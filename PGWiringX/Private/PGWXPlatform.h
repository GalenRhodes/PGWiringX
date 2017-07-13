/******************************************************************************************************************************//**
 *     PROJECT: PGWiringX
 *    FILENAME: PGWXPlatform.h
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

#ifndef __PGWiringX_PGWXPlatform_H_
#define __PGWiringX_PGWXPlatform_H_

#import "PGWXSOC.h"

NS_ASSUME_NONNULL_BEGIN

@interface PGWXPlatform : NSObject<NSLocking>

    @property(nonatomic, readonly, copy) NSString            *boardName;
    @property(nonatomic, readonly, retain) PGWXSOC           *soc;
    @property(nonatomic, readonly, copy) NSArray<NSString *> *gpioMap;
    @property(nonatomic, readonly, copy) NSArray<NSString *> *irqMap;

    -(instancetype)init:(NSError **)error;

    -(NSString *)pinNameForPin:(NSUInteger)pin;

    -(NSString *)irqPinNameForPin:(NSUInteger)pin;

    -(BOOL)setMode:(PGWXPinMode)mode forPin:(NSUInteger)pin error:(NSError **)error;

    -(BOOL)digitalWrite:(PGWXPinState)value toPin:(NSUInteger)pin error:(NSError **)error;

    -(PGWXPinState)digitalReadFromPin:(NSUInteger)pin error:(NSError **)error;

    -(int32_t)analogReadFromPin:(NSUInteger)pin error:(NSError **)error;

    -(BOOL)setISR:(PGWXISRMode)mode forPin:(NSUInteger)pin error:(NSError **)error;

    -(BOOL)waitForInterruptOnPin:(NSUInteger)pin timeout:(NSUInteger)timeout error:(NSError **)error;

    -(BOOL)isValidPin:(NSUInteger)pin;

    -(BOOL)isValidIRQPin:(NSUInteger)pin;

@end

NS_ASSUME_NONNULL_END

#endif //__PGWiringX_PGWXPlatform_H_
