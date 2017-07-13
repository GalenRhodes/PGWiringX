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

NSString *const PGWXPinNotFoundErrorMessage      = @"Pin \"%@\" not found.";
NSString *const PGWXInvalidPinNumberErrorMessage = @"Invalid pin number: %@";
const NSInteger PGWXInvalidPinNumberErrorCode = 112;

@interface PGWXSOC()

    -(int)openMemoryDevice;

    -(void *)mapMemory:(int)fd pageSize:(NSUInteger)pageSize ba:(PGWXAddr *)ba;

    -(BOOL)allocateGPIO:(NSError **)error;

    -(void)mapMemory:(int)fd pageSize:(NSUInteger)pageSize baseAddresses:(NSArray<PGWXAddr *> *)baseAddresses error:(NSError **)error;

    -(void)deallocGPIO;

    -(PGWXLayout *)layoutForPinNamed:(NSString *)pinName error:(NSError **)error;

    -(PGWXLayout *)irqLayoutForPinNamed:(NSString *)pinName error:(NSError **)error;

@end

@implementation PGWXSOC {
        size_t          _gpioCount;
        uintptr_t       *_gpio;
        NSRecursiveLock *_lock;
    }

    -(instancetype)init:(NSError **)error {
        self = [super init];

        if(self) {
            if([self class] == [PGWXSOC class]) {
                PGWXMakeError(error, 118, PGFormat(@"Only concrete subclasses of %@ can be created.", NSStringFromClass([self class])));
                self = nil;
            }
            else {
                _lock      = [NSRecursiveLock new];
                _gpio      = NULL;
                _gpioCount = 0;
                PGSetReference(error, nil);
            }
        }

        return self;
    }

    -(NSString *)brandName {
        return nil;
    }

    -(NSString *)chipSet {
        return nil;
    }

    -(NSDictionary<NSString *, PGWXLayout *> *)layout {
        return [NSDictionary new];
    }

    -(NSArray<PGWXAddr *> *)baseAddresses {
        return [NSArray new];
    }

    -(NSUInteger)pageSize {
        return (4 * 1024);
    }

    -(NSUInteger)isrModes {
        return (PGWX_ISR_MODE_RISING | PGWX_ISR_MODE_FALLING | PGWX_ISR_MODE_BOTH | PGWX_ISR_MODE_NONE);
    }

    -(void)lock {
        [_lock lock];
    }

    -(void)unlock {
        [_lock unlock];
    }

    -(int)openMemoryDevice {
        return open("/dev/mem", O_RDWR | O_SYNC);
    }

    -(void *)mapMemory:(int)fd pageSize:(NSUInteger)pageSize ba:(PGWXAddr *)ba {
        return mmap(0, pageSize, (PROT_READ | PROT_WRITE), MAP_SHARED, fd, (off_t)ba.address);
    }

    -(BOOL)allocateGPIO:(NSError **)error {
        NSError *err = nil;
        [self lock];

        @try {
            if(_gpio == NULL) {
                _gpioCount = 0;
                int fd = [self openMemoryDevice];
                if(fd < 0) PGWXMakeOSError(&err, errno);
                else [self mapMemory:fd pageSize:self.pageSize baseAddresses:self.baseAddresses error:&err];
            }
        }
        @finally {
            [self unlock];
        }

        PGSetReference(error, err);
        return (err == nil);
    }

    -(void)mapMemory:(int)fd pageSize:(NSUInteger)pageSize baseAddresses:(NSArray<PGWXAddr *> *)baseAddresses error:(NSError **)error {
        NSUInteger cc = baseAddresses.count;

        if((_gpio = (uintptr_t *)malloc(cc * sizeof(uintptr_t))) != NULL) {
            PGSetReference(error, nil);
            BOOL success = YES;

            for(PGWXAddr *ba in baseAddresses) {
                void *ptr = [self mapMemory:fd pageSize:pageSize ba:ba];

                if((ptr == NULL) || (ptr == MAP_FAILED)) {
                    PGWXMakeOSError(error, errno);
                    success = NO;
                    [self deallocGPIO];
                    break;
                }

                _gpio[_gpioCount++] = (uintptr_t)ptr;
            }

            NSArray<PGWXLayout *> *layouts = self.layout.allValues;

            for(PGWXLayout *lo in layouts) {
                NSUInteger bank = lo.bank;
                lo.baseAddr = ((success && (bank < cc)) ? (_gpio[bank] + baseAddresses[bank].offset) : ((uintptr_t)-1));
            }
        }
        else {
            PGWXMakeOSError(error, errno);
        }

        close(fd);
    }

    -(void)dealloc {
        [self deallocGPIO];
    }

    -(void)deallocGPIO {
        [self lock];

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

            [self clearLayoutBaseAddresses];
        }
        @finally {
            [self unlock];
        }
    }

    -(void)clearLayoutBaseAddresses {
        NSArray<PGWXLayout *> *layouts = self.layout.allValues;

        for(PGWXLayout *lo in layouts) {
            lo.baseAddr = ((uintptr_t)-1);
        }
    }

    -(PGWXLayout *)layoutForPinNamed:(NSString *)pinName error:(NSError **)error {
        if(pinName.length) {
            PGWXLayout *layout = self.layout[pinName];
            if(layout) return layout;
            PGWXMakeError(error, PGWXInvalidPinNumberErrorCode, PGFormat(PGWXPinNotFoundErrorMessage, pinName));
            return nil;
        }
        PGWXMakeError(error, PGWXInvalidPinNumberErrorCode, PGWXInvalidPinNumberErrorMessage);
        return nil;
    }

    -(PGWXLayout *)irqLayoutForPinNamed:(NSString *)pinName error:(NSError **)error {
        if(pinName.length) {
            PGWXLayout *layout = self.layout[pinName];
            if(layout) return layout;
            PGWXMakeError(error, PGWXInvalidPinNumberErrorCode, PGFormat(PGWXPinNotFoundErrorMessage, pinName));
            return nil;
        }
        PGWXMakeError(error, PGWXInvalidPinNumberErrorCode, PGWXInvalidPinNumberErrorMessage);
        return nil;
    }

    -(BOOL)setMode:(PGWXPinMode)mode forPinNamed:(NSString *)pinName error:(NSError **)error {
        BOOL success = NO;
        if([self allocateGPIO:error]) {
            /*
             * TODO: Set Mode.
             */
        }
        return success;
    }

    -(BOOL)digitalWrite:(PGWXPinState)value toPinNamed:(NSString *)pinName error:(NSError **)error {
        BOOL success = NO;
        if([self allocateGPIO:error]) {
            /*
             * TODO: Digital Write
             */
        }
        return success;
    }

    -(PGWXPinState)digitalReadFromPinNamed:(NSString *)pinName error:(NSError **)error {
        PGWXPinState currentState = PGWX_LOW;
        if([self allocateGPIO:error]) {
            /*
             * TODO: Digital Read
             */
        }
        return currentState;
    }

    -(int32_t)analogReadFromPinNamed:(NSString *)pinName error:(NSError **)error {
        int32_t currentAnalogValue = 0;
        if([self allocateGPIO:error]) {
            /*
             * TODO: Analog Read
             */
        }
        return currentAnalogValue;
    }

    -(BOOL)setISR:(PGWXISRMode)mode forPinNamed:(NSString *)pinName error:(NSError **)error {
        BOOL success = NO;
        if([self allocateGPIO:error]) {
            /*
             * TODO: Set ISR
             */
        }
        return success;
    }

    -(BOOL)waitForInterruptOnPinNamed:(NSString *)pinName timeout:(NSUInteger)timeout error:(NSError **)error {
        BOOL waitResults = NO;
        if([self allocateGPIO:error]) {
            /*
             * TODO: Wait For Interrupt
             */
        }
        return waitResults;
    }

    -(BOOL)isValidPinNamed:(NSString *)pinName {
        return ([self layoutForPinNamed:pinName error:nil] != nil);
    }

    -(BOOL)isValidIRQPinNamed:(NSString *)pinName {
        return ([self irqLayoutForPinNamed:pinName error:nil] != nil);
    }

@end

