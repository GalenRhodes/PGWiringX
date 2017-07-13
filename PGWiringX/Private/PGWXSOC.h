/******************************************************************************************************************************//**
 *     PROJECT: PGWiringX
 *    FILENAME: PGWXSOC.h
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

#ifndef __PGWiringX_PGWXSOC_H_
#define __PGWiringX_PGWXSOC_H_

#import "PGWXLayout.h"
#import "PGWXAddr.h"

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const PGWXPinNotFoundErrorMessage;
FOUNDATION_EXPORT NSString *const PGWXInvalidPinNumberErrorMessage;
FOUNDATION_EXPORT const NSInteger PGWXInvalidPinNumberErrorCode;

@interface PGWXSOC : NSObject<NSLocking>

    @property(nonatomic, readonly, copy) NSString                               *brandName;
    @property(nonatomic, readonly, copy) NSString                               *chipSet;
    @property(nonatomic, readonly, copy) NSDictionary<NSString *, PGWXLayout *> *layout;
    @property(nonatomic, readonly) NSUInteger                                   isrModes;
    @property(nonatomic, readonly) NSUInteger                                   pageSize;
    @property(nonatomic, readonly) NSArray<PGWXAddr *>                          *baseAddresses;

    -(instancetype)init:(NSError **)error;

    -(BOOL)setMode:(PGWXPinMode)mode forPinNamed:(NSString *)pinName error:(NSError **)error;

    -(BOOL)digitalWrite:(PGWXPinState)value toPinNamed:(NSString *)pinName error:(NSError **)error;

    -(PGWXPinState)digitalReadFromPinNamed:(NSString *)pinName error:(NSError **)error;

    -(int32_t)analogReadFromPinNamed:(NSString *)pinName error:(NSError **)error;

    -(BOOL)setISR:(PGWXISRMode)mode forPinNamed:(NSString *)pinName error:(NSError **)error;

    -(BOOL)waitForInterruptOnPinNamed:(NSString *)pinName timeout:(NSUInteger)timeout error:(NSError **)error;

    -(BOOL)isValidPinNamed:(NSString *)pinName;

    -(BOOL)isValidIRQPinNamed:(NSString *)pinName;

@end

NS_ASSUME_NONNULL_END

#endif //__PGWiringX_PGWXSOC_H_
