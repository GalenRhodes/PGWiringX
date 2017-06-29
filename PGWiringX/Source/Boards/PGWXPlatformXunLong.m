/******************************************************************************************************************************//**
 *     PROJECT: PGWiringX
 *    FILENAME: PGWXPlatformXunLong.m
 *         IDE: AppCode
 *      AUTHOR: Galen Rhodes
 *        DATE: 6/26/17 3:00 PM
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

#import "PGWXSOCAllwinner.h"
#import "PGWXPlatformXunLong.h"

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
 *
 * 0v
 * 17|PA5
 * 18|PA4
 *
 * LED RED = PA15
 * LED GREEN = PL10
 */
#define PGWXMAPORANGEPI @[\
    @"PA1",\
    @"PD14",\
    @"PA0",\
    @"PA3",\
    @"PC4",\
    @"PC7",\
    @"PA2",\
    @"PA6",\
    @"PA12",\
    @"PA11",\
    @"PC3",\
    @"PA21",\
    @"PC0",\
    @"PC1",\
    @"PC2",\
    @"PA13",\
    @"PA14",\
    @"PA5",\
    @"PA4",\
    @"PA15",\
    @"PL10",\
    @"PA7",\
    @"PA8",\
    @"PA9",\
    @"PA10",\
    @"PA20",\
    @"PG8",\
    @"PG9",\
    @"PG6",\
    @"PG7"]

#define PGWXIRQORANGEPI @[\
    @"PA1",\
    @"",\
    @"PA0",\
    @"PA3",\
    @"",\
    @"",\
    @"PA2",\
    @"PA6",\
    @"PA12",\
    @"PA11",\
    @"",\
    @"PA21",\
    @"",\
    @"",\
    @"",\
    @"PA13",\
    @"PA14",\
    @"PA5",\
    @"PA4",\
    @"",\
    @"",\
    @"PA7",\
    @"PA8",\
    @"PA9",\
    @"PA10",\
    @"PA20",\
    @"PG8",\
    @"PG9",\
    @"PG6",\
    @"PG7"]

@implementation PGWXPlatformXunLongOrangePiPCP {
    }

    -(instancetype)init:(NSError *_Nullable *)error {
        PGWXSOC *soc = [[PGWXSOCAllwinnerH3 alloc] initWithGPIOMap:PGWXMAPORANGEPI irqMap:PGWXIRQORANGEPI error:error];
        return (self = [super initWithBoardName:@"Orange Pi PC+" soc:soc error:error]);
    }

@end
