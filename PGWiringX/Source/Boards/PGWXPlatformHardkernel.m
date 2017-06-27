/******************************************************************************************************************************//**
 *     PROJECT: PGWiringX
 *    FILENAME: PGWXPlatformHardkernel.m
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

#import "PGWXPlatformHardkernel.h"
#import "PGWXSOCAmlogic.h"
#import "PGWXSOCSamsung.h"

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
#define PGWXMAPODROIDC1 @[\
    [PGWXPinName pinName:@"GPIOY_8"   withNumber: 88],\
    [PGWXPinName pinName:@"GPIOY_7"   withNumber: 87],\
    [PGWXPinName pinName:@"GPIOX_19"  withNumber:116],\
    [PGWXPinName pinName:@"GPIOX_18"  withNumber:115],\
    [PGWXPinName pinName:@"GPIOX_7"   withNumber:104],\
    [PGWXPinName pinName:@"GPIOX_5"   withNumber:102],\
    [PGWXPinName pinName:@"GPIOX_6"   withNumber:103],\
    [PGWXPinName pinName:@"GPIOY_3"   withNumber: 83],\
    [PGWXPinName pinName:@"GPIODV_24" withNumber: 74],\
    [PGWXPinName pinName:@"GPIODV_25" withNumber: 75],\
    [PGWXPinName pinName:@"GPIOX_20"  withNumber:117],\
    [PGWXPinName pinName:@"GPIOX_21"  withNumber:118],\
    [PGWXPinName pinName:@"GPIOX_10"  withNumber:107],\
    [PGWXPinName pinName:@"GPIOX_9"   withNumber:106],\
    [PGWXPinName pinName:@"GPIOX_8"   withNumber:105],\
    [PGWXPinName pinName:@"(Padding)" withNumber: -1],\
    [PGWXPinName pinName:@"(Padding)" withNumber: -1],\
    [PGWXPinName pinName:@"GPIODV_26" withNumber: 76],\
    [PGWXPinName pinName:@"GPIODV_27" withNumber: 77],\
    [PGWXPinName pinName:@"(Padding)" withNumber: -1],\
    [PGWXPinName pinName:@"(Padding)" withNumber: -1],\
    [PGWXPinName pinName:@"GPIOX_4"   withNumber:101],\
    [PGWXPinName pinName:@"GPIOX_3"   withNumber:100],\
    [PGWXPinName pinName:@"GPIOX_11"  withNumber:108],\
    [PGWXPinName pinName:@"GPIOX_0"   withNumber: 97],\
    [PGWXPinName pinName:@"(Padding)" withNumber: -1],\
    [PGWXPinName pinName:@"GPIOX_2"   withNumber: 99],\
    [PGWXPinName pinName:@"GPIOX_1"   withNumber: 98]]

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
#define PGWXMAPODROIDC2 @[\
    [PGWXPinName pinName:@"GPIOX_19"  withNumber:125],\
    [PGWXPinName pinName:@"GPIOX_10"  withNumber:116],\
    [PGWXPinName pinName:@"GPIOX_11"  withNumber:117],\
    [PGWXPinName pinName:@"GPIOX_9"   withNumber:115],\
    [PGWXPinName pinName:@"GPIOX_8"   withNumber:114],\
    [PGWXPinName pinName:@"GPIOX_5"   withNumber:111],\
    [PGWXPinName pinName:@"GPIOX_3"   withNumber:109],\
    [PGWXPinName pinName:@"GPIOX_21"  withNumber:127],\
    [PGWXPinName pinName:@"GPIODV_24" withNumber: 83],\
    [PGWXPinName pinName:@"GPIODV_25" withNumber: 84],\
    [PGWXPinName pinName:@"GPIOX_1"   withNumber:107],\
    [PGWXPinName pinName:@"GPIOY_11"  withNumber:103],\
    [PGWXPinName pinName:@"GPIOX_7"   withNumber:113],\
    [PGWXPinName pinName:@"GPIOX_4"   withNumber:110],\
    [PGWXPinName pinName:@"GPIOX_2"   withNumber:108],\
    [PGWXPinName pinName:@"(Padding)" withNumber: -1],\
    [PGWXPinName pinName:@"(Padding)" withNumber: -1],\
    [PGWXPinName pinName:@"(Padding)" withNumber: -1],\
    [PGWXPinName pinName:@"(Padding)" withNumber: -1],\
    [PGWXPinName pinName:@"(Padding)" withNumber: -1],\
    [PGWXPinName pinName:@"(Padding)" withNumber: -1],\
    [PGWXPinName pinName:@"GPIOX_0"   withNumber:106],\
    [PGWXPinName pinName:@"GPIOY_8"   withNumber: 97],\
    [PGWXPinName pinName:@"GPIOX_6"   withNumber:112],\
    [PGWXPinName pinName:@"GPIOY_3"   withNumber: 92],\
    [PGWXPinName pinName:@"(Padding)" withNumber: -1],\
    [PGWXPinName pinName:@"GPIOY_13"  withNumber:102],\
    [PGWXPinName pinName:@"GPIOY_7"   withNumber: 96]]

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

#define PGWXMAPODROIDXU4 @[\
    [PGWXPinName pinName:@"GPIX_A03"  withNumber:174],\
    [PGWXPinName pinName:@"GPIO_A02"  withNumber:173],\
    [PGWXPinName pinName:@"GPIO_X15"  withNumber: 21],\
    [PGWXPinName pinName:@"GPIO_X16"  withNumber: 22],\
    [PGWXPinName pinName:@"GPIO_X13"  withNumber: 19],\
    [PGWXPinName pinName:@"GPIO_X17"  withNumber: 23],\
    [PGWXPinName pinName:@"GPIO_X20"  withNumber: 24],\
    [PGWXPinName pinName:@"GPIO_X12"  withNumber: 18],\
    [PGWXPinName pinName:@"GPIO_B32"  withNumber:209],\
    [PGWXPinName pinName:@"GPIO_B33"  withNumber:210],\
    [PGWXPinName pinName:@"GPIO_A25"  withNumber:190],\
    [PGWXPinName pinName:@"GPIO_X21"  withNumber: 25],\
    [PGWXPinName pinName:@"GPIO_A27"  withNumber:192],\
    [PGWXPinName pinName:@"GPIO_A26"  withNumber:191],\
    [PGWXPinName pinName:@"GPIO_A24"  withNumber:189],\
    [PGWXPinName pinName:@"GPIO_A01"  withNumber:172],\
    [PGWXPinName pinName:@"GPIO_A00"  withNumber:171],\
    [PGWXPinName pinName:@"(Padding)" withNumber: -1],\
    [PGWXPinName pinName:@"(Padding)" withNumber: -1],\
    [PGWXPinName pinName:@"(Padding)" withNumber: -1],\
    [PGWXPinName pinName:@"(Padding)" withNumber: -1],\
    [PGWXPinName pinName:@"GPIO_X24"  withNumber: 28],\
    [PGWXPinName pinName:@"GPIO_X26"  withNumber: 30],\
    [PGWXPinName pinName:@"GPIO_X27"  withNumber: 31],\
    [PGWXPinName pinName:@"(Padding)" withNumber: -1],\
    [PGWXPinName pinName:@"(Padding)" withNumber: -1],\
    [PGWXPinName pinName:@"GPIO_X25"  withNumber: 29],\
    [PGWXPinName pinName:@"GPIO_X31"  withNumber: 33],\
    [PGWXPinName pinName:@"(Padding)" withNumber: -1],\
    [PGWXPinName pinName:@"(Padding)" withNumber: -1],\
    [PGWXPinName pinName:@"GPIO_A22"  withNumber:187],\
    [PGWXPinName pinName:@"GPIO_A23"  withNumber:188],\
    [PGWXPinName pinName:@"GPIO_X32"  withNumber: 34],\
    [PGWXPinName pinName:@"GPIO_Z0"   withNumber:225],\
    [PGWXPinName pinName:@"GPIO_Z1"   withNumber:226],\
    [PGWXPinName pinName:@"GPIO_Z4"   withNumber:229],\
    [PGWXPinName pinName:@"GPIO_Z2"   withNumber:227],\
    [PGWXPinName pinName:@"GPIO_Z3"   withNumber:228]]

@implementation PGWXPlatformHardkernelOdroidC1 {
    }

    -(instancetype)init:(NSError **)error {
        PGWXSOC *soc = [[PGWXSOCAmlogicS805 alloc] initWithGPIOMap:PGWXMAPODROIDC1 irqMap:nil error:error];
        return (self = [super initWithBoardName:@"ODROID C1" soc:soc error:error]);
    }

@end

@implementation PGWXPlatformHardkernelOdroidC2 {
    }

    -(instancetype)init:(NSError **)error {
        PGWXSOC *soc = [[PGWXSOCAmlogicS905 alloc] initWithGPIOMap:PGWXMAPODROIDC2 irqMap:nil error:error];
        return (self = [super initWithBoardName:@"Odroid C2" soc:soc error:error]);
    }

@end

@implementation PGWXPlatformHardkernelOdroidXU4 {
    }

    -(instancetype)init:(NSError **)error {
        PGWXSOC *soc = [[PGWXSOCSamsungExynos5422 alloc] initWithGPIOMap:PGWXMAPODROIDXU4 irqMap:nil error:error];
        return (self = [super initWithBoardName:@"Odroid XU4" soc:soc error:error]);
    }

@end
