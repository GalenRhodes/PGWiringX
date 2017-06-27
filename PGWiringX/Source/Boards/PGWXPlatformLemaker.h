/******************************************************************************************************************************//**
 *     PROJECT: PGWiringX
 *    FILENAME: PGWXPlatformLemaker.h
 *         IDE: AppCode
 *      AUTHOR: Galen Rhodes
 *        DATE: 6/26/17 2:58 PM
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

#ifndef __PGWiringX_PGWXPlatformLemaker_H_
#define __PGWiringX_PGWXPlatformLemaker_H_

#import <Rubicon/Rubicon.h>
#import <PGWiringX/PGWXPlatform.h>

NS_ASSUME_NONNULL_BEGIN

/*
 * +--+--+
 * |3v|5v|
 * | 8|5v|
 * | 9|0v|
 * | 7|15|
 * |0v|16|
 * | 0| 1|
 * | 2|0v|
 * | 3| 4|
 * |3v| 5|
 * |12|0v|
 * |13| 6|
 * |14|10|
 * |0v|11|
 * |5v|5v|
 * |17|18|
 * |19|20|
 * |0v|0v|
 * +--+--+
 */
@interface PGWXPlatformLemakerBananaPi1 : PGWXPlatform

    -(instancetype)init:(NSError **)error;

@end

/*
 * +--+--+
 * |3v|5v|
 * | 8|5v|
 * | 9|0v|
 * | 7|15|
 * |0v|16|
 * | 0| 1|
 * | 2|0v|
 * | 3| 4|
 * |3v| 5|
 * |12|0v|
 * |13| 6|
 * |14|10|
 * |0v|11|
 * |0v|0v|
 * |21|0v|
 * |22|26|
 * |23|0v|
 * |24|27|
 * |25|28|
 * |0v|29|
 * +--+--+
 */
@interface PGWXPlatformLemakerBananaPiM2 : PGWXPlatform

    -(instancetype)init:(NSError **)error;

@end

NS_ASSUME_NONNULL_END

#endif //__PGWiringX_PGWXPlatformLemaker_H_
