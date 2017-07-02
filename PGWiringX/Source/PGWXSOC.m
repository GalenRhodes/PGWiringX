/******************************************************************************************************************************//**
 *     PROJECT: PGWiringX
 *    FILENAME: PGWXSOC.m
 *         IDE: AppCode
 *      AUTHOR: Galen Rhodes
 *        DATE: 6/26/17 9:47 AM
 * DESCRIPTION:
 *
 * Copyright © 2017 Project Galen. All rights reserved.
 *
 * "It can hardly be a coincidence that no language on Earth has ever produced the expression 'As pretty as an airport.' Airports
 * are ugly. Some are very ugly. Some attain a degree of ugliness that can only be the result of special effort."
 * - Douglas Adams from "The Long Dark Tea-Time of the Soul"
 *
 * Permission to use, copy, modify, and distribute this software for any purpose with or without fee is hereby granted, provided
 * that the above copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR
 * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT,
 * NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *********************************************************************************************************************************/

#import "PGWXSOC.h"

@interface PGWXSOC()

    -(BOOL)allocateGPIO:(NSError *_Nullable *)error;

    -(void)deallocGPIO;

    -(PGWXLayout *)layoutForPin:(NSUInteger)pin error:(NSError *_Nullable *)error;

    -(PGWXLayout *)irqLayoutForPin:(NSUInteger)pin error:(NSError *_Nullable *)error;

@end

@implementation PGWXSOC {
        size_t          _gpioCount;
        uintptr_t       *_gpio;
        NSRecursiveLock *_lock;
    }

    @synthesize brandName = _brandName;
    @synthesize chipSet = _chipSet;
    @synthesize gpioMap = _gpioMap;
    @synthesize irqMap = _irqMap;
    @synthesize layout = _layout;
    @synthesize isrModes = _isrModes;
    @synthesize pageSize = _pageSize;
    @synthesize baseAddresses = _baseAddresses;

    -(instancetype)initWithBrandName:(NSString *)brandName
                             chipSet:(NSString *)chipSet
                              layout:(NSArray<PGWXLayout *> *)layout
                             gpioMap:(NSArray<NSString *> *)gpioMap
                              irqMap:(nullable NSArray<NSString *> *)irqMap
                            isrModes:(NSUInteger)isrModes
                            pageSize:(NSUInteger)pageSize
                       baseAddresses:(NSArray<PGWXAddr *> *)baseAddresses
                               error:(NSError *_Nullable *)error {
        return (self = [self initWithBrandName:brandName
                                       chipSet:chipSet
                                        layout:layout
                                       gpioMap:gpioMap
                                        irqMap:irqMap
                                      isrModes:isrModes
                                      pageSize:pageSize
                                 baseAddresses:baseAddresses
                                 sysfsWithName:NO
                                         error:error]);
    }

    -(instancetype)initWithBrandName:(NSString *)brandName
                             chipSet:(NSString *)chipSet
                              layout:(NSArray<PGWXLayout *> *)layout
                             gpioMap:(NSArray<NSString *> *)gpioMap
                              irqMap:(nullable NSArray<NSString *> *)irqMap
                            isrModes:(NSUInteger)isrModes
                            pageSize:(NSUInteger)pageSize
                       baseAddresses:(NSArray<PGWXAddr *> *)baseAddresses
                       sysfsWithName:(BOOL)sysfsWithName
                               error:(NSError *_Nullable *)error {
        self = [super init];

        if(self) {
            NSError *err = nil;
            if(brandName.length == 0) PGWXMakeError(&err, 201, @"Brand name not provided.");
            else if(chipSet.length == 0) PGWXMakeError(&err, 202, @"Chipset name not provided.");
            else if(layout.count == 0) PGWXMakeError(&err, 203, @"Layout set not provided.");
            else if(gpioMap.count == 0) PGWXMakeError(&err, 204, @"GPIO Map not provided.");
            else if(pageSize == 0) PGWXMakeError(&err, 205, @"Page size not provided.");
            else if(baseAddresses.count == 0) PGWXMakeError(&err, 206, @"Base addresses not provided.");
            else {
                _brandName     = brandName.copy;
                _chipSet       = chipSet.copy;
                _gpioMap       = gpioMap.copy;
                _irqMap        = (irqMap == nil ? _gpioMap : irqMap.copy);
                _isrModes      = isrModes;
                _pageSize      = pageSize;
                _baseAddresses = baseAddresses.copy;
                _gpio          = NULL;
                _gpioCount     = 0;

                NSMutableDictionary *mlayout = [NSMutableDictionary dictionaryWithCapacity:layout.count];

                for(PGWXLayout *lo in layout) {
                    mlayout[lo.name] = lo;
                    lo.sysfsWithName = sysfsWithName;
                }

                _layout = mlayout;
                _lock   = [NSRecursiveLock new];
            }
            if(error) *error = err;
            if(err) self = nil;
        }

        return self;
    }

    -(BOOL)allocateGPIO:(NSError *_Nullable *)error {
        NSError *err = nil;
        [_lock lock];

        @try {
            if(_gpio == NULL) {
                _gpioCount = 0;
                int fd = open("/dev/mem", O_RDWR | O_SYNC);

                if(fd < 0) {
                    PGWXMakeOSError(&err, errno);
                }
                else {
                    _gpio = (uintptr_t *)malloc(_baseAddresses.count * sizeof(uintptr_t));

                    for(PGWXAddr *ba in _baseAddresses) {
                        void *ptr = mmap(0, _pageSize, PROT_READ | PROT_WRITE, MAP_SHARED, fd, (off_t)ba.address);

                        if(ptr == NULL || ptr == MAP_FAILED) {
                            PGWXMakeOSError(&err, errno);
                            [self deallocGPIO];
                            break;
                        }
                        else {
                            _gpio[_gpioCount++] = (uintptr_t)ptr;
                        }
                    }

                    close(fd);
                }
            }
        }
        @finally {
            [_lock unlock];
        }

        if(error) *error = err;
        return (err == nil);
    }

    -(void)dealloc {
        [self deallocGPIO];
    }

    -(void)deallocGPIO {
        [_lock lock];

        @try {
            if(_gpio) {
                for(size_t i = 0; i < _gpioCount; i++) {
                    void *ptr = (void *)_gpio[i];
                    _gpio[i] = (uintptr_t)NULL;
                    if(ptr != NULL && ptr != MAP_FAILED) munmap(ptr, self.pageSize);
                }

                free(_gpio);
                _gpio = NULL;
            }
        }
        @finally {
            [_lock unlock];
        }
    }

    -(PGWXLayout *)layoutForPin:(NSUInteger)pin error:(NSError *_Nullable *)error {
        if(pin < self.gpioMap.count) {
            NSString *pinName = self.gpioMap[pin];
            if(pinName.length) {
                PGWXLayout *layout = self.layout[pinName];
                if(layout) return layout;
            }
        }
        PGWXMakeError(error, 500, PGFormat(@"Invalid PIN Number: %@", @(pin)));
        return nil;
    }

    -(PGWXLayout *)irqLayoutForPin:(NSUInteger)pin error:(NSError *_Nullable *)error {
        if(pin < self.irqMap.count) {
            NSString *pinName = self.irqMap[pin];
            if(pinName.length) {
                PGWXLayout *layout = self.layout[pinName];
                if(layout) return layout;
            }
        }
        PGWXMakeError(error, 500, PGFormat(@"Invalid PIN Number: %@", @(pin)));
        return nil;
    }

    -(BOOL)setMode:(PGWXPinMode)mode forPin:(NSUInteger)pin error:(NSError *_Nullable *)error {
        BOOL success = NO;
        if([self allocateGPIO:error]) {
            /*
             * TODO: Set Mode.
             */
        }
        return success;
    }

    -(BOOL)digitalWrite:(PGWXPinState)value toPin:(NSUInteger)pin error:(NSError *_Nullable *)error {
        BOOL success = NO;
        if([self allocateGPIO:error]) {
            /*
             * TODO: Digital Write
             */
        }
        return success;
    }

    -(PGWXPinState)digitalReadFromPin:(NSUInteger)pin error:(NSError *_Nullable *)error {
        PGWXPinState currentState = PGWX_LOW;
        if([self allocateGPIO:error]) {
            /*
             * TODO: Digital Read
             */
        }
        return currentState;
    }

    -(NSInteger)analogReadFromPin:(NSUInteger)pin error:(NSError *_Nullable *)error {
        NSInteger currentAnalogValue = 0;
        if([self allocateGPIO:error]) {
            /*
             * TODO: Analog Read
             */
        }
        return currentAnalogValue;
    }

    -(BOOL)setISR:(PGWXISRMode)mode forPin:(NSUInteger)pin error:(NSError *_Nullable *)error {
        BOOL success = NO;
        if([self allocateGPIO:error]) {
            /*
             * TODO: Set ISR
             */
        }
        return success;
    }

    -(BOOL)waitForInterruptOnPin:(NSUInteger)pin timeout:(NSUInteger)timeout error:(NSError *_Nullable *)error {
        BOOL waitResults = NO;
        if([self allocateGPIO:error]) {
            /*
             * TODO: Wait For Interrupt
             */
        }
        return waitResults;
    }

    -(BOOL)isValidPin:(NSUInteger)pin {
        return ([self layoutForPin:pin error:nil] != nil);
    }

    -(int)selectableFdForPin:(NSUInteger)pin error:(NSError *_Nullable *)error {
        int currentFD = 0;
        if([self allocateGPIO:error]) {
            /*
             * TODO: Selectable FD
             */
        }
        return currentFD;
    }

    -(PGWXPinState)sysfsDigitalReadFromPin:(NSUInteger)pin error:(NSError *_Nullable *)error {
        return [[self layoutForPin:pin error:error] sysfsDigitalRead:error];
    }

    -(BOOL)sysfsExportPin:(NSUInteger)pin error:(NSError *_Nullable *)error {
        return [[self layoutForPin:pin error:error] sysfsExport:error];
    }

    -(BOOL)sysfsUnexportPin:(NSUInteger)pin error:(NSError *_Nullable *)error {
        return [[self layoutForPin:pin error:error] sysfsUnexport:error];
    }

    -(BOOL)sysfsCheckPin:(NSUInteger)pin error:(NSError *_Nullable *)error {
        return [[self layoutForPin:pin error:error] sysfsCheck:error];
    }

    -(BOOL)sysfsDigitalWrite:(PGWXPinState)value toPin:(NSUInteger)pin error:(NSError *_Nullable *)error {
        return [[self layoutForPin:pin error:error] sysfsDigitalWrite:value error:error];
    }

@end

