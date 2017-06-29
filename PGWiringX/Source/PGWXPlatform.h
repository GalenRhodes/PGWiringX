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

#import <Rubicon/Rubicon.h>
#import <PGWiringX/PGWXSOC.h>

NS_ASSUME_NONNULL_BEGIN

@interface PGWXPlatform : NSObject

    @property(nonatomic, readonly, copy) NSString  *boardName;
    @property(nonatomic, readonly, retain) PGWXSOC *soc;

    -(instancetype)initWithBoardName:(NSString *)boardName soc:(PGWXSOC *)soc error:(NSError *_Nullable *)error;

    -(NSError *)setMode:(PGWXPinMode)mode pin:(NSUInteger)pin;

    -(NSError *)digitalWrite:(PGWXPinState)value pin:(NSUInteger)pin;

    -(PGWXPinState)digitalReadPin:(NSUInteger)pin error:(NSError *_Nullable *)error;

    -(NSInteger)analogReadPin:(NSUInteger)pin error:(NSError *_Nullable *)error;

    -(NSError *)setISR:(PGWXISRMode)mode pin:(NSUInteger)pin;

    -(BOOL)waitForInterruptOnPin:(NSUInteger)pin timeout:(NSUInteger)timeout error:(NSError *_Nullable *)error;

    -(BOOL)isValidPin:(NSUInteger)pin;

    -(int)selectableFdForPin:(NSUInteger)pin error:(NSError *_Nullable *)error;

@end

NS_ASSUME_NONNULL_END

#endif //__PGWiringX_PGWXPlatform_H_
