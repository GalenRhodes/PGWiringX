/******************************************************************************************************************************//**
 *     PROJECT: PGWiringX
 *    FILENAME: PGWXPlatform.m
 *         IDE: AppCode
 *      AUTHOR: Galen Rhodes
 *        DATE: 6/26/17 3:02 PM
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

#import "PGWXPlatform.h"

@implementation PGWXPlatform {
    }

    @synthesize boardName = _boardName;
    @synthesize soc = _soc;

    -(instancetype)init:(NSError *_Nullable *)error {
        self = [super init];

        if(self) {
            PGWXMakeError(error, 302, PGFormat(@"Instances of %@ cannot be instanciated directly.", NSStringFromClass([self class])));
            self = nil;
        }

        return nil;
    }

    -(instancetype)initWithBoardName:(NSString *)boardName soc:(PGWXSOC *)soc error:(NSError *_Nullable *)error {
        self = [super init];

        if(self) {
            if(boardName.length) {
                if(soc) {
                    _soc       = soc;
                    _boardName = boardName.copy;
                }
                else {
                    if(error && *error == nil) PGWXMakeError(error, 301, @"SOC is missing.");
                    self = nil;
                }
            }
            else {
                PGWXMakeError(error, 300, @"Board name is missing.");
                self = nil;
            }
        }

        return self;
    }

    -(BOOL)setMode:(PGWXPinMode)mode forPin:(NSUInteger)pin error:(NSError *_Nullable *)error {
        return [self.soc setMode:mode forPin:pin error:error];
    }

    -(BOOL)digitalWrite:(PGWXPinState)value toPin:(NSUInteger)pin error:(NSError *_Nullable *)error {
        return [self.soc digitalWrite:value toPin:pin error:error];
    }

    -(BOOL)setISR:(PGWXISRMode)mode forPin:(NSUInteger)pin error:(NSError *_Nullable *)error {
        return [self.soc setISR:mode forPin:pin error:error];
    }

    -(PGWXPinState)digitalReadFromPin:(NSUInteger)pin error:(NSError *_Nullable *)error {
        return [self.soc digitalReadFromPin:pin error:error];
    }

    -(NSInteger)analogReadFromPin:(NSUInteger)pin error:(NSError *_Nullable *)error {
        return [self.soc analogReadFromPin:pin error:error];
    }

    -(BOOL)waitForInterruptOnPin:(NSUInteger)pin timeout:(NSUInteger)timeout error:(NSError *_Nullable *)error {
        return [self.soc waitForInterruptOnPin:pin timeout:timeout error:error];
    }

    -(BOOL)isValidPin:(NSUInteger)pin {
        return [self.soc isValidPin:pin];
    }

    -(int)selectableFdForPin:(NSUInteger)pin error:(NSError *_Nullable *)error {
        return [self.soc selectableFdForPin:pin error:error];
    }

    -(BOOL)sysfsExportPin:(NSUInteger)pin error:(NSError *_Nullable *)error {
        return [self.soc sysfsExportPin:pin error:error];
    }

    -(BOOL)sysfsUnexportPin:(NSUInteger)pin error:(NSError *_Nullable *)error {
        return [self.soc sysfsUnexportPin:pin error:error];
    }

    -(BOOL)sysfsCheckPin:(NSUInteger)pin error:(NSError *_Nullable *)error {
        return [self.soc sysfsCheckPin:pin error:error];
    }

    -(BOOL)sysfsDigitalWrite:(PGWXPinState)value toPin:(NSUInteger)pin error:(NSError *_Nullable *)error {
        return [self.soc sysfsDigitalWrite:value toPin:pin error:error];
    }

    -(PGWXPinState)sysfsDigitalReadFromPin:(NSUInteger)pin error:(NSError *_Nullable *)error {
        return [self.soc sysfsDigitalReadFromPin:pin error:error];
    }

@end
