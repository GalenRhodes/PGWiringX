/******************************************************************************************************************************//**
 *     PROJECT: PGWiringX
 *    FILENAME: PGWXPlatformLinkSprite.m
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

#import "PGWXPlatformLinkSprite.h"
#import "PGWXSOCAllwinner.h"
#import "PGWiringX.h"

/*
 PI19: PCDuino GPIO 0
 PI18: PCDuino GPIO 1
 PH7:  PCDuino GPIO 2
 PH6:  PCDuino GPIO 3
 PH8:  PCDuino GPIO 4
 PB2:  PCDuino GPIO 5
 PI3:  PCDuino GPIO 6
 PH9:  PCDuino GPIO 7
 PH10: PCDuino GPIO 8
 PH5:  PCDuino GPIO 9
 PI10: PCDuino GPIO 10
 PI12: PCDuino GPIO 11
 PI13: PCDuino GPIO 12
 PI11: PCDuino GPIO 13
 PH11: PCDuino GPIO 14
 PH12: PCDuino GPIO 15
 PH13: PCDuino GPIO 16
 PH14: PCDuino GPIO 17
 PH15: PCDuino GPIO 18 (TX LED)
 PH16: PCDuino GPIO 19 (RX LED)
*/
@implementation PGWXPlatformLinkSpritePCDuino1 {
        NSArray<NSString *> *_gpioMap;
        PGWXSOC             *_soc;
    }

    -(NSString *)boardName {
        return PGWX_PCDuino1;
    }

    -(NSArray<NSString *> *)gpioMap {
        [self lock];

        @try {
            if(_gpioMap.count == 0) {
                _gpioMap = @[
                        @"PI19",
                        @"PI18",
                        @"PH7",
                        @"PH6",
                        @"PH8",
                        @"PB2",
                        @"PI3",
                        @"PH9",
                        @"PH10",
                        @"PH5",
                        @"PI10",
                        @"PI12",
                        @"PI13",
                        @"PI11",
                        @"PH11",
                        @"PH12",
                        @"PH13",
                        @"PH14",
                        @"PH15",
                        @"PH16"
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
