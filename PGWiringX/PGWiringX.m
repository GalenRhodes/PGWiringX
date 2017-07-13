/***************************************************************************//**
 *     PROJECT: PGWiringX
 *    FILENAME: PGWiringX.m
 *         IDE: AppCode
 *      AUTHOR: Galen Rhodes
 *        DATE: 06/22/17 15:35
 * DESCRIPTION:
 *
 * Copyright © 2017 Galen Rhodes All rights reserved.
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *******************************************************************************/

#import "PGWiringX.h"
#import "PGWXPlatform.h"
#import "PGWXPlatformRaspberryPi.h"
#import "PGWXPlatformHardkernel.h"
#import "PGWXPlatformLemaker.h"
#import "PGWXPlatformLinkSprite.h"
#import "PGWXPlatformXunLong.h"
#import "PGWXPlatformSolidRun.h"

#ifndef __APPLE__

const unsigned char PGWiringXVersionString[] __attribute__ ((used)) = "@(#)PROGRAM:PGWiringX  PROJECT:PGWiringX-1" "\n";
const double PGWiringXVersionNumber __attribute__ ((used)) = (double)1.;

#endif

NSString *const PGWX_OdroidC1            = @"ODROID C1";
NSString *const PGWX_OdroidC2            = @"Odroid C2";
NSString *const PGWX_OdroidXU4           = @"Odroid XU4";
NSString *const PGWX_BananaPi1           = @"Banana Pi 1";
NSString *const PGWX_BananaPiM2          = @"Banana Pi M2";
NSString *const PGWX_PCDuino1            = @"PCDuino1";
NSString *const PGWX_RaspberryPi1B1      = @"Raspberry PI-1B1";
NSString *const PGWX_RaspberryPi1B2      = @"Raspberry PI-1B2";
NSString *const PGWX_RaspberryPiZero     = @"Raspberry PI-Zero";
NSString *const PGWX_RaspberryPi1BPlus   = @"Raspberry PI-1B+";
NSString *const PGWX_RaspberryPi2        = @"Raspberry PI-2";
NSString *const PGWX_RaspberryPi3        = @"Raspberry PI-3";
NSString *const PGWX_HummingboardProDQ   = @"Hummingboard Base/Pro DQ";
NSString *const PGWX_HummingboardProSDL  = @"Hummingboard Base/Pro SDL";
NSString *const PGWX_HummingboardGateDQ  = @"Hummingboard Gate/Edge DQ";
NSString *const PGWX_HummingboardGateSDL = @"Hummingboard Gate/Edge SDL";
NSString *const PGWX_HummingboardBaseDQ  = @"Hummingboard Base/Pro DQ";
NSString *const PGWX_HummingboardBaseSDL = @"Hummingboard Base/Pro SDL";
NSString *const PGWX_HummingboardEdgeDQ  = @"Hummingboard Gate/Edge DQ";
NSString *const PGWX_HummingboardEdgeSDL = @"Hummingboard Gate/Edge SDL";
NSString *const PGWX_OrangePiPCPlus      = @"Orange Pi PC+";

@interface PGWiringX()

    +(NSDictionary<NSString *, NSString *> *)platformMap;

@end

@implementation PGWiringX {
        PGWXPlatform *_platform;
    }

    -(instancetype)initWithPlatformName:(NSString *)platformName error:(NSError **)error {
        self = [super init];

        if(self) {
            if(platformName.length) {
                NSString *platformClassName = [PGWiringX platformMap][platformName];

                if(platformClassName.length) {
                    NSError *err = nil;

                    _platform = [(PGWXPlatform *)[NSClassFromString(platformClassName) alloc] init:&err];

                    if(_platform == nil) {
                        PGWXMakeError(error, 101, PGFormat(@"Error creating platform %@: %@", platformName, err.description));
                        self = nil;
                    }
                }
                else {
                    PGWXMakeError(error, 102, PGFormat(@"No platform found for name: %@", platformName));
                    self = nil;
                }
            }
            else {
                PGWXMakeError(error, 103, @"Platform name not provided.");
                self = nil;
            }
        }

        return self;
    }

    -(BOOL)setMode:(PGWXPinMode)mode forPin:(NSUInteger)pin error:(NSError **)error {
        return [_platform setMode:mode forPin:pin error:error];
    }

    -(BOOL)digitalWrite:(PGWXPinState)value toPin:(NSUInteger)pin error:(NSError **)error {
        return [_platform digitalWrite:value toPin:pin error:error];
    }

    -(BOOL)setISR:(PGWXISRMode)mode forPin:(NSUInteger)pin error:(NSError **)error {
        return [_platform setISR:mode forPin:pin error:error];
    }

    -(PGWXPinState)digitalReadFromPin:(NSUInteger)pin error:(NSError **)error {
        return [_platform digitalReadFromPin:pin error:error];
    }

    -(NSInteger)analogReadFromPin:(NSUInteger)pin error:(NSError **)error {
        return [_platform analogReadFromPin:pin error:error];
    }

    -(BOOL)waitForInterruptOnPin:(NSUInteger)pin timeout:(NSUInteger)timeout error:(NSError **)error {
        return [_platform waitForInterruptOnPin:pin timeout:timeout error:error];
    }

    -(BOOL)isValidPin:(NSUInteger)pin {
        return [_platform isValidPin:pin];
    }

    +(NSDictionary<NSString *, NSString *> *)platformMap {
        static NSDictionary<NSString *, NSString *> *_map = nil;
        @synchronized([PGWiringX class]) {
            if(_map == nil) {
                _map = @{
                        PGWX_OdroidC1           :NSStringFromClass([PGWXPlatformHardkernelOdroidC1 class]),
                        PGWX_OdroidC2           :NSStringFromClass([PGWXPlatformHardkernelOdroidC2 class]),
                        PGWX_OdroidXU4          :NSStringFromClass([PGWXPlatformHardkernelOdroidXU4 class]),
                        PGWX_BananaPi1          :NSStringFromClass([PGWXPlatformLemakerBananaPi1 class]),
                        PGWX_BananaPiM2         :NSStringFromClass([PGWXPlatformLemakerBananaPiM2 class]),
                        PGWX_PCDuino1           :NSStringFromClass([PGWXPlatformLinkSpritePCDuino1 class]),
                        PGWX_RaspberryPi1B1     :NSStringFromClass([PGWXPlatformRaspberryPi1B1 class]),
                        PGWX_RaspberryPi1B2     :NSStringFromClass([PGWXPlatformRaspberryPi1B2 class]),
                        PGWX_RaspberryPiZero    :NSStringFromClass([PGWXPlatformRaspberryPiZero class]),
                        PGWX_RaspberryPi1BPlus  :NSStringFromClass([PGWXPlatformRaspberryPi1BPlus class]),
                        PGWX_RaspberryPi2       :NSStringFromClass([PGWXPlatformRaspberryPi2 class]),
                        PGWX_RaspberryPi3       :NSStringFromClass([PGWXPlatformRaspberryPi3 class]),
                        PGWX_HummingboardProDQ  :NSStringFromClass([PGWXPlatformSolidRunHummingboardBaseProDQ class]),
                        PGWX_HummingboardBaseDQ :NSStringFromClass([PGWXPlatformSolidRunHummingboardBaseProDQ class]),
                        PGWX_HummingboardGateDQ :NSStringFromClass([PGWXPlatformSolidRunHummingboardGateEdgeDQ class]),
                        PGWX_HummingboardEdgeDQ :NSStringFromClass([PGWXPlatformSolidRunHummingboardGateEdgeDQ class]),
                        PGWX_HummingboardProSDL :NSStringFromClass([PGWXPlatformSolidRunHummingboardBaseProSDL class]),
                        PGWX_HummingboardBaseSDL:NSStringFromClass([PGWXPlatformSolidRunHummingboardBaseProSDL class]),
                        PGWX_HummingboardGateSDL:NSStringFromClass([PGWXPlatformSolidRunHummingboardGateEdgeSDL class]),
                        PGWX_HummingboardEdgeSDL:NSStringFromClass([PGWXPlatformSolidRunHummingboardGateEdgeSDL class]),
                        PGWX_OrangePiPCPlus     :NSStringFromClass([PGWXPlatformXunLongOrangePiPCP class])
                };
            }
        }
        return _map;
    }

@end
