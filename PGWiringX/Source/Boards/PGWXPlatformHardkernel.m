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
    @"GPIOY_8",\
    @"GPIOY_7",\
    @"GPIOX_19",\
    @"GPIOX_18",\
    @"GPIOX_7",\
    @"GPIOX_5",\
    @"GPIOX_6",\
    @"GPIOY_3",\
    @"GPIODV_24",\
    @"GPIODV_25",\
    @"GPIOX_20",\
    @"GPIOX_21",\
    @"GPIOX_10",\
    @"GPIOX_9",\
    @"GPIOX_8",\
    @"",\
    @"",\
    @"GPIODV_26",\
    @"GPIODV_27",\
    @"",\
    @"",\
    @"GPIOX_4",\
    @"GPIOX_3",\
    @"GPIOX_11",\
    @"GPIOX_0",\
    @"",\
    @"GPIOX_2",\
    @"GPIOX_1"]

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
    @"GPIOX_19",\
    @"GPIOX_10",\
    @"GPIOX_11",\
    @"GPIOX_9",\
    @"GPIOX_8",\
    @"GPIOX_5",\
    @"GPIOX_3",\
    @"GPIOX_21",\
    @"GPIODV_24",\
    @"GPIODV_25",\
    @"GPIOX_1",\
    @"GPIOY_11",\
    @"GPIOX_7",\
    @"GPIOX_4",\
    @"GPIOX_2",\
    @"",\
    @"",\
    @"",\
    @"",\
    @"",\
    @"",\
    @"GPIOX_0",\
    @"GPIOY_8",\
    @"GPIOX_6",\
    @"GPIOY_3",\
    @"",\
    @"GPIOY_13",\
    @"GPIOY_7"]

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
    @"GPIX_A03",\
    @"GPIO_A02",\
    @"GPIO_X15",\
    @"GPIO_X16",\
    @"GPIO_X13",\
    @"GPIO_X17",\
    @"GPIO_X20",\
    @"GPIO_X12",\
    @"GPIO_B32",\
    @"GPIO_B33",\
    @"GPIO_A25",\
    @"GPIO_X21",\
    @"GPIO_A27",\
    @"GPIO_A26",\
    @"GPIO_A24",\
    @"GPIO_A01",\
    @"GPIO_A00",\
    @"",\
    @"",\
    @"",\
    @"",\
    @"GPIO_X24",\
    @"GPIO_X26",\
    @"GPIO_X27",\
    @"",\
    @"",\
    @"GPIO_X25",\
    @"GPIO_X31",\
    @"",\
    @"",\
    @"GPIO_A22",\
    @"GPIO_A23",\
    @"GPIO_X32",\
    @"GPIO_Z0",\
    @"GPIO_Z1",\
    @"GPIO_Z4",\
    @"GPIO_Z2",\
    @"GPIO_Z3"]

@implementation PGWXPlatformHardkernelOdroidC1 {
    }

    -(instancetype)init:(NSError *_Nullable *)error {
        PGWXSOC *soc = [[PGWXSOCAmlogicS805 alloc] initWithGPIOMap:PGWXMAPODROIDC1 irqMap:nil error:error];
        return (self = [super initWithBoardName:@"ODROID C1" soc:soc error:error]);
    }

@end

@implementation PGWXPlatformHardkernelOdroidC2 {
    }

    -(instancetype)init:(NSError *_Nullable *)error {
        PGWXSOC *soc = [[PGWXSOCAmlogicS905 alloc] initWithGPIOMap:PGWXMAPODROIDC2 irqMap:nil error:error];
        return (self = [super initWithBoardName:@"Odroid C2" soc:soc error:error]);
    }

@end

@implementation PGWXPlatformHardkernelOdroidXU4 {
    }

    -(instancetype)init:(NSError *_Nullable *)error {
        PGWXSOC *soc = [[PGWXSOCSamsungExynos5422 alloc] initWithGPIOMap:PGWXMAPODROIDXU4 irqMap:nil error:error];
        return (self = [super initWithBoardName:@"Odroid XU4" soc:soc error:error]);
    }

@end
