/******************************************************************************************************************************//**
 *     PROJECT: PGWiringX
 *    FILENAME: PGWXI2CChannel.h
 *         IDE: AppCode
 *      AUTHOR: Galen Rhodes
 *        DATE: 7/5/17 3:18 PM
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

#ifndef __PGWiringX_PGWXI2CChannel_H_
#define __PGWiringX_PGWXI2CChannel_H_

#import <Rubicon/Rubicon.h>

@class PGWXPlatform;

NS_ASSUME_NONNULL_BEGIN

@interface PGWXI2CChannel : NSObject<NSLocking>

    -(instancetype)init;

    -(NSInteger)read:(NSError **)error;

    -(NSInteger)readReg8:(NSInteger)reg error:(NSError **)error;

    -(NSUInteger)readReg16:(NSInteger)reg error:(NSError **)error;

    -(BOOL)write:(NSInteger)data error:(NSError **)error;

    -(BOOL)write:(NSInteger)data reg8:(NSInteger)reg error:(NSError **)error;

    -(BOOL)write:(NSInteger)data reg16:(NSInteger)reg error:(NSError **)error;

    -(void)close;

@end

NS_ASSUME_NONNULL_END

#endif //__PGWiringX_PGWXI2CChannel_H_
