/******************************************************************************************************************************//**
 *     PROJECT: PGWiringX
 *    FILENAME: PGWXLayout.m
 *         IDE: AppCode
 *      AUTHOR: Galen Rhodes
 *        DATE: 6/22/17 4:07 PM
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

#include <sys/stat.h>
#import <sys/filio.h>
#import <sys/ioctl.h>
#import "PGWXLayout.h"
#import "PGWXBit.h"

NSString *const PGWXFunctionNotSupportedMessage = @"Pin %@ does not support %@.";
NSString *const PGWXModeNotSetMessage           = @"Pin %@ is not set for %@.";

@implementation PGWXLayout {
        NSString        *_sysfsPath;
        NSRecursiveLock *_lock;
    }

    @synthesize name = _name;
    @synthesize bank = _bank;
    @synthesize number = _number;
    @synthesize select = _select;
    @synthesize set = _set;
    @synthesize clear = _clear;
    @synthesize read = _read;
    @synthesize support = _support;
    @synthesize mode = _mode;
    @synthesize fd = _fd;
    @synthesize irqMode = _irqMode;

    -(instancetype)initWithName:(NSString *)name number:(NSUInteger)number
                           bank:(NSUInteger)bank
                         select:(PGWXBit *)sel
                           read:(PGWXBit *)read
                            set:(PGWXBit *)set
                          clear:(PGWXBit *)clear
                        support:(NSUInteger)sup {
        self = [super init];

        if(self) {
            _name          = name.copy;
            _bank          = bank;
            _select        = sel;
            _set           = set;
            _clear         = clear;
            _read          = read;
            _support       = sup;
            _fd            = -1;
            _mode          = PGWX_PINMODE_NOT_SET;
            _irqMode       = PGWX_ISR_MODE_UNKNOWN;
            _number        = number;
            _sysfsPath     = nil;
            _sysfsWithName = NO;
            _lock          = [NSRecursiveLock new];
        }

        return self;
    }

    +(instancetype)layoutWithName:(NSString *)name
                           number:(NSUInteger)number
                             bank:(NSUInteger)bank
                           select:(PGWXBit *)sel
                             read:(PGWXBit *)read
                              set:(PGWXBit *)set
                            clear:(PGWXBit *)clear
                          support:(NSUInteger)sup {
        return [[self alloc] initWithName:name number:number bank:bank select:sel read:read set:set clear:clear support:sup];
    }

    +(instancetype)layoutWithName:(NSString *)name
                           number:(NSUInteger)number
                             bank:(NSUInteger)bank
                           select:(PGWXBit *)select
                             read:(PGWXBit *)read
                            write:(PGWXBit *)write
                          support:(NSUInteger)support {
        return [[self alloc] initWithName:name number:number bank:bank select:select read:read set:write clear:write support:support];
    }

    +(instancetype)layoutWithName:(NSString *)name
                           number:(NSUInteger)number
                             bank:(NSUInteger)bank
                           select:(PGWXBit *)select
                        readWrite:(PGWXBit *)readWrite
                          support:(NSUInteger)support {
        return [[self alloc] initWithName:name number:number bank:bank select:select read:readWrite set:readWrite clear:readWrite support:support];
    }

    -(void)dealloc {
        NSError *error = nil;
        [self lock];

        @try {
            if(self.mode == PGWX_PINMODE_OUTPUT) [self setMode:PGWX_PINMODE_INPUT error:&error];
            else if(self.mode == PGWX_PINMODE_INTERRUPT) [self sysfsUnexport:&error];

            if(self.fd > 0) {
                close(self.fd);
                self.fd = 0;
            }
        }
        @finally {
            [self unlock];
        }
    }

    -(NSString *)sysfsPath {
        [self lock];

        @try {
            if(_sysfsPath.length == 0) {
                NSString *pn = @(self.number).stringValue;
                _sysfsPath = (_sysfsWithName ? PGFormat(@"/sys/class/gpio/gpio%@_%@", pn, self.name) : PGFormat(@"/sys/class/gpio/gpio%@", pn));
            }
        }
        @finally {
            [self unlock];
        }

        return _sysfsPath;
    }

    -(BOOL)isEqual:(id)other {
        return (other && ((self == other) || ([other isKindOfClass:[self class]] ? [self _isEqualToLayout:other] : [super isEqual:other])));
    }

    -(BOOL)isEqualToLayout:(PGWXLayout *)layout {
        return (layout && ((self == layout) || [self _isEqualToLayout:layout]));
    }

    -(BOOL)_isEqualToLayout:(PGWXLayout *)layout {
        return (PGObjectsEqual(self.name, layout.name) && (self.bank == layout.bank));
    }

    -(NSUInteger)hash {
        return (((31u + _name.hash) * 31u) + (NSUInteger)_bank);
    }

    -(void)lock {
        [_lock lock];
    }

    -(void)unlock {
        [_lock unlock];
    }

    -(BOOL)hasSupportFor:(PGWXPinFunction)function {
        return ((self.support & function) == function);
    }

    -(BOOL)setMode:(PGWXPinMode)mode error:(NSError **)error {
        BOOL success = NO;
        [self lock];

        @try {
            switch(mode) {
                case PGWX_PINMODE_NOT_SET:
                    PGWXMakeError(error, 117, PGFormat(@"Invalid mode setting: %@", @"NOT SET"));
                    break;
                case PGWX_PINMODE_INPUT:
                    if([self hasSupportFor:PGWX_FUNCTION_ANALOG] || [self hasSupportFor:PGWX_FUNCTION_DIGITAL]) {
                        [self sysfsUnexport:nil];
                        [self setModeInputImpl];
                        success = YES;
                        PGSetReference(error, nil);
                    }
                    else {
                        PGWXMakeError(error, 117, PGFormat(@"Invalid mode setting: %@", @"INPUT"));
                    }
                    break;
                case PGWX_PINMODE_OUTPUT:
                    if([self hasSupportFor:PGWX_FUNCTION_DIGITAL]) {
                        [self sysfsUnexport:nil];
                        [self setModeOutputImpl];
                        success = YES;
                        PGSetReference(error, nil);
                    }
                    else {
                        PGWXMakeError(error, 117, PGFormat(@"Invalid mode setting: %@", @"OUTPUT"));
                    }
                    break;
                case PGWX_PINMODE_INTERRUPT:
                    if([self hasSupportFor:PGWX_FUNCTION_INTERRUPT]) {
                        success = [self setISR:PGWX_ISR_MODE_RISING error:error];
                    }
                    else {
                        PGWXMakeError(error, 117, PGFormat(@"Invalid mode setting: %@", @"INTERRUPT"));
                    }
                    break;
            }
        }
        @finally {
            [self unlock];
        }

        return success;
    }

    -(uint32_t)socRead:(uintptr_t)address {
        return *((volatile uint32_t *)(address));
    }

    -(void)socWrite:(uint32_t)value address:(uintptr_t)address {
        *((volatile uint32_t *)(address)) = value;
    }

    -(void)setModeInputImpl {
        uintptr_t addr = (self.baseAddr + self.select.offset);
        [self socWrite:([self socRead:addr] | (1 << self.select.bit)) address:addr];
        _mode = PGWX_PINMODE_INPUT;
    }

    -(void)setModeOutputImpl {
        uintptr_t addr = (self.baseAddr + self.select.offset);
        [self socWrite:([self socRead:addr] & ~(1 << self.select.bit)) address:addr];
        _mode = PGWX_PINMODE_OUTPUT;
    }

    -(void)digitalSetImpl {
        uintptr_t addr = (self.baseAddr + self.set.offset);
        [self socWrite:([self socRead:addr] | (1 << self.set.bit)) address:addr];
    }

    -(void)digitalClearImpl {
        uintptr_t addr = (self.baseAddr + self.clear.offset);
        [self socWrite:([self socRead:addr] & ~(1 << self.clear.bit)) address:addr];
    }

    -(void)digitalWriteImpl:(PGWXPinState)value {
        if(value == PGWX_HIGH) [self digitalSetImpl]; else [self digitalClearImpl];
    }

    -(PGWXPinState)digitalReadImpl {
        return ((([self socRead:(self.baseAddr + self.read.offset)] & (1 << self.read.bit)) == 0) ? PGWX_LOW : PGWX_HIGH);
    }

    -(int32_t)analogReadImpl {
        /*
        * TODO: Learn how to do this...
        */
        return 0;
    }

    -(BOOL)digitalWrite:(PGWXPinState)value error:(NSError **)error {
        BOOL success = NO;
        [self lock];

        @try {
            if([self hasSupportFor:PGWX_FUNCTION_DIGITAL]) {
                if(self.mode == PGWX_PINMODE_OUTPUT) {
                    [self digitalWriteImpl:value];
                    success = YES;
                    PGSetReference(error, nil);
                }
                else PGWXMakeError(error, 124, PGFormat(PGWXModeNotSetMessage, self.name, @"digital output"));
            }
            else PGWXMakeError(error, 119, PGFormat(PGWXFunctionNotSupportedMessage, self.name, @"digital write"));
        }
        @finally {
            [self unlock];
        }

        return success;
    }

    -(PGWXPinState)digitalRead:(NSError **)error {
        PGWXPinState results = PGWX_LOW;
        [self lock];

        @try {
            if([self hasSupportFor:PGWX_FUNCTION_DIGITAL]) {
                if(self.mode == PGWX_PINMODE_INPUT) {
                    results = [self digitalReadImpl];
                    PGSetReference(error, nil);
                }
                else PGWXMakeError(error, 124, PGFormat(PGWXModeNotSetMessage, self.name, @"digital input"));
            }
            else PGWXMakeError(error, 120, PGFormat(PGWXFunctionNotSupportedMessage, self.name, @"digital read"));
        }
        @finally {
            [self unlock];
        }

        return results;
    }

    -(int32_t)analogRead:(NSError **)error {
        int32_t results = 0;
        [self lock];

        @try {
            if([self hasSupportFor:PGWX_FUNCTION_ANALOG]) {
                if(self.mode == PGWX_PINMODE_INPUT) {
                    results = [self analogReadImpl];
                    PGSetReference(error, nil);
                }
                else PGWXMakeError(error, 124, PGFormat(PGWXModeNotSetMessage, self.name, @"analog input"));
            }
            else PGWXMakeError(error, 121, PGFormat(PGWXFunctionNotSupportedMessage, self.name, @"analog read"));
        }
        @finally {
            [self unlock];
        }

        return results;
    }

    -(BOOL)sysfsResetValue:(NSString *)path error:(NSError **)error {
        BOOL results;
        int  fd = 0;

        if((fd = open(path.UTF8String, O_RDWR)) <= 0) {
            PGWXMakeError(error, errno, PGFormat(@"Failed to open %@ for GPIO reading (%@)", path, PGStrError(errno)));
            results = NO;
        }
        else {
            int          cc = 0;
            unsigned int c  = 0;
            ioctl(fd, FIONREAD, &cc);
            for(int i = 0; i < cc; ++i) {
                if(read(fd, &c, 1) != 1) continue;
            }
            lseek(fd, 0, SEEK_SET);
            self.fd = fd;
            results = YES;
        }
        return results;
    }

    -(BOOL)sysfsExport:(NSError **)error {
        return [@(self.number).stringValue writeToFile:@"/sys/class/gpio/export" atomically:NO encoding:NSUTF8StringEncoding error:error];
    }

    -(BOOL)sysfsUnexport:(NSError **)error {
        return [@(self.number).stringValue writeToFile:@"/sys/class/gpio/unexport" atomically:NO encoding:NSUTF8StringEncoding error:error];
    }

    -(BOOL)sysfsCheck:(NSError **)error {
        struct stat s;
        BOOL        success = NO;

        if(stat(self.sysfsPath.UTF8String, &s) == -1) {
            if(ENOENT == errno) PGWXMakeOSError(error, errno);
            else PGWXMakeError(error, 113, PGFormat(@"Unexpected error while changing onwership of %@: %@", self.sysfsPath, PGStrError(errno)));
        }
        else if(S_ISDIR(s.st_mode) || S_ISLNK(s.st_mode)) {
            success = YES;
            PGSetReference(error, nil);
        }
        else PGWXMakeError(error, 114, PGFormat(@"Path %@ exists but is not a folder or link: %@", self.sysfsPath, PGStrError(errno)));

        return success;
    }

    -(BOOL)sysfsValidate:(NSError **)error {
        BOOL success = [self sysfsCheck:error];

        if(!success) {
            [self sysfsUnexport:error];
            success = ([self sysfsExport:error] && [self sysfsCheck:error]);
        }

        return success;
    }

    -(BOOL)sysfsWrite:(NSString *)value toSubPath:(NSString *)subPath error:(NSError **)error {
        BOOL success = [self sysfsValidate:error];

        if(success) {
            success = NO;

            if(subPath.length) {
                NSString *fullPath = PGFormat(@"%@/%@", self.sysfsPath, subPath);
                if(value.length) success = [value writeToFile:fullPath atomically:NO encoding:NSUTF8StringEncoding error:error];
                else PGWXMakeError(error, 115, PGFormat(@"No value given to write to %@", fullPath));
            }
            else PGWXMakeError(error, 116, @"No sub-path given to write value to.");
        }

        return success;
    }

    -(BOOL)sysfsChangeOwner:(NSString *)path error:(NSError **)error {
        PGSetReference(error, nil);
        /*
         * This does not seem to be really required and, in fact, fails when run in user mode.
         */
        /* -- @f:0
        uid_t uid = getuid();
        uid_t gid = getgid();

        if(chown(path.UTF8String, uid, gid) != 0) {
            PGWXMakeError(error, errno, PGFormat(@"Unable to change ownership of file %@: %@", path, PGStrError(errno)));
            return NO;
        }
        @f:1 -- */
        return YES;
    }

    -(BOOL)sysfsResetValue:(NSError **)error {
        NSString *path   = PGFormat(@"%@/value", self.sysfsPath);
        BOOL     results = [self sysfsChangeOwner:path error:error];
        if(results) results = [self sysfsResetValue:path error:error];
        return results;
    }

    -(BOOL)setISR:(PGWXISRMode)mode error:(NSError **)error {
        BOOL results = NO;
        [self lock];

        @try {
            if([self hasSupportFor:PGWX_FUNCTION_INTERRUPT]) {
                if(self.fd > 0) {
                    close(self.fd);
                    self.fd = 0;
                }
                if(mode == PGWX_ISR_MODE_RISING || mode == PGWX_ISR_MODE_FALLING || mode == PGWX_ISR_MODE_BOTH) {
                    results = [self sysfsValidate:error];
                    if(results) results = [self sysfsWrite:@"in" toSubPath:@"direction" error:error];
                    if(results) results = [self sysfsWrite:PGWXISRModeName(mode) toSubPath:@"edge" error:error];
                    if(results) results = [self sysfsResetValue:error];
                    if(results) {
                        _mode    = PGWX_PINMODE_INTERRUPT;
                        _irqMode = mode;
                        results  = YES;
                        PGSetReference(error, nil);
                    }
                }
                else if(mode == PGWX_ISR_MODE_NONE && self.mode == PGWX_PINMODE_INTERRUPT) {
                    results = [self setMode:PGWX_PINMODE_INPUT error:error];
                }
                else PGWXMakeError(error, 125, PGFormat(@"Invalid IRQ Mode for pin %@: %@", self.name, PGWXISRModeName(mode)));
            }
            else PGWXMakeError(error, 122, PGFormat(PGWXFunctionNotSupportedMessage, self.name, @"interrupt"));
        }
        @finally {
            [self unlock];
        }

        return results;
    }

    -(BOOL)waitForInterruptWithTimeout:(NSUInteger)timeout error:(NSError **)error {
        BOOL results = NO;
        [self lock];

        @try {
            if([self hasSupportFor:PGWX_FUNCTION_INTERRUPT]) {
                if(self.mode == PGWX_PINMODE_INTERRUPT) {
                    results = YES;
                    PGSetReference(error, nil);
                }
                else PGWXMakeError(error, 124, PGFormat(PGWXModeNotSetMessage, self.name, @"interrupt"));
            }
            else PGWXMakeError(error, 122, PGFormat(PGWXFunctionNotSupportedMessage, self.name, @"interrupt"));
        }
        @finally {
            [self unlock];
        }

        return results;
    }

@end
