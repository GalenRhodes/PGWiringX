/******************************************************************************************************************************//**
 *     PROJECT: PGWiringX
 *    FILENAME: PGWXPlatformLinkSprite.h
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

#ifndef __PGWiringX_PGWXPlatformLinkSprite_H_
#define __PGWiringX_PGWXPlatformLinkSprite_H_

#import <Rubicon/Rubicon.h>
#import <PGWiringX/PGWXPlatform.h>

NS_ASSUME_NONNULL_BEGIN

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

@interface PGWXPlatformLinkSpritePCDuino1 : PGWXPlatform

    -(instancetype)init:(NSError *_Nullable *)error;

@end

NS_ASSUME_NONNULL_END

#endif //__PGWiringX_PGWXPlatformLinkSprite_H_
