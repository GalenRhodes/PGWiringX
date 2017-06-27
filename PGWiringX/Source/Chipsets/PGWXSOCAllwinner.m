/******************************************************************************************************************************//**
 *     PROJECT: PGWiringX
 *    FILENAME: PGWXSOCAllwinner.m
 *         IDE: AppCode
 *      AUTHOR: Galen Rhodes
 *        DATE: 6/26/17 2:34 PM
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
#import "PGWXBit.h"

#define ISRMODES (PGWX_ISR_MODE_RISING | PGWX_ISR_MODE_FALLING | PGWX_ISR_MODE_BOTH | PGWX_ISR_MODE_NONE)

@implementation PGWXSOCAllwinnerA10 {
    }

    -(instancetype)initWithGPIOMap:(NSArray<PGWXPinName *> *)gpioMap irqMap:(nullable NSArray<PGWXPinName *> *)irqMap error:(NSError **)error {
        return (self = [super initWithBrandName:@"Allwinner"
                                        chipSet:@"A10"
                                         layout:@[[PGWXLayout layoutWithName:@"PA0"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x00, 0)
                                                                   readWrite:PGWXMakeBit(0x10, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA1"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x00, 4)
                                                                   readWrite:PGWXMakeBit(0x10, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA2"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x00, 8)
                                                                   readWrite:PGWXMakeBit(0x10, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA3"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x00, 12)
                                                                   readWrite:PGWXMakeBit(0x10, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA4"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x00, 16)
                                                                   readWrite:PGWXMakeBit(0x10, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA5"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x00, 20)
                                                                   readWrite:PGWXMakeBit(0x10, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA6"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x00, 24)
                                                                   readWrite:PGWXMakeBit(0x10, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA7"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x00, 28)
                                                                   readWrite:PGWXMakeBit(0x10, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA8"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x04, 0)
                                                                   readWrite:PGWXMakeBit(0x10, 8)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA9"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x04, 4)
                                                                   readWrite:PGWXMakeBit(0x10, 9)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA10"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x04, 8)
                                                                   readWrite:PGWXMakeBit(0x10, 10)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA11"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x04, 12)
                                                                   readWrite:PGWXMakeBit(0x10, 11)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA12"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x04, 16)
                                                                   readWrite:PGWXMakeBit(0x10, 12)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA13"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x04, 20)
                                                                   readWrite:PGWXMakeBit(0x10, 13)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA14"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x04, 24)
                                                                   readWrite:PGWXMakeBit(0x10, 14)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA15"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x04, 28)
                                                                   readWrite:PGWXMakeBit(0x10, 15)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA16"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x08, 0)
                                                                   readWrite:PGWXMakeBit(0x10, 16)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA17"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x08, 4)
                                                                   readWrite:PGWXMakeBit(0x10, 17)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PB0"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x24, 0)
                                                                   readWrite:PGWXMakeBit(0x34, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PB1"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x24, 4)
                                                                   readWrite:PGWXMakeBit(0x34, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PB2"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x24, 8)
                                                                   readWrite:PGWXMakeBit(0x34, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PB3"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x24, 12)
                                                                   readWrite:PGWXMakeBit(0x34, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PB4"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x24, 16)
                                                                   readWrite:PGWXMakeBit(0x34, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PB5"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x24, 20)
                                                                   readWrite:PGWXMakeBit(0x34, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PB6"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x24, 24)
                                                                   readWrite:PGWXMakeBit(0x34, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PB7"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x24, 28)
                                                                   readWrite:PGWXMakeBit(0x34, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PB8"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x28, 0)
                                                                   readWrite:PGWXMakeBit(0x34, 8)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PB9"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x28, 4)
                                                                   readWrite:PGWXMakeBit(0x34, 9)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PB10"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x28, 8)
                                                                   readWrite:PGWXMakeBit(0x34, 10)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PB11"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x28, 12)
                                                                   readWrite:PGWXMakeBit(0x34, 11)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PB12"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x28, 16)
                                                                   readWrite:PGWXMakeBit(0x34, 12)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PB13"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x28, 20)
                                                                   readWrite:PGWXMakeBit(0x34, 13)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PB14"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x28, 24)
                                                                   readWrite:PGWXMakeBit(0x34, 14)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PB15"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x28, 28)
                                                                   readWrite:PGWXMakeBit(0x34, 15)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PB16"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x32, 0)
                                                                   readWrite:PGWXMakeBit(0x34, 16)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PB17"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x32, 4)
                                                                   readWrite:PGWXMakeBit(0x34, 17)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PB18"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x32, 8)
                                                                   readWrite:PGWXMakeBit(0x34, 18)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PB19"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x32, 12)
                                                                   readWrite:PGWXMakeBit(0x34, 19)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PB20"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x32, 16)
                                                                   readWrite:PGWXMakeBit(0x34, 20)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PB21"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x32, 20)
                                                                   readWrite:PGWXMakeBit(0x34, 21)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PB22"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x32, 24)
                                                                   readWrite:PGWXMakeBit(0x34, 22)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PB23"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x32, 28)
                                                                   readWrite:PGWXMakeBit(0x34, 23)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC0"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x48, 0)
                                                                   readWrite:PGWXMakeBit(0x58, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC1"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x48, 4)
                                                                   readWrite:PGWXMakeBit(0x58, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC2"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x48, 8)
                                                                   readWrite:PGWXMakeBit(0x58, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC3"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x48, 12)
                                                                   readWrite:PGWXMakeBit(0x58, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC4"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x48, 16)
                                                                   readWrite:PGWXMakeBit(0x58, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC5"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x48, 20)
                                                                   readWrite:PGWXMakeBit(0x58, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC6"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x48, 24)
                                                                   readWrite:PGWXMakeBit(0x58, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC7"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x48, 28)
                                                                   readWrite:PGWXMakeBit(0x58, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC8"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x4C, 0)
                                                                   readWrite:PGWXMakeBit(0x58, 8)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC9"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x4C, 4)
                                                                   readWrite:PGWXMakeBit(0x58, 9)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC10"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x4C, 8)
                                                                   readWrite:PGWXMakeBit(0x58, 10)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC11"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x4C, 12)
                                                                   readWrite:PGWXMakeBit(0x58, 11)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC12"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x4C, 16)
                                                                   readWrite:PGWXMakeBit(0x58, 12)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC13"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x4C, 20)
                                                                   readWrite:PGWXMakeBit(0x58, 13)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC14"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x4C, 24)
                                                                   readWrite:PGWXMakeBit(0x58, 14)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC15"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x4C, 28)
                                                                   readWrite:PGWXMakeBit(0x58, 15)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC16"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x50, 0)
                                                                   readWrite:PGWXMakeBit(0x58, 16)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC17"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x50, 4)
                                                                   readWrite:PGWXMakeBit(0x58, 17)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC18"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x50, 8)
                                                                   readWrite:PGWXMakeBit(0x58, 18)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC19"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x50, 12)
                                                                   readWrite:PGWXMakeBit(0x58, 19)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC20"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x50, 16)
                                                                   readWrite:PGWXMakeBit(0x58, 20)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC21"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x50, 20)
                                                                   readWrite:PGWXMakeBit(0x58, 21)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC22"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x50, 24)
                                                                   readWrite:PGWXMakeBit(0x58, 22)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC23"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x50, 28)
                                                                   readWrite:PGWXMakeBit(0x58, 23)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD0"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x6C, 0)
                                                                   readWrite:PGWXMakeBit(0x7C, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD1"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x6C, 4)
                                                                   readWrite:PGWXMakeBit(0x7C, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD2"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x6C, 8)
                                                                   readWrite:PGWXMakeBit(0x7C, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD3"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x6C, 12)
                                                                   readWrite:PGWXMakeBit(0x7C, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD4"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x6C, 16)
                                                                   readWrite:PGWXMakeBit(0x7C, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD5"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x6C, 20)
                                                                   readWrite:PGWXMakeBit(0x7C, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD6"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x6C, 24)
                                                                   readWrite:PGWXMakeBit(0x7C, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD7"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x6C, 28)
                                                                   readWrite:PGWXMakeBit(0x7C, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD8"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x70, 0)
                                                                   readWrite:PGWXMakeBit(0x7C, 8)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD9"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x70, 4)
                                                                   readWrite:PGWXMakeBit(0x7C, 9)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD10"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x70, 8)
                                                                   readWrite:PGWXMakeBit(0x7C, 10)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD11"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x70, 12)
                                                                   readWrite:PGWXMakeBit(0x7C, 11)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD12"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x70, 16)
                                                                   readWrite:PGWXMakeBit(0x7C, 12)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD13"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x70, 20)
                                                                   readWrite:PGWXMakeBit(0x7C, 13)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD14"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x70, 24)
                                                                   readWrite:PGWXMakeBit(0x7C, 14)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD15"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x70, 28)
                                                                   readWrite:PGWXMakeBit(0x7C, 15)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD16"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x74, 0)
                                                                   readWrite:PGWXMakeBit(0x7C, 16)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD17"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x74, 4)
                                                                   readWrite:PGWXMakeBit(0x7C, 17)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD18"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x74, 8)
                                                                   readWrite:PGWXMakeBit(0x7C, 18)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD19"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x74, 12)
                                                                   readWrite:PGWXMakeBit(0x7C, 19)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD20"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x74, 16)
                                                                   readWrite:PGWXMakeBit(0x7C, 20)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD21"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x74, 20)
                                                                   readWrite:PGWXMakeBit(0x7C, 21)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD22"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x74, 24)
                                                                   readWrite:PGWXMakeBit(0x7C, 22)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD23"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x74, 28)
                                                                   readWrite:PGWXMakeBit(0x7C, 23)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD24"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x78, 0)
                                                                   readWrite:PGWXMakeBit(0x7C, 24)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD25"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x78, 4)
                                                                   readWrite:PGWXMakeBit(0x7C, 25)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD26"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x78, 8)
                                                                   readWrite:PGWXMakeBit(0x7C, 26)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD27"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x78, 12)
                                                                   readWrite:PGWXMakeBit(0x7C, 27)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE0"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x90, 0)
                                                                   readWrite:PGWXMakeBit(0xA0, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE1"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x90, 4)
                                                                   readWrite:PGWXMakeBit(0xA0, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE2"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x90, 8)
                                                                   readWrite:PGWXMakeBit(0xA0, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE3"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x90, 12)
                                                                   readWrite:PGWXMakeBit(0xA0, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE4"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x90, 16)
                                                                   readWrite:PGWXMakeBit(0xA0, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE5"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x90, 20)
                                                                   readWrite:PGWXMakeBit(0xA0, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE6"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x90, 24)
                                                                   readWrite:PGWXMakeBit(0xA0, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE7"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x90, 28)
                                                                   readWrite:PGWXMakeBit(0xA0, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE8"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x94, 0)
                                                                   readWrite:PGWXMakeBit(0xA0, 8)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE9"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x94, 4)
                                                                   readWrite:PGWXMakeBit(0xA0, 9)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE10"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x94, 8)
                                                                   readWrite:PGWXMakeBit(0xA0, 10)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE11"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x94, 12)
                                                                   readWrite:PGWXMakeBit(0xA0, 11)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PF0"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xB4, 0)
                                                                   readWrite:PGWXMakeBit(0xC4, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PF1"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xB4, 4)
                                                                   readWrite:PGWXMakeBit(0xC4, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PF2"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xB4, 8)
                                                                   readWrite:PGWXMakeBit(0xC4, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PF3"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xB4, 12)
                                                                   readWrite:PGWXMakeBit(0xC4, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PF4"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xB4, 16)
                                                                   readWrite:PGWXMakeBit(0xC4, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PF5"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xB4, 20)
                                                                   readWrite:PGWXMakeBit(0xC4, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PG0"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xDC, 0)
                                                                   readWrite:PGWXMakeBit(0xE8, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PG1"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xDC, 4)
                                                                   readWrite:PGWXMakeBit(0xE8, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PG2"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xDC, 8)
                                                                   readWrite:PGWXMakeBit(0xE8, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PG3"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xDC, 12)
                                                                   readWrite:PGWXMakeBit(0xE8, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PG4"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xDC, 16)
                                                                   readWrite:PGWXMakeBit(0xE8, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PG5"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xDC, 20)
                                                                   readWrite:PGWXMakeBit(0xE8, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PG6"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xDC, 24)
                                                                   readWrite:PGWXMakeBit(0xE8, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PG7"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xDC, 28)
                                                                   readWrite:PGWXMakeBit(0xE8, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PG8"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xE0, 0)
                                                                   readWrite:PGWXMakeBit(0xE8, 8)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PG9"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xE0, 4)
                                                                   readWrite:PGWXMakeBit(0xE8, 9)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PG10"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xE0, 8)
                                                                   readWrite:PGWXMakeBit(0xE8, 10)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PG11"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xE0, 12)
                                                                   readWrite:PGWXMakeBit(0xE8, 11)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PH0"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xFC, 0)
                                                                   readWrite:PGWXMakeBit(0x10C, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PH1"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xFC, 4)
                                                                   readWrite:PGWXMakeBit(0x10C, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PH2"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xFC, 8)
                                                                   readWrite:PGWXMakeBit(0x10C, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PH3"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xFC, 12)
                                                                   readWrite:PGWXMakeBit(0x10C, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PH4"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xFC, 16)
                                                                   readWrite:PGWXMakeBit(0x10C, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PH5"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xFC, 20)
                                                                   readWrite:PGWXMakeBit(0x10C, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PH6"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xFC, 24)
                                                                   readWrite:PGWXMakeBit(0x10C, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PH7"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xFC, 28)
                                                                   readWrite:PGWXMakeBit(0x10C, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PH8"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x100, 0)
                                                                   readWrite:PGWXMakeBit(0x10C, 8)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PH9"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x100, 4)
                                                                   readWrite:PGWXMakeBit(0x10C, 9)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PH10"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x100, 8)
                                                                   readWrite:PGWXMakeBit(0x10C, 10)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PH11"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x100, 12)
                                                                   readWrite:PGWXMakeBit(0x10C, 11)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PH12"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x100, 16)
                                                                   readWrite:PGWXMakeBit(0x10C, 12)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PH13"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x100, 20)
                                                                   readWrite:PGWXMakeBit(0x10C, 13)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PH14"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x100, 24)
                                                                   readWrite:PGWXMakeBit(0x10C, 14)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PH15"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x100, 28)
                                                                   readWrite:PGWXMakeBit(0x10C, 15)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PH16"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x104, 0)
                                                                   readWrite:PGWXMakeBit(0x10C, 16)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PH17"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x104, 4)
                                                                   readWrite:PGWXMakeBit(0x10C, 17)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PH18"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x104, 8)
                                                                   readWrite:PGWXMakeBit(0x10C, 18)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PH19"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x104, 12)
                                                                   readWrite:PGWXMakeBit(0x10C, 19)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PH20"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x104, 16)
                                                                   readWrite:PGWXMakeBit(0x10C, 20)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PH21"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x104, 20)
                                                                   readWrite:PGWXMakeBit(0x10C, 21)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PH22"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x104, 24)
                                                                   readWrite:PGWXMakeBit(0x10C, 22)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PH23"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x104, 28)
                                                                   readWrite:PGWXMakeBit(0x10C, 23)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PI0"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x120, 0)
                                                                   readWrite:PGWXMakeBit(0x130, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PI1"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x120, 4)
                                                                   readWrite:PGWXMakeBit(0x130, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PI2"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x120, 8)
                                                                   readWrite:PGWXMakeBit(0x130, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PI3"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x120, 12)
                                                                   readWrite:PGWXMakeBit(0x130, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PI4"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x120, 16)
                                                                   readWrite:PGWXMakeBit(0x130, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PI5"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x120, 20)
                                                                   readWrite:PGWXMakeBit(0x130, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PI6"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x120, 24)
                                                                   readWrite:PGWXMakeBit(0x130, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PI7"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x124, 28)
                                                                   readWrite:PGWXMakeBit(0x130, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PI8"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x124, 0)
                                                                   readWrite:PGWXMakeBit(0x130, 8)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PI9"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x124, 4)
                                                                   readWrite:PGWXMakeBit(0x130, 9)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PI10"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x124, 8)
                                                                   readWrite:PGWXMakeBit(0x130, 10)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PI11"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x124, 12)
                                                                   readWrite:PGWXMakeBit(0x130, 11)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PI12"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x124, 16)
                                                                   readWrite:PGWXMakeBit(0x130, 12)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PI13"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x124, 20)
                                                                   readWrite:PGWXMakeBit(0x130, 13)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PI14"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x124, 24)
                                                                   readWrite:PGWXMakeBit(0x130, 14)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PI15"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x128, 28)
                                                                   readWrite:PGWXMakeBit(0x130, 15)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PI16"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x128, 0)
                                                                   readWrite:PGWXMakeBit(0x130, 16)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PI17"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x128, 4)
                                                                   readWrite:PGWXMakeBit(0x130, 17)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PI18"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x128, 8)
                                                                   readWrite:PGWXMakeBit(0x130, 18)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PI19"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x128, 12)
                                                                   readWrite:PGWXMakeBit(0x130, 19)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PI20"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x128, 16)
                                                                   readWrite:PGWXMakeBit(0x130, 20)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PI21"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x128, 20)
                                                                   readWrite:PGWXMakeBit(0x130, 21)
                                                                     support:PGWX_FUNCTION_DIGITAL]]
                                        gpioMap:gpioMap
                                         irqMap:irqMap
                                       isrModes:ISRMODES
                                       pageSize:(4 * 1024)
                                  baseAddresses:@[[PGWXAddr address:0x01C20000 offset:0x00000800]]
                                          error:error]);
    }

@end

@implementation PGWXSOCAllwinnerA31s {
    }

    -(instancetype)initWithGPIOMap:(NSArray<PGWXPinName *> *)gpioMap irqMap:(nullable NSArray<PGWXPinName *> *)irqMap error:(NSError **)error {
        return (self = [super initWithBrandName:@"Allwinner"
                                        chipSet:@"A31s"
                                         layout:@[[PGWXLayout layoutWithName:@"PA0"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x00, 0)
                                                                   readWrite:PGWXMakeBit(0x10, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA1"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x00, 4)
                                                                   readWrite:PGWXMakeBit(0x10, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA2"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x00, 8)
                                                                   readWrite:PGWXMakeBit(0x10, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA3"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x00, 12)
                                                                   readWrite:PGWXMakeBit(0x10, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA4"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x00, 16)
                                                                   readWrite:PGWXMakeBit(0x10, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA5"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x00, 20)
                                                                   readWrite:PGWXMakeBit(0x10, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA6"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x00, 24)
                                                                   readWrite:PGWXMakeBit(0x10, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA7"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x00, 28)
                                                                   readWrite:PGWXMakeBit(0x10, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA8"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x04, 0)
                                                                   readWrite:PGWXMakeBit(0x10, 8)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA9"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x04, 4)
                                                                   readWrite:PGWXMakeBit(0x10, 9)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA10"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x04, 8)
                                                                   readWrite:PGWXMakeBit(0x10, 10)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA11"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x04, 12)
                                                                   readWrite:PGWXMakeBit(0x10, 11)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA12"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x04, 16)
                                                                   readWrite:PGWXMakeBit(0x10, 12)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA13"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x04, 20)
                                                                   readWrite:PGWXMakeBit(0x10, 13)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA14"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x04, 24)
                                                                   readWrite:PGWXMakeBit(0x10, 14)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA15"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x04, 28)
                                                                   readWrite:PGWXMakeBit(0x10, 15)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA16"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x08, 0)
                                                                   readWrite:PGWXMakeBit(0x10, 16)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA17"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x08, 4)
                                                                   readWrite:PGWXMakeBit(0x10, 17)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA18"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x08, 8)
                                                                   readWrite:PGWXMakeBit(0x10, 18)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA19"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x08, 12)
                                                                   readWrite:PGWXMakeBit(0x10, 19)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA20"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x08, 16)
                                                                   readWrite:PGWXMakeBit(0x10, 20)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA21"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x08, 20)
                                                                   readWrite:PGWXMakeBit(0x10, 21)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA22"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x08, 24)
                                                                   readWrite:PGWXMakeBit(0x10, 22)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA23"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x08, 28)
                                                                   readWrite:PGWXMakeBit(0x10, 23)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA24"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x0C, 0)
                                                                   readWrite:PGWXMakeBit(0x10, 24)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA25"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x0C, 4)
                                                                   readWrite:PGWXMakeBit(0x10, 25)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA26"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x0C, 8)
                                                                   readWrite:PGWXMakeBit(0x10, 26)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PA27"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x0C, 12)
                                                                   readWrite:PGWXMakeBit(0x10, 27)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PB0"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X24, 0)
                                                                   readWrite:PGWXMakeBit(0x34, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PB1"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X24, 4)
                                                                   readWrite:PGWXMakeBit(0x34, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PB2"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X24, 8)
                                                                   readWrite:PGWXMakeBit(0x34, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PB3"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X24, 12)
                                                                   readWrite:PGWXMakeBit(0x34, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PB4"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X24, 16)
                                                                   readWrite:PGWXMakeBit(0x34, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PB5"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X24, 20)
                                                                   readWrite:PGWXMakeBit(0x34, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PB6"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X24, 24)
                                                                   readWrite:PGWXMakeBit(0x34, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PB7"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X24, 28)
                                                                   readWrite:PGWXMakeBit(0x34, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC0"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X48, 0)
                                                                   readWrite:PGWXMakeBit(0x58, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC1"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X48, 4)
                                                                   readWrite:PGWXMakeBit(0x58, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC2"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X48, 8)
                                                                   readWrite:PGWXMakeBit(0x58, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC3"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X48, 12)
                                                                   readWrite:PGWXMakeBit(0x58, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC4"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X48, 16)
                                                                   readWrite:PGWXMakeBit(0x58, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC5"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X48, 20)
                                                                   readWrite:PGWXMakeBit(0x58, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC6"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X48, 24)
                                                                   readWrite:PGWXMakeBit(0x58, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC7"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X48, 28)
                                                                   readWrite:PGWXMakeBit(0x58, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC8"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X4C, 0)
                                                                   readWrite:PGWXMakeBit(0x58, 8)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC9"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X4C, 4)
                                                                   readWrite:PGWXMakeBit(0x58, 9)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC10"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X4C, 8)
                                                                   readWrite:PGWXMakeBit(0x58, 10)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC11"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X4C, 12)
                                                                   readWrite:PGWXMakeBit(0x58, 11)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC12"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x4C, 16)
                                                                   readWrite:PGWXMakeBit(0x58, 12)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC13"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x4C, 20)
                                                                   readWrite:PGWXMakeBit(0x58, 13)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC14"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x4C, 24)
                                                                   readWrite:PGWXMakeBit(0x58, 14)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC15"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x4C, 28)
                                                                   readWrite:PGWXMakeBit(0x58, 15)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC24"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x54, 0)
                                                                   readWrite:PGWXMakeBit(0x58, 24)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC25"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x54, 4)
                                                                   readWrite:PGWXMakeBit(0x58, 25)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC26"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x54, 8)
                                                                   readWrite:PGWXMakeBit(0x58, 26)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC27"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x54, 12)
                                                                   readWrite:PGWXMakeBit(0x58, 27)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD0"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X6C, 0)
                                                                   readWrite:PGWXMakeBit(0x7C, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD1"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X6C, 4)
                                                                   readWrite:PGWXMakeBit(0x7C, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD2"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X6C, 8)
                                                                   readWrite:PGWXMakeBit(0x7C, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD3"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X6C, 12)
                                                                   readWrite:PGWXMakeBit(0x7C, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD4"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X6C, 16)
                                                                   readWrite:PGWXMakeBit(0x7C, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD5"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X6C, 20)
                                                                   readWrite:PGWXMakeBit(0x7C, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD6"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X6C, 24)
                                                                   readWrite:PGWXMakeBit(0x7C, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD7"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X6C, 28)
                                                                   readWrite:PGWXMakeBit(0x7C, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD8"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X70, 0)
                                                                   readWrite:PGWXMakeBit(0x7C, 8)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD9"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X70, 4)
                                                                   readWrite:PGWXMakeBit(0x7C, 9)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD10"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X70, 8)
                                                                   readWrite:PGWXMakeBit(0x7C, 10)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD11"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X70, 12)
                                                                   readWrite:PGWXMakeBit(0x7C, 11)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD12"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x70, 16)
                                                                   readWrite:PGWXMakeBit(0x7C, 12)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD13"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x70, 20)
                                                                   readWrite:PGWXMakeBit(0x7C, 13)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD14"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x70, 24)
                                                                   readWrite:PGWXMakeBit(0x7C, 14)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD15"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x70, 28)
                                                                   readWrite:PGWXMakeBit(0x7C, 15)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD16"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x74, 0)
                                                                   readWrite:PGWXMakeBit(0x7C, 16)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD17"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x74, 4)
                                                                   readWrite:PGWXMakeBit(0x7C, 17)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD18"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x74, 8)
                                                                   readWrite:PGWXMakeBit(0x7C, 18)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD19"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x74, 12)
                                                                   readWrite:PGWXMakeBit(0x7C, 19)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD20"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x74, 16)
                                                                   readWrite:PGWXMakeBit(0x7C, 20)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD21"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x74, 20)
                                                                   readWrite:PGWXMakeBit(0x7C, 21)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD22"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x74, 24)
                                                                   readWrite:PGWXMakeBit(0x7C, 22)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD23"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x74, 28)
                                                                   readWrite:PGWXMakeBit(0x7C, 23)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD24"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x78, 0)
                                                                   readWrite:PGWXMakeBit(0x7C, 24)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD25"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x78, 4)
                                                                   readWrite:PGWXMakeBit(0x7C, 25)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD26"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x78, 8)
                                                                   readWrite:PGWXMakeBit(0x7C, 26)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD27"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x78, 12)
                                                                   readWrite:PGWXMakeBit(0x7C, 27)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE0"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X90, 0)
                                                                   readWrite:PGWXMakeBit(0xA0, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE1"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X90, 4)
                                                                   readWrite:PGWXMakeBit(0xA0, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE2"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X90, 8)
                                                                   readWrite:PGWXMakeBit(0xA0, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE3"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X90, 12)
                                                                   readWrite:PGWXMakeBit(0xA0, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE4"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X90, 16)
                                                                   readWrite:PGWXMakeBit(0xA0, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE5"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X90, 20)
                                                                   readWrite:PGWXMakeBit(0xA0, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE6"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X90, 24)
                                                                   readWrite:PGWXMakeBit(0xA0, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE7"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X90, 28)
                                                                   readWrite:PGWXMakeBit(0xA0, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE8"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X94, 0)
                                                                   readWrite:PGWXMakeBit(0xA0, 8)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE9"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X94, 4)
                                                                   readWrite:PGWXMakeBit(0xA0, 9)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE10"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X94, 8)
                                                                   readWrite:PGWXMakeBit(0xA0, 10)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE11"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X94, 12)
                                                                   readWrite:PGWXMakeBit(0xA0, 11)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE12"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X94, 16)
                                                                   readWrite:PGWXMakeBit(0xA0, 12)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE13"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X94, 20)
                                                                   readWrite:PGWXMakeBit(0xA0, 13)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE14"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X94, 24)
                                                                   readWrite:PGWXMakeBit(0xA0, 14)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE15"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X94, 28)
                                                                   readWrite:PGWXMakeBit(0xA0, 15)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PF0"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0XB4, 0)
                                                                   readWrite:PGWXMakeBit(0xC4, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PF1"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0XB4, 4)
                                                                   readWrite:PGWXMakeBit(0xC4, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PF2"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0XB4, 8)
                                                                   readWrite:PGWXMakeBit(0xC4, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PF3"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0XB4, 12)
                                                                   readWrite:PGWXMakeBit(0xC4, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PF4"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0XB4, 16)
                                                                   readWrite:PGWXMakeBit(0xC4, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PF5"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0XB4, 20)
                                                                   readWrite:PGWXMakeBit(0xC4, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PG0"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0XD8, 0)
                                                                   readWrite:PGWXMakeBit(0xE8, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PG1"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0XD8, 4)
                                                                   readWrite:PGWXMakeBit(0xE8, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PG2"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0XD8, 8)
                                                                   readWrite:PGWXMakeBit(0xE8, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PG3"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0XD8, 12)
                                                                   readWrite:PGWXMakeBit(0xE8, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PG4"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0XD8, 16)
                                                                   readWrite:PGWXMakeBit(0xE8, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PG5"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0XD8, 20)
                                                                   readWrite:PGWXMakeBit(0xE8, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PG6"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0XD8, 24)
                                                                   readWrite:PGWXMakeBit(0xE8, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PG7"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0XD8, 28)
                                                                   readWrite:PGWXMakeBit(0xE8, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PG8"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0XDC, 0)
                                                                   readWrite:PGWXMakeBit(0xE8, 8)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PG9"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0XDC, 4)
                                                                   readWrite:PGWXMakeBit(0xE8, 9)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PG10"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0XDC, 8)
                                                                   readWrite:PGWXMakeBit(0xE8, 10)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PG11"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0XDC, 12)
                                                                   readWrite:PGWXMakeBit(0xE8, 11)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PG12"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0XDC, 16)
                                                                   readWrite:PGWXMakeBit(0xE8, 12)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PG13"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0XDC, 20)
                                                                   readWrite:PGWXMakeBit(0xE8, 13)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PG14"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0XDC, 24)
                                                                   readWrite:PGWXMakeBit(0xE8, 14)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PG15"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0XDC, 28)
                                                                   readWrite:PGWXMakeBit(0xE8, 15)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PG16"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0XE0, 0)
                                                                   readWrite:PGWXMakeBit(0xE8, 16)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PG17"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0XE0, 4)
                                                                   readWrite:PGWXMakeBit(0xE8, 17)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PG18"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0XE0, 8)
                                                                   readWrite:PGWXMakeBit(0xE8, 18)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PH9"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X100, 4)
                                                                   readWrite:PGWXMakeBit(0x10C, 9)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PH10"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x100, 8)
                                                                   readWrite:PGWXMakeBit(0x10C, 10)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PH11"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x100, 12)
                                                                   readWrite:PGWXMakeBit(0x10C, 11)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PH12"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x100, 16)
                                                                   readWrite:PGWXMakeBit(0x10C, 12)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PH13"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x100, 20)
                                                                   readWrite:PGWXMakeBit(0x10C, 13)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PH14"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x100, 24)
                                                                   readWrite:PGWXMakeBit(0x10C, 14)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PH15"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0X100, 28)
                                                                   readWrite:PGWXMakeBit(0x10C, 15)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PH16"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x104, 0)
                                                                   readWrite:PGWXMakeBit(0x10C, 16)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PH17"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x104, 4)
                                                                   readWrite:PGWXMakeBit(0x10C, 17)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PH18"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x104, 8)
                                                                   readWrite:PGWXMakeBit(0x10C, 18)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PH19"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x104, 12)
                                                                   readWrite:PGWXMakeBit(0x10C, 19)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PH20"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x104, 16)
                                                                   readWrite:PGWXMakeBit(0x10C, 20)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PH21"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x104, 20)
                                                                   readWrite:PGWXMakeBit(0x10C, 21)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PH22"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x104, 24)
                                                                   readWrite:PGWXMakeBit(0x10C, 22)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PH23"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x104, 28)
                                                                   readWrite:PGWXMakeBit(0x10C, 23)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PH24"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x108, 0)
                                                                   readWrite:PGWXMakeBit(0x10C, 24)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PH25"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x108, 4)
                                                                   readWrite:PGWXMakeBit(0x10C, 25)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PH26"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x108, 8)
                                                                   readWrite:PGWXMakeBit(0x10C, 26)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PH27"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x108, 12)
                                                                   readWrite:PGWXMakeBit(0x10C, 27)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PH28"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x108, 16)
                                                                   readWrite:PGWXMakeBit(0x10C, 28)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PL0" bank:1 select:PGWXMakeBit(0X0, 0) readWrite:PGWXMakeBit(0x10, 0) support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PL1" bank:1 select:PGWXMakeBit(0X0, 4) readWrite:PGWXMakeBit(0x10, 1) support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PL2" bank:1 select:PGWXMakeBit(0X0, 8) readWrite:PGWXMakeBit(0x10, 2) support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PL3"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0X0, 12)
                                                                   readWrite:PGWXMakeBit(0x10, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PL4"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0X0, 16)
                                                                   readWrite:PGWXMakeBit(0x10, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PL5"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0X0, 20)
                                                                   readWrite:PGWXMakeBit(0x10, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PL6"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0X0, 24)
                                                                   readWrite:PGWXMakeBit(0x10, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PL7"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0X0, 28)
                                                                   readWrite:PGWXMakeBit(0x10, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PM0"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0X24, 0)
                                                                   readWrite:PGWXMakeBit(0x34, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PM1"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0X24, 4)
                                                                   readWrite:PGWXMakeBit(0x34, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PM2"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0X24, 8)
                                                                   readWrite:PGWXMakeBit(0x34, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PM3"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0X24, 12)
                                                                   readWrite:PGWXMakeBit(0x34, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PM4"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0X24, 16)
                                                                   readWrite:PGWXMakeBit(0x34, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PM5"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0X24, 20)
                                                                   readWrite:PGWXMakeBit(0x34, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PM6"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0X24, 24)
                                                                   readWrite:PGWXMakeBit(0x34, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PM7"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0X24, 28)
                                                                   readWrite:PGWXMakeBit(0x34, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL]]
                                        gpioMap:gpioMap
                                         irqMap:irqMap
                                       isrModes:ISRMODES
                                       pageSize:(4 * 1024)
                                  baseAddresses:@[[PGWXAddr address:0x01C20000 offset:0x00000800], [PGWXAddr address:0x01F02000 offset:0x00000C00]]
                                          error:error]);
    }

@end

@implementation PGWXSOCAllwinnerH3 {
    }

    -(instancetype)initWithGPIOMap:(NSArray<PGWXPinName *> *)gpioMap irqMap:(nullable NSArray<PGWXPinName *> *)irqMap error:(NSError **)error {
        return (self = [super initWithBrandName:@"Allwinner"
                                        chipSet:@"H3"
                                         layout:@[[PGWXLayout layoutWithName:@"PA0"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x00, 0)
                                                                   readWrite:PGWXMakeBit(0x10, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PA1"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x00, 4)
                                                                   readWrite:PGWXMakeBit(0x10, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PA2"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x00, 8)
                                                                   readWrite:PGWXMakeBit(0x10, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PA3"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x00, 12)
                                                                   readWrite:PGWXMakeBit(0x10, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PA4"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x00, 16)
                                                                   readWrite:PGWXMakeBit(0x10, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PA5"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x00, 20)
                                                                   readWrite:PGWXMakeBit(0x10, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PA6"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x00, 24)
                                                                   readWrite:PGWXMakeBit(0x10, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PA7"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x00, 28)
                                                                   readWrite:PGWXMakeBit(0x10, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PA8"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x04, 0)
                                                                   readWrite:PGWXMakeBit(0x10, 8)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PA9"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x04, 4)
                                                                   readWrite:PGWXMakeBit(0x10, 9)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PA10"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x04, 8)
                                                                   readWrite:PGWXMakeBit(0x10, 10)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PA11"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x04, 12)
                                                                   readWrite:PGWXMakeBit(0x10, 11)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PA12"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x04, 16)
                                                                   readWrite:PGWXMakeBit(0x10, 12)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PA13"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x04, 20)
                                                                   readWrite:PGWXMakeBit(0x10, 13)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PA14"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x04, 24)
                                                                   readWrite:PGWXMakeBit(0x10, 14)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PA15"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x04, 28)
                                                                   readWrite:PGWXMakeBit(0x10, 15)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PA16"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x08, 0)
                                                                   readWrite:PGWXMakeBit(0x10, 16)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PA17"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x08, 4)
                                                                   readWrite:PGWXMakeBit(0x10, 17)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PA18"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x08, 8)
                                                                   readWrite:PGWXMakeBit(0x10, 18)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PA19"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x08, 12)
                                                                   readWrite:PGWXMakeBit(0x10, 19)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PA20"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x08, 16)
                                                                   readWrite:PGWXMakeBit(0x10, 20)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PA21"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x08, 20)
                                                                   readWrite:PGWXMakeBit(0x10, 21)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PC0"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x48, 0)
                                                                   readWrite:PGWXMakeBit(0x58, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC1"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x48, 4)
                                                                   readWrite:PGWXMakeBit(0x58, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC2"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x48, 8)
                                                                   readWrite:PGWXMakeBit(0x58, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC3"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x48, 12)
                                                                   readWrite:PGWXMakeBit(0x58, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC4"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x48, 16)
                                                                   readWrite:PGWXMakeBit(0x58, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC5"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x48, 20)
                                                                   readWrite:PGWXMakeBit(0x58, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC6"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x48, 24)
                                                                   readWrite:PGWXMakeBit(0x58, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC7"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x48, 28)
                                                                   readWrite:PGWXMakeBit(0x58, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC8"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x4C, 0)
                                                                   readWrite:PGWXMakeBit(0x58, 8)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC9"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x4C, 4)
                                                                   readWrite:PGWXMakeBit(0x58, 9)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC10"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x4C, 8)
                                                                   readWrite:PGWXMakeBit(0x58, 10)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC11"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x4C, 12)
                                                                   readWrite:PGWXMakeBit(0x58, 11)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC12"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x4C, 16)
                                                                   readWrite:PGWXMakeBit(0x58, 12)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC13"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x4C, 20)
                                                                   readWrite:PGWXMakeBit(0x58, 13)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC14"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x4C, 24)
                                                                   readWrite:PGWXMakeBit(0x58, 14)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC15"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x4C, 28)
                                                                   readWrite:PGWXMakeBit(0x58, 15)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC16"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x50, 0)
                                                                   readWrite:PGWXMakeBit(0x58, 16)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC17"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x50, 4)
                                                                   readWrite:PGWXMakeBit(0x58, 17)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PC18"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x50, 8)
                                                                   readWrite:PGWXMakeBit(0x58, 18)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD0"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x6C, 0)
                                                                   readWrite:PGWXMakeBit(0x7C, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD1"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x6C, 4)
                                                                   readWrite:PGWXMakeBit(0x7C, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD2"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x6C, 8)
                                                                   readWrite:PGWXMakeBit(0x7C, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD3"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x6C, 12)
                                                                   readWrite:PGWXMakeBit(0x7C, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD4"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x6C, 16)
                                                                   readWrite:PGWXMakeBit(0x7C, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD5"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x6C, 20)
                                                                   readWrite:PGWXMakeBit(0x7C, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD6"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x6C, 24)
                                                                   readWrite:PGWXMakeBit(0x7C, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD7"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x6C, 28)
                                                                   readWrite:PGWXMakeBit(0x7C, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD8"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x70, 0)
                                                                   readWrite:PGWXMakeBit(0x7C, 8)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD9"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x70, 4)
                                                                   readWrite:PGWXMakeBit(0x7C, 9)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD10"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x70, 8)
                                                                   readWrite:PGWXMakeBit(0x7C, 10)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD11"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x70, 12)
                                                                   readWrite:PGWXMakeBit(0x7C, 11)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD12"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x70, 16)
                                                                   readWrite:PGWXMakeBit(0x7C, 12)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD13"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x70, 20)
                                                                   readWrite:PGWXMakeBit(0x7C, 13)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD14"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x70, 24)
                                                                   readWrite:PGWXMakeBit(0x7C, 14)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD15"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x70, 28)
                                                                   readWrite:PGWXMakeBit(0x7C, 15)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD16"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x74, 0)
                                                                   readWrite:PGWXMakeBit(0x7C, 16)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PD17"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x74, 4)
                                                                   readWrite:PGWXMakeBit(0x7C, 17)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE0"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x90, 0)
                                                                   readWrite:PGWXMakeBit(0xA0, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE1"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x90, 4)
                                                                   readWrite:PGWXMakeBit(0xA0, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE2"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x90, 8)
                                                                   readWrite:PGWXMakeBit(0xA0, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE3"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x90, 12)
                                                                   readWrite:PGWXMakeBit(0xA0, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE4"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x90, 16)
                                                                   readWrite:PGWXMakeBit(0xA0, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE5"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x90, 20)
                                                                   readWrite:PGWXMakeBit(0xA0, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE6"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x90, 24)
                                                                   readWrite:PGWXMakeBit(0xA0, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE7"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x90, 28)
                                                                   readWrite:PGWXMakeBit(0xA0, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE8"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x94, 0)
                                                                   readWrite:PGWXMakeBit(0xA0, 8)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE9"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x94, 4)
                                                                   readWrite:PGWXMakeBit(0xA0, 9)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE10"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x94, 8)
                                                                   readWrite:PGWXMakeBit(0xA0, 10)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE11"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x94, 12)
                                                                   readWrite:PGWXMakeBit(0xA0, 11)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE12"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x94, 16)
                                                                   readWrite:PGWXMakeBit(0xA0, 12)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE13"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x94, 20)
                                                                   readWrite:PGWXMakeBit(0xA0, 13)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE14"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x94, 24)
                                                                   readWrite:PGWXMakeBit(0xA0, 14)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PE15"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x94, 28)
                                                                   readWrite:PGWXMakeBit(0xA0, 15)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PF0"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xB4, 0)
                                                                   readWrite:PGWXMakeBit(0xC4, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PF1"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xB4, 4)
                                                                   readWrite:PGWXMakeBit(0xC4, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PF2"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xB4, 8)
                                                                   readWrite:PGWXMakeBit(0xC4, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PF3"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xB4, 12)
                                                                   readWrite:PGWXMakeBit(0xC4, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PF4"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xB4, 16)
                                                                   readWrite:PGWXMakeBit(0xC4, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PF5"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xB4, 20)
                                                                   readWrite:PGWXMakeBit(0xC4, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PF6"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xB4, 24)
                                                                   readWrite:PGWXMakeBit(0xC4, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PG0"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xD8, 0)
                                                                   readWrite:PGWXMakeBit(0xE8, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PG1"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xD8, 4)
                                                                   readWrite:PGWXMakeBit(0xE8, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PG2"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xD8, 8)
                                                                   readWrite:PGWXMakeBit(0xE8, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PG3"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xD8, 12)
                                                                   readWrite:PGWXMakeBit(0xE8, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PG4"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xD8, 16)
                                                                   readWrite:PGWXMakeBit(0xE8, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PG5"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xD8, 20)
                                                                   readWrite:PGWXMakeBit(0xE8, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PG6"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xD8, 24)
                                                                   readWrite:PGWXMakeBit(0xE8, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PG7"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xD8, 28)
                                                                   readWrite:PGWXMakeBit(0xE8, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PG8"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xDC, 0)
                                                                   readWrite:PGWXMakeBit(0xE8, 8)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PG9"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xDC, 4)
                                                                   readWrite:PGWXMakeBit(0xE8, 9)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PG10"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xDC, 8)
                                                                   readWrite:PGWXMakeBit(0xE8, 10)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PG11"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xDC, 12)
                                                                   readWrite:PGWXMakeBit(0xE8, 11)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PG12"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xDC, 12)
                                                                   readWrite:PGWXMakeBit(0xE8, 12)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PG13"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xDC, 12)
                                                                   readWrite:PGWXMakeBit(0xE8, 13)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"PL0"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x00, 0)
                                                                   readWrite:PGWXMakeBit(0x10, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PL1"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x00, 4)
                                                                   readWrite:PGWXMakeBit(0x10, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PL2"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x00, 8)
                                                                   readWrite:PGWXMakeBit(0x10, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PL3"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x00, 12)
                                                                   readWrite:PGWXMakeBit(0x10, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PL4"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x00, 16)
                                                                   readWrite:PGWXMakeBit(0x10, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PL5"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x00, 20)
                                                                   readWrite:PGWXMakeBit(0x10, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PL6"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x00, 24)
                                                                   readWrite:PGWXMakeBit(0x10, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PL7"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x00, 28)
                                                                   readWrite:PGWXMakeBit(0x10, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PL8"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x04, 0)
                                                                   readWrite:PGWXMakeBit(0x10, 8)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PL9"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x04, 4)
                                                                   readWrite:PGWXMakeBit(0x10, 9)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PL10"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x04, 8)
                                                                   readWrite:PGWXMakeBit(0x10, 10)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"PL11"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x04, 12)
                                                                   readWrite:PGWXMakeBit(0x10, 11)
                                                                     support:PGWX_FUNCTION_DIGITAL]]
                                        gpioMap:gpioMap
                                         irqMap:irqMap
                                       isrModes:ISRMODES
                                       pageSize:(4 * 1024)
                                  baseAddresses:@[[PGWXAddr address:0x01C20000 offset:0x00000800], [PGWXAddr address:0x01F02000 offset:0x00000C00]]
                                          error:error]);
    }

@end
