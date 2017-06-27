/******************************************************************************************************************************//**
 *     PROJECT: PGWiringX
 *    FILENAME: PGWXPlatformLemaker.m
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

#import "PGWXPlatformLemaker.h"
#import "PGWXSOCAllwinner.h"

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
#define PGWXMAPBANANAPI1 @[\
    [PGWXPinName pinName:@"PI19" withNumber:167],\
    [PGWXPinName pinName:@"PH2"  withNumber:126],\
    [PGWXPinName pinName:@"PI18" withNumber:166],\
    [PGWXPinName pinName:@"PI17" withNumber:165],\
    [PGWXPinName pinName:@"PH20" withNumber:144],\
    [PGWXPinName pinName:@"PH21" withNumber:145],\
    [PGWXPinName pinName:@"PI16" withNumber:164],\
    [PGWXPinName pinName:@"PI3"  withNumber:151],\
    [PGWXPinName pinName:@"PB21" withNumber: 39],\
    [PGWXPinName pinName:@"PB20" withNumber: 38],\
    [PGWXPinName pinName:@"PI10" withNumber:158],\
    [PGWXPinName pinName:@"PI14" withNumber:162],\
    [PGWXPinName pinName:@"PI12" withNumber:160],\
    [PGWXPinName pinName:@"PI13" withNumber:161],\
    [PGWXPinName pinName:@"PI11" withNumber:159],\
    [PGWXPinName pinName:@"PH0"  withNumber:124],\
    [PGWXPinName pinName:@"PH1"  withNumber:125],\
    [PGWXPinName pinName:@"PH5"  withNumber:129],\
    [PGWXPinName pinName:@"PI21" withNumber:169],\
    [PGWXPinName pinName:@"PH3"  withNumber:127],\
    [PGWXPinName pinName:@"PI20" withNumber:168]]

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
#define PGWXMAPBANANAPIM2 @[\
    [PGWXPinName pinName:@"PG7"       withNumber:113],\
    [PGWXPinName pinName:@"PH10"      withNumber:126],\
    [PGWXPinName pinName:@"PG6"       withNumber:112],\
    [PGWXPinName pinName:@"PG9"       withNumber:115],\
    [PGWXPinName pinName:@"PH11"      withNumber:127],\
    [PGWXPinName pinName:@"PH12"      withNumber:128],\
    [PGWXPinName pinName:@"PG8"       withNumber:114],\
    [PGWXPinName pinName:@"PH9"       withNumber:125],\
    [PGWXPinName pinName:@"PH19"      withNumber:135],\
    [PGWXPinName pinName:@"PH18"      withNumber:134],\
    [PGWXPinName pinName:@"PG13"      withNumber:119],\
    [PGWXPinName pinName:@"PG12"      withNumber:118],\
    [PGWXPinName pinName:@"PG15"      withNumber:121],\
    [PGWXPinName pinName:@"PG16"      withNumber:122],\
    [PGWXPinName pinName:@"PG14"      withNumber:120],\
    [PGWXPinName pinName:@"PE4"       withNumber: 88],\
    [PGWXPinName pinName:@"PE5"       withNumber: 89],\
    [PGWXPinName pinName:@"(Padding)" withNumber: -1],\
    [PGWXPinName pinName:@"(Padding)" withNumber: -1],\
    [PGWXPinName pinName:@"(Padding)" withNumber: -1],\
    [PGWXPinName pinName:@"(Padding)" withNumber: -1],\
    [PGWXPinName pinName:@"PB0"       withNumber: 28],\
    [PGWXPinName pinName:@"PB1"       withNumber: 29],\
    [PGWXPinName pinName:@"PB2"       withNumber: 30],\
    [PGWXPinName pinName:@"PB3"       withNumber: 31],\
    [PGWXPinName pinName:@"PB4"       withNumber: 32],\
    [PGWXPinName pinName:@"PB7"       withNumber: 35],\
    [PGWXPinName pinName:@"PE6"       withNumber: 90],\
    [PGWXPinName pinName:@"PE7"       withNumber: 91],\
    [PGWXPinName pinName:@"PM2"       withNumber:155],\
    [PGWXPinName pinName:@"PG10"      withNumber:116],\
    [PGWXPinName pinName:@"PG11"      withNumber:117]]

@implementation PGWXPlatformLemakerBananaPi1 {
    }

    -(instancetype)init:(NSError **)error {
        PGWXSOC *soc = [[PGWXSOCAllwinnerA10 alloc] initWithGPIOMap:PGWXMAPBANANAPI1 irqMap:nil error:error];
        return (self = [super initWithBoardName:@"Banana Pi1" soc:soc error:error]);
    }

@end

@implementation PGWXPlatformLemakerBananaPiM2 {
    }

    -(instancetype)init:(NSError **)error {
        PGWXSOC *soc = [[PGWXSOCAllwinnerA31s alloc] initWithGPIOMap:PGWXMAPBANANAPIM2 irqMap:nil error:error];
        return nil;
    }

@end
