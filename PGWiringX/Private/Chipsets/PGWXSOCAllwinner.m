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
    @public
        NSArray<PGWXAddr *>                    *_baseAddresses;
        NSDictionary<NSString *, PGWXLayout *> *_layout;
    }

    -(NSString *)brandName {
        return @"Allwinner";
    }

    -(NSString *)chipSet {
        return @"A10";
    }

    -(NSDictionary<NSString *, PGWXLayout *> *)layout {
        [self lock];

        @try {
            if(self->_layout.count == 0) {
                NSMutableDictionary *lo = [NSMutableDictionary new];
                NSUInteger          idx = 0;

                lo[@"PA0"]  = [PGWXLayout layoutWithName:@"PA0" number:idx++ bank:0 select:MB(0x00, 0) readWrite:MB(0x10, 0) support:SUP1];
                lo[@"PA1"]  = [PGWXLayout layoutWithName:@"PA1" number:idx++ bank:0 select:MB(0x00, 4) readWrite:MB(0x10, 1) support:SUP1];
                lo[@"PA2"]  = [PGWXLayout layoutWithName:@"PA2" number:idx++ bank:0 select:MB(0x00, 8) readWrite:MB(0x10, 2) support:SUP1];
                lo[@"PA3"]  = [PGWXLayout layoutWithName:@"PA3" number:idx++ bank:0 select:MB(0x00, 12) readWrite:MB(0x10, 3) support:SUP1];
                lo[@"PA4"]  = [PGWXLayout layoutWithName:@"PA4" number:idx++ bank:0 select:MB(0x00, 16) readWrite:MB(0x10, 4) support:SUP1];
                lo[@"PA5"]  = [PGWXLayout layoutWithName:@"PA5" number:idx++ bank:0 select:MB(0x00, 20) readWrite:MB(0x10, 5) support:SUP1];
                lo[@"PA6"]  = [PGWXLayout layoutWithName:@"PA6" number:idx++ bank:0 select:MB(0x00, 24) readWrite:MB(0x10, 6) support:SUP1];
                lo[@"PA7"]  = [PGWXLayout layoutWithName:@"PA7" number:idx++ bank:0 select:MB(0x00, 28) readWrite:MB(0x10, 7) support:SUP1];
                lo[@"PA8"]  = [PGWXLayout layoutWithName:@"PA8" number:idx++ bank:0 select:MB(0x04, 0) readWrite:MB(0x10, 8) support:SUP1];
                lo[@"PA9"]  = [PGWXLayout layoutWithName:@"PA9" number:idx++ bank:0 select:MB(0x04, 4) readWrite:MB(0x10, 9) support:SUP1];
                lo[@"PA10"] = [PGWXLayout layoutWithName:@"PA10" number:idx++ bank:0 select:MB(0x04, 8) readWrite:MB(0x10, 10) support:SUP1];
                lo[@"PA11"] = [PGWXLayout layoutWithName:@"PA11" number:idx++ bank:0 select:MB(0x04, 12) readWrite:MB(0x10, 11) support:SUP1];
                lo[@"PA12"] = [PGWXLayout layoutWithName:@"PA12" number:idx++ bank:0 select:MB(0x04, 16) readWrite:MB(0x10, 12) support:SUP1];
                lo[@"PA13"] = [PGWXLayout layoutWithName:@"PA13" number:idx++ bank:0 select:MB(0x04, 20) readWrite:MB(0x10, 13) support:SUP1];
                lo[@"PA14"] = [PGWXLayout layoutWithName:@"PA14" number:idx++ bank:0 select:MB(0x04, 24) readWrite:MB(0x10, 14) support:SUP1];
                lo[@"PA15"] = [PGWXLayout layoutWithName:@"PA15" number:idx++ bank:0 select:MB(0x04, 28) readWrite:MB(0x10, 15) support:SUP1];
                lo[@"PA16"] = [PGWXLayout layoutWithName:@"PA16" number:idx++ bank:0 select:MB(0x08, 0) readWrite:MB(0x10, 16) support:SUP1];
                lo[@"PA17"] = [PGWXLayout layoutWithName:@"PA17" number:idx++ bank:0 select:MB(0x08, 4) readWrite:MB(0x10, 17) support:SUP1];
                lo[@"PB0"]  = [PGWXLayout layoutWithName:@"PB0" number:idx++ bank:0 select:MB(0x24, 0) readWrite:MB(0x34, 0) support:SUP1];
                lo[@"PB1"]  = [PGWXLayout layoutWithName:@"PB1" number:idx++ bank:0 select:MB(0x24, 4) readWrite:MB(0x34, 1) support:SUP1];
                lo[@"PB2"]  = [PGWXLayout layoutWithName:@"PB2" number:idx++ bank:0 select:MB(0x24, 8) readWrite:MB(0x34, 2) support:SUP1];
                lo[@"PB3"]  = [PGWXLayout layoutWithName:@"PB3" number:idx++ bank:0 select:MB(0x24, 12) readWrite:MB(0x34, 3) support:SUP1];
                lo[@"PB4"]  = [PGWXLayout layoutWithName:@"PB4" number:idx++ bank:0 select:MB(0x24, 16) readWrite:MB(0x34, 4) support:SUP1];
                lo[@"PB5"]  = [PGWXLayout layoutWithName:@"PB5" number:idx++ bank:0 select:MB(0x24, 20) readWrite:MB(0x34, 5) support:SUP1];
                lo[@"PB6"]  = [PGWXLayout layoutWithName:@"PB6" number:idx++ bank:0 select:MB(0x24, 24) readWrite:MB(0x34, 6) support:SUP1];
                lo[@"PB7"]  = [PGWXLayout layoutWithName:@"PB7" number:idx++ bank:0 select:MB(0x24, 28) readWrite:MB(0x34, 7) support:SUP1];
                lo[@"PB8"]  = [PGWXLayout layoutWithName:@"PB8" number:idx++ bank:0 select:MB(0x28, 0) readWrite:MB(0x34, 8) support:SUP1];
                lo[@"PB9"]  = [PGWXLayout layoutWithName:@"PB9" number:idx++ bank:0 select:MB(0x28, 4) readWrite:MB(0x34, 9) support:SUP1];
                lo[@"PB10"] = [PGWXLayout layoutWithName:@"PB10" number:idx++ bank:0 select:MB(0x28, 8) readWrite:MB(0x34, 10) support:SUP1];
                lo[@"PB11"] = [PGWXLayout layoutWithName:@"PB11" number:idx++ bank:0 select:MB(0x28, 12) readWrite:MB(0x34, 11) support:SUP1];
                lo[@"PB12"] = [PGWXLayout layoutWithName:@"PB12" number:idx++ bank:0 select:MB(0x28, 16) readWrite:MB(0x34, 12) support:SUP1];
                lo[@"PB13"] = [PGWXLayout layoutWithName:@"PB13" number:idx++ bank:0 select:MB(0x28, 20) readWrite:MB(0x34, 13) support:SUP1];
                lo[@"PB14"] = [PGWXLayout layoutWithName:@"PB14" number:idx++ bank:0 select:MB(0x28, 24) readWrite:MB(0x34, 14) support:SUP1];
                lo[@"PB15"] = [PGWXLayout layoutWithName:@"PB15" number:idx++ bank:0 select:MB(0x28, 28) readWrite:MB(0x34, 15) support:SUP1];
                lo[@"PB16"] = [PGWXLayout layoutWithName:@"PB16" number:idx++ bank:0 select:MB(0x32, 0) readWrite:MB(0x34, 16) support:SUP1];
                lo[@"PB17"] = [PGWXLayout layoutWithName:@"PB17" number:idx++ bank:0 select:MB(0x32, 4) readWrite:MB(0x34, 17) support:SUP1];
                lo[@"PB18"] = [PGWXLayout layoutWithName:@"PB18" number:idx++ bank:0 select:MB(0x32, 8) readWrite:MB(0x34, 18) support:SUP1];
                lo[@"PB19"] = [PGWXLayout layoutWithName:@"PB19" number:idx++ bank:0 select:MB(0x32, 12) readWrite:MB(0x34, 19) support:SUP1];
                lo[@"PB20"] = [PGWXLayout layoutWithName:@"PB20" number:idx++ bank:0 select:MB(0x32, 16) readWrite:MB(0x34, 20) support:SUP1];
                lo[@"PB21"] = [PGWXLayout layoutWithName:@"PB21" number:idx++ bank:0 select:MB(0x32, 20) readWrite:MB(0x34, 21) support:SUP1];
                lo[@"PB22"] = [PGWXLayout layoutWithName:@"PB22" number:idx++ bank:0 select:MB(0x32, 24) readWrite:MB(0x34, 22) support:SUP1];
                lo[@"PB23"] = [PGWXLayout layoutWithName:@"PB23" number:idx++ bank:0 select:MB(0x32, 28) readWrite:MB(0x34, 23) support:SUP1];
                lo[@"PC0"]  = [PGWXLayout layoutWithName:@"PC0" number:idx++ bank:0 select:MB(0x48, 0) readWrite:MB(0x58, 0) support:SUP1];
                lo[@"PC1"]  = [PGWXLayout layoutWithName:@"PC1" number:idx++ bank:0 select:MB(0x48, 4) readWrite:MB(0x58, 1) support:SUP1];
                lo[@"PC2"]  = [PGWXLayout layoutWithName:@"PC2" number:idx++ bank:0 select:MB(0x48, 8) readWrite:MB(0x58, 2) support:SUP1];
                lo[@"PC3"]  = [PGWXLayout layoutWithName:@"PC3" number:idx++ bank:0 select:MB(0x48, 12) readWrite:MB(0x58, 3) support:SUP1];
                lo[@"PC4"]  = [PGWXLayout layoutWithName:@"PC4" number:idx++ bank:0 select:MB(0x48, 16) readWrite:MB(0x58, 4) support:SUP1];
                lo[@"PC5"]  = [PGWXLayout layoutWithName:@"PC5" number:idx++ bank:0 select:MB(0x48, 20) readWrite:MB(0x58, 5) support:SUP1];
                lo[@"PC6"]  = [PGWXLayout layoutWithName:@"PC6" number:idx++ bank:0 select:MB(0x48, 24) readWrite:MB(0x58, 6) support:SUP1];
                lo[@"PC7"]  = [PGWXLayout layoutWithName:@"PC7" number:idx++ bank:0 select:MB(0x48, 28) readWrite:MB(0x58, 7) support:SUP1];
                lo[@"PC8"]  = [PGWXLayout layoutWithName:@"PC8" number:idx++ bank:0 select:MB(0x4C, 0) readWrite:MB(0x58, 8) support:SUP1];
                lo[@"PC9"]  = [PGWXLayout layoutWithName:@"PC9" number:idx++ bank:0 select:MB(0x4C, 4) readWrite:MB(0x58, 9) support:SUP1];
                lo[@"PC10"] = [PGWXLayout layoutWithName:@"PC10" number:idx++ bank:0 select:MB(0x4C, 8) readWrite:MB(0x58, 10) support:SUP1];
                lo[@"PC11"] = [PGWXLayout layoutWithName:@"PC11" number:idx++ bank:0 select:MB(0x4C, 12) readWrite:MB(0x58, 11) support:SUP1];
                lo[@"PC12"] = [PGWXLayout layoutWithName:@"PC12" number:idx++ bank:0 select:MB(0x4C, 16) readWrite:MB(0x58, 12) support:SUP1];
                lo[@"PC13"] = [PGWXLayout layoutWithName:@"PC13" number:idx++ bank:0 select:MB(0x4C, 20) readWrite:MB(0x58, 13) support:SUP1];
                lo[@"PC14"] = [PGWXLayout layoutWithName:@"PC14" number:idx++ bank:0 select:MB(0x4C, 24) readWrite:MB(0x58, 14) support:SUP1];
                lo[@"PC15"] = [PGWXLayout layoutWithName:@"PC15" number:idx++ bank:0 select:MB(0x4C, 28) readWrite:MB(0x58, 15) support:SUP1];
                lo[@"PC16"] = [PGWXLayout layoutWithName:@"PC16" number:idx++ bank:0 select:MB(0x50, 0) readWrite:MB(0x58, 16) support:SUP1];
                lo[@"PC17"] = [PGWXLayout layoutWithName:@"PC17" number:idx++ bank:0 select:MB(0x50, 4) readWrite:MB(0x58, 17) support:SUP1];
                lo[@"PC18"] = [PGWXLayout layoutWithName:@"PC18" number:idx++ bank:0 select:MB(0x50, 8) readWrite:MB(0x58, 18) support:SUP1];
                lo[@"PC19"] = [PGWXLayout layoutWithName:@"PC19" number:idx++ bank:0 select:MB(0x50, 12) readWrite:MB(0x58, 19) support:SUP1];
                lo[@"PC20"] = [PGWXLayout layoutWithName:@"PC20" number:idx++ bank:0 select:MB(0x50, 16) readWrite:MB(0x58, 20) support:SUP1];
                lo[@"PC21"] = [PGWXLayout layoutWithName:@"PC21" number:idx++ bank:0 select:MB(0x50, 20) readWrite:MB(0x58, 21) support:SUP1];
                lo[@"PC22"] = [PGWXLayout layoutWithName:@"PC22" number:idx++ bank:0 select:MB(0x50, 24) readWrite:MB(0x58, 22) support:SUP1];
                lo[@"PC23"] = [PGWXLayout layoutWithName:@"PC23" number:idx++ bank:0 select:MB(0x50, 28) readWrite:MB(0x58, 23) support:SUP1];
                lo[@"PD0"]  = [PGWXLayout layoutWithName:@"PD0" number:idx++ bank:0 select:MB(0x6C, 0) readWrite:MB(0x7C, 0) support:SUP1];
                lo[@"PD1"]  = [PGWXLayout layoutWithName:@"PD1" number:idx++ bank:0 select:MB(0x6C, 4) readWrite:MB(0x7C, 1) support:SUP1];
                lo[@"PD2"]  = [PGWXLayout layoutWithName:@"PD2" number:idx++ bank:0 select:MB(0x6C, 8) readWrite:MB(0x7C, 2) support:SUP1];
                lo[@"PD3"]  = [PGWXLayout layoutWithName:@"PD3" number:idx++ bank:0 select:MB(0x6C, 12) readWrite:MB(0x7C, 3) support:SUP1];
                lo[@"PD4"]  = [PGWXLayout layoutWithName:@"PD4" number:idx++ bank:0 select:MB(0x6C, 16) readWrite:MB(0x7C, 4) support:SUP1];
                lo[@"PD5"]  = [PGWXLayout layoutWithName:@"PD5" number:idx++ bank:0 select:MB(0x6C, 20) readWrite:MB(0x7C, 5) support:SUP1];
                lo[@"PD6"]  = [PGWXLayout layoutWithName:@"PD6" number:idx++ bank:0 select:MB(0x6C, 24) readWrite:MB(0x7C, 6) support:SUP1];
                lo[@"PD7"]  = [PGWXLayout layoutWithName:@"PD7" number:idx++ bank:0 select:MB(0x6C, 28) readWrite:MB(0x7C, 7) support:SUP1];
                lo[@"PD8"]  = [PGWXLayout layoutWithName:@"PD8" number:idx++ bank:0 select:MB(0x70, 0) readWrite:MB(0x7C, 8) support:SUP1];
                lo[@"PD9"]  = [PGWXLayout layoutWithName:@"PD9" number:idx++ bank:0 select:MB(0x70, 4) readWrite:MB(0x7C, 9) support:SUP1];
                lo[@"PD10"] = [PGWXLayout layoutWithName:@"PD10" number:idx++ bank:0 select:MB(0x70, 8) readWrite:MB(0x7C, 10) support:SUP1];
                lo[@"PD11"] = [PGWXLayout layoutWithName:@"PD11" number:idx++ bank:0 select:MB(0x70, 12) readWrite:MB(0x7C, 11) support:SUP1];
                lo[@"PD12"] = [PGWXLayout layoutWithName:@"PD12" number:idx++ bank:0 select:MB(0x70, 16) readWrite:MB(0x7C, 12) support:SUP1];
                lo[@"PD13"] = [PGWXLayout layoutWithName:@"PD13" number:idx++ bank:0 select:MB(0x70, 20) readWrite:MB(0x7C, 13) support:SUP1];
                lo[@"PD14"] = [PGWXLayout layoutWithName:@"PD14" number:idx++ bank:0 select:MB(0x70, 24) readWrite:MB(0x7C, 14) support:SUP1];
                lo[@"PD15"] = [PGWXLayout layoutWithName:@"PD15" number:idx++ bank:0 select:MB(0x70, 28) readWrite:MB(0x7C, 15) support:SUP1];
                lo[@"PD16"] = [PGWXLayout layoutWithName:@"PD16" number:idx++ bank:0 select:MB(0x74, 0) readWrite:MB(0x7C, 16) support:SUP1];
                lo[@"PD17"] = [PGWXLayout layoutWithName:@"PD17" number:idx++ bank:0 select:MB(0x74, 4) readWrite:MB(0x7C, 17) support:SUP1];
                lo[@"PD18"] = [PGWXLayout layoutWithName:@"PD18" number:idx++ bank:0 select:MB(0x74, 8) readWrite:MB(0x7C, 18) support:SUP1];
                lo[@"PD19"] = [PGWXLayout layoutWithName:@"PD19" number:idx++ bank:0 select:MB(0x74, 12) readWrite:MB(0x7C, 19) support:SUP1];
                lo[@"PD20"] = [PGWXLayout layoutWithName:@"PD20" number:idx++ bank:0 select:MB(0x74, 16) readWrite:MB(0x7C, 20) support:SUP1];
                lo[@"PD21"] = [PGWXLayout layoutWithName:@"PD21" number:idx++ bank:0 select:MB(0x74, 20) readWrite:MB(0x7C, 21) support:SUP1];
                lo[@"PD22"] = [PGWXLayout layoutWithName:@"PD22" number:idx++ bank:0 select:MB(0x74, 24) readWrite:MB(0x7C, 22) support:SUP1];
                lo[@"PD23"] = [PGWXLayout layoutWithName:@"PD23" number:idx++ bank:0 select:MB(0x74, 28) readWrite:MB(0x7C, 23) support:SUP1];
                lo[@"PD24"] = [PGWXLayout layoutWithName:@"PD24" number:idx++ bank:0 select:MB(0x78, 0) readWrite:MB(0x7C, 24) support:SUP1];
                lo[@"PD25"] = [PGWXLayout layoutWithName:@"PD25" number:idx++ bank:0 select:MB(0x78, 4) readWrite:MB(0x7C, 25) support:SUP1];
                lo[@"PD26"] = [PGWXLayout layoutWithName:@"PD26" number:idx++ bank:0 select:MB(0x78, 8) readWrite:MB(0x7C, 26) support:SUP1];
                lo[@"PD27"] = [PGWXLayout layoutWithName:@"PD27" number:idx++ bank:0 select:MB(0x78, 12) readWrite:MB(0x7C, 27) support:SUP1];
                lo[@"PE0"]  = [PGWXLayout layoutWithName:@"PE0" number:idx++ bank:0 select:MB(0x90, 0) readWrite:MB(0xA0, 0) support:SUP1];
                lo[@"PE1"]  = [PGWXLayout layoutWithName:@"PE1" number:idx++ bank:0 select:MB(0x90, 4) readWrite:MB(0xA0, 1) support:SUP1];
                lo[@"PE2"]  = [PGWXLayout layoutWithName:@"PE2" number:idx++ bank:0 select:MB(0x90, 8) readWrite:MB(0xA0, 2) support:SUP1];
                lo[@"PE3"]  = [PGWXLayout layoutWithName:@"PE3" number:idx++ bank:0 select:MB(0x90, 12) readWrite:MB(0xA0, 3) support:SUP1];
                lo[@"PE4"]  = [PGWXLayout layoutWithName:@"PE4" number:idx++ bank:0 select:MB(0x90, 16) readWrite:MB(0xA0, 4) support:SUP1];
                lo[@"PE5"]  = [PGWXLayout layoutWithName:@"PE5" number:idx++ bank:0 select:MB(0x90, 20) readWrite:MB(0xA0, 5) support:SUP1];
                lo[@"PE6"]  = [PGWXLayout layoutWithName:@"PE6" number:idx++ bank:0 select:MB(0x90, 24) readWrite:MB(0xA0, 6) support:SUP1];
                lo[@"PE7"]  = [PGWXLayout layoutWithName:@"PE7" number:idx++ bank:0 select:MB(0x90, 28) readWrite:MB(0xA0, 7) support:SUP1];
                lo[@"PE8"]  = [PGWXLayout layoutWithName:@"PE8" number:idx++ bank:0 select:MB(0x94, 0) readWrite:MB(0xA0, 8) support:SUP1];
                lo[@"PE9"]  = [PGWXLayout layoutWithName:@"PE9" number:idx++ bank:0 select:MB(0x94, 4) readWrite:MB(0xA0, 9) support:SUP1];
                lo[@"PE10"] = [PGWXLayout layoutWithName:@"PE10" number:idx++ bank:0 select:MB(0x94, 8) readWrite:MB(0xA0, 10) support:SUP1];
                lo[@"PE11"] = [PGWXLayout layoutWithName:@"PE11" number:idx++ bank:0 select:MB(0x94, 12) readWrite:MB(0xA0, 11) support:SUP1];
                lo[@"PF0"]  = [PGWXLayout layoutWithName:@"PF0" number:idx++ bank:0 select:MB(0xB4, 0) readWrite:MB(0xC4, 0) support:SUP1];
                lo[@"PF1"]  = [PGWXLayout layoutWithName:@"PF1" number:idx++ bank:0 select:MB(0xB4, 4) readWrite:MB(0xC4, 1) support:SUP1];
                lo[@"PF2"]  = [PGWXLayout layoutWithName:@"PF2" number:idx++ bank:0 select:MB(0xB4, 8) readWrite:MB(0xC4, 2) support:SUP1];
                lo[@"PF3"]  = [PGWXLayout layoutWithName:@"PF3" number:idx++ bank:0 select:MB(0xB4, 12) readWrite:MB(0xC4, 3) support:SUP1];
                lo[@"PF4"]  = [PGWXLayout layoutWithName:@"PF4" number:idx++ bank:0 select:MB(0xB4, 16) readWrite:MB(0xC4, 4) support:SUP1];
                lo[@"PF5"]  = [PGWXLayout layoutWithName:@"PF5" number:idx++ bank:0 select:MB(0xB4, 20) readWrite:MB(0xC4, 5) support:SUP1];
                lo[@"PG0"]  = [PGWXLayout layoutWithName:@"PG0" number:idx++ bank:0 select:MB(0xDC, 0) readWrite:MB(0xE8, 0) support:SUP1];
                lo[@"PG1"]  = [PGWXLayout layoutWithName:@"PG1" number:idx++ bank:0 select:MB(0xDC, 4) readWrite:MB(0xE8, 1) support:SUP1];
                lo[@"PG2"]  = [PGWXLayout layoutWithName:@"PG2" number:idx++ bank:0 select:MB(0xDC, 8) readWrite:MB(0xE8, 2) support:SUP1];
                lo[@"PG3"]  = [PGWXLayout layoutWithName:@"PG3" number:idx++ bank:0 select:MB(0xDC, 12) readWrite:MB(0xE8, 3) support:SUP1];
                lo[@"PG4"]  = [PGWXLayout layoutWithName:@"PG4" number:idx++ bank:0 select:MB(0xDC, 16) readWrite:MB(0xE8, 4) support:SUP1];
                lo[@"PG5"]  = [PGWXLayout layoutWithName:@"PG5" number:idx++ bank:0 select:MB(0xDC, 20) readWrite:MB(0xE8, 5) support:SUP1];
                lo[@"PG6"]  = [PGWXLayout layoutWithName:@"PG6" number:idx++ bank:0 select:MB(0xDC, 24) readWrite:MB(0xE8, 6) support:SUP1];
                lo[@"PG7"]  = [PGWXLayout layoutWithName:@"PG7" number:idx++ bank:0 select:MB(0xDC, 28) readWrite:MB(0xE8, 7) support:SUP1];
                lo[@"PG8"]  = [PGWXLayout layoutWithName:@"PG8" number:idx++ bank:0 select:MB(0xE0, 0) readWrite:MB(0xE8, 8) support:SUP1];
                lo[@"PG9"]  = [PGWXLayout layoutWithName:@"PG9" number:idx++ bank:0 select:MB(0xE0, 4) readWrite:MB(0xE8, 9) support:SUP1];
                lo[@"PG10"] = [PGWXLayout layoutWithName:@"PG10" number:idx++ bank:0 select:MB(0xE0, 8) readWrite:MB(0xE8, 10) support:SUP1];
                lo[@"PG11"] = [PGWXLayout layoutWithName:@"PG11" number:idx++ bank:0 select:MB(0xE0, 12) readWrite:MB(0xE8, 11) support:SUP1];
                lo[@"PH0"]  = [PGWXLayout layoutWithName:@"PH0" number:idx++ bank:0 select:MB(0xFC, 0) readWrite:MB(0x10C, 0) support:SUP1];
                lo[@"PH1"]  = [PGWXLayout layoutWithName:@"PH1" number:idx++ bank:0 select:MB(0xFC, 4) readWrite:MB(0x10C, 1) support:SUP1];
                lo[@"PH2"]  = [PGWXLayout layoutWithName:@"PH2" number:idx++ bank:0 select:MB(0xFC, 8) readWrite:MB(0x10C, 2) support:SUP1];
                lo[@"PH3"]  = [PGWXLayout layoutWithName:@"PH3" number:idx++ bank:0 select:MB(0xFC, 12) readWrite:MB(0x10C, 3) support:SUP1];
                lo[@"PH4"]  = [PGWXLayout layoutWithName:@"PH4" number:idx++ bank:0 select:MB(0xFC, 16) readWrite:MB(0x10C, 4) support:SUP1];
                lo[@"PH5"]  = [PGWXLayout layoutWithName:@"PH5" number:idx++ bank:0 select:MB(0xFC, 20) readWrite:MB(0x10C, 5) support:SUP2];
                lo[@"PH6"]  = [PGWXLayout layoutWithName:@"PH6" number:idx++ bank:0 select:MB(0xFC, 24) readWrite:MB(0x10C, 6) support:SUP1];
                lo[@"PH7"]  = [PGWXLayout layoutWithName:@"PH7" number:idx++ bank:0 select:MB(0xFC, 28) readWrite:MB(0x10C, 7) support:SUP1];
                lo[@"PH8"]  = [PGWXLayout layoutWithName:@"PH8" number:idx++ bank:0 select:MB(0x100, 0) readWrite:MB(0x10C, 8) support:SUP2];
                lo[@"PH9"]  = [PGWXLayout layoutWithName:@"PH9" number:idx++ bank:0 select:MB(0x100, 4) readWrite:MB(0x10C, 9) support:SUP2];
                lo[@"PH10"] = [PGWXLayout layoutWithName:@"PH10" number:idx++ bank:0 select:MB(0x100, 8) readWrite:MB(0x10C, 10) support:SUP2];
                lo[@"PH11"] = [PGWXLayout layoutWithName:@"PH11" number:idx++ bank:0 select:MB(0x100, 12) readWrite:MB(0x10C, 11) support:SUP2];
                lo[@"PH12"] = [PGWXLayout layoutWithName:@"PH12" number:idx++ bank:0 select:MB(0x100, 16) readWrite:MB(0x10C, 12) support:SUP2];
                lo[@"PH13"] = [PGWXLayout layoutWithName:@"PH13" number:idx++ bank:0 select:MB(0x100, 20) readWrite:MB(0x10C, 13) support:SUP2];
                lo[@"PH14"] = [PGWXLayout layoutWithName:@"PH14" number:idx++ bank:0 select:MB(0x100, 24) readWrite:MB(0x10C, 14) support:SUP2];
                lo[@"PH15"] = [PGWXLayout layoutWithName:@"PH15" number:idx++ bank:0 select:MB(0x100, 28) readWrite:MB(0x10C, 15) support:SUP1];
                lo[@"PH16"] = [PGWXLayout layoutWithName:@"PH16" number:idx++ bank:0 select:MB(0x104, 0) readWrite:MB(0x10C, 16) support:SUP1];
                lo[@"PH17"] = [PGWXLayout layoutWithName:@"PH17" number:idx++ bank:0 select:MB(0x104, 4) readWrite:MB(0x10C, 17) support:SUP1];
                lo[@"PH18"] = [PGWXLayout layoutWithName:@"PH18" number:idx++ bank:0 select:MB(0x104, 8) readWrite:MB(0x10C, 18) support:SUP1];
                lo[@"PH19"] = [PGWXLayout layoutWithName:@"PH19" number:idx++ bank:0 select:MB(0x104, 12) readWrite:MB(0x10C, 19) support:SUP1];
                lo[@"PH20"] = [PGWXLayout layoutWithName:@"PH20" number:idx++ bank:0 select:MB(0x104, 16) readWrite:MB(0x10C, 20) support:SUP1];
                lo[@"PH21"] = [PGWXLayout layoutWithName:@"PH21" number:idx++ bank:0 select:MB(0x104, 20) readWrite:MB(0x10C, 21) support:SUP1];
                lo[@"PH22"] = [PGWXLayout layoutWithName:@"PH22" number:idx++ bank:0 select:MB(0x104, 24) readWrite:MB(0x10C, 22) support:SUP1];
                lo[@"PH23"] = [PGWXLayout layoutWithName:@"PH23" number:idx++ bank:0 select:MB(0x104, 28) readWrite:MB(0x10C, 23) support:SUP1];
                lo[@"PI0"]  = [PGWXLayout layoutWithName:@"PI0" number:idx++ bank:0 select:MB(0x120, 0) readWrite:MB(0x130, 0) support:SUP1];
                lo[@"PI1"]  = [PGWXLayout layoutWithName:@"PI1" number:idx++ bank:0 select:MB(0x120, 4) readWrite:MB(0x130, 1) support:SUP1];
                lo[@"PI2"]  = [PGWXLayout layoutWithName:@"PI2" number:idx++ bank:0 select:MB(0x120, 8) readWrite:MB(0x130, 2) support:SUP1];
                lo[@"PI3"]  = [PGWXLayout layoutWithName:@"PI3" number:idx++ bank:0 select:MB(0x120, 12) readWrite:MB(0x130, 3) support:SUP1];
                lo[@"PI4"]  = [PGWXLayout layoutWithName:@"PI4" number:idx++ bank:0 select:MB(0x120, 16) readWrite:MB(0x130, 4) support:SUP1];
                lo[@"PI5"]  = [PGWXLayout layoutWithName:@"PI5" number:idx++ bank:0 select:MB(0x120, 20) readWrite:MB(0x130, 5) support:SUP1];
                lo[@"PI6"]  = [PGWXLayout layoutWithName:@"PI6" number:idx++ bank:0 select:MB(0x120, 24) readWrite:MB(0x130, 6) support:SUP1];
                lo[@"PI7"]  = [PGWXLayout layoutWithName:@"PI7" number:idx++ bank:0 select:MB(0x124, 28) readWrite:MB(0x130, 7) support:SUP1];
                lo[@"PI8"]  = [PGWXLayout layoutWithName:@"PI8" number:idx++ bank:0 select:MB(0x124, 0) readWrite:MB(0x130, 8) support:SUP1];
                lo[@"PI9"]  = [PGWXLayout layoutWithName:@"PI9" number:idx++ bank:0 select:MB(0x124, 4) readWrite:MB(0x130, 9) support:SUP1];
                lo[@"PI10"] = [PGWXLayout layoutWithName:@"PI10" number:idx++ bank:0 select:MB(0x124, 8) readWrite:MB(0x130, 10) support:SUP2];
                lo[@"PI11"] = [PGWXLayout layoutWithName:@"PI11" number:idx++ bank:0 select:MB(0x124, 12) readWrite:MB(0x130, 11) support:SUP2];
                lo[@"PI12"] = [PGWXLayout layoutWithName:@"PI12" number:idx++ bank:0 select:MB(0x124, 16) readWrite:MB(0x130, 12) support:SUP2];
                lo[@"PI13"] = [PGWXLayout layoutWithName:@"PI13" number:idx++ bank:0 select:MB(0x124, 20) readWrite:MB(0x130, 13) support:SUP2];
                lo[@"PI14"] = [PGWXLayout layoutWithName:@"PI14" number:idx++ bank:0 select:MB(0x124, 24) readWrite:MB(0x130, 14) support:SUP1];
                lo[@"PI15"] = [PGWXLayout layoutWithName:@"PI15" number:idx++ bank:0 select:MB(0x128, 28) readWrite:MB(0x130, 15) support:SUP1];
                lo[@"PI16"] = [PGWXLayout layoutWithName:@"PI16" number:idx++ bank:0 select:MB(0x128, 0) readWrite:MB(0x130, 16) support:SUP1];
                lo[@"PI17"] = [PGWXLayout layoutWithName:@"PI17" number:idx++ bank:0 select:MB(0x128, 4) readWrite:MB(0x130, 17) support:SUP1];
                lo[@"PI18"] = [PGWXLayout layoutWithName:@"PI18" number:idx++ bank:0 select:MB(0x128, 8) readWrite:MB(0x130, 18) support:SUP1];
                lo[@"PI19"] = [PGWXLayout layoutWithName:@"PI19" number:idx++ bank:0 select:MB(0x128, 12) readWrite:MB(0x130, 19) support:SUP1];
                lo[@"PI20"] = [PGWXLayout layoutWithName:@"PI20" number:idx++ bank:0 select:MB(0x128, 16) readWrite:MB(0x130, 20) support:SUP1];
                lo[@"PI21"] = [PGWXLayout layoutWithName:@"PI21" number:idx bank:0 select:MB(0x128, 20) readWrite:MB(0x130, 21) support:SUP1];

                self->_layout = [NSDictionary dictionaryWithDictionary:lo];
            }
        }
        @finally {
            [self unlock];
        }

        return self->_layout;
    }

    -(NSArray<PGWXAddr *> *)baseAddresses {
        [self lock];

        @try {
            if(self->_baseAddresses.count == 0) {
                self->_baseAddresses = @[[PGWXAddr address:0x01C20000 offset:0x00000800]];
            }
        }
        @finally {
            [self unlock];
        }

        return self->_baseAddresses;
    }

@end

@implementation PGWXSOCAllwinnerA31s {
    }

    -(NSString *)chipSet {
        return @"A31s";
    }

    -(NSDictionary<NSString *, PGWXLayout *> *)layout {
        [self lock];

        @try {
            if(self->_layout.count == 0) {
                NSMutableDictionary *lo = [NSMutableDictionary new];
                NSUInteger          idx = 0;

                lo[@"PA0"]  = [PGWXLayout layoutWithName:@"PA0" number:idx++ bank:0 select:MB(0x00, 0) readWrite:MB(0x10, 0) support:SUP1];
                lo[@"PA1"]  = [PGWXLayout layoutWithName:@"PA1" number:idx++ bank:0 select:MB(0x00, 4) readWrite:MB(0x10, 1) support:SUP1];
                lo[@"PA2"]  = [PGWXLayout layoutWithName:@"PA2" number:idx++ bank:0 select:MB(0x00, 8) readWrite:MB(0x10, 2) support:SUP1];
                lo[@"PA3"]  = [PGWXLayout layoutWithName:@"PA3" number:idx++ bank:0 select:MB(0x00, 12) readWrite:MB(0x10, 3) support:SUP1];
                lo[@"PA4"]  = [PGWXLayout layoutWithName:@"PA4" number:idx++ bank:0 select:MB(0x00, 16) readWrite:MB(0x10, 4) support:SUP1];
                lo[@"PA5"]  = [PGWXLayout layoutWithName:@"PA5" number:idx++ bank:0 select:MB(0x00, 20) readWrite:MB(0x10, 5) support:SUP1];
                lo[@"PA6"]  = [PGWXLayout layoutWithName:@"PA6" number:idx++ bank:0 select:MB(0x00, 24) readWrite:MB(0x10, 6) support:SUP1];
                lo[@"PA7"]  = [PGWXLayout layoutWithName:@"PA7" number:idx++ bank:0 select:MB(0x00, 28) readWrite:MB(0x10, 7) support:SUP1];
                lo[@"PA8"]  = [PGWXLayout layoutWithName:@"PA8" number:idx++ bank:0 select:MB(0x04, 0) readWrite:MB(0x10, 8) support:SUP1];
                lo[@"PA9"]  = [PGWXLayout layoutWithName:@"PA9" number:idx++ bank:0 select:MB(0x04, 4) readWrite:MB(0x10, 9) support:SUP1];
                lo[@"PA10"] = [PGWXLayout layoutWithName:@"PA10" number:idx++ bank:0 select:MB(0x04, 8) readWrite:MB(0x10, 10) support:SUP1];
                lo[@"PA11"] = [PGWXLayout layoutWithName:@"PA11" number:idx++ bank:0 select:MB(0x04, 12) readWrite:MB(0x10, 11) support:SUP1];
                lo[@"PA12"] = [PGWXLayout layoutWithName:@"PA12" number:idx++ bank:0 select:MB(0x04, 16) readWrite:MB(0x10, 12) support:SUP1];
                lo[@"PA13"] = [PGWXLayout layoutWithName:@"PA13" number:idx++ bank:0 select:MB(0x04, 20) readWrite:MB(0x10, 13) support:SUP1];
                lo[@"PA14"] = [PGWXLayout layoutWithName:@"PA14" number:idx++ bank:0 select:MB(0x04, 24) readWrite:MB(0x10, 14) support:SUP1];
                lo[@"PA15"] = [PGWXLayout layoutWithName:@"PA15" number:idx++ bank:0 select:MB(0x04, 28) readWrite:MB(0x10, 15) support:SUP1];
                lo[@"PA16"] = [PGWXLayout layoutWithName:@"PA16" number:idx++ bank:0 select:MB(0x08, 0) readWrite:MB(0x10, 16) support:SUP1];
                lo[@"PA17"] = [PGWXLayout layoutWithName:@"PA17" number:idx++ bank:0 select:MB(0x08, 4) readWrite:MB(0x10, 17) support:SUP1];
                lo[@"PA18"] = [PGWXLayout layoutWithName:@"PA18" number:idx++ bank:0 select:MB(0x08, 8) readWrite:MB(0x10, 18) support:SUP1];
                lo[@"PA19"] = [PGWXLayout layoutWithName:@"PA19" number:idx++ bank:0 select:MB(0x08, 12) readWrite:MB(0x10, 19) support:SUP1];
                lo[@"PA20"] = [PGWXLayout layoutWithName:@"PA20" number:idx++ bank:0 select:MB(0x08, 16) readWrite:MB(0x10, 20) support:SUP1];
                lo[@"PA21"] = [PGWXLayout layoutWithName:@"PA21" number:idx++ bank:0 select:MB(0x08, 20) readWrite:MB(0x10, 21) support:SUP1];
                lo[@"PA22"] = [PGWXLayout layoutWithName:@"PA22" number:idx++ bank:0 select:MB(0x08, 24) readWrite:MB(0x10, 22) support:SUP1];
                lo[@"PA23"] = [PGWXLayout layoutWithName:@"PA23" number:idx++ bank:0 select:MB(0x08, 28) readWrite:MB(0x10, 23) support:SUP1];
                lo[@"PA24"] = [PGWXLayout layoutWithName:@"PA24" number:idx++ bank:0 select:MB(0x0C, 0) readWrite:MB(0x10, 24) support:SUP1];
                lo[@"PA25"] = [PGWXLayout layoutWithName:@"PA25" number:idx++ bank:0 select:MB(0x0C, 4) readWrite:MB(0x10, 25) support:SUP1];
                lo[@"PA26"] = [PGWXLayout layoutWithName:@"PA26" number:idx++ bank:0 select:MB(0x0C, 8) readWrite:MB(0x10, 26) support:SUP1];
                lo[@"PA27"] = [PGWXLayout layoutWithName:@"PA27" number:idx++ bank:0 select:MB(0x0C, 12) readWrite:MB(0x10, 27) support:SUP1];
                lo[@"PB0"]  = [PGWXLayout layoutWithName:@"PB0" number:idx++ bank:0 select:MB(0X24, 0) readWrite:MB(0x34, 0) support:SUP1];
                lo[@"PB1"]  = [PGWXLayout layoutWithName:@"PB1" number:idx++ bank:0 select:MB(0X24, 4) readWrite:MB(0x34, 1) support:SUP1];
                lo[@"PB2"]  = [PGWXLayout layoutWithName:@"PB2" number:idx++ bank:0 select:MB(0X24, 8) readWrite:MB(0x34, 2) support:SUP1];
                lo[@"PB3"]  = [PGWXLayout layoutWithName:@"PB3" number:idx++ bank:0 select:MB(0X24, 12) readWrite:MB(0x34, 3) support:SUP1];
                lo[@"PB4"]  = [PGWXLayout layoutWithName:@"PB4" number:idx++ bank:0 select:MB(0X24, 16) readWrite:MB(0x34, 4) support:SUP1];
                lo[@"PB5"]  = [PGWXLayout layoutWithName:@"PB5" number:idx++ bank:0 select:MB(0X24, 20) readWrite:MB(0x34, 5) support:SUP1];
                lo[@"PB6"]  = [PGWXLayout layoutWithName:@"PB6" number:idx++ bank:0 select:MB(0X24, 24) readWrite:MB(0x34, 6) support:SUP1];
                lo[@"PB7"]  = [PGWXLayout layoutWithName:@"PB7" number:idx++ bank:0 select:MB(0X24, 28) readWrite:MB(0x34, 7) support:SUP1];
                lo[@"PC0"]  = [PGWXLayout layoutWithName:@"PC0" number:idx++ bank:0 select:MB(0X48, 0) readWrite:MB(0x58, 0) support:SUP1];
                lo[@"PC1"]  = [PGWXLayout layoutWithName:@"PC1" number:idx++ bank:0 select:MB(0X48, 4) readWrite:MB(0x58, 1) support:SUP1];
                lo[@"PC2"]  = [PGWXLayout layoutWithName:@"PC2" number:idx++ bank:0 select:MB(0X48, 8) readWrite:MB(0x58, 2) support:SUP1];
                lo[@"PC3"]  = [PGWXLayout layoutWithName:@"PC3" number:idx++ bank:0 select:MB(0X48, 12) readWrite:MB(0x58, 3) support:SUP1];
                lo[@"PC4"]  = [PGWXLayout layoutWithName:@"PC4" number:idx++ bank:0 select:MB(0X48, 16) readWrite:MB(0x58, 4) support:SUP1];
                lo[@"PC5"]  = [PGWXLayout layoutWithName:@"PC5" number:idx++ bank:0 select:MB(0X48, 20) readWrite:MB(0x58, 5) support:SUP1];
                lo[@"PC6"]  = [PGWXLayout layoutWithName:@"PC6" number:idx++ bank:0 select:MB(0X48, 24) readWrite:MB(0x58, 6) support:SUP1];
                lo[@"PC7"]  = [PGWXLayout layoutWithName:@"PC7" number:idx++ bank:0 select:MB(0X48, 28) readWrite:MB(0x58, 7) support:SUP1];
                lo[@"PC8"]  = [PGWXLayout layoutWithName:@"PC8" number:idx++ bank:0 select:MB(0X4C, 0) readWrite:MB(0x58, 8) support:SUP1];
                lo[@"PC9"]  = [PGWXLayout layoutWithName:@"PC9" number:idx++ bank:0 select:MB(0X4C, 4) readWrite:MB(0x58, 9) support:SUP1];
                lo[@"PC10"] = [PGWXLayout layoutWithName:@"PC10" number:idx++ bank:0 select:MB(0X4C, 8) readWrite:MB(0x58, 10) support:SUP1];
                lo[@"PC11"] = [PGWXLayout layoutWithName:@"PC11" number:idx++ bank:0 select:MB(0X4C, 12) readWrite:MB(0x58, 11) support:SUP1];
                lo[@"PC12"] = [PGWXLayout layoutWithName:@"PC12" number:idx++ bank:0 select:MB(0x4C, 16) readWrite:MB(0x58, 12) support:SUP1];
                lo[@"PC13"] = [PGWXLayout layoutWithName:@"PC13" number:idx++ bank:0 select:MB(0x4C, 20) readWrite:MB(0x58, 13) support:SUP1];
                lo[@"PC14"] = [PGWXLayout layoutWithName:@"PC14" number:idx++ bank:0 select:MB(0x4C, 24) readWrite:MB(0x58, 14) support:SUP1];
                lo[@"PC15"] = [PGWXLayout layoutWithName:@"PC15" number:idx++ bank:0 select:MB(0x4C, 28) readWrite:MB(0x58, 15) support:SUP1];
                lo[@"PC24"] = [PGWXLayout layoutWithName:@"PC24" number:idx++ bank:0 select:MB(0x54, 0) readWrite:MB(0x58, 24) support:SUP1];
                lo[@"PC25"] = [PGWXLayout layoutWithName:@"PC25" number:idx++ bank:0 select:MB(0x54, 4) readWrite:MB(0x58, 25) support:SUP1];
                lo[@"PC26"] = [PGWXLayout layoutWithName:@"PC26" number:idx++ bank:0 select:MB(0x54, 8) readWrite:MB(0x58, 26) support:SUP1];
                lo[@"PC27"] = [PGWXLayout layoutWithName:@"PC27" number:idx++ bank:0 select:MB(0x54, 12) readWrite:MB(0x58, 27) support:SUP1];
                lo[@"PD0"]  = [PGWXLayout layoutWithName:@"PD0" number:idx++ bank:0 select:MB(0X6C, 0) readWrite:MB(0x7C, 0) support:SUP1];
                lo[@"PD1"]  = [PGWXLayout layoutWithName:@"PD1" number:idx++ bank:0 select:MB(0X6C, 4) readWrite:MB(0x7C, 1) support:SUP1];
                lo[@"PD2"]  = [PGWXLayout layoutWithName:@"PD2" number:idx++ bank:0 select:MB(0X6C, 8) readWrite:MB(0x7C, 2) support:SUP1];
                lo[@"PD3"]  = [PGWXLayout layoutWithName:@"PD3" number:idx++ bank:0 select:MB(0X6C, 12) readWrite:MB(0x7C, 3) support:SUP1];
                lo[@"PD4"]  = [PGWXLayout layoutWithName:@"PD4" number:idx++ bank:0 select:MB(0X6C, 16) readWrite:MB(0x7C, 4) support:SUP1];
                lo[@"PD5"]  = [PGWXLayout layoutWithName:@"PD5" number:idx++ bank:0 select:MB(0X6C, 20) readWrite:MB(0x7C, 5) support:SUP1];
                lo[@"PD6"]  = [PGWXLayout layoutWithName:@"PD6" number:idx++ bank:0 select:MB(0X6C, 24) readWrite:MB(0x7C, 6) support:SUP1];
                lo[@"PD7"]  = [PGWXLayout layoutWithName:@"PD7" number:idx++ bank:0 select:MB(0X6C, 28) readWrite:MB(0x7C, 7) support:SUP1];
                lo[@"PD8"]  = [PGWXLayout layoutWithName:@"PD8" number:idx++ bank:0 select:MB(0X70, 0) readWrite:MB(0x7C, 8) support:SUP1];
                lo[@"PD9"]  = [PGWXLayout layoutWithName:@"PD9" number:idx++ bank:0 select:MB(0X70, 4) readWrite:MB(0x7C, 9) support:SUP1];
                lo[@"PD10"] = [PGWXLayout layoutWithName:@"PD10" number:idx++ bank:0 select:MB(0X70, 8) readWrite:MB(0x7C, 10) support:SUP1];
                lo[@"PD11"] = [PGWXLayout layoutWithName:@"PD11" number:idx++ bank:0 select:MB(0X70, 12) readWrite:MB(0x7C, 11) support:SUP1];
                lo[@"PD12"] = [PGWXLayout layoutWithName:@"PD12" number:idx++ bank:0 select:MB(0x70, 16) readWrite:MB(0x7C, 12) support:SUP1];
                lo[@"PD13"] = [PGWXLayout layoutWithName:@"PD13" number:idx++ bank:0 select:MB(0x70, 20) readWrite:MB(0x7C, 13) support:SUP1];
                lo[@"PD14"] = [PGWXLayout layoutWithName:@"PD14" number:idx++ bank:0 select:MB(0x70, 24) readWrite:MB(0x7C, 14) support:SUP1];
                lo[@"PD15"] = [PGWXLayout layoutWithName:@"PD15" number:idx++ bank:0 select:MB(0x70, 28) readWrite:MB(0x7C, 15) support:SUP1];
                lo[@"PD16"] = [PGWXLayout layoutWithName:@"PD16" number:idx++ bank:0 select:MB(0x74, 0) readWrite:MB(0x7C, 16) support:SUP1];
                lo[@"PD17"] = [PGWXLayout layoutWithName:@"PD17" number:idx++ bank:0 select:MB(0x74, 4) readWrite:MB(0x7C, 17) support:SUP1];
                lo[@"PD18"] = [PGWXLayout layoutWithName:@"PD18" number:idx++ bank:0 select:MB(0x74, 8) readWrite:MB(0x7C, 18) support:SUP1];
                lo[@"PD19"] = [PGWXLayout layoutWithName:@"PD19" number:idx++ bank:0 select:MB(0x74, 12) readWrite:MB(0x7C, 19) support:SUP1];
                lo[@"PD20"] = [PGWXLayout layoutWithName:@"PD20" number:idx++ bank:0 select:MB(0x74, 16) readWrite:MB(0x7C, 20) support:SUP1];
                lo[@"PD21"] = [PGWXLayout layoutWithName:@"PD21" number:idx++ bank:0 select:MB(0x74, 20) readWrite:MB(0x7C, 21) support:SUP1];
                lo[@"PD22"] = [PGWXLayout layoutWithName:@"PD22" number:idx++ bank:0 select:MB(0x74, 24) readWrite:MB(0x7C, 22) support:SUP1];
                lo[@"PD23"] = [PGWXLayout layoutWithName:@"PD23" number:idx++ bank:0 select:MB(0x74, 28) readWrite:MB(0x7C, 23) support:SUP1];
                lo[@"PD24"] = [PGWXLayout layoutWithName:@"PD24" number:idx++ bank:0 select:MB(0x78, 0) readWrite:MB(0x7C, 24) support:SUP1];
                lo[@"PD25"] = [PGWXLayout layoutWithName:@"PD25" number:idx++ bank:0 select:MB(0x78, 4) readWrite:MB(0x7C, 25) support:SUP1];
                lo[@"PD26"] = [PGWXLayout layoutWithName:@"PD26" number:idx++ bank:0 select:MB(0x78, 8) readWrite:MB(0x7C, 26) support:SUP1];
                lo[@"PD27"] = [PGWXLayout layoutWithName:@"PD27" number:idx++ bank:0 select:MB(0x78, 12) readWrite:MB(0x7C, 27) support:SUP1];
                lo[@"PE0"]  = [PGWXLayout layoutWithName:@"PE0" number:idx++ bank:0 select:MB(0X90, 0) readWrite:MB(0xA0, 0) support:SUP1];
                lo[@"PE1"]  = [PGWXLayout layoutWithName:@"PE1" number:idx++ bank:0 select:MB(0X90, 4) readWrite:MB(0xA0, 1) support:SUP1];
                lo[@"PE2"]  = [PGWXLayout layoutWithName:@"PE2" number:idx++ bank:0 select:MB(0X90, 8) readWrite:MB(0xA0, 2) support:SUP1];
                lo[@"PE3"]  = [PGWXLayout layoutWithName:@"PE3" number:idx++ bank:0 select:MB(0X90, 12) readWrite:MB(0xA0, 3) support:SUP1];
                lo[@"PE4"]  = [PGWXLayout layoutWithName:@"PE4" number:idx++ bank:0 select:MB(0X90, 16) readWrite:MB(0xA0, 4) support:SUP1];
                lo[@"PE5"]  = [PGWXLayout layoutWithName:@"PE5" number:idx++ bank:0 select:MB(0X90, 20) readWrite:MB(0xA0, 5) support:SUP1];
                lo[@"PE6"]  = [PGWXLayout layoutWithName:@"PE6" number:idx++ bank:0 select:MB(0X90, 24) readWrite:MB(0xA0, 6) support:SUP1];
                lo[@"PE7"]  = [PGWXLayout layoutWithName:@"PE7" number:idx++ bank:0 select:MB(0X90, 28) readWrite:MB(0xA0, 7) support:SUP1];
                lo[@"PE8"]  = [PGWXLayout layoutWithName:@"PE8" number:idx++ bank:0 select:MB(0X94, 0) readWrite:MB(0xA0, 8) support:SUP1];
                lo[@"PE9"]  = [PGWXLayout layoutWithName:@"PE9" number:idx++ bank:0 select:MB(0X94, 4) readWrite:MB(0xA0, 9) support:SUP1];
                lo[@"PE10"] = [PGWXLayout layoutWithName:@"PE10" number:idx++ bank:0 select:MB(0X94, 8) readWrite:MB(0xA0, 10) support:SUP1];
                lo[@"PE11"] = [PGWXLayout layoutWithName:@"PE11" number:idx++ bank:0 select:MB(0X94, 12) readWrite:MB(0xA0, 11) support:SUP1];
                lo[@"PE12"] = [PGWXLayout layoutWithName:@"PE12" number:idx++ bank:0 select:MB(0X94, 16) readWrite:MB(0xA0, 12) support:SUP1];
                lo[@"PE13"] = [PGWXLayout layoutWithName:@"PE13" number:idx++ bank:0 select:MB(0X94, 20) readWrite:MB(0xA0, 13) support:SUP1];
                lo[@"PE14"] = [PGWXLayout layoutWithName:@"PE14" number:idx++ bank:0 select:MB(0X94, 24) readWrite:MB(0xA0, 14) support:SUP1];
                lo[@"PE15"] = [PGWXLayout layoutWithName:@"PE15" number:idx++ bank:0 select:MB(0X94, 28) readWrite:MB(0xA0, 15) support:SUP1];
                lo[@"PF0"]  = [PGWXLayout layoutWithName:@"PF0" number:idx++ bank:0 select:MB(0XB4, 0) readWrite:MB(0xC4, 0) support:SUP1];
                lo[@"PF1"]  = [PGWXLayout layoutWithName:@"PF1" number:idx++ bank:0 select:MB(0XB4, 4) readWrite:MB(0xC4, 1) support:SUP1];
                lo[@"PF2"]  = [PGWXLayout layoutWithName:@"PF2" number:idx++ bank:0 select:MB(0XB4, 8) readWrite:MB(0xC4, 2) support:SUP1];
                lo[@"PF3"]  = [PGWXLayout layoutWithName:@"PF3" number:idx++ bank:0 select:MB(0XB4, 12) readWrite:MB(0xC4, 3) support:SUP1];
                lo[@"PF4"]  = [PGWXLayout layoutWithName:@"PF4" number:idx++ bank:0 select:MB(0XB4, 16) readWrite:MB(0xC4, 4) support:SUP1];
                lo[@"PF5"]  = [PGWXLayout layoutWithName:@"PF5" number:idx++ bank:0 select:MB(0XB4, 20) readWrite:MB(0xC4, 5) support:SUP1];
                lo[@"PG0"]  = [PGWXLayout layoutWithName:@"PG0" number:idx++ bank:0 select:MB(0XD8, 0) readWrite:MB(0xE8, 0) support:SUP1];
                lo[@"PG1"]  = [PGWXLayout layoutWithName:@"PG1" number:idx++ bank:0 select:MB(0XD8, 4) readWrite:MB(0xE8, 1) support:SUP1];
                lo[@"PG2"]  = [PGWXLayout layoutWithName:@"PG2" number:idx++ bank:0 select:MB(0XD8, 8) readWrite:MB(0xE8, 2) support:SUP1];
                lo[@"PG3"]  = [PGWXLayout layoutWithName:@"PG3" number:idx++ bank:0 select:MB(0XD8, 12) readWrite:MB(0xE8, 3) support:SUP1];
                lo[@"PG4"]  = [PGWXLayout layoutWithName:@"PG4" number:idx++ bank:0 select:MB(0XD8, 16) readWrite:MB(0xE8, 4) support:SUP1];
                lo[@"PG5"]  = [PGWXLayout layoutWithName:@"PG5" number:idx++ bank:0 select:MB(0XD8, 20) readWrite:MB(0xE8, 5) support:SUP1];
                lo[@"PG6"]  = [PGWXLayout layoutWithName:@"PG6" number:idx++ bank:0 select:MB(0XD8, 24) readWrite:MB(0xE8, 6) support:SUP1];
                lo[@"PG7"]  = [PGWXLayout layoutWithName:@"PG7" number:idx++ bank:0 select:MB(0XD8, 28) readWrite:MB(0xE8, 7) support:SUP1];
                lo[@"PG8"]  = [PGWXLayout layoutWithName:@"PG8" number:idx++ bank:0 select:MB(0XDC, 0) readWrite:MB(0xE8, 8) support:SUP1];
                lo[@"PG9"]  = [PGWXLayout layoutWithName:@"PG9" number:idx++ bank:0 select:MB(0XDC, 4) readWrite:MB(0xE8, 9) support:SUP1];
                lo[@"PG10"] = [PGWXLayout layoutWithName:@"PG10" number:idx++ bank:0 select:MB(0XDC, 8) readWrite:MB(0xE8, 10) support:SUP1];
                lo[@"PG11"] = [PGWXLayout layoutWithName:@"PG11" number:idx++ bank:0 select:MB(0XDC, 12) readWrite:MB(0xE8, 11) support:SUP1];
                lo[@"PG12"] = [PGWXLayout layoutWithName:@"PG12" number:idx++ bank:0 select:MB(0XDC, 16) readWrite:MB(0xE8, 12) support:SUP1];
                lo[@"PG13"] = [PGWXLayout layoutWithName:@"PG13" number:idx++ bank:0 select:MB(0XDC, 20) readWrite:MB(0xE8, 13) support:SUP1];
                lo[@"PG14"] = [PGWXLayout layoutWithName:@"PG14" number:idx++ bank:0 select:MB(0XDC, 24) readWrite:MB(0xE8, 14) support:SUP1];
                lo[@"PG15"] = [PGWXLayout layoutWithName:@"PG15" number:idx++ bank:0 select:MB(0XDC, 28) readWrite:MB(0xE8, 15) support:SUP1];
                lo[@"PG16"] = [PGWXLayout layoutWithName:@"PG16" number:idx++ bank:0 select:MB(0XE0, 0) readWrite:MB(0xE8, 16) support:SUP1];
                lo[@"PG17"] = [PGWXLayout layoutWithName:@"PG17" number:idx++ bank:0 select:MB(0XE0, 4) readWrite:MB(0xE8, 17) support:SUP1];
                lo[@"PG18"] = [PGWXLayout layoutWithName:@"PG18" number:idx++ bank:0 select:MB(0XE0, 8) readWrite:MB(0xE8, 18) support:SUP1];
                lo[@"PH9"]  = [PGWXLayout layoutWithName:@"PH9" number:idx++ bank:0 select:MB(0X100, 4) readWrite:MB(0x10C, 9) support:SUP2];
                lo[@"PH10"] = [PGWXLayout layoutWithName:@"PH10" number:idx++ bank:0 select:MB(0x100, 8) readWrite:MB(0x10C, 10) support:SUP2];
                lo[@"PH11"] = [PGWXLayout layoutWithName:@"PH11" number:idx++ bank:0 select:MB(0x100, 12) readWrite:MB(0x10C, 11) support:SUP2];
                lo[@"PH12"] = [PGWXLayout layoutWithName:@"PH12" number:idx++ bank:0 select:MB(0x100, 16) readWrite:MB(0x10C, 12) support:SUP2];
                lo[@"PH13"] = [PGWXLayout layoutWithName:@"PH13" number:idx++ bank:0 select:MB(0x100, 20) readWrite:MB(0x10C, 13) support:SUP2];
                lo[@"PH14"] = [PGWXLayout layoutWithName:@"PH14" number:idx++ bank:0 select:MB(0x100, 24) readWrite:MB(0x10C, 14) support:SUP2];
                lo[@"PH15"] = [PGWXLayout layoutWithName:@"PH15" number:idx++ bank:0 select:MB(0X100, 28) readWrite:MB(0x10C, 15) support:SUP1];
                lo[@"PH16"] = [PGWXLayout layoutWithName:@"PH16" number:idx++ bank:0 select:MB(0x104, 0) readWrite:MB(0x10C, 16) support:SUP1];
                lo[@"PH17"] = [PGWXLayout layoutWithName:@"PH17" number:idx++ bank:0 select:MB(0x104, 4) readWrite:MB(0x10C, 17) support:SUP1];
                lo[@"PH18"] = [PGWXLayout layoutWithName:@"PH18" number:idx++ bank:0 select:MB(0x104, 8) readWrite:MB(0x10C, 18) support:SUP1];
                lo[@"PH19"] = [PGWXLayout layoutWithName:@"PH19" number:idx++ bank:0 select:MB(0x104, 12) readWrite:MB(0x10C, 19) support:SUP1];
                lo[@"PH20"] = [PGWXLayout layoutWithName:@"PH20" number:idx++ bank:0 select:MB(0x104, 16) readWrite:MB(0x10C, 20) support:SUP1];
                lo[@"PH21"] = [PGWXLayout layoutWithName:@"PH21" number:idx++ bank:0 select:MB(0x104, 20) readWrite:MB(0x10C, 21) support:SUP1];
                lo[@"PH22"] = [PGWXLayout layoutWithName:@"PH22" number:idx++ bank:0 select:MB(0x104, 24) readWrite:MB(0x10C, 22) support:SUP1];
                lo[@"PH23"] = [PGWXLayout layoutWithName:@"PH23" number:idx++ bank:0 select:MB(0x104, 28) readWrite:MB(0x10C, 23) support:SUP1];
                lo[@"PH24"] = [PGWXLayout layoutWithName:@"PH24" number:idx++ bank:0 select:MB(0x108, 0) readWrite:MB(0x10C, 24) support:SUP1];
                lo[@"PH25"] = [PGWXLayout layoutWithName:@"PH25" number:idx++ bank:0 select:MB(0x108, 4) readWrite:MB(0x10C, 25) support:SUP1];
                lo[@"PH26"] = [PGWXLayout layoutWithName:@"PH26" number:idx++ bank:0 select:MB(0x108, 8) readWrite:MB(0x10C, 26) support:SUP1];
                lo[@"PH27"] = [PGWXLayout layoutWithName:@"PH27" number:idx++ bank:0 select:MB(0x108, 12) readWrite:MB(0x10C, 27) support:SUP1];
                lo[@"PH28"] = [PGWXLayout layoutWithName:@"PH28" number:idx++ bank:0 select:MB(0x108, 16) readWrite:MB(0x10C, 28) support:SUP1];
                lo[@"PL0"]  = [PGWXLayout layoutWithName:@"PL0" number:idx++ bank:1 select:MB(0X0, 0) readWrite:MB(0x10, 0) support:SUP1];
                lo[@"PL1"]  = [PGWXLayout layoutWithName:@"PL1" number:idx++ bank:1 select:MB(0X0, 4) readWrite:MB(0x10, 1) support:SUP1];
                lo[@"PL2"]  = [PGWXLayout layoutWithName:@"PL2" number:idx++ bank:1 select:MB(0X0, 8) readWrite:MB(0x10, 2) support:SUP1];
                lo[@"PL3"]  = [PGWXLayout layoutWithName:@"PL3" number:idx++ bank:1 select:MB(0X0, 12) readWrite:MB(0x10, 3) support:SUP1];
                lo[@"PL4"]  = [PGWXLayout layoutWithName:@"PL4" number:idx++ bank:1 select:MB(0X0, 16) readWrite:MB(0x10, 4) support:SUP1];
                lo[@"PL5"]  = [PGWXLayout layoutWithName:@"PL5" number:idx++ bank:1 select:MB(0X0, 20) readWrite:MB(0x10, 5) support:SUP1];
                lo[@"PL6"]  = [PGWXLayout layoutWithName:@"PL6" number:idx++ bank:1 select:MB(0X0, 24) readWrite:MB(0x10, 6) support:SUP1];
                lo[@"PL7"]  = [PGWXLayout layoutWithName:@"PL7" number:idx++ bank:1 select:MB(0X0, 28) readWrite:MB(0x10, 7) support:SUP1];
                lo[@"PM0"]  = [PGWXLayout layoutWithName:@"PM0" number:idx++ bank:1 select:MB(0X24, 0) readWrite:MB(0x34, 0) support:SUP1];
                lo[@"PM1"]  = [PGWXLayout layoutWithName:@"PM1" number:idx++ bank:1 select:MB(0X24, 4) readWrite:MB(0x34, 1) support:SUP1];
                lo[@"PM2"]  = [PGWXLayout layoutWithName:@"PM2" number:idx++ bank:1 select:MB(0X24, 8) readWrite:MB(0x34, 2) support:SUP1];
                lo[@"PM3"]  = [PGWXLayout layoutWithName:@"PM3" number:idx++ bank:1 select:MB(0X24, 12) readWrite:MB(0x34, 3) support:SUP1];
                lo[@"PM4"]  = [PGWXLayout layoutWithName:@"PM4" number:idx++ bank:1 select:MB(0X24, 16) readWrite:MB(0x34, 4) support:SUP1];
                lo[@"PM5"]  = [PGWXLayout layoutWithName:@"PM5" number:idx++ bank:1 select:MB(0X24, 20) readWrite:MB(0x34, 5) support:SUP1];
                lo[@"PM6"]  = [PGWXLayout layoutWithName:@"PM6" number:idx++ bank:1 select:MB(0X24, 24) readWrite:MB(0x34, 6) support:SUP1];
                lo[@"PM7"]  = [PGWXLayout layoutWithName:@"PM7" number:idx bank:1 select:MB(0X24, 28) readWrite:MB(0x34, 7) support:SUP1];

                self->_layout = [NSDictionary dictionaryWithDictionary:lo];
            }
        }
        @finally {
            [self unlock];
        }

        return self->_layout;
    }

    -(NSArray<PGWXAddr *> *)baseAddresses {
        [self lock];

        @try {
            if(self->_baseAddresses.count == 0) {
                self->_baseAddresses = @[[PGWXAddr address:0x01C20000 offset:0x00000800], [PGWXAddr address:0x01F02000 offset:0x00000C00]];
            }
        }
        @finally {
            [self unlock];
        }

        return self->_baseAddresses;
    }
@end

@implementation PGWXSOCAllwinnerH3 {
    }

    -(NSString *)chipSet {
        return @"H3";
    }

    -(NSDictionary<NSString *, PGWXLayout *> *)layout {
        [self lock];

        @try {
            if(self->_layout.count == 0) {
                NSMutableDictionary *lo = [NSMutableDictionary new];
                NSUInteger          idx = 0;

                lo[@"PA0"]  = [PGWXLayout layoutWithName:@"PA0" number:idx++ bank:0 select:MB(0x00, 0) readWrite:MB(0x10, 0) support:SUP2];
                lo[@"PA1"]  = [PGWXLayout layoutWithName:@"PA1" number:idx++ bank:0 select:MB(0x00, 4) readWrite:MB(0x10, 1) support:SUP2];
                lo[@"PA2"]  = [PGWXLayout layoutWithName:@"PA2" number:idx++ bank:0 select:MB(0x00, 8) readWrite:MB(0x10, 2) support:SUP2];
                lo[@"PA3"]  = [PGWXLayout layoutWithName:@"PA3" number:idx++ bank:0 select:MB(0x00, 12) readWrite:MB(0x10, 3) support:SUP2];
                lo[@"PA4"]  = [PGWXLayout layoutWithName:@"PA4" number:idx++ bank:0 select:MB(0x00, 16) readWrite:MB(0x10, 4) support:SUP2];
                lo[@"PA5"]  = [PGWXLayout layoutWithName:@"PA5" number:idx++ bank:0 select:MB(0x00, 20) readWrite:MB(0x10, 5) support:SUP2];
                lo[@"PA6"]  = [PGWXLayout layoutWithName:@"PA6" number:idx++ bank:0 select:MB(0x00, 24) readWrite:MB(0x10, 6) support:SUP2];
                lo[@"PA7"]  = [PGWXLayout layoutWithName:@"PA7" number:idx++ bank:0 select:MB(0x00, 28) readWrite:MB(0x10, 7) support:SUP2];
                lo[@"PA8"]  = [PGWXLayout layoutWithName:@"PA8" number:idx++ bank:0 select:MB(0x04, 0) readWrite:MB(0x10, 8) support:SUP2];
                lo[@"PA9"]  = [PGWXLayout layoutWithName:@"PA9" number:idx++ bank:0 select:MB(0x04, 4) readWrite:MB(0x10, 9) support:SUP2];
                lo[@"PA10"] = [PGWXLayout layoutWithName:@"PA10" number:idx++ bank:0 select:MB(0x04, 8) readWrite:MB(0x10, 10) support:SUP2];
                lo[@"PA11"] = [PGWXLayout layoutWithName:@"PA11" number:idx++ bank:0 select:MB(0x04, 12) readWrite:MB(0x10, 11) support:SUP2];
                lo[@"PA12"] = [PGWXLayout layoutWithName:@"PA12" number:idx++ bank:0 select:MB(0x04, 16) readWrite:MB(0x10, 12) support:SUP2];
                lo[@"PA13"] = [PGWXLayout layoutWithName:@"PA13" number:idx++ bank:0 select:MB(0x04, 20) readWrite:MB(0x10, 13) support:SUP2];
                lo[@"PA14"] = [PGWXLayout layoutWithName:@"PA14" number:idx++ bank:0 select:MB(0x04, 24) readWrite:MB(0x10, 14) support:SUP2];
                lo[@"PA15"] = [PGWXLayout layoutWithName:@"PA15" number:idx++ bank:0 select:MB(0x04, 28) readWrite:MB(0x10, 15) support:SUP2];
                lo[@"PA16"] = [PGWXLayout layoutWithName:@"PA16" number:idx++ bank:0 select:MB(0x08, 0) readWrite:MB(0x10, 16) support:SUP2];
                lo[@"PA17"] = [PGWXLayout layoutWithName:@"PA17" number:idx++ bank:0 select:MB(0x08, 4) readWrite:MB(0x10, 17) support:SUP2];
                lo[@"PA18"] = [PGWXLayout layoutWithName:@"PA18" number:idx++ bank:0 select:MB(0x08, 8) readWrite:MB(0x10, 18) support:SUP2];
                lo[@"PA19"] = [PGWXLayout layoutWithName:@"PA19" number:idx++ bank:0 select:MB(0x08, 12) readWrite:MB(0x10, 19) support:SUP2];
                lo[@"PA20"] = [PGWXLayout layoutWithName:@"PA20" number:idx++ bank:0 select:MB(0x08, 16) readWrite:MB(0x10, 20) support:SUP2];
                lo[@"PA21"] = [PGWXLayout layoutWithName:@"PA21" number:idx++ bank:0 select:MB(0x08, 20) readWrite:MB(0x10, 21) support:SUP2];
                lo[@"PC0"]  = [PGWXLayout layoutWithName:@"PC0" number:idx++ bank:0 select:MB(0x48, 0) readWrite:MB(0x58, 0) support:SUP1];
                lo[@"PC1"]  = [PGWXLayout layoutWithName:@"PC1" number:idx++ bank:0 select:MB(0x48, 4) readWrite:MB(0x58, 1) support:SUP1];
                lo[@"PC2"]  = [PGWXLayout layoutWithName:@"PC2" number:idx++ bank:0 select:MB(0x48, 8) readWrite:MB(0x58, 2) support:SUP1];
                lo[@"PC3"]  = [PGWXLayout layoutWithName:@"PC3" number:idx++ bank:0 select:MB(0x48, 12) readWrite:MB(0x58, 3) support:SUP1];
                lo[@"PC4"]  = [PGWXLayout layoutWithName:@"PC4" number:idx++ bank:0 select:MB(0x48, 16) readWrite:MB(0x58, 4) support:SUP1];
                lo[@"PC5"]  = [PGWXLayout layoutWithName:@"PC5" number:idx++ bank:0 select:MB(0x48, 20) readWrite:MB(0x58, 5) support:SUP1];
                lo[@"PC6"]  = [PGWXLayout layoutWithName:@"PC6" number:idx++ bank:0 select:MB(0x48, 24) readWrite:MB(0x58, 6) support:SUP1];
                lo[@"PC7"]  = [PGWXLayout layoutWithName:@"PC7" number:idx++ bank:0 select:MB(0x48, 28) readWrite:MB(0x58, 7) support:SUP1];
                lo[@"PC8"]  = [PGWXLayout layoutWithName:@"PC8" number:idx++ bank:0 select:MB(0x4C, 0) readWrite:MB(0x58, 8) support:SUP1];
                lo[@"PC9"]  = [PGWXLayout layoutWithName:@"PC9" number:idx++ bank:0 select:MB(0x4C, 4) readWrite:MB(0x58, 9) support:SUP1];
                lo[@"PC10"] = [PGWXLayout layoutWithName:@"PC10" number:idx++ bank:0 select:MB(0x4C, 8) readWrite:MB(0x58, 10) support:SUP1];
                lo[@"PC11"] = [PGWXLayout layoutWithName:@"PC11" number:idx++ bank:0 select:MB(0x4C, 12) readWrite:MB(0x58, 11) support:SUP1];
                lo[@"PC12"] = [PGWXLayout layoutWithName:@"PC12" number:idx++ bank:0 select:MB(0x4C, 16) readWrite:MB(0x58, 12) support:SUP1];
                lo[@"PC13"] = [PGWXLayout layoutWithName:@"PC13" number:idx++ bank:0 select:MB(0x4C, 20) readWrite:MB(0x58, 13) support:SUP1];
                lo[@"PC14"] = [PGWXLayout layoutWithName:@"PC14" number:idx++ bank:0 select:MB(0x4C, 24) readWrite:MB(0x58, 14) support:SUP1];
                lo[@"PC15"] = [PGWXLayout layoutWithName:@"PC15" number:idx++ bank:0 select:MB(0x4C, 28) readWrite:MB(0x58, 15) support:SUP1];
                lo[@"PC16"] = [PGWXLayout layoutWithName:@"PC16" number:idx++ bank:0 select:MB(0x50, 0) readWrite:MB(0x58, 16) support:SUP1];
                lo[@"PC17"] = [PGWXLayout layoutWithName:@"PC17" number:idx++ bank:0 select:MB(0x50, 4) readWrite:MB(0x58, 17) support:SUP1];
                lo[@"PC18"] = [PGWXLayout layoutWithName:@"PC18" number:idx++ bank:0 select:MB(0x50, 8) readWrite:MB(0x58, 18) support:SUP1];
                lo[@"PD0"]  = [PGWXLayout layoutWithName:@"PD0" number:idx++ bank:0 select:MB(0x6C, 0) readWrite:MB(0x7C, 0) support:SUP1];
                lo[@"PD1"]  = [PGWXLayout layoutWithName:@"PD1" number:idx++ bank:0 select:MB(0x6C, 4) readWrite:MB(0x7C, 1) support:SUP1];
                lo[@"PD2"]  = [PGWXLayout layoutWithName:@"PD2" number:idx++ bank:0 select:MB(0x6C, 8) readWrite:MB(0x7C, 2) support:SUP1];
                lo[@"PD3"]  = [PGWXLayout layoutWithName:@"PD3" number:idx++ bank:0 select:MB(0x6C, 12) readWrite:MB(0x7C, 3) support:SUP1];
                lo[@"PD4"]  = [PGWXLayout layoutWithName:@"PD4" number:idx++ bank:0 select:MB(0x6C, 16) readWrite:MB(0x7C, 4) support:SUP1];
                lo[@"PD5"]  = [PGWXLayout layoutWithName:@"PD5" number:idx++ bank:0 select:MB(0x6C, 20) readWrite:MB(0x7C, 5) support:SUP1];
                lo[@"PD6"]  = [PGWXLayout layoutWithName:@"PD6" number:idx++ bank:0 select:MB(0x6C, 24) readWrite:MB(0x7C, 6) support:SUP1];
                lo[@"PD7"]  = [PGWXLayout layoutWithName:@"PD7" number:idx++ bank:0 select:MB(0x6C, 28) readWrite:MB(0x7C, 7) support:SUP1];
                lo[@"PD8"]  = [PGWXLayout layoutWithName:@"PD8" number:idx++ bank:0 select:MB(0x70, 0) readWrite:MB(0x7C, 8) support:SUP1];
                lo[@"PD9"]  = [PGWXLayout layoutWithName:@"PD9" number:idx++ bank:0 select:MB(0x70, 4) readWrite:MB(0x7C, 9) support:SUP1];
                lo[@"PD10"] = [PGWXLayout layoutWithName:@"PD10" number:idx++ bank:0 select:MB(0x70, 8) readWrite:MB(0x7C, 10) support:SUP1];
                lo[@"PD11"] = [PGWXLayout layoutWithName:@"PD11" number:idx++ bank:0 select:MB(0x70, 12) readWrite:MB(0x7C, 11) support:SUP1];
                lo[@"PD12"] = [PGWXLayout layoutWithName:@"PD12" number:idx++ bank:0 select:MB(0x70, 16) readWrite:MB(0x7C, 12) support:SUP1];
                lo[@"PD13"] = [PGWXLayout layoutWithName:@"PD13" number:idx++ bank:0 select:MB(0x70, 20) readWrite:MB(0x7C, 13) support:SUP1];
                lo[@"PD14"] = [PGWXLayout layoutWithName:@"PD14" number:idx++ bank:0 select:MB(0x70, 24) readWrite:MB(0x7C, 14) support:SUP1];
                lo[@"PD15"] = [PGWXLayout layoutWithName:@"PD15" number:idx++ bank:0 select:MB(0x70, 28) readWrite:MB(0x7C, 15) support:SUP1];
                lo[@"PD16"] = [PGWXLayout layoutWithName:@"PD16" number:idx++ bank:0 select:MB(0x74, 0) readWrite:MB(0x7C, 16) support:SUP1];
                lo[@"PD17"] = [PGWXLayout layoutWithName:@"PD17" number:idx++ bank:0 select:MB(0x74, 4) readWrite:MB(0x7C, 17) support:SUP1];
                lo[@"PE0"]  = [PGWXLayout layoutWithName:@"PE0" number:idx++ bank:0 select:MB(0x90, 0) readWrite:MB(0xA0, 0) support:SUP1];
                lo[@"PE1"]  = [PGWXLayout layoutWithName:@"PE1" number:idx++ bank:0 select:MB(0x90, 4) readWrite:MB(0xA0, 1) support:SUP1];
                lo[@"PE2"]  = [PGWXLayout layoutWithName:@"PE2" number:idx++ bank:0 select:MB(0x90, 8) readWrite:MB(0xA0, 2) support:SUP1];
                lo[@"PE3"]  = [PGWXLayout layoutWithName:@"PE3" number:idx++ bank:0 select:MB(0x90, 12) readWrite:MB(0xA0, 3) support:SUP1];
                lo[@"PE4"]  = [PGWXLayout layoutWithName:@"PE4" number:idx++ bank:0 select:MB(0x90, 16) readWrite:MB(0xA0, 4) support:SUP1];
                lo[@"PE5"]  = [PGWXLayout layoutWithName:@"PE5" number:idx++ bank:0 select:MB(0x90, 20) readWrite:MB(0xA0, 5) support:SUP1];
                lo[@"PE6"]  = [PGWXLayout layoutWithName:@"PE6" number:idx++ bank:0 select:MB(0x90, 24) readWrite:MB(0xA0, 6) support:SUP1];
                lo[@"PE7"]  = [PGWXLayout layoutWithName:@"PE7" number:idx++ bank:0 select:MB(0x90, 28) readWrite:MB(0xA0, 7) support:SUP1];
                lo[@"PE8"]  = [PGWXLayout layoutWithName:@"PE8" number:idx++ bank:0 select:MB(0x94, 0) readWrite:MB(0xA0, 8) support:SUP1];
                lo[@"PE9"]  = [PGWXLayout layoutWithName:@"PE9" number:idx++ bank:0 select:MB(0x94, 4) readWrite:MB(0xA0, 9) support:SUP1];
                lo[@"PE10"] = [PGWXLayout layoutWithName:@"PE10" number:idx++ bank:0 select:MB(0x94, 8) readWrite:MB(0xA0, 10) support:SUP1];
                lo[@"PE11"] = [PGWXLayout layoutWithName:@"PE11" number:idx++ bank:0 select:MB(0x94, 12) readWrite:MB(0xA0, 11) support:SUP1];
                lo[@"PE12"] = [PGWXLayout layoutWithName:@"PE12" number:idx++ bank:0 select:MB(0x94, 16) readWrite:MB(0xA0, 12) support:SUP1];
                lo[@"PE13"] = [PGWXLayout layoutWithName:@"PE13" number:idx++ bank:0 select:MB(0x94, 20) readWrite:MB(0xA0, 13) support:SUP1];
                lo[@"PE14"] = [PGWXLayout layoutWithName:@"PE14" number:idx++ bank:0 select:MB(0x94, 24) readWrite:MB(0xA0, 14) support:SUP1];
                lo[@"PE15"] = [PGWXLayout layoutWithName:@"PE15" number:idx++ bank:0 select:MB(0x94, 28) readWrite:MB(0xA0, 15) support:SUP1];
                lo[@"PF0"]  = [PGWXLayout layoutWithName:@"PF0" number:idx++ bank:0 select:MB(0xB4, 0) readWrite:MB(0xC4, 0) support:SUP1];
                lo[@"PF1"]  = [PGWXLayout layoutWithName:@"PF1" number:idx++ bank:0 select:MB(0xB4, 4) readWrite:MB(0xC4, 1) support:SUP1];
                lo[@"PF2"]  = [PGWXLayout layoutWithName:@"PF2" number:idx++ bank:0 select:MB(0xB4, 8) readWrite:MB(0xC4, 2) support:SUP1];
                lo[@"PF3"]  = [PGWXLayout layoutWithName:@"PF3" number:idx++ bank:0 select:MB(0xB4, 12) readWrite:MB(0xC4, 3) support:SUP1];
                lo[@"PF4"]  = [PGWXLayout layoutWithName:@"PF4" number:idx++ bank:0 select:MB(0xB4, 16) readWrite:MB(0xC4, 4) support:SUP1];
                lo[@"PF5"]  = [PGWXLayout layoutWithName:@"PF5" number:idx++ bank:0 select:MB(0xB4, 20) readWrite:MB(0xC4, 5) support:SUP1];
                lo[@"PF6"]  = [PGWXLayout layoutWithName:@"PF6" number:idx++ bank:0 select:MB(0xB4, 24) readWrite:MB(0xC4, 6) support:SUP1];
                lo[@"PG0"]  = [PGWXLayout layoutWithName:@"PG0" number:idx++ bank:0 select:MB(0xD8, 0) readWrite:MB(0xE8, 0) support:SUP2];
                lo[@"PG1"]  = [PGWXLayout layoutWithName:@"PG1" number:idx++ bank:0 select:MB(0xD8, 4) readWrite:MB(0xE8, 1) support:SUP2];
                lo[@"PG2"]  = [PGWXLayout layoutWithName:@"PG2" number:idx++ bank:0 select:MB(0xD8, 8) readWrite:MB(0xE8, 2) support:SUP2];
                lo[@"PG3"]  = [PGWXLayout layoutWithName:@"PG3" number:idx++ bank:0 select:MB(0xD8, 12) readWrite:MB(0xE8, 3) support:SUP2];
                lo[@"PG4"]  = [PGWXLayout layoutWithName:@"PG4" number:idx++ bank:0 select:MB(0xD8, 16) readWrite:MB(0xE8, 4) support:SUP2];
                lo[@"PG5"]  = [PGWXLayout layoutWithName:@"PG5" number:idx++ bank:0 select:MB(0xD8, 20) readWrite:MB(0xE8, 5) support:SUP2];
                lo[@"PG6"]  = [PGWXLayout layoutWithName:@"PG6" number:idx++ bank:0 select:MB(0xD8, 24) readWrite:MB(0xE8, 6) support:SUP2];
                lo[@"PG7"]  = [PGWXLayout layoutWithName:@"PG7" number:idx++ bank:0 select:MB(0xD8, 28) readWrite:MB(0xE8, 7) support:SUP2];
                lo[@"PG8"]  = [PGWXLayout layoutWithName:@"PG8" number:idx++ bank:0 select:MB(0xDC, 0) readWrite:MB(0xE8, 8) support:SUP2];
                lo[@"PG9"]  = [PGWXLayout layoutWithName:@"PG9" number:idx++ bank:0 select:MB(0xDC, 4) readWrite:MB(0xE8, 9) support:SUP2];
                lo[@"PG10"] = [PGWXLayout layoutWithName:@"PG10" number:idx++ bank:0 select:MB(0xDC, 8) readWrite:MB(0xE8, 10) support:SUP2];
                lo[@"PG11"] = [PGWXLayout layoutWithName:@"PG11" number:idx++ bank:0 select:MB(0xDC, 12) readWrite:MB(0xE8, 11) support:SUP2];
                lo[@"PG12"] = [PGWXLayout layoutWithName:@"PG12" number:idx++ bank:0 select:MB(0xDC, 12) readWrite:MB(0xE8, 12) support:SUP2];
                lo[@"PG13"] = [PGWXLayout layoutWithName:@"PG13" number:idx++ bank:0 select:MB(0xDC, 12) readWrite:MB(0xE8, 13) support:SUP2];
                lo[@"PL0"]  = [PGWXLayout layoutWithName:@"PL0" number:idx++ bank:1 select:MB(0x00, 0) readWrite:MB(0x10, 0) support:SUP1];
                lo[@"PL1"]  = [PGWXLayout layoutWithName:@"PL1" number:idx++ bank:1 select:MB(0x00, 4) readWrite:MB(0x10, 1) support:SUP1];
                lo[@"PL2"]  = [PGWXLayout layoutWithName:@"PL2" number:idx++ bank:1 select:MB(0x00, 8) readWrite:MB(0x10, 2) support:SUP1];
                lo[@"PL3"]  = [PGWXLayout layoutWithName:@"PL3" number:idx++ bank:1 select:MB(0x00, 12) readWrite:MB(0x10, 3) support:SUP1];
                lo[@"PL4"]  = [PGWXLayout layoutWithName:@"PL4" number:idx++ bank:1 select:MB(0x00, 16) readWrite:MB(0x10, 4) support:SUP1];
                lo[@"PL5"]  = [PGWXLayout layoutWithName:@"PL5" number:idx++ bank:1 select:MB(0x00, 20) readWrite:MB(0x10, 5) support:SUP1];
                lo[@"PL6"]  = [PGWXLayout layoutWithName:@"PL6" number:idx++ bank:1 select:MB(0x00, 24) readWrite:MB(0x10, 6) support:SUP1];
                lo[@"PL7"]  = [PGWXLayout layoutWithName:@"PL7" number:idx++ bank:1 select:MB(0x00, 28) readWrite:MB(0x10, 7) support:SUP1];
                lo[@"PL8"]  = [PGWXLayout layoutWithName:@"PL8" number:idx++ bank:1 select:MB(0x04, 0) readWrite:MB(0x10, 8) support:SUP1];
                lo[@"PL9"]  = [PGWXLayout layoutWithName:@"PL9" number:idx++ bank:1 select:MB(0x04, 4) readWrite:MB(0x10, 9) support:SUP1];
                lo[@"PL10"] = [PGWXLayout layoutWithName:@"PL10" number:idx++ bank:1 select:MB(0x04, 8) readWrite:MB(0x10, 10) support:SUP1];
                lo[@"PL11"] = [PGWXLayout layoutWithName:@"PL11" number:idx bank:1 select:MB(0x04, 12) readWrite:MB(0x10, 11) support:SUP1];

                self->_layout = [NSDictionary dictionaryWithDictionary:lo];
            }
        }
        @finally {
            [self unlock];
        }

        return self->_layout;
    }

@end
