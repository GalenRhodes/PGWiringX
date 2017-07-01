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
#import "PGWXLayout.h"
#import "PGWXBit.h"

@interface PGWXLayout()

    -(BOOL)_isEqualToLayout:(PGWXLayout *)layout;

    -(BOOL)_sysfsCheck:(NSError *_Nullable *)error;
@end

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

    -(NSString *)sysfsPath {
        [self lock];

        @try {
            if(_sysfsPath.length == 0) {
                NSNumber *pn = @(self.number);
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

    -(BOOL)_sysfsExport:(NSError *_Nullable *)error {
        return [PGFormat(@"%d", (int)self.number) writeToFile:@"/sys/class/gpio/export" atomically:NO encoding:NSUTF8StringEncoding error:error];
    }

    -(BOOL)_sysfsUnexport:(NSError *_Nullable *)error {
        return [PGFormat(@"%d", (int)self.number) writeToFile:@"/sys/class/gpio/unexport" atomically:NO encoding:NSUTF8StringEncoding error:error];
    }

    -(BOOL)_sysfsCheck:(NSError *_Nullable *)error {
        struct stat s;
        BOOL        success = NO;
        int         err     = stat(self.sysfsPath.UTF8String, &s);

        if(err == -1) {
            if(ENOENT == errno) {
                PGWXMakeOSError(error, errno);
            }
            else {
                PGWXMakeError(error, 600, PGFormat(@"Unexpected error while changing onwership of %@: %@", self.sysfsPath, PGStrError(errno)));
            }
        }
        else if(S_ISDIR(s.st_mode) || S_ISLNK(s.st_mode)) {
            success = YES;
            if(error) *error = nil;
        }
        else {
            PGWXMakeError(error, 600, PGFormat(@"Path %@ exists but is not a folder or link: %@", self.sysfsPath, PGStrError(errno)));
        }

        return success;
    }

    -(BOOL)_sysfsValidate:(NSError *_Nullable *)error {
        BOOL success = NO;
        success = [self _sysfsCheck:error];

        if(!success) {
            [self _sysfsUnexport:error];
            success = ([self _sysfsExport:error] && [self _sysfsCheck:error]);
        }
        return success;
    }

    -(BOOL)_sysfsWrite:(NSString *)value toSubPath:(NSString *)subPath error:(NSError *_Nullable *)error {
        BOOL success = NO;

        if((success = [self _sysfsValidate:error])) {
            success = NO;

            if(subPath.length) {
                NSString *fullPath = PGFormat(@"%@/%@", self.sysfsPath, subPath);
                if(value.length) success = [value writeToFile:fullPath atomically:NO encoding:NSUTF8StringEncoding error:error];
                else PGWXMakeError(error, 601, PGFormat(@"No value given to write to %@", fullPath));
            }
            else PGWXMakeError(error, 602, @"No sub-path given to write value to.");
        }

        return success;
    }

    -(PGWXPinState)_sysfsDigitalRead:(NSError *_Nullable *)error {
        NSString *fullPath = PGFormat(@"%@/value", self.sysfsPath);
        NSString *value    = [NSString stringWithContentsOfFile:fullPath encoding:NSUTF8StringEncoding error:error];
        return ([value isEqualToString:@"1"] ? PGWX_HIGH : PGWX_LOW);
    }

    -(BOOL)sysfsExport:(NSError *_Nullable *)error {
        BOOL success = NO;
        [self lock];
        @try { success = [self _sysfsExport:error]; } @finally { [self unlock]; }
        return success;
    }

    -(BOOL)sysfsUnexport:(NSError *_Nullable *)error {
        BOOL success = NO;
        [self lock];
        @try { success = [self _sysfsUnexport:error]; } @finally { [self unlock]; }
        return success;
    }

    -(BOOL)sysfsWrite:(NSString *)value toSubPath:(NSString *)subPath error:(NSError *_Nullable *)error {
        BOOL success = NO;
        [self lock];
        @try { success = [self _sysfsWrite:value toSubPath:subPath error:error]; } @finally { [self unlock]; }
        return success;
    }

    -(BOOL)sysfsDigitalWrite:(PGWXPinState)value error:(NSError *_Nullable *)error {
        return [self sysfsWrite:(value == PGWX_HIGH ? @"1" : @"0") toSubPath:@"/value" error:error];
    }

    -(PGWXPinState)sysfsDigitalRead:(NSError *_Nullable *)error {
        PGWXPinState state = PGWX_LOW;
        [self lock];
        @try { state = [self _sysfsDigitalRead:error]; } @finally { [self unlock]; }
        return state;
    }

    -(BOOL)sysfsValidate:(NSError *_Nullable *)error {
        BOOL success = NO;
        [self lock];
        @try { success = [self _sysfsValidate:error]; } @finally { [self unlock]; }
        return success;
    }

    -(BOOL)sysfsCheck:(NSError *_Nullable *)error {
        BOOL success = NO;
        [self lock];
        @try { success = [self _sysfsCheck:error]; } @finally { [self unlock]; }
        return success;
    }

@end
