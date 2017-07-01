/******************************************************************************************************************************//**
 *     PROJECT: PGWiringX
 *    FILENAME: PGWXPlatformHardkernel.h
 *         IDE: AppCode
 *      AUTHOR: Galen Rhodes
 *        DATE: 6/26/17 2:57 PM
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

#ifndef __PGWiringX_PGWXPlatformHardkernel_H_
#define __PGWiringX_PGWXPlatformHardkernel_H_

#import "PGWXPlatform.h"

NS_ASSUME_NONNULL_BEGIN

/*
 * |-----|
 * |3v|5v|
 * | 8|5v|
 * | 9|0v|
 * | 7|TX|
 * |0v|RX|
 * | 0| 1|
 * | 2|0v|
 * | 3| 4|
 * |3v| 5|
 * |12|0v|
 * |13| 6|
 * |14|10|
 * |0v|11|
 * |17|18|
 * |21|0v|
 * |22|26|
 * |23|0v|
 * |24|27|
 * |AD|2v|
 * |0v|AD|
 * |-----|
 */
@interface PGWXPlatformHardkernelOdroidC1 : PGWXPlatform

    -(instancetype)init:(NSError *_Nullable *)error;

@end

/*
 * |-----|
 * |3v|5v|
 * |I2|5v|
 * |I2|0v|
 * | 7|TX|
 * |0v|RX|
 * | 0| 1|
 * | 2|0v|
 * | 3| 4|
 * |3v| 5|
 * |12|0v|
 * |13| 6|
 * |14|10|
 * |0v|11|
 * |I2|I2|
 * |21|0v|
 * |22|26|
 * |23|0v|
 * |24|27|
 * |AD|2v|
 * |0v|AD|
 * |-----|
 */
@interface PGWXPlatformHardkernelOdroidC2 : PGWXPlatform

    -(instancetype)init:(NSError *_Nullable *)error;

@end

/*
 * |-----|
 * |5v|0v|
 * |AD| 1|
 * | 0|16|
 * |12|15|
 * |13|14|
 * |10|PW|
 * | 2| 9|
 * | 7| 8|
 * | 3| 4|
 * |22|21|
 * |26|23|
 * |AD|11|
 * | 5| 6|
 * |27|0v|
 * |2v|0v|
 * |-----|
 *
 * -------------------
 * |36 34 33 32 2v 5v|
 * |37 35 0v 31 30 0v|
 * -------------------
 */
@interface PGWXPlatformHardkernelOdroidXU4 : PGWXPlatform

    -(instancetype)init:(NSError *_Nullable *)error;

@end

NS_ASSUME_NONNULL_END

#endif //__PGWiringX_PGWXPlatformHardkernel_H_
