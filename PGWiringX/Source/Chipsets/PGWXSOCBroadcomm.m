/******************************************************************************************************************************//**
 *     PROJECT: PGWiringX
 *    FILENAME: PGWXSOCBroadcomm.m
 *         IDE: AppCode
 *      AUTHOR: Galen Rhodes
 *        DATE: 6/26/17 1:34 PM
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

#import "PGWXSOCBroadcomm.h"
#import "PGWXBit.h"

#define GPFSEL0    0x00
#define GPFSEL1    0x04
#define GPFSEL2    0x08
#define GPFSEL3    0x0C
#define GPFSEL4    0x10
#define GPFSEL5    0x14

#define GPSET0    0x1C
#define GPSET1    0x20

#define GPCLR0    0x28
#define GPCLR1    0x2C

#define GPLEV0    0x34
#define GPLEV1    0x38

@interface PGWXSOCBroadcomm2835()

    -(instancetype)initWithChipset:(NSString *)chipSet
                            layout:(NSArray<PGWXLayout *> *)layout
                           gpioMap:(NSArray<PGWXPinName *> *)gpioMap
                            irqMap:(nullable NSArray<PGWXPinName *> *)irqMap
                     baseAddresses:(NSArray<PGWXAddr *> *)baseAddresses
                             error:(NSError **)error;

    -(instancetype)initWithChipSet:(NSString *)chipSet
                           gpioMap:(NSArray<PGWXPinName *> *)gpioMap
                            irqMap:(nullable NSArray<PGWXPinName *> *)irqMap
                     baseAddresses:(NSArray<PGWXAddr *> *)baseAddresses
                             error:(NSError **)error;
@end

@interface PGWXSOCBroadcomm2836()

@end

@implementation PGWXSOCBroadcomm2835 {
    }

    -(instancetype)initWithChipset:(NSString *)chipSet
                            layout:(NSArray<PGWXLayout *> *)layout
                           gpioMap:(NSArray<PGWXPinName *> *)gpioMap
                            irqMap:(nullable NSArray<PGWXPinName *> *)irqMap
                     baseAddresses:(NSArray<PGWXAddr *> *)baseAddresses
                             error:(NSError **)error {
        self = [super initWithBrandName:@"Broadcomm"
                                chipSet:chipSet
                                 layout:layout
                                gpioMap:gpioMap
                                 irqMap:irqMap
                               isrModes:PGWX_ISR_MODE_RISING | PGWX_ISR_MODE_FALLING | PGWX_ISR_MODE_BOTH | PGWX_ISR_MODE_NONE
                               pageSize:(4 * 1024)
                          baseAddresses:baseAddresses
                                  error:error];
        return self;
    }

    -(instancetype)initWithChipSet:(NSString *)chipSet
                           gpioMap:(NSArray<PGWXPinName *> *)gpioMap
                            irqMap:(nullable NSArray<PGWXPinName *> *)irqMap
                     baseAddresses:(NSArray<PGWXAddr *> *)baseAddresses
                             error:(NSError **)error {
        return (self = [self initWithChipset:chipSet
                                      layout:@[[PGWXLayout layoutWithName:@"FSEL0"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL0, 0)
                                                                     read:PGWXMakeBit(GPLEV0, 0)
                                                                      set:PGWXMakeBit(GPSET0, 0)
                                                                    clear:PGWXMakeBit(GPCLR0, 0)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL1"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL0, 3)
                                                                     read:PGWXMakeBit(GPLEV0, 1)
                                                                      set:PGWXMakeBit(GPSET0, 1)
                                                                    clear:PGWXMakeBit(GPCLR0, 1)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL2"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL0, 6)
                                                                     read:PGWXMakeBit(GPLEV0, 2)
                                                                      set:PGWXMakeBit(GPSET0, 2)
                                                                    clear:PGWXMakeBit(GPCLR0, 2)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL3"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL0, 9)
                                                                     read:PGWXMakeBit(GPLEV0, 3)
                                                                      set:PGWXMakeBit(GPSET0, 3)
                                                                    clear:PGWXMakeBit(GPCLR0, 3)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL4"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL0, 12)
                                                                     read:PGWXMakeBit(GPLEV0, 4)
                                                                      set:PGWXMakeBit(GPSET0, 4)
                                                                    clear:PGWXMakeBit(GPCLR0, 4)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL5"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL0, 15)
                                                                     read:PGWXMakeBit(GPLEV0, 5)
                                                                      set:PGWXMakeBit(GPSET0, 5)
                                                                    clear:PGWXMakeBit(GPCLR0, 5)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL6"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL0, 18)
                                                                     read:PGWXMakeBit(GPLEV0, 6)
                                                                      set:PGWXMakeBit(GPSET0, 6)
                                                                    clear:PGWXMakeBit(GPCLR0, 6)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL7"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL0, 21)
                                                                     read:PGWXMakeBit(GPLEV0, 7)
                                                                      set:PGWXMakeBit(GPSET0, 7)
                                                                    clear:PGWXMakeBit(GPCLR0, 7)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL8"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL0, 24)
                                                                     read:PGWXMakeBit(GPLEV0, 8)
                                                                      set:PGWXMakeBit(GPSET0, 8)
                                                                    clear:PGWXMakeBit(GPCLR0, 8)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL9"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL0, 27)
                                                                     read:PGWXMakeBit(GPLEV0, 9)
                                                                      set:PGWXMakeBit(GPSET0, 9)
                                                                    clear:PGWXMakeBit(GPCLR0, 9)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL10"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL1, 0)
                                                                     read:PGWXMakeBit(GPLEV0, 10)
                                                                      set:PGWXMakeBit(GPSET0, 10)
                                                                    clear:PGWXMakeBit(GPCLR0, 10)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL11"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL1, 3)
                                                                     read:PGWXMakeBit(GPLEV0, 11)
                                                                      set:PGWXMakeBit(GPSET0, 11)
                                                                    clear:PGWXMakeBit(GPCLR0, 11)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL12"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL1, 6)
                                                                     read:PGWXMakeBit(GPLEV0, 12)
                                                                      set:PGWXMakeBit(GPSET0, 12)
                                                                    clear:PGWXMakeBit(GPCLR0, 12)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL13"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL1, 9)
                                                                     read:PGWXMakeBit(GPLEV0, 13)
                                                                      set:PGWXMakeBit(GPSET0, 13)
                                                                    clear:PGWXMakeBit(GPCLR0, 13)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL14"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL1, 12)
                                                                     read:PGWXMakeBit(GPLEV0, 14)
                                                                      set:PGWXMakeBit(GPSET0, 14)
                                                                    clear:PGWXMakeBit(GPCLR0, 14)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL15"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL1, 15)
                                                                     read:PGWXMakeBit(GPLEV0, 15)
                                                                      set:PGWXMakeBit(GPSET0, 15)
                                                                    clear:PGWXMakeBit(GPCLR0, 15)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL16"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL1, 18)
                                                                     read:PGWXMakeBit(GPLEV0, 16)
                                                                      set:PGWXMakeBit(GPSET0, 16)
                                                                    clear:PGWXMakeBit(GPCLR0, 16)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL17"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL1, 21)
                                                                     read:PGWXMakeBit(GPLEV0, 17)
                                                                      set:PGWXMakeBit(GPSET0, 17)
                                                                    clear:PGWXMakeBit(GPCLR0, 17)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL18"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL1, 24)
                                                                     read:PGWXMakeBit(GPLEV0, 18)
                                                                      set:PGWXMakeBit(GPSET0, 18)
                                                                    clear:PGWXMakeBit(GPCLR0, 18)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL19"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL1, 27)
                                                                     read:PGWXMakeBit(GPLEV0, 19)
                                                                      set:PGWXMakeBit(GPSET0, 19)
                                                                    clear:PGWXMakeBit(GPCLR0, 19)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL20"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL2, 0)
                                                                     read:PGWXMakeBit(GPLEV0, 20)
                                                                      set:PGWXMakeBit(GPSET0, 20)
                                                                    clear:PGWXMakeBit(GPCLR0, 20)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL21"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL2, 3)
                                                                     read:PGWXMakeBit(GPLEV0, 21)
                                                                      set:PGWXMakeBit(GPSET0, 21)
                                                                    clear:PGWXMakeBit(GPCLR0, 21)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL22"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL2, 6)
                                                                     read:PGWXMakeBit(GPLEV0, 22)
                                                                      set:PGWXMakeBit(GPSET0, 22)
                                                                    clear:PGWXMakeBit(GPCLR0, 22)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL23"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL2, 9)
                                                                     read:PGWXMakeBit(GPLEV0, 23)
                                                                      set:PGWXMakeBit(GPSET0, 23)
                                                                    clear:PGWXMakeBit(GPCLR0, 23)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL24"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL2, 12)
                                                                     read:PGWXMakeBit(GPLEV0, 24)
                                                                      set:PGWXMakeBit(GPSET0, 24)
                                                                    clear:PGWXMakeBit(GPCLR0, 24)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL25"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL2, 15)
                                                                     read:PGWXMakeBit(GPLEV0, 25)
                                                                      set:PGWXMakeBit(GPSET0, 25)
                                                                    clear:PGWXMakeBit(GPCLR0, 25)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL26"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL2, 18)
                                                                     read:PGWXMakeBit(GPLEV0, 26)
                                                                      set:PGWXMakeBit(GPSET0, 26)
                                                                    clear:PGWXMakeBit(GPCLR0, 26)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL27"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL2, 21)
                                                                     read:PGWXMakeBit(GPLEV0, 27)
                                                                      set:PGWXMakeBit(GPSET0, 27)
                                                                    clear:PGWXMakeBit(GPCLR0, 27)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL28"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL2, 24)
                                                                     read:PGWXMakeBit(GPLEV0, 28)
                                                                      set:PGWXMakeBit(GPSET0, 28)
                                                                    clear:PGWXMakeBit(GPCLR0, 28)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL29"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL2, 27)
                                                                     read:PGWXMakeBit(GPLEV0, 29)
                                                                      set:PGWXMakeBit(GPSET0, 29)
                                                                    clear:PGWXMakeBit(GPCLR0, 29)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL30"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL3, 0)
                                                                     read:PGWXMakeBit(GPLEV0, 30)
                                                                      set:PGWXMakeBit(GPSET0, 30)
                                                                    clear:PGWXMakeBit(GPCLR0, 30)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL31"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL3, 3)
                                                                     read:PGWXMakeBit(GPLEV0, 31)
                                                                      set:PGWXMakeBit(GPSET0, 31)
                                                                    clear:PGWXMakeBit(GPCLR0, 31)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL32"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL3, 6)
                                                                     read:PGWXMakeBit(GPLEV1, 0)
                                                                      set:PGWXMakeBit(GPSET1, 0)
                                                                    clear:PGWXMakeBit(GPCLR1, 0)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL33"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL3, 9)
                                                                     read:PGWXMakeBit(GPLEV1, 1)
                                                                      set:PGWXMakeBit(GPSET1, 1)
                                                                    clear:PGWXMakeBit(GPCLR1, 1)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL34"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL3, 12)
                                                                     read:PGWXMakeBit(GPLEV1, 2)
                                                                      set:PGWXMakeBit(GPSET1, 2)
                                                                    clear:PGWXMakeBit(GPCLR1, 2)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL35"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL3, 15)
                                                                     read:PGWXMakeBit(GPLEV1, 3)
                                                                      set:PGWXMakeBit(GPSET1, 3)
                                                                    clear:PGWXMakeBit(GPCLR1, 3)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL36"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL3, 18)
                                                                     read:PGWXMakeBit(GPLEV1, 4)
                                                                      set:PGWXMakeBit(GPSET1, 4)
                                                                    clear:PGWXMakeBit(GPCLR1, 4)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL37"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL3, 21)
                                                                     read:PGWXMakeBit(GPLEV1, 5)
                                                                      set:PGWXMakeBit(GPSET1, 5)
                                                                    clear:PGWXMakeBit(GPCLR1, 5)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL38"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL3, 24)
                                                                     read:PGWXMakeBit(GPLEV1, 6)
                                                                      set:PGWXMakeBit(GPSET1, 6)
                                                                    clear:PGWXMakeBit(GPCLR1, 6)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL39"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL3, 27)
                                                                     read:PGWXMakeBit(GPLEV1, 7)
                                                                      set:PGWXMakeBit(GPSET1, 7)
                                                                    clear:PGWXMakeBit(GPCLR1, 7)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL40"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL4, 0)
                                                                     read:PGWXMakeBit(GPLEV1, 8)
                                                                      set:PGWXMakeBit(GPSET1, 8)
                                                                    clear:PGWXMakeBit(GPCLR1, 8)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL41"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL4, 3)
                                                                     read:PGWXMakeBit(GPLEV1, 9)
                                                                      set:PGWXMakeBit(GPSET1, 9)
                                                                    clear:PGWXMakeBit(GPCLR1, 9)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL42"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL4, 6)
                                                                     read:PGWXMakeBit(GPLEV1, 10)
                                                                      set:PGWXMakeBit(GPSET1, 10)
                                                                    clear:PGWXMakeBit(GPCLR1, 10)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL43"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL4, 9)
                                                                     read:PGWXMakeBit(GPLEV1, 11)
                                                                      set:PGWXMakeBit(GPSET1, 11)
                                                                    clear:PGWXMakeBit(GPCLR1, 11)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL44"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL4, 12)
                                                                     read:PGWXMakeBit(GPLEV1, 12)
                                                                      set:PGWXMakeBit(GPSET1, 12)
                                                                    clear:PGWXMakeBit(GPCLR1, 12)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL45"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL4, 15)
                                                                     read:PGWXMakeBit(GPLEV1, 13)
                                                                      set:PGWXMakeBit(GPSET1, 13)
                                                                    clear:PGWXMakeBit(GPCLR1, 13)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL46"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL4, 18)
                                                                     read:PGWXMakeBit(GPLEV1, 14)
                                                                      set:PGWXMakeBit(GPSET1, 14)
                                                                    clear:PGWXMakeBit(GPCLR1, 14)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL47"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL4, 21)
                                                                     read:PGWXMakeBit(GPLEV1, 15)
                                                                      set:PGWXMakeBit(GPSET1, 15)
                                                                    clear:PGWXMakeBit(GPCLR1, 15)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL48"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL4, 24)
                                                                     read:PGWXMakeBit(GPLEV1, 16)
                                                                      set:PGWXMakeBit(GPSET1, 16)
                                                                    clear:PGWXMakeBit(GPCLR1, 16)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL49"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL4, 27)
                                                                     read:PGWXMakeBit(GPLEV1, 17)
                                                                      set:PGWXMakeBit(GPSET1, 17)
                                                                    clear:PGWXMakeBit(GPCLR1, 17)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL50"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL5, 0)
                                                                     read:PGWXMakeBit(GPLEV1, 18)
                                                                      set:PGWXMakeBit(GPSET1, 18)
                                                                    clear:PGWXMakeBit(GPCLR1, 18)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL51"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL5, 3)
                                                                     read:PGWXMakeBit(GPLEV1, 19)
                                                                      set:PGWXMakeBit(GPSET1, 19)
                                                                    clear:PGWXMakeBit(GPCLR1, 19)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL52"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL5, 6)
                                                                     read:PGWXMakeBit(GPLEV1, 20)
                                                                      set:PGWXMakeBit(GPSET1, 20)
                                                                    clear:PGWXMakeBit(GPCLR1, 20)
                                                                  support:PGWX_FUNCTION_DIGITAL],
                                               [PGWXLayout layoutWithName:@"FSEL53"
                                                                     bank:0
                                                                   select:PGWXMakeBit(GPFSEL5, 9)
                                                                     read:PGWXMakeBit(GPLEV1, 21)
                                                                      set:PGWXMakeBit(GPSET1, 21)
                                                                    clear:PGWXMakeBit(GPCLR1, 21)
                                                                  support:PGWX_FUNCTION_DIGITAL]]
                                     gpioMap:gpioMap
                                      irqMap:irqMap
                               baseAddresses:baseAddresses
                                       error:error]);
    }

    -(instancetype)initWithGPIOMap:(NSArray<PGWXPinName *> *)gpioMap irqMap:(nullable NSArray<PGWXPinName *> *)irqMap error:(NSError **)error {
        return (self = [self initWithChipSet:@"2835" gpioMap:gpioMap irqMap:irqMap baseAddresses:@[[PGWXAddr address:0x20200000 offset:0x00000000]] error:error]);
    }

@end

@implementation PGWXSOCBroadcomm2836 {
    }

    -(instancetype)initWithGPIOMap:(NSArray<PGWXPinName *> *)gpioMap irqMap:(nullable NSArray<PGWXPinName *> *)irqMap error:(NSError **)error {
        return (self = [self initWithChipSet:@"2836" gpioMap:gpioMap irqMap:irqMap baseAddresses:@[[PGWXAddr address:0x3F200000 offset:0x00000000]] error:error]);
    }

@end

@implementation PGWXSOCBroadcomm2837 {
    }

    -(instancetype)initWithGPIOMap:(NSArray<PGWXPinName *> *)gpioMap irqMap:(nullable NSArray<PGWXPinName *> *)irqMap error:(NSError **)error {
        return (self = [self initWithChipSet:@"2837" gpioMap:gpioMap irqMap:irqMap baseAddresses:@[[PGWXAddr address:0x3F200000 offset:0x00000000]] error:error]);
    }

@end
