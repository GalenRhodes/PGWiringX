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

#define PGWXMAPPCDUINO1 @[\
    [PGWXPinName pinName:@"PI19" withNumber:167],\
    [PGWXPinName pinName:@"PI18" withNumber:166],\
    [PGWXPinName pinName:@"PH7"  withNumber:131],\
    [PGWXPinName pinName:@"PH6"  withNumber:130],\
    [PGWXPinName pinName:@"PH8"  withNumber:132],\
    [PGWXPinName pinName:@"PB2"  withNumber: 20],\
    [PGWXPinName pinName:@"PI3"  withNumber:151],\
    [PGWXPinName pinName:@"PH9"  withNumber:133],\
    [PGWXPinName pinName:@"PH10" withNumber:134],\
    [PGWXPinName pinName:@"PH5"  withNumber:129],\
    [PGWXPinName pinName:@"PI10" withNumber:158],\
    [PGWXPinName pinName:@"PI12" withNumber:160],\
    [PGWXPinName pinName:@"PI13" withNumber:161],\
    [PGWXPinName pinName:@"PI11" withNumber:159],\
    [PGWXPinName pinName:@"PH11" withNumber:135],\
    [PGWXPinName pinName:@"PH12" withNumber:136],\
    [PGWXPinName pinName:@"PH13" withNumber:137],\
    [PGWXPinName pinName:@"PH14" withNumber:138],\
    [PGWXPinName pinName:@"PH15" withNumber:139],\
    [PGWXPinName pinName:@"PH16" withNumber:140]]

@implementation PGWXPlatformLinkSpritePCDuino1 {
    }

    -(instancetype)init:(NSError **)error {
        PGWXSOC *soc = [[PGWXSOCAllwinnerA10 alloc] initWithGPIOMap:PGWXMAPPCDUINO1 irqMap:nil error:error];
        return (self = [super initWithBoardName:@"PCDuino1" soc:soc error:error]);
    }

@end
