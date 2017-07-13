/***************************************************************************//**
 *     PROJECT: PGWiringX
 *    FILENAME: PGWiringX.h
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

#import <PGWiringX/PGWXSupport.h>

FOUNDATION_EXPORT double              PGWiringXVersionNumber;
FOUNDATION_EXPORT const unsigned char PGWiringXVersionString[];

NS_ASSUME_NONNULL_BEGIN

/*
 * The following string constants contain the names of all the supported single-board computers.
 */

FOUNDATION_EXPORT NSString *const PGWX_OdroidC1;
FOUNDATION_EXPORT NSString *const PGWX_OdroidC2;
FOUNDATION_EXPORT NSString *const PGWX_OdroidXU4;
FOUNDATION_EXPORT NSString *const PGWX_BananaPi1;
FOUNDATION_EXPORT NSString *const PGWX_BananaPiM2;
FOUNDATION_EXPORT NSString *const PGWX_PCDuino1;
FOUNDATION_EXPORT NSString *const PGWX_RaspberryPi1B1;
FOUNDATION_EXPORT NSString *const PGWX_RaspberryPi1B2;
FOUNDATION_EXPORT NSString *const PGWX_RaspberryPiZero;
FOUNDATION_EXPORT NSString *const PGWX_RaspberryPi1BPlus;
FOUNDATION_EXPORT NSString *const PGWX_RaspberryPi2;
FOUNDATION_EXPORT NSString *const PGWX_RaspberryPi3;
FOUNDATION_EXPORT NSString *const PGWX_HummingboardBaseDQ;
FOUNDATION_EXPORT NSString *const PGWX_HummingboardBaseSDL;
FOUNDATION_EXPORT NSString *const PGWX_HummingboardProDQ;
FOUNDATION_EXPORT NSString *const PGWX_HummingboardProSDL;
FOUNDATION_EXPORT NSString *const PGWX_HummingboardEdgeDQ;
FOUNDATION_EXPORT NSString *const PGWX_HummingboardEdgeSDL;
FOUNDATION_EXPORT NSString *const PGWX_HummingboardGateDQ;
FOUNDATION_EXPORT NSString *const PGWX_HummingboardGateSDL;
FOUNDATION_EXPORT NSString *const PGWX_OrangePiPCPlus;

@interface PGWiringX : NSObject

    -(instancetype)initWithPlatformName:(NSString *)platformName error:(NSError **)error;

    -(BOOL)setMode:(PGWXPinMode)mode forPin:(NSUInteger)pin error:(NSError **)error;

    -(BOOL)digitalWrite:(PGWXPinState)value toPin:(NSUInteger)pin error:(NSError **)error;

    -(PGWXPinState)digitalReadFromPin:(NSUInteger)pin error:(NSError **)error;

    -(NSInteger)analogReadFromPin:(NSUInteger)pin error:(NSError **)error;

    -(BOOL)setISR:(PGWXISRMode)mode forPin:(NSUInteger)pin error:(NSError **)error;

    -(BOOL)waitForInterruptOnPin:(NSUInteger)pin timeout:(NSUInteger)timeout error:(NSError **)error;

    -(BOOL)isValidPin:(NSUInteger)pin;

@end

NS_ASSUME_NONNULL_END
