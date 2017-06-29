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

#define MB(b, o)  PGWXMakeBit((b),(o))
#define IM (PGWX_ISR_MODE_RISING | PGWX_ISR_MODE_FALLING | PGWX_ISR_MODE_BOTH | PGWX_ISR_MODE_NONE)
#define SUP1     (PGWX_FUNCTION_DIGITAL)
#define SUP2     (SUP1 | PGWX_FUNCTION_INTERRUPT)
#define PAGESZ   (4 * 1024)
#define BRAND    @"Allwinner"

@implementation PGWXSOCAllwinnerA10 {
    }

    -(instancetype)initWithGPIOMap:(NSArray<NSString *> *)gpioMap irqMap:(nullable NSArray<NSString *> *)irqMap error:(NSError *_Nullable *)error {
        NSUInteger     idx = 0;
        NSArray        *ba = @[[PGWXAddr address:0x01C20000 offset:0x00000800]];
        NSMutableArray *ar = [NSMutableArray new];

        [ar addObject:[PGWXLayout layoutWithName:@"PA0" number:idx++ bank:0 select:MB(0x00, 0) readWrite:MB(0x10, 0) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA1" number:idx++ bank:0 select:MB(0x00, 4) readWrite:MB(0x10, 1) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA2" number:idx++ bank:0 select:MB(0x00, 8) readWrite:MB(0x10, 2) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA3" number:idx++ bank:0 select:MB(0x00, 12) readWrite:MB(0x10, 3) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA4" number:idx++ bank:0 select:MB(0x00, 16) readWrite:MB(0x10, 4) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA5" number:idx++ bank:0 select:MB(0x00, 20) readWrite:MB(0x10, 5) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA6" number:idx++ bank:0 select:MB(0x00, 24) readWrite:MB(0x10, 6) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA7" number:idx++ bank:0 select:MB(0x00, 28) readWrite:MB(0x10, 7) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA8" number:idx++ bank:0 select:MB(0x04, 0) readWrite:MB(0x10, 8) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA9" number:idx++ bank:0 select:MB(0x04, 4) readWrite:MB(0x10, 9) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA10" number:idx++ bank:0 select:MB(0x04, 8) readWrite:MB(0x10, 10) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA11" number:idx++ bank:0 select:MB(0x04, 12) readWrite:MB(0x10, 11) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA12" number:idx++ bank:0 select:MB(0x04, 16) readWrite:MB(0x10, 12) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA13" number:idx++ bank:0 select:MB(0x04, 20) readWrite:MB(0x10, 13) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA14" number:idx++ bank:0 select:MB(0x04, 24) readWrite:MB(0x10, 14) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA15" number:idx++ bank:0 select:MB(0x04, 28) readWrite:MB(0x10, 15) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA16" number:idx++ bank:0 select:MB(0x08, 0) readWrite:MB(0x10, 16) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA17" number:idx++ bank:0 select:MB(0x08, 4) readWrite:MB(0x10, 17) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PB0" number:idx++ bank:0 select:MB(0x24, 0) readWrite:MB(0x34, 0) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PB1" number:idx++ bank:0 select:MB(0x24, 4) readWrite:MB(0x34, 1) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PB2" number:idx++ bank:0 select:MB(0x24, 8) readWrite:MB(0x34, 2) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PB3" number:idx++ bank:0 select:MB(0x24, 12) readWrite:MB(0x34, 3) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PB4" number:idx++ bank:0 select:MB(0x24, 16) readWrite:MB(0x34, 4) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PB5" number:idx++ bank:0 select:MB(0x24, 20) readWrite:MB(0x34, 5) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PB6" number:idx++ bank:0 select:MB(0x24, 24) readWrite:MB(0x34, 6) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PB7" number:idx++ bank:0 select:MB(0x24, 28) readWrite:MB(0x34, 7) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PB8" number:idx++ bank:0 select:MB(0x28, 0) readWrite:MB(0x34, 8) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PB9" number:idx++ bank:0 select:MB(0x28, 4) readWrite:MB(0x34, 9) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PB10" number:idx++ bank:0 select:MB(0x28, 8) readWrite:MB(0x34, 10) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PB11" number:idx++ bank:0 select:MB(0x28, 12) readWrite:MB(0x34, 11) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PB12" number:idx++ bank:0 select:MB(0x28, 16) readWrite:MB(0x34, 12) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PB13" number:idx++ bank:0 select:MB(0x28, 20) readWrite:MB(0x34, 13) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PB14" number:idx++ bank:0 select:MB(0x28, 24) readWrite:MB(0x34, 14) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PB15" number:idx++ bank:0 select:MB(0x28, 28) readWrite:MB(0x34, 15) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PB16" number:idx++ bank:0 select:MB(0x32, 0) readWrite:MB(0x34, 16) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PB17" number:idx++ bank:0 select:MB(0x32, 4) readWrite:MB(0x34, 17) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PB18" number:idx++ bank:0 select:MB(0x32, 8) readWrite:MB(0x34, 18) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PB19" number:idx++ bank:0 select:MB(0x32, 12) readWrite:MB(0x34, 19) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PB20" number:idx++ bank:0 select:MB(0x32, 16) readWrite:MB(0x34, 20) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PB21" number:idx++ bank:0 select:MB(0x32, 20) readWrite:MB(0x34, 21) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PB22" number:idx++ bank:0 select:MB(0x32, 24) readWrite:MB(0x34, 22) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PB23" number:idx++ bank:0 select:MB(0x32, 28) readWrite:MB(0x34, 23) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC0" number:idx++ bank:0 select:MB(0x48, 0) readWrite:MB(0x58, 0) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC1" number:idx++ bank:0 select:MB(0x48, 4) readWrite:MB(0x58, 1) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC2" number:idx++ bank:0 select:MB(0x48, 8) readWrite:MB(0x58, 2) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC3" number:idx++ bank:0 select:MB(0x48, 12) readWrite:MB(0x58, 3) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC4" number:idx++ bank:0 select:MB(0x48, 16) readWrite:MB(0x58, 4) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC5" number:idx++ bank:0 select:MB(0x48, 20) readWrite:MB(0x58, 5) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC6" number:idx++ bank:0 select:MB(0x48, 24) readWrite:MB(0x58, 6) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC7" number:idx++ bank:0 select:MB(0x48, 28) readWrite:MB(0x58, 7) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC8" number:idx++ bank:0 select:MB(0x4C, 0) readWrite:MB(0x58, 8) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC9" number:idx++ bank:0 select:MB(0x4C, 4) readWrite:MB(0x58, 9) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC10" number:idx++ bank:0 select:MB(0x4C, 8) readWrite:MB(0x58, 10) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC11" number:idx++ bank:0 select:MB(0x4C, 12) readWrite:MB(0x58, 11) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC12" number:idx++ bank:0 select:MB(0x4C, 16) readWrite:MB(0x58, 12) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC13" number:idx++ bank:0 select:MB(0x4C, 20) readWrite:MB(0x58, 13) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC14" number:idx++ bank:0 select:MB(0x4C, 24) readWrite:MB(0x58, 14) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC15" number:idx++ bank:0 select:MB(0x4C, 28) readWrite:MB(0x58, 15) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC16" number:idx++ bank:0 select:MB(0x50, 0) readWrite:MB(0x58, 16) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC17" number:idx++ bank:0 select:MB(0x50, 4) readWrite:MB(0x58, 17) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC18" number:idx++ bank:0 select:MB(0x50, 8) readWrite:MB(0x58, 18) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC19" number:idx++ bank:0 select:MB(0x50, 12) readWrite:MB(0x58, 19) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC20" number:idx++ bank:0 select:MB(0x50, 16) readWrite:MB(0x58, 20) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC21" number:idx++ bank:0 select:MB(0x50, 20) readWrite:MB(0x58, 21) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC22" number:idx++ bank:0 select:MB(0x50, 24) readWrite:MB(0x58, 22) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC23" number:idx++ bank:0 select:MB(0x50, 28) readWrite:MB(0x58, 23) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD0" number:idx++ bank:0 select:MB(0x6C, 0) readWrite:MB(0x7C, 0) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD1" number:idx++ bank:0 select:MB(0x6C, 4) readWrite:MB(0x7C, 1) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD2" number:idx++ bank:0 select:MB(0x6C, 8) readWrite:MB(0x7C, 2) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD3" number:idx++ bank:0 select:MB(0x6C, 12) readWrite:MB(0x7C, 3) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD4" number:idx++ bank:0 select:MB(0x6C, 16) readWrite:MB(0x7C, 4) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD5" number:idx++ bank:0 select:MB(0x6C, 20) readWrite:MB(0x7C, 5) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD6" number:idx++ bank:0 select:MB(0x6C, 24) readWrite:MB(0x7C, 6) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD7" number:idx++ bank:0 select:MB(0x6C, 28) readWrite:MB(0x7C, 7) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD8" number:idx++ bank:0 select:MB(0x70, 0) readWrite:MB(0x7C, 8) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD9" number:idx++ bank:0 select:MB(0x70, 4) readWrite:MB(0x7C, 9) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD10" number:idx++ bank:0 select:MB(0x70, 8) readWrite:MB(0x7C, 10) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD11" number:idx++ bank:0 select:MB(0x70, 12) readWrite:MB(0x7C, 11) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD12" number:idx++ bank:0 select:MB(0x70, 16) readWrite:MB(0x7C, 12) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD13" number:idx++ bank:0 select:MB(0x70, 20) readWrite:MB(0x7C, 13) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD14" number:idx++ bank:0 select:MB(0x70, 24) readWrite:MB(0x7C, 14) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD15" number:idx++ bank:0 select:MB(0x70, 28) readWrite:MB(0x7C, 15) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD16" number:idx++ bank:0 select:MB(0x74, 0) readWrite:MB(0x7C, 16) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD17" number:idx++ bank:0 select:MB(0x74, 4) readWrite:MB(0x7C, 17) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD18" number:idx++ bank:0 select:MB(0x74, 8) readWrite:MB(0x7C, 18) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD19" number:idx++ bank:0 select:MB(0x74, 12) readWrite:MB(0x7C, 19) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD20" number:idx++ bank:0 select:MB(0x74, 16) readWrite:MB(0x7C, 20) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD21" number:idx++ bank:0 select:MB(0x74, 20) readWrite:MB(0x7C, 21) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD22" number:idx++ bank:0 select:MB(0x74, 24) readWrite:MB(0x7C, 22) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD23" number:idx++ bank:0 select:MB(0x74, 28) readWrite:MB(0x7C, 23) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD24" number:idx++ bank:0 select:MB(0x78, 0) readWrite:MB(0x7C, 24) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD25" number:idx++ bank:0 select:MB(0x78, 4) readWrite:MB(0x7C, 25) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD26" number:idx++ bank:0 select:MB(0x78, 8) readWrite:MB(0x7C, 26) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD27" number:idx++ bank:0 select:MB(0x78, 12) readWrite:MB(0x7C, 27) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE0" number:idx++ bank:0 select:MB(0x90, 0) readWrite:MB(0xA0, 0) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE1" number:idx++ bank:0 select:MB(0x90, 4) readWrite:MB(0xA0, 1) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE2" number:idx++ bank:0 select:MB(0x90, 8) readWrite:MB(0xA0, 2) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE3" number:idx++ bank:0 select:MB(0x90, 12) readWrite:MB(0xA0, 3) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE4" number:idx++ bank:0 select:MB(0x90, 16) readWrite:MB(0xA0, 4) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE5" number:idx++ bank:0 select:MB(0x90, 20) readWrite:MB(0xA0, 5) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE6" number:idx++ bank:0 select:MB(0x90, 24) readWrite:MB(0xA0, 6) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE7" number:idx++ bank:0 select:MB(0x90, 28) readWrite:MB(0xA0, 7) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE8" number:idx++ bank:0 select:MB(0x94, 0) readWrite:MB(0xA0, 8) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE9" number:idx++ bank:0 select:MB(0x94, 4) readWrite:MB(0xA0, 9) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE10" number:idx++ bank:0 select:MB(0x94, 8) readWrite:MB(0xA0, 10) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE11" number:idx++ bank:0 select:MB(0x94, 12) readWrite:MB(0xA0, 11) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PF0" number:idx++ bank:0 select:MB(0xB4, 0) readWrite:MB(0xC4, 0) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PF1" number:idx++ bank:0 select:MB(0xB4, 4) readWrite:MB(0xC4, 1) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PF2" number:idx++ bank:0 select:MB(0xB4, 8) readWrite:MB(0xC4, 2) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PF3" number:idx++ bank:0 select:MB(0xB4, 12) readWrite:MB(0xC4, 3) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PF4" number:idx++ bank:0 select:MB(0xB4, 16) readWrite:MB(0xC4, 4) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PF5" number:idx++ bank:0 select:MB(0xB4, 20) readWrite:MB(0xC4, 5) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG0" number:idx++ bank:0 select:MB(0xDC, 0) readWrite:MB(0xE8, 0) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG1" number:idx++ bank:0 select:MB(0xDC, 4) readWrite:MB(0xE8, 1) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG2" number:idx++ bank:0 select:MB(0xDC, 8) readWrite:MB(0xE8, 2) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG3" number:idx++ bank:0 select:MB(0xDC, 12) readWrite:MB(0xE8, 3) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG4" number:idx++ bank:0 select:MB(0xDC, 16) readWrite:MB(0xE8, 4) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG5" number:idx++ bank:0 select:MB(0xDC, 20) readWrite:MB(0xE8, 5) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG6" number:idx++ bank:0 select:MB(0xDC, 24) readWrite:MB(0xE8, 6) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG7" number:idx++ bank:0 select:MB(0xDC, 28) readWrite:MB(0xE8, 7) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG8" number:idx++ bank:0 select:MB(0xE0, 0) readWrite:MB(0xE8, 8) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG9" number:idx++ bank:0 select:MB(0xE0, 4) readWrite:MB(0xE8, 9) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG10" number:idx++ bank:0 select:MB(0xE0, 8) readWrite:MB(0xE8, 10) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG11" number:idx++ bank:0 select:MB(0xE0, 12) readWrite:MB(0xE8, 11) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH0" number:idx++ bank:0 select:MB(0xFC, 0) readWrite:MB(0x10C, 0) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH1" number:idx++ bank:0 select:MB(0xFC, 4) readWrite:MB(0x10C, 1) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH2" number:idx++ bank:0 select:MB(0xFC, 8) readWrite:MB(0x10C, 2) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH3" number:idx++ bank:0 select:MB(0xFC, 12) readWrite:MB(0x10C, 3) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH4" number:idx++ bank:0 select:MB(0xFC, 16) readWrite:MB(0x10C, 4) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH5" number:idx++ bank:0 select:MB(0xFC, 20) readWrite:MB(0x10C, 5) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH6" number:idx++ bank:0 select:MB(0xFC, 24) readWrite:MB(0x10C, 6) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH7" number:idx++ bank:0 select:MB(0xFC, 28) readWrite:MB(0x10C, 7) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH8" number:idx++ bank:0 select:MB(0x100, 0) readWrite:MB(0x10C, 8) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH9" number:idx++ bank:0 select:MB(0x100, 4) readWrite:MB(0x10C, 9) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH10" number:idx++ bank:0 select:MB(0x100, 8) readWrite:MB(0x10C, 10) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH11" number:idx++ bank:0 select:MB(0x100, 12) readWrite:MB(0x10C, 11) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH12" number:idx++ bank:0 select:MB(0x100, 16) readWrite:MB(0x10C, 12) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH13" number:idx++ bank:0 select:MB(0x100, 20) readWrite:MB(0x10C, 13) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH14" number:idx++ bank:0 select:MB(0x100, 24) readWrite:MB(0x10C, 14) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH15" number:idx++ bank:0 select:MB(0x100, 28) readWrite:MB(0x10C, 15) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH16" number:idx++ bank:0 select:MB(0x104, 0) readWrite:MB(0x10C, 16) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH17" number:idx++ bank:0 select:MB(0x104, 4) readWrite:MB(0x10C, 17) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH18" number:idx++ bank:0 select:MB(0x104, 8) readWrite:MB(0x10C, 18) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH19" number:idx++ bank:0 select:MB(0x104, 12) readWrite:MB(0x10C, 19) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH20" number:idx++ bank:0 select:MB(0x104, 16) readWrite:MB(0x10C, 20) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH21" number:idx++ bank:0 select:MB(0x104, 20) readWrite:MB(0x10C, 21) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH22" number:idx++ bank:0 select:MB(0x104, 24) readWrite:MB(0x10C, 22) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH23" number:idx++ bank:0 select:MB(0x104, 28) readWrite:MB(0x10C, 23) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PI0" number:idx++ bank:0 select:MB(0x120, 0) readWrite:MB(0x130, 0) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PI1" number:idx++ bank:0 select:MB(0x120, 4) readWrite:MB(0x130, 1) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PI2" number:idx++ bank:0 select:MB(0x120, 8) readWrite:MB(0x130, 2) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PI3" number:idx++ bank:0 select:MB(0x120, 12) readWrite:MB(0x130, 3) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PI4" number:idx++ bank:0 select:MB(0x120, 16) readWrite:MB(0x130, 4) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PI5" number:idx++ bank:0 select:MB(0x120, 20) readWrite:MB(0x130, 5) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PI6" number:idx++ bank:0 select:MB(0x120, 24) readWrite:MB(0x130, 6) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PI7" number:idx++ bank:0 select:MB(0x124, 28) readWrite:MB(0x130, 7) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PI8" number:idx++ bank:0 select:MB(0x124, 0) readWrite:MB(0x130, 8) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PI9" number:idx++ bank:0 select:MB(0x124, 4) readWrite:MB(0x130, 9) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PI10" number:idx++ bank:0 select:MB(0x124, 8) readWrite:MB(0x130, 10) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PI11" number:idx++ bank:0 select:MB(0x124, 12) readWrite:MB(0x130, 11) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PI12" number:idx++ bank:0 select:MB(0x124, 16) readWrite:MB(0x130, 12) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PI13" number:idx++ bank:0 select:MB(0x124, 20) readWrite:MB(0x130, 13) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PI14" number:idx++ bank:0 select:MB(0x124, 24) readWrite:MB(0x130, 14) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PI15" number:idx++ bank:0 select:MB(0x128, 28) readWrite:MB(0x130, 15) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PI16" number:idx++ bank:0 select:MB(0x128, 0) readWrite:MB(0x130, 16) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PI17" number:idx++ bank:0 select:MB(0x128, 4) readWrite:MB(0x130, 17) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PI18" number:idx++ bank:0 select:MB(0x128, 8) readWrite:MB(0x130, 18) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PI19" number:idx++ bank:0 select:MB(0x128, 12) readWrite:MB(0x130, 19) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PI20" number:idx++ bank:0 select:MB(0x128, 16) readWrite:MB(0x130, 20) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PI21" number:idx bank:0 select:MB(0x128, 20) readWrite:MB(0x130, 21) support:SUP1]];

        return (self = [super initWithBrandName:BRAND chipSet:@"A10" layout:ar gpioMap:gpioMap irqMap:irqMap isrModes:IM pageSize:PAGESZ baseAddresses:ba error:error]);
    }

@end

@implementation PGWXSOCAllwinnerA31s {
    }

    -(instancetype)initWithGPIOMap:(NSArray<NSString *> *)gpioMap irqMap:(nullable NSArray<NSString *> *)irqMap error:(NSError *_Nullable *)error {
        NSUInteger     idx = 0;
        NSArray        *ba = @[[PGWXAddr address:0x01C20000 offset:0x00000800], [PGWXAddr address:0x01F02000 offset:0x00000C00]];
        NSMutableArray *ar = [NSMutableArray new];

        [ar addObject:[PGWXLayout layoutWithName:@"PA0" number:idx++ bank:0 select:MB(0x00, 0) readWrite:MB(0x10, 0) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA1" number:idx++ bank:0 select:MB(0x00, 4) readWrite:MB(0x10, 1) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA2" number:idx++ bank:0 select:MB(0x00, 8) readWrite:MB(0x10, 2) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA3" number:idx++ bank:0 select:MB(0x00, 12) readWrite:MB(0x10, 3) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA4" number:idx++ bank:0 select:MB(0x00, 16) readWrite:MB(0x10, 4) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA5" number:idx++ bank:0 select:MB(0x00, 20) readWrite:MB(0x10, 5) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA6" number:idx++ bank:0 select:MB(0x00, 24) readWrite:MB(0x10, 6) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA7" number:idx++ bank:0 select:MB(0x00, 28) readWrite:MB(0x10, 7) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA8" number:idx++ bank:0 select:MB(0x04, 0) readWrite:MB(0x10, 8) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA9" number:idx++ bank:0 select:MB(0x04, 4) readWrite:MB(0x10, 9) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA10" number:idx++ bank:0 select:MB(0x04, 8) readWrite:MB(0x10, 10) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA11" number:idx++ bank:0 select:MB(0x04, 12) readWrite:MB(0x10, 11) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA12" number:idx++ bank:0 select:MB(0x04, 16) readWrite:MB(0x10, 12) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA13" number:idx++ bank:0 select:MB(0x04, 20) readWrite:MB(0x10, 13) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA14" number:idx++ bank:0 select:MB(0x04, 24) readWrite:MB(0x10, 14) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA15" number:idx++ bank:0 select:MB(0x04, 28) readWrite:MB(0x10, 15) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA16" number:idx++ bank:0 select:MB(0x08, 0) readWrite:MB(0x10, 16) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA17" number:idx++ bank:0 select:MB(0x08, 4) readWrite:MB(0x10, 17) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA18" number:idx++ bank:0 select:MB(0x08, 8) readWrite:MB(0x10, 18) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA19" number:idx++ bank:0 select:MB(0x08, 12) readWrite:MB(0x10, 19) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA20" number:idx++ bank:0 select:MB(0x08, 16) readWrite:MB(0x10, 20) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA21" number:idx++ bank:0 select:MB(0x08, 20) readWrite:MB(0x10, 21) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA22" number:idx++ bank:0 select:MB(0x08, 24) readWrite:MB(0x10, 22) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA23" number:idx++ bank:0 select:MB(0x08, 28) readWrite:MB(0x10, 23) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA24" number:idx++ bank:0 select:MB(0x0C, 0) readWrite:MB(0x10, 24) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA25" number:idx++ bank:0 select:MB(0x0C, 4) readWrite:MB(0x10, 25) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA26" number:idx++ bank:0 select:MB(0x0C, 8) readWrite:MB(0x10, 26) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA27" number:idx++ bank:0 select:MB(0x0C, 12) readWrite:MB(0x10, 27) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PB0" number:idx++ bank:0 select:MB(0X24, 0) readWrite:MB(0x34, 0) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PB1" number:idx++ bank:0 select:MB(0X24, 4) readWrite:MB(0x34, 1) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PB2" number:idx++ bank:0 select:MB(0X24, 8) readWrite:MB(0x34, 2) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PB3" number:idx++ bank:0 select:MB(0X24, 12) readWrite:MB(0x34, 3) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PB4" number:idx++ bank:0 select:MB(0X24, 16) readWrite:MB(0x34, 4) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PB5" number:idx++ bank:0 select:MB(0X24, 20) readWrite:MB(0x34, 5) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PB6" number:idx++ bank:0 select:MB(0X24, 24) readWrite:MB(0x34, 6) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PB7" number:idx++ bank:0 select:MB(0X24, 28) readWrite:MB(0x34, 7) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC0" number:idx++ bank:0 select:MB(0X48, 0) readWrite:MB(0x58, 0) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC1" number:idx++ bank:0 select:MB(0X48, 4) readWrite:MB(0x58, 1) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC2" number:idx++ bank:0 select:MB(0X48, 8) readWrite:MB(0x58, 2) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC3" number:idx++ bank:0 select:MB(0X48, 12) readWrite:MB(0x58, 3) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC4" number:idx++ bank:0 select:MB(0X48, 16) readWrite:MB(0x58, 4) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC5" number:idx++ bank:0 select:MB(0X48, 20) readWrite:MB(0x58, 5) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC6" number:idx++ bank:0 select:MB(0X48, 24) readWrite:MB(0x58, 6) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC7" number:idx++ bank:0 select:MB(0X48, 28) readWrite:MB(0x58, 7) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC8" number:idx++ bank:0 select:MB(0X4C, 0) readWrite:MB(0x58, 8) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC9" number:idx++ bank:0 select:MB(0X4C, 4) readWrite:MB(0x58, 9) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC10" number:idx++ bank:0 select:MB(0X4C, 8) readWrite:MB(0x58, 10) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC11" number:idx++ bank:0 select:MB(0X4C, 12) readWrite:MB(0x58, 11) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC12" number:idx++ bank:0 select:MB(0x4C, 16) readWrite:MB(0x58, 12) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC13" number:idx++ bank:0 select:MB(0x4C, 20) readWrite:MB(0x58, 13) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC14" number:idx++ bank:0 select:MB(0x4C, 24) readWrite:MB(0x58, 14) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC15" number:idx++ bank:0 select:MB(0x4C, 28) readWrite:MB(0x58, 15) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC24" number:idx++ bank:0 select:MB(0x54, 0) readWrite:MB(0x58, 24) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC25" number:idx++ bank:0 select:MB(0x54, 4) readWrite:MB(0x58, 25) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC26" number:idx++ bank:0 select:MB(0x54, 8) readWrite:MB(0x58, 26) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC27" number:idx++ bank:0 select:MB(0x54, 12) readWrite:MB(0x58, 27) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD0" number:idx++ bank:0 select:MB(0X6C, 0) readWrite:MB(0x7C, 0) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD1" number:idx++ bank:0 select:MB(0X6C, 4) readWrite:MB(0x7C, 1) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD2" number:idx++ bank:0 select:MB(0X6C, 8) readWrite:MB(0x7C, 2) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD3" number:idx++ bank:0 select:MB(0X6C, 12) readWrite:MB(0x7C, 3) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD4" number:idx++ bank:0 select:MB(0X6C, 16) readWrite:MB(0x7C, 4) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD5" number:idx++ bank:0 select:MB(0X6C, 20) readWrite:MB(0x7C, 5) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD6" number:idx++ bank:0 select:MB(0X6C, 24) readWrite:MB(0x7C, 6) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD7" number:idx++ bank:0 select:MB(0X6C, 28) readWrite:MB(0x7C, 7) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD8" number:idx++ bank:0 select:MB(0X70, 0) readWrite:MB(0x7C, 8) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD9" number:idx++ bank:0 select:MB(0X70, 4) readWrite:MB(0x7C, 9) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD10" number:idx++ bank:0 select:MB(0X70, 8) readWrite:MB(0x7C, 10) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD11" number:idx++ bank:0 select:MB(0X70, 12) readWrite:MB(0x7C, 11) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD12" number:idx++ bank:0 select:MB(0x70, 16) readWrite:MB(0x7C, 12) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD13" number:idx++ bank:0 select:MB(0x70, 20) readWrite:MB(0x7C, 13) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD14" number:idx++ bank:0 select:MB(0x70, 24) readWrite:MB(0x7C, 14) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD15" number:idx++ bank:0 select:MB(0x70, 28) readWrite:MB(0x7C, 15) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD16" number:idx++ bank:0 select:MB(0x74, 0) readWrite:MB(0x7C, 16) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD17" number:idx++ bank:0 select:MB(0x74, 4) readWrite:MB(0x7C, 17) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD18" number:idx++ bank:0 select:MB(0x74, 8) readWrite:MB(0x7C, 18) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD19" number:idx++ bank:0 select:MB(0x74, 12) readWrite:MB(0x7C, 19) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD20" number:idx++ bank:0 select:MB(0x74, 16) readWrite:MB(0x7C, 20) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD21" number:idx++ bank:0 select:MB(0x74, 20) readWrite:MB(0x7C, 21) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD22" number:idx++ bank:0 select:MB(0x74, 24) readWrite:MB(0x7C, 22) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD23" number:idx++ bank:0 select:MB(0x74, 28) readWrite:MB(0x7C, 23) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD24" number:idx++ bank:0 select:MB(0x78, 0) readWrite:MB(0x7C, 24) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD25" number:idx++ bank:0 select:MB(0x78, 4) readWrite:MB(0x7C, 25) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD26" number:idx++ bank:0 select:MB(0x78, 8) readWrite:MB(0x7C, 26) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD27" number:idx++ bank:0 select:MB(0x78, 12) readWrite:MB(0x7C, 27) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE0" number:idx++ bank:0 select:MB(0X90, 0) readWrite:MB(0xA0, 0) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE1" number:idx++ bank:0 select:MB(0X90, 4) readWrite:MB(0xA0, 1) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE2" number:idx++ bank:0 select:MB(0X90, 8) readWrite:MB(0xA0, 2) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE3" number:idx++ bank:0 select:MB(0X90, 12) readWrite:MB(0xA0, 3) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE4" number:idx++ bank:0 select:MB(0X90, 16) readWrite:MB(0xA0, 4) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE5" number:idx++ bank:0 select:MB(0X90, 20) readWrite:MB(0xA0, 5) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE6" number:idx++ bank:0 select:MB(0X90, 24) readWrite:MB(0xA0, 6) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE7" number:idx++ bank:0 select:MB(0X90, 28) readWrite:MB(0xA0, 7) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE8" number:idx++ bank:0 select:MB(0X94, 0) readWrite:MB(0xA0, 8) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE9" number:idx++ bank:0 select:MB(0X94, 4) readWrite:MB(0xA0, 9) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE10" number:idx++ bank:0 select:MB(0X94, 8) readWrite:MB(0xA0, 10) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE11" number:idx++ bank:0 select:MB(0X94, 12) readWrite:MB(0xA0, 11) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE12" number:idx++ bank:0 select:MB(0X94, 16) readWrite:MB(0xA0, 12) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE13" number:idx++ bank:0 select:MB(0X94, 20) readWrite:MB(0xA0, 13) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE14" number:idx++ bank:0 select:MB(0X94, 24) readWrite:MB(0xA0, 14) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE15" number:idx++ bank:0 select:MB(0X94, 28) readWrite:MB(0xA0, 15) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PF0" number:idx++ bank:0 select:MB(0XB4, 0) readWrite:MB(0xC4, 0) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PF1" number:idx++ bank:0 select:MB(0XB4, 4) readWrite:MB(0xC4, 1) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PF2" number:idx++ bank:0 select:MB(0XB4, 8) readWrite:MB(0xC4, 2) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PF3" number:idx++ bank:0 select:MB(0XB4, 12) readWrite:MB(0xC4, 3) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PF4" number:idx++ bank:0 select:MB(0XB4, 16) readWrite:MB(0xC4, 4) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PF5" number:idx++ bank:0 select:MB(0XB4, 20) readWrite:MB(0xC4, 5) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG0" number:idx++ bank:0 select:MB(0XD8, 0) readWrite:MB(0xE8, 0) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG1" number:idx++ bank:0 select:MB(0XD8, 4) readWrite:MB(0xE8, 1) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG2" number:idx++ bank:0 select:MB(0XD8, 8) readWrite:MB(0xE8, 2) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG3" number:idx++ bank:0 select:MB(0XD8, 12) readWrite:MB(0xE8, 3) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG4" number:idx++ bank:0 select:MB(0XD8, 16) readWrite:MB(0xE8, 4) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG5" number:idx++ bank:0 select:MB(0XD8, 20) readWrite:MB(0xE8, 5) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG6" number:idx++ bank:0 select:MB(0XD8, 24) readWrite:MB(0xE8, 6) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG7" number:idx++ bank:0 select:MB(0XD8, 28) readWrite:MB(0xE8, 7) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG8" number:idx++ bank:0 select:MB(0XDC, 0) readWrite:MB(0xE8, 8) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG9" number:idx++ bank:0 select:MB(0XDC, 4) readWrite:MB(0xE8, 9) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG10" number:idx++ bank:0 select:MB(0XDC, 8) readWrite:MB(0xE8, 10) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG11" number:idx++ bank:0 select:MB(0XDC, 12) readWrite:MB(0xE8, 11) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG12" number:idx++ bank:0 select:MB(0XDC, 16) readWrite:MB(0xE8, 12) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG13" number:idx++ bank:0 select:MB(0XDC, 20) readWrite:MB(0xE8, 13) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG14" number:idx++ bank:0 select:MB(0XDC, 24) readWrite:MB(0xE8, 14) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG15" number:idx++ bank:0 select:MB(0XDC, 28) readWrite:MB(0xE8, 15) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG16" number:idx++ bank:0 select:MB(0XE0, 0) readWrite:MB(0xE8, 16) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG17" number:idx++ bank:0 select:MB(0XE0, 4) readWrite:MB(0xE8, 17) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG18" number:idx++ bank:0 select:MB(0XE0, 8) readWrite:MB(0xE8, 18) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH9" number:idx++ bank:0 select:MB(0X100, 4) readWrite:MB(0x10C, 9) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH10" number:idx++ bank:0 select:MB(0x100, 8) readWrite:MB(0x10C, 10) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH11" number:idx++ bank:0 select:MB(0x100, 12) readWrite:MB(0x10C, 11) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH12" number:idx++ bank:0 select:MB(0x100, 16) readWrite:MB(0x10C, 12) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH13" number:idx++ bank:0 select:MB(0x100, 20) readWrite:MB(0x10C, 13) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH14" number:idx++ bank:0 select:MB(0x100, 24) readWrite:MB(0x10C, 14) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH15" number:idx++ bank:0 select:MB(0X100, 28) readWrite:MB(0x10C, 15) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH16" number:idx++ bank:0 select:MB(0x104, 0) readWrite:MB(0x10C, 16) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH17" number:idx++ bank:0 select:MB(0x104, 4) readWrite:MB(0x10C, 17) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH18" number:idx++ bank:0 select:MB(0x104, 8) readWrite:MB(0x10C, 18) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH19" number:idx++ bank:0 select:MB(0x104, 12) readWrite:MB(0x10C, 19) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH20" number:idx++ bank:0 select:MB(0x104, 16) readWrite:MB(0x10C, 20) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH21" number:idx++ bank:0 select:MB(0x104, 20) readWrite:MB(0x10C, 21) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH22" number:idx++ bank:0 select:MB(0x104, 24) readWrite:MB(0x10C, 22) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH23" number:idx++ bank:0 select:MB(0x104, 28) readWrite:MB(0x10C, 23) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH24" number:idx++ bank:0 select:MB(0x108, 0) readWrite:MB(0x10C, 24) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH25" number:idx++ bank:0 select:MB(0x108, 4) readWrite:MB(0x10C, 25) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH26" number:idx++ bank:0 select:MB(0x108, 8) readWrite:MB(0x10C, 26) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH27" number:idx++ bank:0 select:MB(0x108, 12) readWrite:MB(0x10C, 27) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PH28" number:idx++ bank:0 select:MB(0x108, 16) readWrite:MB(0x10C, 28) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PL0" number:idx++ bank:1 select:MB(0X0, 0) readWrite:MB(0x10, 0) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PL1" number:idx++ bank:1 select:MB(0X0, 4) readWrite:MB(0x10, 1) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PL2" number:idx++ bank:1 select:MB(0X0, 8) readWrite:MB(0x10, 2) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PL3" number:idx++ bank:1 select:MB(0X0, 12) readWrite:MB(0x10, 3) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PL4" number:idx++ bank:1 select:MB(0X0, 16) readWrite:MB(0x10, 4) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PL5" number:idx++ bank:1 select:MB(0X0, 20) readWrite:MB(0x10, 5) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PL6" number:idx++ bank:1 select:MB(0X0, 24) readWrite:MB(0x10, 6) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PL7" number:idx++ bank:1 select:MB(0X0, 28) readWrite:MB(0x10, 7) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PM0" number:idx++ bank:1 select:MB(0X24, 0) readWrite:MB(0x34, 0) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PM1" number:idx++ bank:1 select:MB(0X24, 4) readWrite:MB(0x34, 1) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PM2" number:idx++ bank:1 select:MB(0X24, 8) readWrite:MB(0x34, 2) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PM3" number:idx++ bank:1 select:MB(0X24, 12) readWrite:MB(0x34, 3) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PM4" number:idx++ bank:1 select:MB(0X24, 16) readWrite:MB(0x34, 4) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PM5" number:idx++ bank:1 select:MB(0X24, 20) readWrite:MB(0x34, 5) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PM6" number:idx++ bank:1 select:MB(0X24, 24) readWrite:MB(0x34, 6) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PM7" number:idx bank:1 select:MB(0X24, 28) readWrite:MB(0x34, 7) support:SUP1]];

        return (self = [super initWithBrandName:BRAND chipSet:@"A31s" layout:ar gpioMap:gpioMap irqMap:irqMap isrModes:IM pageSize:PAGESZ baseAddresses:ba error:error]);
    }

@end

@implementation PGWXSOCAllwinnerH3 {
    }

    -(instancetype)initWithGPIOMap:(NSArray<NSString *> *)gpioMap irqMap:(nullable NSArray<NSString *> *)irqMap error:(NSError *_Nullable *)error {
        NSUInteger     idx = 0;
        NSArray        *ba = @[[PGWXAddr address:0x01C20000 offset:0x00000800], [PGWXAddr address:0x01F02000 offset:0x00000C00]];
        NSMutableArray *ar = [NSMutableArray new];

        [ar addObject:[PGWXLayout layoutWithName:@"PA0" number:idx++ bank:0 select:MB(0x00, 0) readWrite:MB(0x10, 0) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA1" number:idx++ bank:0 select:MB(0x00, 4) readWrite:MB(0x10, 1) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA2" number:idx++ bank:0 select:MB(0x00, 8) readWrite:MB(0x10, 2) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA3" number:idx++ bank:0 select:MB(0x00, 12) readWrite:MB(0x10, 3) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA4" number:idx++ bank:0 select:MB(0x00, 16) readWrite:MB(0x10, 4) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA5" number:idx++ bank:0 select:MB(0x00, 20) readWrite:MB(0x10, 5) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA6" number:idx++ bank:0 select:MB(0x00, 24) readWrite:MB(0x10, 6) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA7" number:idx++ bank:0 select:MB(0x00, 28) readWrite:MB(0x10, 7) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA8" number:idx++ bank:0 select:MB(0x04, 0) readWrite:MB(0x10, 8) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA9" number:idx++ bank:0 select:MB(0x04, 4) readWrite:MB(0x10, 9) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA10" number:idx++ bank:0 select:MB(0x04, 8) readWrite:MB(0x10, 10) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA11" number:idx++ bank:0 select:MB(0x04, 12) readWrite:MB(0x10, 11) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA12" number:idx++ bank:0 select:MB(0x04, 16) readWrite:MB(0x10, 12) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA13" number:idx++ bank:0 select:MB(0x04, 20) readWrite:MB(0x10, 13) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA14" number:idx++ bank:0 select:MB(0x04, 24) readWrite:MB(0x10, 14) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA15" number:idx++ bank:0 select:MB(0x04, 28) readWrite:MB(0x10, 15) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA16" number:idx++ bank:0 select:MB(0x08, 0) readWrite:MB(0x10, 16) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA17" number:idx++ bank:0 select:MB(0x08, 4) readWrite:MB(0x10, 17) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA18" number:idx++ bank:0 select:MB(0x08, 8) readWrite:MB(0x10, 18) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA19" number:idx++ bank:0 select:MB(0x08, 12) readWrite:MB(0x10, 19) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA20" number:idx++ bank:0 select:MB(0x08, 16) readWrite:MB(0x10, 20) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PA21" number:idx++ bank:0 select:MB(0x08, 20) readWrite:MB(0x10, 21) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC0" number:idx++ bank:0 select:MB(0x48, 0) readWrite:MB(0x58, 0) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC1" number:idx++ bank:0 select:MB(0x48, 4) readWrite:MB(0x58, 1) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC2" number:idx++ bank:0 select:MB(0x48, 8) readWrite:MB(0x58, 2) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC3" number:idx++ bank:0 select:MB(0x48, 12) readWrite:MB(0x58, 3) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC4" number:idx++ bank:0 select:MB(0x48, 16) readWrite:MB(0x58, 4) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC5" number:idx++ bank:0 select:MB(0x48, 20) readWrite:MB(0x58, 5) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC6" number:idx++ bank:0 select:MB(0x48, 24) readWrite:MB(0x58, 6) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC7" number:idx++ bank:0 select:MB(0x48, 28) readWrite:MB(0x58, 7) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC8" number:idx++ bank:0 select:MB(0x4C, 0) readWrite:MB(0x58, 8) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC9" number:idx++ bank:0 select:MB(0x4C, 4) readWrite:MB(0x58, 9) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC10" number:idx++ bank:0 select:MB(0x4C, 8) readWrite:MB(0x58, 10) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC11" number:idx++ bank:0 select:MB(0x4C, 12) readWrite:MB(0x58, 11) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC12" number:idx++ bank:0 select:MB(0x4C, 16) readWrite:MB(0x58, 12) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC13" number:idx++ bank:0 select:MB(0x4C, 20) readWrite:MB(0x58, 13) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC14" number:idx++ bank:0 select:MB(0x4C, 24) readWrite:MB(0x58, 14) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC15" number:idx++ bank:0 select:MB(0x4C, 28) readWrite:MB(0x58, 15) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC16" number:idx++ bank:0 select:MB(0x50, 0) readWrite:MB(0x58, 16) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC17" number:idx++ bank:0 select:MB(0x50, 4) readWrite:MB(0x58, 17) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PC18" number:idx++ bank:0 select:MB(0x50, 8) readWrite:MB(0x58, 18) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD0" number:idx++ bank:0 select:MB(0x6C, 0) readWrite:MB(0x7C, 0) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD1" number:idx++ bank:0 select:MB(0x6C, 4) readWrite:MB(0x7C, 1) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD2" number:idx++ bank:0 select:MB(0x6C, 8) readWrite:MB(0x7C, 2) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD3" number:idx++ bank:0 select:MB(0x6C, 12) readWrite:MB(0x7C, 3) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD4" number:idx++ bank:0 select:MB(0x6C, 16) readWrite:MB(0x7C, 4) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD5" number:idx++ bank:0 select:MB(0x6C, 20) readWrite:MB(0x7C, 5) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD6" number:idx++ bank:0 select:MB(0x6C, 24) readWrite:MB(0x7C, 6) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD7" number:idx++ bank:0 select:MB(0x6C, 28) readWrite:MB(0x7C, 7) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD8" number:idx++ bank:0 select:MB(0x70, 0) readWrite:MB(0x7C, 8) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD9" number:idx++ bank:0 select:MB(0x70, 4) readWrite:MB(0x7C, 9) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD10" number:idx++ bank:0 select:MB(0x70, 8) readWrite:MB(0x7C, 10) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD11" number:idx++ bank:0 select:MB(0x70, 12) readWrite:MB(0x7C, 11) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD12" number:idx++ bank:0 select:MB(0x70, 16) readWrite:MB(0x7C, 12) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD13" number:idx++ bank:0 select:MB(0x70, 20) readWrite:MB(0x7C, 13) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD14" number:idx++ bank:0 select:MB(0x70, 24) readWrite:MB(0x7C, 14) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD15" number:idx++ bank:0 select:MB(0x70, 28) readWrite:MB(0x7C, 15) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD16" number:idx++ bank:0 select:MB(0x74, 0) readWrite:MB(0x7C, 16) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PD17" number:idx++ bank:0 select:MB(0x74, 4) readWrite:MB(0x7C, 17) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE0" number:idx++ bank:0 select:MB(0x90, 0) readWrite:MB(0xA0, 0) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE1" number:idx++ bank:0 select:MB(0x90, 4) readWrite:MB(0xA0, 1) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE2" number:idx++ bank:0 select:MB(0x90, 8) readWrite:MB(0xA0, 2) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE3" number:idx++ bank:0 select:MB(0x90, 12) readWrite:MB(0xA0, 3) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE4" number:idx++ bank:0 select:MB(0x90, 16) readWrite:MB(0xA0, 4) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE5" number:idx++ bank:0 select:MB(0x90, 20) readWrite:MB(0xA0, 5) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE6" number:idx++ bank:0 select:MB(0x90, 24) readWrite:MB(0xA0, 6) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE7" number:idx++ bank:0 select:MB(0x90, 28) readWrite:MB(0xA0, 7) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE8" number:idx++ bank:0 select:MB(0x94, 0) readWrite:MB(0xA0, 8) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE9" number:idx++ bank:0 select:MB(0x94, 4) readWrite:MB(0xA0, 9) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE10" number:idx++ bank:0 select:MB(0x94, 8) readWrite:MB(0xA0, 10) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE11" number:idx++ bank:0 select:MB(0x94, 12) readWrite:MB(0xA0, 11) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE12" number:idx++ bank:0 select:MB(0x94, 16) readWrite:MB(0xA0, 12) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE13" number:idx++ bank:0 select:MB(0x94, 20) readWrite:MB(0xA0, 13) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE14" number:idx++ bank:0 select:MB(0x94, 24) readWrite:MB(0xA0, 14) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PE15" number:idx++ bank:0 select:MB(0x94, 28) readWrite:MB(0xA0, 15) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PF0" number:idx++ bank:0 select:MB(0xB4, 0) readWrite:MB(0xC4, 0) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PF1" number:idx++ bank:0 select:MB(0xB4, 4) readWrite:MB(0xC4, 1) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PF2" number:idx++ bank:0 select:MB(0xB4, 8) readWrite:MB(0xC4, 2) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PF3" number:idx++ bank:0 select:MB(0xB4, 12) readWrite:MB(0xC4, 3) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PF4" number:idx++ bank:0 select:MB(0xB4, 16) readWrite:MB(0xC4, 4) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PF5" number:idx++ bank:0 select:MB(0xB4, 20) readWrite:MB(0xC4, 5) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PF6" number:idx++ bank:0 select:MB(0xB4, 24) readWrite:MB(0xC4, 6) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG0" number:idx++ bank:0 select:MB(0xD8, 0) readWrite:MB(0xE8, 0) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG1" number:idx++ bank:0 select:MB(0xD8, 4) readWrite:MB(0xE8, 1) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG2" number:idx++ bank:0 select:MB(0xD8, 8) readWrite:MB(0xE8, 2) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG3" number:idx++ bank:0 select:MB(0xD8, 12) readWrite:MB(0xE8, 3) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG4" number:idx++ bank:0 select:MB(0xD8, 16) readWrite:MB(0xE8, 4) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG5" number:idx++ bank:0 select:MB(0xD8, 20) readWrite:MB(0xE8, 5) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG6" number:idx++ bank:0 select:MB(0xD8, 24) readWrite:MB(0xE8, 6) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG7" number:idx++ bank:0 select:MB(0xD8, 28) readWrite:MB(0xE8, 7) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG8" number:idx++ bank:0 select:MB(0xDC, 0) readWrite:MB(0xE8, 8) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG9" number:idx++ bank:0 select:MB(0xDC, 4) readWrite:MB(0xE8, 9) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG10" number:idx++ bank:0 select:MB(0xDC, 8) readWrite:MB(0xE8, 10) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG11" number:idx++ bank:0 select:MB(0xDC, 12) readWrite:MB(0xE8, 11) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG12" number:idx++ bank:0 select:MB(0xDC, 12) readWrite:MB(0xE8, 12) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PG13" number:idx++ bank:0 select:MB(0xDC, 12) readWrite:MB(0xE8, 13) support:SUP2]];
        [ar addObject:[PGWXLayout layoutWithName:@"PL0" number:idx++ bank:1 select:MB(0x00, 0) readWrite:MB(0x10, 0) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PL1" number:idx++ bank:1 select:MB(0x00, 4) readWrite:MB(0x10, 1) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PL2" number:idx++ bank:1 select:MB(0x00, 8) readWrite:MB(0x10, 2) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PL3" number:idx++ bank:1 select:MB(0x00, 12) readWrite:MB(0x10, 3) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PL4" number:idx++ bank:1 select:MB(0x00, 16) readWrite:MB(0x10, 4) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PL5" number:idx++ bank:1 select:MB(0x00, 20) readWrite:MB(0x10, 5) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PL6" number:idx++ bank:1 select:MB(0x00, 24) readWrite:MB(0x10, 6) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PL7" number:idx++ bank:1 select:MB(0x00, 28) readWrite:MB(0x10, 7) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PL8" number:idx++ bank:1 select:MB(0x04, 0) readWrite:MB(0x10, 8) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PL9" number:idx++ bank:1 select:MB(0x04, 4) readWrite:MB(0x10, 9) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PL10" number:idx++ bank:1 select:MB(0x04, 8) readWrite:MB(0x10, 10) support:SUP1]];
        [ar addObject:[PGWXLayout layoutWithName:@"PL11" number:idx bank:1 select:MB(0x04, 12) readWrite:MB(0x10, 11) support:SUP1]];

        return (self = [super initWithBrandName:BRAND chipSet:@"H3" layout:ar gpioMap:gpioMap irqMap:irqMap isrModes:IM pageSize:PAGESZ baseAddresses:ba error:error]);
    }

@end
