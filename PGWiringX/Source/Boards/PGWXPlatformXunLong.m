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
    [PGWXPinName pinName:@"PA1"  withNumber:  1],\
    [PGWXPinName pinName:@"PD14" withNumber: 55],\
    [PGWXPinName pinName:@"PA0"  withNumber:  0],\
    [PGWXPinName pinName:@"PA3"  withNumber:  3],\
    [PGWXPinName pinName:@"PC4"  withNumber: 26],\
    [PGWXPinName pinName:@"PC7"  withNumber: 29],\
    [PGWXPinName pinName:@"PA2"  withNumber:  2],\
    [PGWXPinName pinName:@"PA6"  withNumber:  6],\
    [PGWXPinName pinName:@"PA12" withNumber: 12],\
    [PGWXPinName pinName:@"PA11" withNumber: 11],\
    [PGWXPinName pinName:@"PC3"  withNumber: 25],\
    [PGWXPinName pinName:@"PA21" withNumber: 21],\
    [PGWXPinName pinName:@"PC0"  withNumber: 22],\
    [PGWXPinName pinName:@"PC1"  withNumber: 23],\
    [PGWXPinName pinName:@"PC2"  withNumber: 24],\
    [PGWXPinName pinName:@"PA13" withNumber: 13],\
    [PGWXPinName pinName:@"PA14" withNumber: 14],\
    [PGWXPinName pinName:@"PA5"  withNumber:  5],\
    [PGWXPinName pinName:@"PA4"  withNumber:  4],\
    [PGWXPinName pinName:@"PA15" withNumber: 15],\
    [PGWXPinName pinName:@"PL10" withNumber:106],\
    [PGWXPinName pinName:@"PA7"  withNumber:  7],\
    [PGWXPinName pinName:@"PA8"  withNumber:  8],\
    [PGWXPinName pinName:@"PA9"  withNumber:  9],\
    [PGWXPinName pinName:@"PA10" withNumber: 10],\
    [PGWXPinName pinName:@"PA20" withNumber: 20],\
    [PGWXPinName pinName:@"PG8"  withNumber: 90],\
    [PGWXPinName pinName:@"PG9"  withNumber: 91],\
    [PGWXPinName pinName:@"PG6"  withNumber: 88],\
    [PGWXPinName pinName:@"PG7"  withNumber: 89]]

#define PGWXIRQORANGEPI @[\
    [PGWXPinName pinName:@"PA1"       withNumber: 1],\
    [PGWXPinName pinName:@"(Padding)" withNumber:-1],\
    [PGWXPinName pinName:@"PA0"       withNumber: 0],\
    [PGWXPinName pinName:@"PA3"       withNumber: 3],\
    [PGWXPinName pinName:@"(Padding)" withNumber:-1],\
    [PGWXPinName pinName:@"(Padding)" withNumber:-1],\
    [PGWXPinName pinName:@"PA2"       withNumber: 2],\
    [PGWXPinName pinName:@"PA6"       withNumber: 6],\
    [PGWXPinName pinName:@"PA12"      withNumber:12],\
    [PGWXPinName pinName:@"PA11"      withNumber:11],\
    [PGWXPinName pinName:@"(Padding)" withNumber:-1],\
    [PGWXPinName pinName:@"PA21"      withNumber:21],\
    [PGWXPinName pinName:@"(Padding)" withNumber:-1],\
    [PGWXPinName pinName:@"(Padding)" withNumber:-1],\
    [PGWXPinName pinName:@"(Padding)" withNumber:-1],\
    [PGWXPinName pinName:@"PA13"      withNumber:13],\
    [PGWXPinName pinName:@"PA14"      withNumber:14],\
    [PGWXPinName pinName:@"PA5"       withNumber: 5],\
    [PGWXPinName pinName:@"PA4"       withNumber: 4],\
    [PGWXPinName pinName:@"(Padding)" withNumber:-1],\
    [PGWXPinName pinName:@"(Padding)" withNumber:-1],\
    [PGWXPinName pinName:@"PA7"       withNumber: 7],\
    [PGWXPinName pinName:@"PA8"       withNumber: 8],\
    [PGWXPinName pinName:@"PA9"       withNumber: 9],\
    [PGWXPinName pinName:@"PA10"      withNumber:10],\
    [PGWXPinName pinName:@"PA20"      withNumber:20],\
    [PGWXPinName pinName:@"PG8"       withNumber:90],\
    [PGWXPinName pinName:@"PG9"       withNumber:91],\
    [PGWXPinName pinName:@"PG6"       withNumber:88],\
    [PGWXPinName pinName:@"PG7"       withNumber:89]]

@implementation PGWXPlatformXunLongOrangePiPCP {
    }

    -(instancetype)init:(NSError **)error {
        PGWXSOC *soc = [[PGWXSOCAllwinnerH3 alloc] initWithGPIOMap:PGWXMAPORANGEPI irqMap:PGWXIRQORANGEPI error:error];
        return (self = [super initWithBoardName:@"Orange Pi PC+" soc:soc error:error]);
    }

@end
