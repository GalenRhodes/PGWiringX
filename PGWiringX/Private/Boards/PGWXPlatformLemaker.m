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
#import "PGWiringX.h"

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
@implementation PGWXPlatformLemakerBananaPi1 {
        NSArray<NSString *> *_gpioMap;
        PGWXSOC             *_soc;
    }

    -(NSString *)boardName {
        return PGWX_BananaPi1;
    }

    -(NSArray<NSString *> *)gpioMap {
        [self lock];

        @try {
            if(_gpioMap.count == 0) {
                _gpioMap = @[
                        @"PI19",
                        @"PH2",
                        @"PI18",
                        @"PI17",
                        @"PH20",
                        @"PH21",
                        @"PI16",
                        @"PI3",
                        @"PB21",
                        @"PB20",
                        @"PI10",
                        @"PI14",
                        @"PI12",
                        @"PI13",
                        @"PI11",
                        @"PH0",
                        @"PH1",
                        @"PH5",
                        @"PI21",
                        @"PH3",
                        @"PI20"
                ];
            }
        }
        @finally {
            [self unlock];
        }
        return _gpioMap;
    }

    -(PGWXSOC *)soc {
        [self lock];

        @try {
            if(_soc == nil) {
                _soc = [[PGWXSOCAllwinnerA10 alloc] init:nil];
            }
        }
        @finally {
            [self unlock];
        }
        return _soc;
    }

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
@implementation PGWXPlatformLemakerBananaPiM2 {
        NSArray<NSString *> *_gpioMap;
        PGWXSOC             *_soc;
    }

    -(NSString *)boardName {
        return PGWX_BananaPiM2;
    }

    -(NSArray<NSString *> *)gpioMap {
        [self lock];

        @try {
            if(_gpioMap.count == 0) {
                _gpioMap = @[
                        @"PG7",
                        @"PH10",
                        @"PG6",
                        @"PG9",
                        @"PH11",
                        @"PH12",
                        @"PG8",
                        @"PH9",
                        @"PH19",
                        @"PH18",
                        @"PG13",
                        @"PG12",
                        @"PG15",
                        @"PG16",
                        @"PG14",
                        @"PE4",
                        @"PE5",
                        @"",
                        @"",
                        @"",
                        @"",
                        @"PB0",
                        @"PB1",
                        @"PB2",
                        @"PB3",
                        @"PB4",
                        @"PB7",
                        @"PE6",
                        @"PE7",
                        @"PM2",
                        @"PG10",
                        @"PG11"
                ];
            }
        }
        @finally {
            [self unlock];
        }
        return _gpioMap;
    }

    -(PGWXSOC *)soc {
        [self lock];

        @try {
            if(_soc == nil) {
                _soc = [[PGWXSOCAllwinnerA31s alloc] init:nil];
            }
        }
        @finally {
            [self unlock];
        }
        return _soc;
    }

@end
