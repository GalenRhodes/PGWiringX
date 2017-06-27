/******************************************************************************************************************************//**
 *     PROJECT: PGWiringX
 *    FILENAME: PGWXExynos.m
 *         IDE: AppCode
 *      AUTHOR: Galen Rhodes
 *        DATE: 6/26/17 2:11 PM
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

#import "PGWXSOCSamsung.h"
#import "PGWXBit.h"

@implementation PGWXSOCSamsungExynos5422 {
    }

    -(instancetype)initWithGPIOMap:(NSArray<PGWXPinName *> *)gpioMap irqMap:(nullable NSArray<PGWXPinName *> *)irqMap error:(NSError **)error {
        return (self = [super initWithBrandName:@"Samsung"
                                        chipSet:@"Exynos5422"
                                         layout:@[[PGWXLayout layoutWithName:@"GPIO_Y70"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x000, 0)
                                                                   readWrite:PGWXMakeBit(0x004, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],

                                                  [PGWXLayout layoutWithName:@"GPIO_Y71"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x000, 4)
                                                                   readWrite:PGWXMakeBit(0x004, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y72"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x000, 8)
                                                                   readWrite:PGWXMakeBit(0x004, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y73"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x000, 12)
                                                                   readWrite:PGWXMakeBit(0x004, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y74"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x000, 16)
                                                                   readWrite:PGWXMakeBit(0x004, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y75"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x000, 20)
                                                                   readWrite:PGWXMakeBit(0x004, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y76"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x000, 24)
                                                                   readWrite:PGWXMakeBit(0x004, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y77"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0x000, 28)
                                                                   readWrite:PGWXMakeBit(0x004, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_X00"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xC00, 0)
                                                                   readWrite:PGWXMakeBit(0xC04, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_X01"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xC00, 4)
                                                                   readWrite:PGWXMakeBit(0xC04, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_X02"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xC00, 8)
                                                                   readWrite:PGWXMakeBit(0xC04, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_X03"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xC00, 12)
                                                                   readWrite:PGWXMakeBit(0xC04, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_X04"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xC00, 16)
                                                                   readWrite:PGWXMakeBit(0xC04, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_X05"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xC00, 20)
                                                                   readWrite:PGWXMakeBit(0xC04, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_X06"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xC00, 24)
                                                                   readWrite:PGWXMakeBit(0xC04, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_X07"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xC00, 28)
                                                                   readWrite:PGWXMakeBit(0xC04, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_X10"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xC20, 0)
                                                                   readWrite:PGWXMakeBit(0xC24, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_X11"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xC20, 4)
                                                                   readWrite:PGWXMakeBit(0xC24, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_X12"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xC20, 8)
                                                                   readWrite:PGWXMakeBit(0xC24, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_X13"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xC20, 12)
                                                                   readWrite:PGWXMakeBit(0xC24, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_X14"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xC20, 16)
                                                                   readWrite:PGWXMakeBit(0xC24, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_X15"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xC20, 20)
                                                                   readWrite:PGWXMakeBit(0xC24, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_X16"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xC20, 24)
                                                                   readWrite:PGWXMakeBit(0xC24, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_X17"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xC20, 28)
                                                                   readWrite:PGWXMakeBit(0xC24, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_X20"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xC40, 0)
                                                                   readWrite:PGWXMakeBit(0xC44, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_X21"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xC40, 4)
                                                                   readWrite:PGWXMakeBit(0xC44, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_X22"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xC40, 8)
                                                                   readWrite:PGWXMakeBit(0xC44, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_X23"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xC40, 12)
                                                                   readWrite:PGWXMakeBit(0xC44, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_X24"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xC40, 16)
                                                                   readWrite:PGWXMakeBit(0xC44, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_X25"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xC40, 20)
                                                                   readWrite:PGWXMakeBit(0xC44, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_X26"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xC40, 24)
                                                                   readWrite:PGWXMakeBit(0xC44, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_X27"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xC40, 28)
                                                                   readWrite:PGWXMakeBit(0xC44, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_X30"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xC60, 0)
                                                                   readWrite:PGWXMakeBit(0xC64, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_X31"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xC60, 4)
                                                                   readWrite:PGWXMakeBit(0xC64, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_X32"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xC60, 8)
                                                                   readWrite:PGWXMakeBit(0xC64, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_X33"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xC60, 12)
                                                                   readWrite:PGWXMakeBit(0xC64, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_X34"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xC60, 16)
                                                                   readWrite:PGWXMakeBit(0xC64, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_X35"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xC60, 20)
                                                                   readWrite:PGWXMakeBit(0xC64, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_X36"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xC60, 24)
                                                                   readWrite:PGWXMakeBit(0xC64, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_X37"
                                                                        bank:0
                                                                      select:PGWXMakeBit(0xC60, 28)
                                                                   readWrite:PGWXMakeBit(0xC64, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_C00"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x000, 0)
                                                                   readWrite:PGWXMakeBit(0x004, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_C01"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x000, 4)
                                                                   readWrite:PGWXMakeBit(0x004, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_C02"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x000, 8)
                                                                   readWrite:PGWXMakeBit(0x004, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_C03"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x000, 12)
                                                                   readWrite:PGWXMakeBit(0x004, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_C04"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x000, 16)
                                                                   readWrite:PGWXMakeBit(0x004, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_C05"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x000, 20)
                                                                   readWrite:PGWXMakeBit(0x004, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_C06"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x000, 24)
                                                                   readWrite:PGWXMakeBit(0x004, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_C07"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x000, 28)
                                                                   readWrite:PGWXMakeBit(0x004, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_C10"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x020, 0)
                                                                   readWrite:PGWXMakeBit(0x024, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_C11"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x020, 4)
                                                                   readWrite:PGWXMakeBit(0x024, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_C12"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x020, 8)
                                                                   readWrite:PGWXMakeBit(0x024, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_C13"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x020, 12)
                                                                   readWrite:PGWXMakeBit(0x024, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_C14"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x020, 16)
                                                                   readWrite:PGWXMakeBit(0x024, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_C15"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x020, 20)
                                                                   readWrite:PGWXMakeBit(0x024, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_C16"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x020, 24)
                                                                   readWrite:PGWXMakeBit(0x024, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_C17"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x020, 28)
                                                                   readWrite:PGWXMakeBit(0x024, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_C20"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x040, 0)
                                                                   readWrite:PGWXMakeBit(0x044, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_C21"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x040, 4)
                                                                   readWrite:PGWXMakeBit(0x044, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_C22"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x040, 8)
                                                                   readWrite:PGWXMakeBit(0x044, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_C23"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x040, 12)
                                                                   readWrite:PGWXMakeBit(0x044, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_C24"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x040, 16)
                                                                   readWrite:PGWXMakeBit(0x044, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_C25"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x040, 20)
                                                                   readWrite:PGWXMakeBit(0x044, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_C26"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x040, 24)
                                                                   readWrite:PGWXMakeBit(0x044, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_C30"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x060, 0)
                                                                   readWrite:PGWXMakeBit(0x064, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_C31"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x060, 4)
                                                                   readWrite:PGWXMakeBit(0x064, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_C32"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x060, 8)
                                                                   readWrite:PGWXMakeBit(0x064, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_C33"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x060, 12)
                                                                   readWrite:PGWXMakeBit(0x064, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_C40"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x080, 0)
                                                                   readWrite:PGWXMakeBit(0x084, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_C41"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x080, 4)
                                                                   readWrite:PGWXMakeBit(0x084, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_D10"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x0A0, 0)
                                                                   readWrite:PGWXMakeBit(0x0A4, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_D11"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x0A0, 4)
                                                                   readWrite:PGWXMakeBit(0x0A4, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_D12"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x0A0, 8)
                                                                   readWrite:PGWXMakeBit(0x0A4, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_D13"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x0A0, 12)
                                                                   readWrite:PGWXMakeBit(0x0A4, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_D14"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x0A0, 16)
                                                                   readWrite:PGWXMakeBit(0x0A4, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_D15"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x0A0, 20)
                                                                   readWrite:PGWXMakeBit(0x0A4, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_D16"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x0A0, 24)
                                                                   readWrite:PGWXMakeBit(0x0A4, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_D17"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x0A0, 28)
                                                                   readWrite:PGWXMakeBit(0x0A4, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y00"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x0C0, 0)
                                                                   readWrite:PGWXMakeBit(0x0C4, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y01"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x0C0, 4)
                                                                   readWrite:PGWXMakeBit(0x0C4, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y02"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x0C0, 8)
                                                                   readWrite:PGWXMakeBit(0x0C4, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y03"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x0C0, 12)
                                                                   readWrite:PGWXMakeBit(0x0C4, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y04"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x0C0, 16)
                                                                   readWrite:PGWXMakeBit(0x0C4, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y05"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x0C0, 20)
                                                                   readWrite:PGWXMakeBit(0x0C4, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y10"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x0E0, 0)
                                                                   readWrite:PGWXMakeBit(0x0E4, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y11"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x0E0, 4)
                                                                   readWrite:PGWXMakeBit(0x0E4, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y12"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x0E0, 8)
                                                                   readWrite:PGWXMakeBit(0x0E4, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y13"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x0E0, 12)
                                                                   readWrite:PGWXMakeBit(0x0E4, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y20"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x100, 0)
                                                                   readWrite:PGWXMakeBit(0x104, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y21"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x100, 4)
                                                                   readWrite:PGWXMakeBit(0x104, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y22"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x100, 8)
                                                                   readWrite:PGWXMakeBit(0x104, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y23"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x100, 12)
                                                                   readWrite:PGWXMakeBit(0x104, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y24"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x100, 16)
                                                                   readWrite:PGWXMakeBit(0x104, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y25"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x100, 20)
                                                                   readWrite:PGWXMakeBit(0x104, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y30"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x120, 0)
                                                                   readWrite:PGWXMakeBit(0x124, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y31"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x120, 4)
                                                                   readWrite:PGWXMakeBit(0x124, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y32"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x120, 8)
                                                                   readWrite:PGWXMakeBit(0x124, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y33"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x120, 12)
                                                                   readWrite:PGWXMakeBit(0x124, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y34"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x120, 16)
                                                                   readWrite:PGWXMakeBit(0x124, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y35"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x120, 20)
                                                                   readWrite:PGWXMakeBit(0x124, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y36"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x120, 24)
                                                                   readWrite:PGWXMakeBit(0x124, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y37"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x120, 28)
                                                                   readWrite:PGWXMakeBit(0x124, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y40"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x140, 0)
                                                                   readWrite:PGWXMakeBit(0x144, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y41"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x140, 4)
                                                                   readWrite:PGWXMakeBit(0x144, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y42"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x140, 8)
                                                                   readWrite:PGWXMakeBit(0x144, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y43"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x140, 12)
                                                                   readWrite:PGWXMakeBit(0x144, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y44"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x140, 16)
                                                                   readWrite:PGWXMakeBit(0x144, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y45"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x140, 20)
                                                                   readWrite:PGWXMakeBit(0x144, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y46"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x140, 24)
                                                                   readWrite:PGWXMakeBit(0x144, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y47"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x140, 28)
                                                                   readWrite:PGWXMakeBit(0x144, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y50"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x160, 0)
                                                                   readWrite:PGWXMakeBit(0x164, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y51"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x160, 4)
                                                                   readWrite:PGWXMakeBit(0x164, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y52"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x160, 8)
                                                                   readWrite:PGWXMakeBit(0x164, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y53"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x160, 12)
                                                                   readWrite:PGWXMakeBit(0x164, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y54"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x160, 16)
                                                                   readWrite:PGWXMakeBit(0x164, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y55"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x160, 20)
                                                                   readWrite:PGWXMakeBit(0x164, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y56"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x160, 24)
                                                                   readWrite:PGWXMakeBit(0x164, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y57"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x160, 28)
                                                                   readWrite:PGWXMakeBit(0x164, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y60"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x180, 0)
                                                                   readWrite:PGWXMakeBit(0x184, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y61"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x180, 4)
                                                                   readWrite:PGWXMakeBit(0x184, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y62"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x180, 8)
                                                                   readWrite:PGWXMakeBit(0x184, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y63"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x180, 12)
                                                                   readWrite:PGWXMakeBit(0x184, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y64"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x180, 16)
                                                                   readWrite:PGWXMakeBit(0x184, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y65"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x180, 20)
                                                                   readWrite:PGWXMakeBit(0x184, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y66"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x180, 24)
                                                                   readWrite:PGWXMakeBit(0x184, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_Y67"
                                                                        bank:1
                                                                      select:PGWXMakeBit(0x180, 28)
                                                                   readWrite:PGWXMakeBit(0x184, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL],
                                                  [PGWXLayout layoutWithName:@"GPIO_E00"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x000, 0)
                                                                   readWrite:PGWXMakeBit(0x004, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_E01"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x000, 4)
                                                                   readWrite:PGWXMakeBit(0x004, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_E02"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x000, 8)
                                                                   readWrite:PGWXMakeBit(0x004, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_E03"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x000, 12)
                                                                   readWrite:PGWXMakeBit(0x004, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_E04"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x000, 16)
                                                                   readWrite:PGWXMakeBit(0x004, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_E05"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x000, 20)
                                                                   readWrite:PGWXMakeBit(0x004, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_E06"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x000, 24)
                                                                   readWrite:PGWXMakeBit(0x004, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_E07"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x000, 28)
                                                                   readWrite:PGWXMakeBit(0x004, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_E10"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x020, 0)
                                                                   readWrite:PGWXMakeBit(0x024, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_E11"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x020, 4)
                                                                   readWrite:PGWXMakeBit(0x024, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_F00"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x040, 0)
                                                                   readWrite:PGWXMakeBit(0x044, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_F01"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x040, 4)
                                                                   readWrite:PGWXMakeBit(0x044, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_F02"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x040, 8)
                                                                   readWrite:PGWXMakeBit(0x044, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_F03"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x040, 12)
                                                                   readWrite:PGWXMakeBit(0x044, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_F04"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x040, 16)
                                                                   readWrite:PGWXMakeBit(0x044, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_F05"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x040, 20)
                                                                   readWrite:PGWXMakeBit(0x044, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_F10"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x060, 0)
                                                                   readWrite:PGWXMakeBit(0x064, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_F11"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x060, 4)
                                                                   readWrite:PGWXMakeBit(0x064, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_F12"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x060, 8)
                                                                   readWrite:PGWXMakeBit(0x064, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_F13"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x060, 12)
                                                                   readWrite:PGWXMakeBit(0x064, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_F14"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x060, 16)
                                                                   readWrite:PGWXMakeBit(0x064, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_F15"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x060, 20)
                                                                   readWrite:PGWXMakeBit(0x064, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_F16"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x060, 24)
                                                                   readWrite:PGWXMakeBit(0x064, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_F17"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x060, 28)
                                                                   readWrite:PGWXMakeBit(0x064, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_G00"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x080, 0)
                                                                   readWrite:PGWXMakeBit(0x084, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_G01"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x080, 4)
                                                                   readWrite:PGWXMakeBit(0x084, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_G02"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x080, 8)
                                                                   readWrite:PGWXMakeBit(0x084, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_G03"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x080, 12)
                                                                   readWrite:PGWXMakeBit(0x084, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_G04"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x080, 16)
                                                                   readWrite:PGWXMakeBit(0x084, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_G05"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x080, 20)
                                                                   readWrite:PGWXMakeBit(0x084, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_G06"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x080, 24)
                                                                   readWrite:PGWXMakeBit(0x084, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_G07"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x080, 28)
                                                                   readWrite:PGWXMakeBit(0x084, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_G10"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x0A0, 0)
                                                                   readWrite:PGWXMakeBit(0x0A4, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_G11"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x0A0, 4)
                                                                   readWrite:PGWXMakeBit(0x0A4, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_G12"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x0A0, 8)
                                                                   readWrite:PGWXMakeBit(0x0A4, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_G13"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x0A0, 12)
                                                                   readWrite:PGWXMakeBit(0x0A4, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_G14"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x0A0, 16)
                                                                   readWrite:PGWXMakeBit(0x0A4, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_G15"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x0A0, 20)
                                                                   readWrite:PGWXMakeBit(0x0A4, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_G16"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x0A0, 24)
                                                                   readWrite:PGWXMakeBit(0x0A4, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_G17"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x0A0, 28)
                                                                   readWrite:PGWXMakeBit(0x0A4, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_G20"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x0C0, 0)
                                                                   readWrite:PGWXMakeBit(0x0C4, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_G21"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x0C0, 4)
                                                                   readWrite:PGWXMakeBit(0x0C4, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_J40"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x0E0, 0)
                                                                   readWrite:PGWXMakeBit(0x0E4, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_J41"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x0E0, 4)
                                                                   readWrite:PGWXMakeBit(0x0E4, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_J42"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x0E0, 8)
                                                                   readWrite:PGWXMakeBit(0x0E4, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_J43"
                                                                        bank:2
                                                                      select:PGWXMakeBit(0x0E0, 12)
                                                                   readWrite:PGWXMakeBit(0x0E4, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_A00"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x000, 0)
                                                                   readWrite:PGWXMakeBit(0x004, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_A01"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x000, 4)
                                                                   readWrite:PGWXMakeBit(0x004, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_A02"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x000, 8)
                                                                   readWrite:PGWXMakeBit(0x004, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_A03"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x000, 12)
                                                                   readWrite:PGWXMakeBit(0x004, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_A04"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x000, 16)
                                                                   readWrite:PGWXMakeBit(0x004, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_A05"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x000, 20)
                                                                   readWrite:PGWXMakeBit(0x004, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_A06"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x000, 24)
                                                                   readWrite:PGWXMakeBit(0x004, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT | PGWX_FUNCTION_I2C],
                                                  [PGWXLayout layoutWithName:@"GPIO_A07"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x000, 28)
                                                                   readWrite:PGWXMakeBit(0x004, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT | PGWX_FUNCTION_I2C],
                                                  [PGWXLayout layoutWithName:@"GPIO_A10"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x020, 0)
                                                                   readWrite:PGWXMakeBit(0x024, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_A11"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x020, 4)
                                                                   readWrite:PGWXMakeBit(0x024, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_A12"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x020, 8)
                                                                   readWrite:PGWXMakeBit(0x024, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_A13"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x020, 12)
                                                                   readWrite:PGWXMakeBit(0x024, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_A14"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x020, 16)
                                                                   readWrite:PGWXMakeBit(0x024, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_A15"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x020, 20)
                                                                   readWrite:PGWXMakeBit(0x024, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_A20"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x040, 0)
                                                                   readWrite:PGWXMakeBit(0x044, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT | PGWX_FUNCTION_I2C],
                                                  [PGWXLayout layoutWithName:@"GPIO_A21"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x040, 4)
                                                                   readWrite:PGWXMakeBit(0x044, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT | PGWX_FUNCTION_I2C],
                                                  [PGWXLayout layoutWithName:@"GPIO_A22"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x040, 8)
                                                                   readWrite:PGWXMakeBit(0x044, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT | PGWX_FUNCTION_I2C],
                                                  [PGWXLayout layoutWithName:@"GPIO_A23"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x040, 12)
                                                                   readWrite:PGWXMakeBit(0x044, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT | PGWX_FUNCTION_I2C],
                                                  [PGWXLayout layoutWithName:@"GPIO_A24"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x040, 16)
                                                                   readWrite:PGWXMakeBit(0x044, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_A25"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x040, 20)
                                                                   readWrite:PGWXMakeBit(0x044, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_A26"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x040, 24)
                                                                   readWrite:PGWXMakeBit(0x044, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_A27"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x040, 28)
                                                                   readWrite:PGWXMakeBit(0x044, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_B00"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x060, 0)
                                                                   readWrite:PGWXMakeBit(0x064, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT | PGWX_FUNCTION_I2C],
                                                  [PGWXLayout layoutWithName:@"GPIO_B01"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x060, 4)
                                                                   readWrite:PGWXMakeBit(0x064, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT | PGWX_FUNCTION_I2C],
                                                  [PGWXLayout layoutWithName:@"GPIO_B02"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x060, 8)
                                                                   readWrite:PGWXMakeBit(0x064, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT | PGWX_FUNCTION_I2C],
                                                  [PGWXLayout layoutWithName:@"GPIO_B03"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x060, 12)
                                                                   readWrite:PGWXMakeBit(0x064, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT | PGWX_FUNCTION_I2C],
                                                  [PGWXLayout layoutWithName:@"GPIO_B04"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x060, 16)
                                                                   readWrite:PGWXMakeBit(0x064, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT | PGWX_FUNCTION_I2C],
                                                  [PGWXLayout layoutWithName:@"GPIO_B10"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x080, 0)
                                                                   readWrite:PGWXMakeBit(0x084, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_B11"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x080, 4)
                                                                   readWrite:PGWXMakeBit(0x084, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_B12"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x080, 8)
                                                                   readWrite:PGWXMakeBit(0x084, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_B13"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x080, 12)
                                                                   readWrite:PGWXMakeBit(0x084, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_B14"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x080, 16)
                                                                   readWrite:PGWXMakeBit(0x084, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_B20"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x0A0, 0)
                                                                   readWrite:PGWXMakeBit(0x0A4, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_B21"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x0A0, 4)
                                                                   readWrite:PGWXMakeBit(0x0A4, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_B22"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x0A0, 8)
                                                                   readWrite:PGWXMakeBit(0x0A4, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT | PGWX_FUNCTION_I2C],
                                                  [PGWXLayout layoutWithName:@"GPIO_B23"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x0A0, 12)
                                                                   readWrite:PGWXMakeBit(0x0A4, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT | PGWX_FUNCTION_I2C],
                                                  [PGWXLayout layoutWithName:@"GPIO_B30"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x0C0, 0)
                                                                   readWrite:PGWXMakeBit(0x0C4, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT | PGWX_FUNCTION_I2C],
                                                  [PGWXLayout layoutWithName:@"GPIO_B31"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x0C0, 4)
                                                                   readWrite:PGWXMakeBit(0x0C4, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT | PGWX_FUNCTION_I2C],
                                                  [PGWXLayout layoutWithName:@"GPIO_B32"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x0C0, 8)
                                                                   readWrite:PGWXMakeBit(0x0C4, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT | PGWX_FUNCTION_I2C],
                                                  [PGWXLayout layoutWithName:@"GPIO_B33"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x0C0, 12)
                                                                   readWrite:PGWXMakeBit(0x0C4, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT | PGWX_FUNCTION_I2C],
                                                  [PGWXLayout layoutWithName:@"GPIO_B34"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x0C0, 16)
                                                                   readWrite:PGWXMakeBit(0x0C4, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT | PGWX_FUNCTION_I2C],
                                                  [PGWXLayout layoutWithName:@"GPIO_B35"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x0C0, 20)
                                                                   readWrite:PGWXMakeBit(0x0C4, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT | PGWX_FUNCTION_I2C],
                                                  [PGWXLayout layoutWithName:@"GPIO_B36"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x0C0, 24)
                                                                   readWrite:PGWXMakeBit(0x0C4, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT | PGWX_FUNCTION_I2C],
                                                  [PGWXLayout layoutWithName:@"GPIO_B37"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x0C0, 28)
                                                                   readWrite:PGWXMakeBit(0x0C4, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT | PGWX_FUNCTION_I2C],
                                                  [PGWXLayout layoutWithName:@"GPIO_B40"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x0E0, 0)
                                                                   readWrite:PGWXMakeBit(0x0E4, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT | PGWX_FUNCTION_I2C],
                                                  [PGWXLayout layoutWithName:@"GPIO_B41"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x0E0, 4)
                                                                   readWrite:PGWXMakeBit(0x0E4, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT | PGWX_FUNCTION_I2C],
                                                  [PGWXLayout layoutWithName:@"GPIO_H00"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x100, 0)
                                                                   readWrite:PGWXMakeBit(0x104, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_H01"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x100, 4)
                                                                   readWrite:PGWXMakeBit(0x104, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_H02"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x100, 8)
                                                                   readWrite:PGWXMakeBit(0x104, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_H03"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x100, 12)
                                                                   readWrite:PGWXMakeBit(0x104, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_H04"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x100, 16)
                                                                   readWrite:PGWXMakeBit(0x104, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_H05"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x100, 20)
                                                                   readWrite:PGWXMakeBit(0x104, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_H06"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x100, 24)
                                                                   readWrite:PGWXMakeBit(0x104, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_H07"
                                                                        bank:3
                                                                      select:PGWXMakeBit(0x100, 28)
                                                                   readWrite:PGWXMakeBit(0x104, 7)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_Z0"
                                                                        bank:4
                                                                      select:PGWXMakeBit(0x000, 0)
                                                                   readWrite:PGWXMakeBit(0x004, 0)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_Z1"
                                                                        bank:4
                                                                      select:PGWXMakeBit(0x000, 4)
                                                                   readWrite:PGWXMakeBit(0x004, 1)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_Z2"
                                                                        bank:4
                                                                      select:PGWXMakeBit(0x000, 8)
                                                                   readWrite:PGWXMakeBit(0x004, 2)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_Z3"
                                                                        bank:4
                                                                      select:PGWXMakeBit(0x000, 12)
                                                                   readWrite:PGWXMakeBit(0x004, 3)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_Z4"
                                                                        bank:4
                                                                      select:PGWXMakeBit(0x000, 16)
                                                                   readWrite:PGWXMakeBit(0x004, 4)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_Z5"
                                                                        bank:4
                                                                      select:PGWXMakeBit(0x000, 20)
                                                                   readWrite:PGWXMakeBit(0x004, 5)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT],
                                                  [PGWXLayout layoutWithName:@"GPIO_Z6"
                                                                        bank:4
                                                                      select:PGWXMakeBit(0x000, 24)
                                                                   readWrite:PGWXMakeBit(0x004, 6)
                                                                     support:PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT]]
                                        gpioMap:gpioMap
                                         irqMap:irqMap
                                       isrModes:(PGWX_ISR_MODE_RISING | PGWX_ISR_MODE_FALLING | PGWX_ISR_MODE_BOTH | PGWX_ISR_MODE_NONE)
                                       pageSize:(4 * 1024)
                                  baseAddresses:@[[PGWXAddr address:0x13400000 offset:0x00000000],
                                                  [PGWXAddr address:0x13410000 offset:0x00000000],
                                                  [PGWXAddr address:0x14000000 offset:0x00000000],
                                                  [PGWXAddr address:0x14010000 offset:0x00000000],
                                                  [PGWXAddr address:0x03860000 offset:0x00000000]]
                                          error:error]);
    }
@end
