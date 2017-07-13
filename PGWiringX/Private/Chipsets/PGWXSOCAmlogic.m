/******************************************************************************************************************************//**
 *     PROJECT: PGWiringX
 *    FILENAME: PGWXSOCAmlogic.m
 *         IDE: AppCode
 *      AUTHOR: Galen Rhodes
 *        DATE: 6/26/17 2:51 PM
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

#import "PGWXSOCAmlogic.h"
#import "PGWXBit.h"

#define SUP1     (PGWX_FUNCTION_DIGITAL | PGWX_FUNCTION_INTERRUPT)
#define MB(b, o)  PGWXMakeBit((b),(o))

@implementation PGWXSOCAmlogicS805 {
    @public
        NSArray<PGWXAddr *>                    *_baseAddresses;
        NSDictionary<NSString *, PGWXLayout *> *_layout;
    }

    -(NSString *)brandName {
        return @"Amlogic";
    }

    -(NSString *)chipSet {
        return @"S805";
    }

    -(NSArray<PGWXAddr *> *)baseAddresses {
        [self lock];

        @try {
            if(_baseAddresses.count == 0) {
                _baseAddresses = @[[PGWXAddr address:0xC1108000 offset:0x00000000], [PGWXAddr address:0xC8100000 offset:0x00000000]];
            }
        }
        @finally {
            [self unlock];
        }

        return _baseAddresses;
    }

    -(NSDictionary<NSString *, PGWXLayout *> *)layout {
        [self lock];

        @try {
            if(_layout.count == 0) {
                NSUInteger          i   = 0;
                NSMutableDictionary *lo = [NSMutableDictionary new];

                lo[@"GPIOAO_0"]  = [PGWXLayout layoutWithName:@"GPIOAO_0" number:i++ bank:1 select:MB(0x24, 0) read:MB(0x28, 0) write:MB(0x24, 16) support:SUP1];
                lo[@"GPIOAO_1"]  = [PGWXLayout layoutWithName:@"GPIOAO_1" number:i++ bank:1 select:MB(0x24, 1) read:MB(0x28, 1) write:MB(0x24, 17) support:SUP1];
                lo[@"GPIOAO_2"]  = [PGWXLayout layoutWithName:@"GPIOAO_2" number:i++ bank:1 select:MB(0x24, 2) read:MB(0x28, 2) write:MB(0x24, 18) support:SUP1];
                lo[@"GPIOAO_3"]  = [PGWXLayout layoutWithName:@"GPIOAO_3" number:i++ bank:1 select:MB(0x24, 3) read:MB(0x28, 3) write:MB(0x24, 19) support:SUP1];
                lo[@"GPIOAO_4"]  = [PGWXLayout layoutWithName:@"GPIOAO_4" number:i++ bank:1 select:MB(0x24, 4) read:MB(0x28, 4) write:MB(0x24, 20) support:SUP1];
                lo[@"GPIOAO_5"]  = [PGWXLayout layoutWithName:@"GPIOAO_5" number:i++ bank:1 select:MB(0x24, 5) read:MB(0x28, 5) write:MB(0x24, 21) support:SUP1];
                lo[@"GPIOAO_6"]  = [PGWXLayout layoutWithName:@"GPIOAO_6" number:i++ bank:1 select:MB(0x24, 6) read:MB(0x28, 6) write:MB(0x24, 22) support:SUP1];
                lo[@"GPIOAO_7"]  = [PGWXLayout layoutWithName:@"GPIOAO_7" number:i++ bank:1 select:MB(0x24, 7) read:MB(0x28, 7) write:MB(0x24, 23) support:SUP1];
                lo[@"GPIOAO_8"]  = [PGWXLayout layoutWithName:@"GPIOAO_8" number:i++ bank:1 select:MB(0x24, 8) read:MB(0x28, 8) write:MB(0x24, 24) support:SUP1];
                lo[@"GPIOAO_9"]  = [PGWXLayout layoutWithName:@"GPIOAO_9" number:i++ bank:1 select:MB(0x24, 9) read:MB(0x28, 9) write:MB(0x24, 25) support:SUP1];
                lo[@"GPIOAO_10"] = [PGWXLayout layoutWithName:@"GPIOAO_10" number:i++ bank:1 select:MB(0x24, 10) read:MB(0x28, 10) write:MB(0x24, 26) support:SUP1];
                lo[@"GPIOAO_11"] = [PGWXLayout layoutWithName:@"GPIOAO_11" number:i++ bank:1 select:MB(0x24, 11) read:MB(0x28, 11) write:MB(0x24, 27) support:SUP1];
                lo[@"GPIOAO_12"] = [PGWXLayout layoutWithName:@"GPIOAO_12" number:i++ bank:1 select:MB(0x24, 12) read:MB(0x28, 12) write:MB(0x24, 28) support:SUP1];
                lo[@"GPIOAO_13"] = [PGWXLayout layoutWithName:@"GPIOAO_13" number:i++ bank:1 select:MB(0x24, 13) read:MB(0x28, 13) write:MB(0x24, 29) support:SUP1];
                lo[@"GPIOH_0"]   = [PGWXLayout layoutWithName:@"GPIOH_0" number:i++ bank:0 select:MB(0x54, 19) read:MB(0x5C, 19) write:MB(0x58, 19) support:SUP1];
                lo[@"GPIOH_1"]   = [PGWXLayout layoutWithName:@"GPIOH_1" number:i++ bank:0 select:MB(0x54, 20) read:MB(0x5C, 20) write:MB(0x58, 20) support:SUP1];
                lo[@"GPIOH_2"]   = [PGWXLayout layoutWithName:@"GPIOH_2" number:i++ bank:0 select:MB(0x54, 21) read:MB(0x5C, 21) write:MB(0x58, 21) support:SUP1];
                lo[@"GPIOH_3"]   = [PGWXLayout layoutWithName:@"GPIOH_3" number:i++ bank:0 select:MB(0x54, 22) read:MB(0x5C, 22) write:MB(0x58, 22) support:SUP1];
                lo[@"GPIOH_4"]   = [PGWXLayout layoutWithName:@"GPIOH_4" number:i++ bank:0 select:MB(0x54, 23) read:MB(0x5C, 23) write:MB(0x58, 23) support:SUP1];
                lo[@"GPIOH_5"]   = [PGWXLayout layoutWithName:@"GPIOH_5" number:i++ bank:0 select:MB(0x54, 24) read:MB(0x5C, 24) write:MB(0x58, 24) support:SUP1];
                lo[@"GPIOH_6"]   = [PGWXLayout layoutWithName:@"GPIOH_6" number:i++ bank:0 select:MB(0x54, 25) read:MB(0x5C, 25) write:MB(0x58, 25) support:SUP1];
                lo[@"GPIOH_7"]   = [PGWXLayout layoutWithName:@"GPIOH_7" number:i++ bank:0 select:MB(0x54, 26) read:MB(0x5C, 26) write:MB(0x58, 26) support:SUP1];
                lo[@"GPIOH_8"]   = [PGWXLayout layoutWithName:@"GPIOH_8" number:i++ bank:0 select:MB(0x54, 27) read:MB(0x5C, 27) write:MB(0x58, 27) support:SUP1];
                lo[@"GPIOH_9"]   = [PGWXLayout layoutWithName:@"GPIOH_9" number:i++ bank:0 select:MB(0x54, 28) read:MB(0x5C, 28) write:MB(0x58, 28) support:SUP1];
                lo[@"BOOT_0"]    = [PGWXLayout layoutWithName:@"BOOT_0" number:i++ bank:0 select:MB(0x54, 0) read:MB(0x5C, 0) write:MB(0x58, 0) support:SUP1];
                lo[@"BOOT_1"]    = [PGWXLayout layoutWithName:@"BOOT_1" number:i++ bank:0 select:MB(0x54, 1) read:MB(0x5C, 1) write:MB(0x58, 1) support:SUP1];
                lo[@"BOOT_2"]    = [PGWXLayout layoutWithName:@"BOOT_2" number:i++ bank:0 select:MB(0x54, 2) read:MB(0x5C, 2) write:MB(0x58, 2) support:SUP1];
                lo[@"BOOT_3"]    = [PGWXLayout layoutWithName:@"BOOT_3" number:i++ bank:0 select:MB(0x54, 3) read:MB(0x5C, 3) write:MB(0x58, 3) support:SUP1];
                lo[@"BOOT_4"]    = [PGWXLayout layoutWithName:@"BOOT_4" number:i++ bank:0 select:MB(0x54, 4) read:MB(0x5C, 4) write:MB(0x58, 4) support:SUP1];
                lo[@"BOOT_5"]    = [PGWXLayout layoutWithName:@"BOOT_5" number:i++ bank:0 select:MB(0x54, 5) read:MB(0x5C, 5) write:MB(0x58, 5) support:SUP1];
                lo[@"BOOT_6"]    = [PGWXLayout layoutWithName:@"BOOT_6" number:i++ bank:0 select:MB(0x54, 6) read:MB(0x5C, 6) write:MB(0x58, 6) support:SUP1];
                lo[@"BOOT_7"]    = [PGWXLayout layoutWithName:@"BOOT_7" number:i++ bank:0 select:MB(0x54, 7) read:MB(0x5C, 7) write:MB(0x58, 7) support:SUP1];
                lo[@"BOOT_8"]    = [PGWXLayout layoutWithName:@"BOOT_8" number:i++ bank:0 select:MB(0x54, 8) read:MB(0x5C, 8) write:MB(0x58, 8) support:SUP1];
                lo[@"BOOT_9"]    = [PGWXLayout layoutWithName:@"BOOT_9" number:i++ bank:0 select:MB(0x54, 9) read:MB(0x5C, 9) write:MB(0x58, 9) support:SUP1];
                lo[@"BOOT_10"]   = [PGWXLayout layoutWithName:@"BOOT_10" number:i++ bank:0 select:MB(0x54, 10) read:MB(0x5C, 10) write:MB(0x58, 10) support:SUP1];
                lo[@"BOOT_11"]   = [PGWXLayout layoutWithName:@"BOOT_11" number:i++ bank:0 select:MB(0x54, 11) read:MB(0x5C, 11) write:MB(0x58, 11) support:SUP1];
                lo[@"BOOT_12"]   = [PGWXLayout layoutWithName:@"BOOT_12" number:i++ bank:0 select:MB(0x54, 12) read:MB(0x5C, 12) write:MB(0x58, 12) support:SUP1];
                lo[@"BOOT_13"]   = [PGWXLayout layoutWithName:@"BOOT_13" number:i++ bank:0 select:MB(0x54, 13) read:MB(0x5C, 13) write:MB(0x58, 13) support:SUP1];
                lo[@"BOOT_14"]   = [PGWXLayout layoutWithName:@"BOOT_14" number:i++ bank:0 select:MB(0x54, 14) read:MB(0x5C, 14) write:MB(0x58, 14) support:SUP1];
                lo[@"BOOT_15"]   = [PGWXLayout layoutWithName:@"BOOT_15" number:i++ bank:0 select:MB(0x54, 15) read:MB(0x5C, 15) write:MB(0x58, 15) support:SUP1];
                lo[@"BOOT_16"]   = [PGWXLayout layoutWithName:@"BOOT_16" number:i++ bank:0 select:MB(0x54, 16) read:MB(0x5C, 16) write:MB(0x58, 16) support:SUP1];
                lo[@"BOOT_17"]   = [PGWXLayout layoutWithName:@"BOOT_17" number:i++ bank:0 select:MB(0x54, 17) read:MB(0x5C, 17) write:MB(0x58, 17) support:SUP1];
                lo[@"BOOT_18"]   = [PGWXLayout layoutWithName:@"BOOT_18" number:i++ bank:0 select:MB(0x54, 18) read:MB(0x5C, 18) write:MB(0x58, 18) support:SUP1];
                lo[@"CARD_0"]    = [PGWXLayout layoutWithName:@"CARD_0" number:i++ bank:0 select:MB(0x30, 22) read:MB(0x38, 22) write:MB(0x34, 22) support:SUP1];
                lo[@"CARD_1"]    = [PGWXLayout layoutWithName:@"CARD_1" number:i++ bank:0 select:MB(0x30, 23) read:MB(0x38, 23) write:MB(0x34, 23) support:SUP1];
                lo[@"CARD_2"]    = [PGWXLayout layoutWithName:@"CARD_2" number:i++ bank:0 select:MB(0x30, 24) read:MB(0x38, 24) write:MB(0x34, 24) support:SUP1];
                lo[@"CARD_3"]    = [PGWXLayout layoutWithName:@"CARD_3" number:i++ bank:0 select:MB(0x30, 25) read:MB(0x38, 25) write:MB(0x34, 25) support:SUP1];
                lo[@"CARD_4"]    = [PGWXLayout layoutWithName:@"CARD_4" number:i++ bank:0 select:MB(0x30, 26) read:MB(0x38, 26) write:MB(0x34, 26) support:SUP1];
                lo[@"CARD_5"]    = [PGWXLayout layoutWithName:@"CARD_5" number:i++ bank:0 select:MB(0x30, 27) read:MB(0x38, 27) write:MB(0x34, 27) support:SUP1];
                lo[@"CARD_6"]    = [PGWXLayout layoutWithName:@"CARD_6" number:i++ bank:0 select:MB(0x30, 28) read:MB(0x38, 28) write:MB(0x34, 28) support:SUP1];
                lo[@"GPIODV_0"]  = [PGWXLayout layoutWithName:@"GPIODV_0" number:i++ bank:0 select:MB(0x48, 0) read:MB(0x50, 0) write:MB(0x4C, 0) support:SUP1];
                lo[@"GPIODV_1"]  = [PGWXLayout layoutWithName:@"GPIODV_1" number:i++ bank:0 select:MB(0x48, 1) read:MB(0x50, 1) write:MB(0x4C, 1) support:SUP1];
                lo[@"GPIODV_2"]  = [PGWXLayout layoutWithName:@"GPIODV_2" number:i++ bank:0 select:MB(0x48, 2) read:MB(0x50, 2) write:MB(0x4C, 2) support:SUP1];
                lo[@"GPIODV_3"]  = [PGWXLayout layoutWithName:@"GPIODV_3" number:i++ bank:0 select:MB(0x48, 3) read:MB(0x50, 3) write:MB(0x4C, 3) support:SUP1];
                lo[@"GPIODV_4"]  = [PGWXLayout layoutWithName:@"GPIODV_4" number:i++ bank:0 select:MB(0x48, 4) read:MB(0x50, 4) write:MB(0x4C, 4) support:SUP1];
                lo[@"GPIODV_5"]  = [PGWXLayout layoutWithName:@"GPIODV_5" number:i++ bank:0 select:MB(0x48, 5) read:MB(0x50, 5) write:MB(0x4C, 5) support:SUP1];
                lo[@"GPIODV_6"]  = [PGWXLayout layoutWithName:@"GPIODV_6" number:i++ bank:0 select:MB(0x48, 6) read:MB(0x50, 6) write:MB(0x4C, 6) support:SUP1];
                lo[@"GPIODV_7"]  = [PGWXLayout layoutWithName:@"GPIODV_7" number:i++ bank:0 select:MB(0x48, 7) read:MB(0x50, 7) write:MB(0x4C, 7) support:SUP1];
                lo[@"GPIODV_8"]  = [PGWXLayout layoutWithName:@"GPIODV_8" number:i++ bank:0 select:MB(0x48, 8) read:MB(0x50, 8) write:MB(0x4C, 8) support:SUP1];
                lo[@"GPIODV_9"]  = [PGWXLayout layoutWithName:@"GPIODV_9" number:i++ bank:0 select:MB(0x48, 9) read:MB(0x50, 9) write:MB(0x4C, 9) support:SUP1];
                lo[@"GPIODV_10"] = [PGWXLayout layoutWithName:@"GPIODV_10" number:i++ bank:0 select:MB(0x48, 10) read:MB(0x50, 10) write:MB(0x4C, 10) support:SUP1];
                lo[@"GPIODV_11"] = [PGWXLayout layoutWithName:@"GPIODV_11" number:i++ bank:0 select:MB(0x48, 11) read:MB(0x50, 11) write:MB(0x4C, 11) support:SUP1];
                lo[@"GPIODV_12"] = [PGWXLayout layoutWithName:@"GPIODV_12" number:i++ bank:0 select:MB(0x48, 12) read:MB(0x50, 12) write:MB(0x4C, 12) support:SUP1];
                lo[@"GPIODV_13"] = [PGWXLayout layoutWithName:@"GPIODV_13" number:i++ bank:0 select:MB(0x48, 13) read:MB(0x50, 13) write:MB(0x4C, 13) support:SUP1];
                lo[@"GPIODV_14"] = [PGWXLayout layoutWithName:@"GPIODV_14" number:i++ bank:0 select:MB(0x48, 14) read:MB(0x50, 14) write:MB(0x4C, 14) support:SUP1];
                lo[@"GPIODV_15"] = [PGWXLayout layoutWithName:@"GPIODV_15" number:i++ bank:0 select:MB(0x48, 15) read:MB(0x50, 15) write:MB(0x4C, 15) support:SUP1];
                lo[@"GPIODV_16"] = [PGWXLayout layoutWithName:@"GPIODV_16" number:i++ bank:0 select:MB(0x48, 16) read:MB(0x50, 16) write:MB(0x4C, 16) support:SUP1];
                lo[@"GPIODV_17"] = [PGWXLayout layoutWithName:@"GPIODV_17" number:i++ bank:0 select:MB(0x48, 17) read:MB(0x50, 17) write:MB(0x4C, 17) support:SUP1];
                lo[@"GPIODV_18"] = [PGWXLayout layoutWithName:@"GPIODV_18" number:i++ bank:0 select:MB(0x48, 18) read:MB(0x50, 18) write:MB(0x4C, 18) support:SUP1];
                lo[@"GPIODV_19"] = [PGWXLayout layoutWithName:@"GPIODV_19" number:i++ bank:0 select:MB(0x48, 19) read:MB(0x50, 19) write:MB(0x4C, 19) support:SUP1];
                lo[@"GPIODV_20"] = [PGWXLayout layoutWithName:@"GPIODV_20" number:i++ bank:0 select:MB(0x48, 20) read:MB(0x50, 20) write:MB(0x4C, 20) support:SUP1];
                lo[@"GPIODV_21"] = [PGWXLayout layoutWithName:@"GPIODV_21" number:i++ bank:0 select:MB(0x48, 21) read:MB(0x50, 21) write:MB(0x4C, 21) support:SUP1];
                lo[@"GPIODV_22"] = [PGWXLayout layoutWithName:@"GPIODV_22" number:i++ bank:0 select:MB(0x48, 22) read:MB(0x50, 22) write:MB(0x4C, 22) support:SUP1];
                lo[@"GPIODV_23"] = [PGWXLayout layoutWithName:@"GPIODV_23" number:i++ bank:0 select:MB(0x48, 23) read:MB(0x50, 23) write:MB(0x4C, 23) support:SUP1];
                lo[@"GPIODV_24"] = [PGWXLayout layoutWithName:@"GPIODV_24" number:i++ bank:0 select:MB(0x48, 24) read:MB(0x50, 24) write:MB(0x4C, 24) support:SUP1];
                lo[@"GPIODV_25"] = [PGWXLayout layoutWithName:@"GPIODV_25" number:i++ bank:0 select:MB(0x48, 25) read:MB(0x50, 25) write:MB(0x4C, 25) support:SUP1];
                lo[@"GPIODV_26"] = [PGWXLayout layoutWithName:@"GPIODV_26" number:i++ bank:0 select:MB(0x48, 26) read:MB(0x50, 26) write:MB(0x4C, 26) support:SUP1];
                lo[@"GPIODV_27"] = [PGWXLayout layoutWithName:@"GPIODV_27" number:i++ bank:0 select:MB(0x48, 27) read:MB(0x50, 27) write:MB(0x4C, 27) support:SUP1];
                lo[@"GPIODV_28"] = [PGWXLayout layoutWithName:@"GPIODV_28" number:i++ bank:0 select:MB(0x48, 28) read:MB(0x50, 28) write:MB(0x4C, 28) support:SUP1];
                lo[@"GPIODV_29"] = [PGWXLayout layoutWithName:@"GPIODV_29" number:i++ bank:0 select:MB(0x48, 29) read:MB(0x50, 29) write:MB(0x4C, 29) support:SUP1];
                lo[@"GPIOY_0"]   = [PGWXLayout layoutWithName:@"GPIOY_0" number:i++ bank:0 select:MB(0x3C, 0) read:MB(0x44, 0) write:MB(0x40, 0) support:SUP1];
                lo[@"GPIOY_1"]   = [PGWXLayout layoutWithName:@"GPIOY_1" number:i++ bank:0 select:MB(0x3C, 1) read:MB(0x44, 1) write:MB(0x40, 1) support:SUP1];
                lo[@"GPIOY_2"]   = [PGWXLayout layoutWithName:@"GPIOY_2" number:i++ bank:0 select:MB(0x3C, 2) read:MB(0x44, 2) write:MB(0x40, 2) support:SUP1];
                lo[@"GPIOY_3"]   = [PGWXLayout layoutWithName:@"GPIOY_3" number:i++ bank:0 select:MB(0x3C, 3) read:MB(0x44, 3) write:MB(0x40, 3) support:SUP1];
                lo[@"GPIOY_4"]   = [PGWXLayout layoutWithName:@"GPIOY_4" number:i++ bank:0 select:MB(0x3C, 4) read:MB(0x44, 4) write:MB(0x40, 4) support:SUP1];
                lo[@"GPIOY_5"]   = [PGWXLayout layoutWithName:@"GPIOY_5" number:i++ bank:0 select:MB(0x3C, 5) read:MB(0x44, 5) write:MB(0x40, 5) support:SUP1];
                lo[@"GPIOY_6"]   = [PGWXLayout layoutWithName:@"GPIOY_6" number:i++ bank:0 select:MB(0x3C, 6) read:MB(0x44, 6) write:MB(0x40, 6) support:SUP1];
                lo[@"GPIOY_7"]   = [PGWXLayout layoutWithName:@"GPIOY_7" number:i++ bank:0 select:MB(0x3C, 7) read:MB(0x44, 7) write:MB(0x40, 7) support:SUP1];
                lo[@"GPIOY_8"]   = [PGWXLayout layoutWithName:@"GPIOY_8" number:i++ bank:0 select:MB(0x3C, 8) read:MB(0x44, 8) write:MB(0x40, 8) support:SUP1];
                lo[@"GPIOY_9"]   = [PGWXLayout layoutWithName:@"GPIOY_9" number:i++ bank:0 select:MB(0x3C, 9) read:MB(0x44, 9) write:MB(0x40, 9) support:SUP1];
                lo[@"GPIOY_10"]  = [PGWXLayout layoutWithName:@"GPIOY_10" number:i++ bank:0 select:MB(0x3C, 10) read:MB(0x44, 10) write:MB(0x40, 10) support:SUP1];
                lo[@"GPIOY_11"]  = [PGWXLayout layoutWithName:@"GPIOY_11" number:i++ bank:0 select:MB(0x3C, 11) read:MB(0x44, 11) write:MB(0x40, 11) support:SUP1];
                lo[@"GPIOY_12"]  = [PGWXLayout layoutWithName:@"GPIOY_12" number:i++ bank:0 select:MB(0x3C, 12) read:MB(0x44, 12) write:MB(0x40, 12) support:SUP1];
                lo[@"GPIOY_13"]  = [PGWXLayout layoutWithName:@"GPIOY_13" number:i++ bank:0 select:MB(0x3C, 13) read:MB(0x44, 13) write:MB(0x40, 13) support:SUP1];
                lo[@"GPIOY_14"]  = [PGWXLayout layoutWithName:@"GPIOY_14" number:i++ bank:0 select:MB(0x3C, 14) read:MB(0x44, 14) write:MB(0x40, 14) support:SUP1];
                lo[@"GPIOY_15"]  = [PGWXLayout layoutWithName:@"GPIOY_15" number:i++ bank:0 select:MB(0x3C, 15) read:MB(0x44, 15) write:MB(0x40, 15) support:SUP1];
                lo[@"GPIOY_16"]  = [PGWXLayout layoutWithName:@"GPIOY_16" number:i++ bank:0 select:MB(0x3C, 16) read:MB(0x44, 16) write:MB(0x40, 16) support:SUP1];
                lo[@"GPIOX_0"]   = [PGWXLayout layoutWithName:@"GPIOX_0" number:i++ bank:0 select:MB(0x30, 0) read:MB(0x38, 0) write:MB(0x34, 0) support:SUP1];
                lo[@"GPIOX_1"]   = [PGWXLayout layoutWithName:@"GPIOX_1" number:i++ bank:0 select:MB(0x30, 1) read:MB(0x38, 1) write:MB(0x34, 1) support:SUP1];
                lo[@"GPIOX_2"]   = [PGWXLayout layoutWithName:@"GPIOX_2" number:i++ bank:0 select:MB(0x30, 2) read:MB(0x38, 2) write:MB(0x34, 2) support:SUP1];
                lo[@"GPIOX_3"]   = [PGWXLayout layoutWithName:@"GPIOX_3" number:i++ bank:0 select:MB(0x30, 3) read:MB(0x38, 3) write:MB(0x34, 3) support:SUP1];
                lo[@"GPIOX_4"]   = [PGWXLayout layoutWithName:@"GPIOX_4" number:i++ bank:0 select:MB(0x30, 4) read:MB(0x38, 4) write:MB(0x34, 4) support:SUP1];
                lo[@"GPIOX_5"]   = [PGWXLayout layoutWithName:@"GPIOX_5" number:i++ bank:0 select:MB(0x30, 5) read:MB(0x38, 5) write:MB(0x34, 5) support:SUP1];
                lo[@"GPIOX_6"]   = [PGWXLayout layoutWithName:@"GPIOX_6" number:i++ bank:0 select:MB(0x30, 6) read:MB(0x38, 6) write:MB(0x34, 6) support:SUP1];
                lo[@"GPIOX_7"]   = [PGWXLayout layoutWithName:@"GPIOX_7" number:i++ bank:0 select:MB(0x30, 7) read:MB(0x38, 7) write:MB(0x34, 7) support:SUP1];
                lo[@"GPIOX_8"]   = [PGWXLayout layoutWithName:@"GPIOX_8" number:i++ bank:0 select:MB(0x30, 8) read:MB(0x38, 8) write:MB(0x34, 8) support:SUP1];
                lo[@"GPIOX_9"]   = [PGWXLayout layoutWithName:@"GPIOX_9" number:i++ bank:0 select:MB(0x30, 9) read:MB(0x38, 9) write:MB(0x34, 9) support:SUP1];
                lo[@"GPIOX_10"]  = [PGWXLayout layoutWithName:@"GPIOX_10" number:i++ bank:0 select:MB(0x30, 10) read:MB(0x38, 10) write:MB(0x34, 10) support:SUP1];
                lo[@"GPIOX_11"]  = [PGWXLayout layoutWithName:@"GPIOX_11" number:i++ bank:0 select:MB(0x30, 11) read:MB(0x38, 11) write:MB(0x34, 11) support:SUP1];
                lo[@"GPIOX_12"]  = [PGWXLayout layoutWithName:@"GPIOX_12" number:i++ bank:0 select:MB(0x30, 12) read:MB(0x38, 12) write:MB(0x34, 12) support:SUP1];
                lo[@"GPIOX_13"]  = [PGWXLayout layoutWithName:@"GPIOX_13" number:i++ bank:0 select:MB(0x30, 13) read:MB(0x38, 13) write:MB(0x34, 13) support:SUP1];
                lo[@"GPIOX_14"]  = [PGWXLayout layoutWithName:@"GPIOX_14" number:i++ bank:0 select:MB(0x30, 14) read:MB(0x38, 14) write:MB(0x34, 14) support:SUP1];
                lo[@"GPIOX_15"]  = [PGWXLayout layoutWithName:@"GPIOX_15" number:i++ bank:0 select:MB(0x30, 15) read:MB(0x38, 15) write:MB(0x34, 15) support:SUP1];
                lo[@"GPIOX_16"]  = [PGWXLayout layoutWithName:@"GPIOX_16" number:i++ bank:0 select:MB(0x30, 16) read:MB(0x38, 16) write:MB(0x34, 16) support:SUP1];
                lo[@"GPIOX_17"]  = [PGWXLayout layoutWithName:@"GPIOX_17" number:i++ bank:0 select:MB(0x30, 17) read:MB(0x38, 17) write:MB(0x34, 17) support:SUP1];
                lo[@"GPIOX_18"]  = [PGWXLayout layoutWithName:@"GPIOX_18" number:i++ bank:0 select:MB(0x30, 18) read:MB(0x38, 18) write:MB(0x34, 18) support:SUP1];
                lo[@"GPIOX_19"]  = [PGWXLayout layoutWithName:@"GPIOX_19" number:i++ bank:0 select:MB(0x30, 19) read:MB(0x38, 19) write:MB(0x34, 19) support:SUP1];
                lo[@"GPIOX_20"]  = [PGWXLayout layoutWithName:@"GPIOX_20" number:i++ bank:0 select:MB(0x30, 20) read:MB(0x38, 20) write:MB(0x34, 20) support:SUP1];
                lo[@"GPIOX_21"]  = [PGWXLayout layoutWithName:@"GPIOX_21" number:i++ bank:0 select:MB(0x30, 21) read:MB(0x38, 21) write:MB(0x34, 21) support:SUP1];
                lo[@"DIF_0_P"]   = [PGWXLayout layoutWithName:@"DIF_0_P" number:i++ bank:0 select:MB(0x60, 12) read:MB(0x68, 12) write:MB(0x64, 12) support:SUP1];
                lo[@"DIF_0_N"]   = [PGWXLayout layoutWithName:@"DIF_0_N" number:i++ bank:0 select:MB(0x60, 13) read:MB(0x68, 13) write:MB(0x64, 13) support:SUP1];
                lo[@"DIF_1_P"]   = [PGWXLayout layoutWithName:@"DIF_1_P" number:i++ bank:0 select:MB(0x60, 14) read:MB(0x68, 14) write:MB(0x64, 14) support:SUP1];
                lo[@"DIF_1_N"]   = [PGWXLayout layoutWithName:@"DIF_1_N" number:i++ bank:0 select:MB(0x60, 15) read:MB(0x68, 15) write:MB(0x64, 15) support:SUP1];
                lo[@"DIF_2_P"]   = [PGWXLayout layoutWithName:@"DIF_2_P" number:i++ bank:0 select:MB(0x60, 16) read:MB(0x68, 16) write:MB(0x64, 16) support:SUP1];
                lo[@"DIF_2_N"]   = [PGWXLayout layoutWithName:@"DIF_2_N" number:i++ bank:0 select:MB(0x60, 17) read:MB(0x68, 17) write:MB(0x64, 17) support:SUP1];
                lo[@"DIF_3_P"]   = [PGWXLayout layoutWithName:@"DIF_3_P" number:i++ bank:0 select:MB(0x60, 18) read:MB(0x68, 18) write:MB(0x64, 18) support:SUP1];
                lo[@"DIF_3_N"]   = [PGWXLayout layoutWithName:@"DIF_3_N" number:i++ bank:0 select:MB(0x60, 19) read:MB(0x68, 19) write:MB(0x64, 19) support:SUP1];
                lo[@"DIF_4_P"]   = [PGWXLayout layoutWithName:@"DIF_4_P" number:i++ bank:0 select:MB(0x60, 20) read:MB(0x68, 20) write:MB(0x64, 20) support:SUP1];
                lo[@"DIF_4_N"]   = [PGWXLayout layoutWithName:@"DIF_4_N" number:i bank:0 select:MB(0x60, 21) read:MB(0x68, 21) write:MB(0x64, 21) support:SUP1];

                _layout = [NSDictionary dictionaryWithDictionary:lo]; // Make it immutable...
            }
        }
        @finally {
            [self unlock];
        }

        return _layout;
    }

@end

@implementation PGWXSOCAmlogicS905 {
    }

    -(NSString *)chipSet {
        return @"S905";
    }

    -(NSArray<PGWXAddr *> *)baseAddresses {
        [self lock];

        @try {
            if(self->_baseAddresses.count == 0) {
                self->_baseAddresses = @[[PGWXAddr address:0xC8834000 offset:0x00000400], [PGWXAddr address:0xC8100000 offset:0x00000000]];
            }
        }
        @finally {
            [self unlock];
        }

        return self->_baseAddresses;
    }

    -(NSDictionary<NSString *, PGWXLayout *> *)layout {
        [self lock];

        @try {
            if(self->_layout.count == 0) {
                NSUInteger          i   = 0;
                NSMutableDictionary *lo = [NSMutableDictionary new];

                lo[@"GPIOAO_0"]  = [PGWXLayout layoutWithName:@"GPIOAO_0" number:i++ bank:1 select:MB(0x24, 0) read:MB(0x28, 0) write:MB(0x24, 16) support:SUP1];
                lo[@"GPIOAO_1"]  = [PGWXLayout layoutWithName:@"GPIOAO_1" number:i++ bank:1 select:MB(0x24, 1) read:MB(0x28, 1) write:MB(0x24, 17) support:SUP1];
                lo[@"GPIOAO_2"]  = [PGWXLayout layoutWithName:@"GPIOAO_2" number:i++ bank:1 select:MB(0x24, 2) read:MB(0x28, 2) write:MB(0x24, 18) support:SUP1];
                lo[@"GPIOAO_3"]  = [PGWXLayout layoutWithName:@"GPIOAO_3" number:i++ bank:1 select:MB(0x24, 3) read:MB(0x28, 3) write:MB(0x24, 19) support:SUP1];
                lo[@"GPIOAO_4"]  = [PGWXLayout layoutWithName:@"GPIOAO_4" number:i++ bank:1 select:MB(0x24, 4) read:MB(0x28, 4) write:MB(0x24, 20) support:SUP1];
                lo[@"GPIOAO_5"]  = [PGWXLayout layoutWithName:@"GPIOAO_5" number:i++ bank:1 select:MB(0x24, 5) read:MB(0x28, 5) write:MB(0x24, 21) support:SUP1];
                lo[@"GPIOAO_6"]  = [PGWXLayout layoutWithName:@"GPIOAO_6" number:i++ bank:1 select:MB(0x24, 6) read:MB(0x28, 6) write:MB(0x24, 22) support:SUP1];
                lo[@"GPIOAO_7"]  = [PGWXLayout layoutWithName:@"GPIOAO_7" number:i++ bank:1 select:MB(0x24, 7) read:MB(0x28, 7) write:MB(0x24, 23) support:SUP1];
                lo[@"GPIOAO_8"]  = [PGWXLayout layoutWithName:@"GPIOAO_8" number:i++ bank:1 select:MB(0x24, 8) read:MB(0x28, 8) write:MB(0x24, 24) support:SUP1];
                lo[@"GPIOAO_9"]  = [PGWXLayout layoutWithName:@"GPIOAO_9" number:i++ bank:1 select:MB(0x24, 9) read:MB(0x28, 9) write:MB(0x24, 25) support:SUP1];
                lo[@"GPIOAO_10"] = [PGWXLayout layoutWithName:@"GPIOAO_10" number:i++ bank:1 select:MB(0x24, 10) read:MB(0x28, 10) write:MB(0x24, 26) support:SUP1];
                lo[@"GPIOAO_11"] = [PGWXLayout layoutWithName:@"GPIOAO_11" number:i++ bank:1 select:MB(0x24, 11) read:MB(0x28, 11) write:MB(0x24, 27) support:SUP1];
                lo[@"GPIOAO_12"] = [PGWXLayout layoutWithName:@"GPIOAO_12" number:i++ bank:1 select:MB(0x24, 12) read:MB(0x28, 12) write:MB(0x24, 28) support:SUP1];
                lo[@"GPIOAO_13"] = [PGWXLayout layoutWithName:@"GPIOAO_13" number:i++ bank:1 select:MB(0x24, 13) read:MB(0x28, 13) write:MB(0x24, 29) support:SUP1];
                lo[@"GPIOZ_0"]   = [PGWXLayout layoutWithName:@"GPIOZ_0" number:i++ bank:0 select:MB(0x54, 0) read:MB(0x5C, 0) write:MB(0x58, 0) support:SUP1];
                lo[@"GPIOZ_1"]   = [PGWXLayout layoutWithName:@"GPIOZ_1" number:i++ bank:0 select:MB(0x54, 1) read:MB(0x5C, 1) write:MB(0x58, 1) support:SUP1];
                lo[@"GPIOZ_2"]   = [PGWXLayout layoutWithName:@"GPIOZ_2" number:i++ bank:0 select:MB(0x54, 2) read:MB(0x5C, 2) write:MB(0x58, 2) support:SUP1];
                lo[@"GPIOZ_3"]   = [PGWXLayout layoutWithName:@"GPIOZ_3" number:i++ bank:0 select:MB(0x54, 3) read:MB(0x5C, 3) write:MB(0x58, 3) support:SUP1];
                lo[@"GPIOZ_4"]   = [PGWXLayout layoutWithName:@"GPIOZ_4" number:i++ bank:0 select:MB(0x54, 4) read:MB(0x5C, 4) write:MB(0x58, 4) support:SUP1];
                lo[@"GPIOZ_5"]   = [PGWXLayout layoutWithName:@"GPIOZ_5" number:i++ bank:0 select:MB(0x54, 5) read:MB(0x5C, 5) write:MB(0x58, 5) support:SUP1];
                lo[@"GPIOZ_6"]   = [PGWXLayout layoutWithName:@"GPIOZ_6" number:i++ bank:0 select:MB(0x54, 6) read:MB(0x5C, 6) write:MB(0x58, 6) support:SUP1];
                lo[@"GPIOZ_7"]   = [PGWXLayout layoutWithName:@"GPIOZ_7" number:i++ bank:0 select:MB(0x54, 7) read:MB(0x5C, 7) write:MB(0x58, 7) support:SUP1];
                lo[@"GPIOZ_8"]   = [PGWXLayout layoutWithName:@"GPIOZ_8" number:i++ bank:0 select:MB(0x54, 8) read:MB(0x5C, 8) write:MB(0x58, 8) support:SUP1];
                lo[@"GPIOZ_9"]   = [PGWXLayout layoutWithName:@"GPIOZ_9" number:i++ bank:0 select:MB(0x54, 9) read:MB(0x5C, 9) write:MB(0x58, 9) support:SUP1];
                lo[@"GPIOZ_10"]  = [PGWXLayout layoutWithName:@"GPIOZ_10" number:i++ bank:0 select:MB(0x54, 10) read:MB(0x5C, 10) write:MB(0x58, 10) support:SUP1];
                lo[@"GPIOZ_11"]  = [PGWXLayout layoutWithName:@"GPIOZ_11" number:i++ bank:0 select:MB(0x54, 11) read:MB(0x5C, 11) write:MB(0x58, 11) support:SUP1];
                lo[@"GPIOZ_12"]  = [PGWXLayout layoutWithName:@"GPIOZ_12" number:i++ bank:0 select:MB(0x54, 12) read:MB(0x5C, 12) write:MB(0x58, 12) support:SUP1];
                lo[@"GPIOZ_13"]  = [PGWXLayout layoutWithName:@"GPIOZ_13" number:i++ bank:0 select:MB(0x54, 13) read:MB(0x5C, 13) write:MB(0x58, 13) support:SUP1];
                lo[@"GPIOZ_14"]  = [PGWXLayout layoutWithName:@"GPIOZ_14" number:i++ bank:0 select:MB(0x54, 14) read:MB(0x5C, 14) write:MB(0x58, 14) support:SUP1];
                lo[@"GPIOZ_15"]  = [PGWXLayout layoutWithName:@"GPIOZ_15" number:i++ bank:0 select:MB(0x54, 15) read:MB(0x5C, 15) write:MB(0x58, 15) support:SUP1];
                lo[@"GPIOH_0"]   = [PGWXLayout layoutWithName:@"GPIOH_0" number:i++ bank:0 select:MB(0x3C, 20) read:MB(0x44, 20) write:MB(0x40, 20) support:SUP1];
                lo[@"GPIOH_1"]   = [PGWXLayout layoutWithName:@"GPIOH_1" number:i++ bank:0 select:MB(0x3C, 21) read:MB(0x44, 21) write:MB(0x40, 21) support:SUP1];
                lo[@"GPIOH_2"]   = [PGWXLayout layoutWithName:@"GPIOH_2" number:i++ bank:0 select:MB(0x3C, 22) read:MB(0x44, 22) write:MB(0x40, 22) support:SUP1];
                lo[@"GPIOH_3"]   = [PGWXLayout layoutWithName:@"GPIOH_3" number:i++ bank:0 select:MB(0x3C, 23) read:MB(0x44, 23) write:MB(0x40, 23) support:SUP1];
                lo[@"BOOT_0"]    = [PGWXLayout layoutWithName:@"BOOT_0" number:i++ bank:0 select:MB(0x48, 0) read:MB(0x50, 0) write:MB(0x4C, 0) support:SUP1];
                lo[@"BOOT_1"]    = [PGWXLayout layoutWithName:@"BOOT_1" number:i++ bank:0 select:MB(0x48, 1) read:MB(0x50, 1) write:MB(0x4C, 1) support:SUP1];
                lo[@"BOOT_2"]    = [PGWXLayout layoutWithName:@"BOOT_2" number:i++ bank:0 select:MB(0x48, 2) read:MB(0x50, 2) write:MB(0x4C, 2) support:SUP1];
                lo[@"BOOT_3"]    = [PGWXLayout layoutWithName:@"BOOT_3" number:i++ bank:0 select:MB(0x48, 3) read:MB(0x50, 3) write:MB(0x4C, 3) support:SUP1];
                lo[@"BOOT_4"]    = [PGWXLayout layoutWithName:@"BOOT_4" number:i++ bank:0 select:MB(0x48, 4) read:MB(0x50, 4) write:MB(0x4C, 4) support:SUP1];
                lo[@"BOOT_5"]    = [PGWXLayout layoutWithName:@"BOOT_5" number:i++ bank:0 select:MB(0x48, 5) read:MB(0x50, 5) write:MB(0x4C, 5) support:SUP1];
                lo[@"BOOT_6"]    = [PGWXLayout layoutWithName:@"BOOT_6" number:i++ bank:0 select:MB(0x48, 6) read:MB(0x50, 6) write:MB(0x4C, 6) support:SUP1];
                lo[@"BOOT_7"]    = [PGWXLayout layoutWithName:@"BOOT_7" number:i++ bank:0 select:MB(0x48, 7) read:MB(0x50, 7) write:MB(0x4C, 7) support:SUP1];
                lo[@"BOOT_8"]    = [PGWXLayout layoutWithName:@"BOOT_8" number:i++ bank:0 select:MB(0x48, 8) read:MB(0x50, 8) write:MB(0x4C, 8) support:SUP1];
                lo[@"BOOT_9"]    = [PGWXLayout layoutWithName:@"BOOT_9" number:i++ bank:0 select:MB(0x48, 9) read:MB(0x50, 9) write:MB(0x4C, 9) support:SUP1];
                lo[@"BOOT_10"]   = [PGWXLayout layoutWithName:@"BOOT_10" number:i++ bank:0 select:MB(0x48, 10) read:MB(0x50, 10) write:MB(0x4C, 10) support:SUP1];
                lo[@"BOOT_11"]   = [PGWXLayout layoutWithName:@"BOOT_11" number:i++ bank:0 select:MB(0x48, 11) read:MB(0x50, 11) write:MB(0x4C, 11) support:SUP1];
                lo[@"BOOT_12"]   = [PGWXLayout layoutWithName:@"BOOT_12" number:i++ bank:0 select:MB(0x48, 12) read:MB(0x50, 12) write:MB(0x4C, 12) support:SUP1];
                lo[@"BOOT_13"]   = [PGWXLayout layoutWithName:@"BOOT_13" number:i++ bank:0 select:MB(0x48, 13) read:MB(0x50, 13) write:MB(0x4C, 13) support:SUP1];
                lo[@"BOOT_14"]   = [PGWXLayout layoutWithName:@"BOOT_14" number:i++ bank:0 select:MB(0x48, 14) read:MB(0x50, 14) write:MB(0x4C, 14) support:SUP1];
                lo[@"BOOT_15"]   = [PGWXLayout layoutWithName:@"BOOT_15" number:i++ bank:0 select:MB(0x48, 15) read:MB(0x50, 15) write:MB(0x4C, 15) support:SUP1];
                lo[@"BOOT_16"]   = [PGWXLayout layoutWithName:@"BOOT_16" number:i++ bank:0 select:MB(0x48, 16) read:MB(0x50, 16) write:MB(0x4C, 16) support:SUP1];
                lo[@"BOOT_17"]   = [PGWXLayout layoutWithName:@"BOOT_17" number:i++ bank:0 select:MB(0x48, 17) read:MB(0x50, 17) write:MB(0x4C, 17) support:SUP1];
                lo[@"CARD_0"]    = [PGWXLayout layoutWithName:@"CARD_0" number:i++ bank:0 select:MB(0x48, 20) read:MB(0x50, 20) write:MB(0x4C, 20) support:SUP1];
                lo[@"CARD_1"]    = [PGWXLayout layoutWithName:@"CARD_1" number:i++ bank:0 select:MB(0x48, 21) read:MB(0x50, 21) write:MB(0x4C, 21) support:SUP1];
                lo[@"CARD_2"]    = [PGWXLayout layoutWithName:@"CARD_2" number:i++ bank:0 select:MB(0x48, 22) read:MB(0x50, 22) write:MB(0x4C, 22) support:SUP1];
                lo[@"CARD_3"]    = [PGWXLayout layoutWithName:@"CARD_3" number:i++ bank:0 select:MB(0x48, 23) read:MB(0x50, 23) write:MB(0x4C, 23) support:SUP1];
                lo[@"CARD_4"]    = [PGWXLayout layoutWithName:@"CARD_4" number:i++ bank:0 select:MB(0x48, 24) read:MB(0x50, 24) write:MB(0x4C, 24) support:SUP1];
                lo[@"CARD_5"]    = [PGWXLayout layoutWithName:@"CARD_5" number:i++ bank:0 select:MB(0x48, 25) read:MB(0x50, 25) write:MB(0x4C, 25) support:SUP1];
                lo[@"CARD_6"]    = [PGWXLayout layoutWithName:@"CARD_6" number:i++ bank:0 select:MB(0x48, 26) read:MB(0x50, 26) write:MB(0x4C, 26) support:SUP1];
                lo[@"GPIODV_0"]  = [PGWXLayout layoutWithName:@"GPIODV_0" number:i++ bank:0 select:MB(0x30, 0) read:MB(0x38, 0) write:MB(0x34, 0) support:SUP1];
                lo[@"GPIODV_1"]  = [PGWXLayout layoutWithName:@"GPIODV_1" number:i++ bank:0 select:MB(0x30, 1) read:MB(0x38, 1) write:MB(0x34, 1) support:SUP1];
                lo[@"GPIODV_2"]  = [PGWXLayout layoutWithName:@"GPIODV_2" number:i++ bank:0 select:MB(0x30, 2) read:MB(0x38, 2) write:MB(0x34, 2) support:SUP1];
                lo[@"GPIODV_3"]  = [PGWXLayout layoutWithName:@"GPIODV_3" number:i++ bank:0 select:MB(0x30, 3) read:MB(0x38, 3) write:MB(0x34, 3) support:SUP1];
                lo[@"GPIODV_4"]  = [PGWXLayout layoutWithName:@"GPIODV_4" number:i++ bank:0 select:MB(0x30, 4) read:MB(0x38, 4) write:MB(0x34, 4) support:SUP1];
                lo[@"GPIODV_5"]  = [PGWXLayout layoutWithName:@"GPIODV_5" number:i++ bank:0 select:MB(0x30, 5) read:MB(0x38, 5) write:MB(0x34, 5) support:SUP1];
                lo[@"GPIODV_6"]  = [PGWXLayout layoutWithName:@"GPIODV_6" number:i++ bank:0 select:MB(0x30, 6) read:MB(0x38, 6) write:MB(0x34, 6) support:SUP1];
                lo[@"GPIODV_7"]  = [PGWXLayout layoutWithName:@"GPIODV_7" number:i++ bank:0 select:MB(0x30, 7) read:MB(0x38, 7) write:MB(0x34, 7) support:SUP1];
                lo[@"GPIODV_8"]  = [PGWXLayout layoutWithName:@"GPIODV_8" number:i++ bank:0 select:MB(0x30, 8) read:MB(0x38, 8) write:MB(0x34, 8) support:SUP1];
                lo[@"GPIODV_9"]  = [PGWXLayout layoutWithName:@"GPIODV_9" number:i++ bank:0 select:MB(0x30, 9) read:MB(0x38, 9) write:MB(0x34, 9) support:SUP1];
                lo[@"GPIODV_10"] = [PGWXLayout layoutWithName:@"GPIODV_10" number:i++ bank:0 select:MB(0x30, 10) read:MB(0x38, 10) write:MB(0x34, 10) support:SUP1];
                lo[@"GPIODV_11"] = [PGWXLayout layoutWithName:@"GPIODV_11" number:i++ bank:0 select:MB(0x30, 11) read:MB(0x38, 11) write:MB(0x34, 11) support:SUP1];
                lo[@"GPIODV_12"] = [PGWXLayout layoutWithName:@"GPIODV_12" number:i++ bank:0 select:MB(0x30, 12) read:MB(0x38, 12) write:MB(0x34, 12) support:SUP1];
                lo[@"GPIODV_13"] = [PGWXLayout layoutWithName:@"GPIODV_13" number:i++ bank:0 select:MB(0x30, 13) read:MB(0x38, 13) write:MB(0x34, 13) support:SUP1];
                lo[@"GPIODV_14"] = [PGWXLayout layoutWithName:@"GPIODV_14" number:i++ bank:0 select:MB(0x30, 14) read:MB(0x38, 14) write:MB(0x34, 14) support:SUP1];
                lo[@"GPIODV_15"] = [PGWXLayout layoutWithName:@"GPIODV_15" number:i++ bank:0 select:MB(0x30, 15) read:MB(0x38, 15) write:MB(0x34, 15) support:SUP1];
                lo[@"GPIODV_16"] = [PGWXLayout layoutWithName:@"GPIODV_16" number:i++ bank:0 select:MB(0x30, 16) read:MB(0x38, 16) write:MB(0x34, 16) support:SUP1];
                lo[@"GPIODV_17"] = [PGWXLayout layoutWithName:@"GPIODV_17" number:i++ bank:0 select:MB(0x30, 17) read:MB(0x38, 17) write:MB(0x34, 17) support:SUP1];
                lo[@"GPIODV_18"] = [PGWXLayout layoutWithName:@"GPIODV_18" number:i++ bank:0 select:MB(0x30, 18) read:MB(0x38, 18) write:MB(0x34, 18) support:SUP1];
                lo[@"GPIODV_19"] = [PGWXLayout layoutWithName:@"GPIODV_19" number:i++ bank:0 select:MB(0x30, 19) read:MB(0x38, 19) write:MB(0x34, 19) support:SUP1];
                lo[@"GPIODV_20"] = [PGWXLayout layoutWithName:@"GPIODV_20" number:i++ bank:0 select:MB(0x30, 20) read:MB(0x38, 20) write:MB(0x34, 20) support:SUP1];
                lo[@"GPIODV_21"] = [PGWXLayout layoutWithName:@"GPIODV_21" number:i++ bank:0 select:MB(0x30, 21) read:MB(0x38, 21) write:MB(0x34, 21) support:SUP1];
                lo[@"GPIODV_22"] = [PGWXLayout layoutWithName:@"GPIODV_22" number:i++ bank:0 select:MB(0x30, 22) read:MB(0x38, 22) write:MB(0x34, 22) support:SUP1];
                lo[@"GPIODV_23"] = [PGWXLayout layoutWithName:@"GPIODV_23" number:i++ bank:0 select:MB(0x30, 23) read:MB(0x38, 23) write:MB(0x34, 23) support:SUP1];
                lo[@"GPIODV_24"] = [PGWXLayout layoutWithName:@"GPIODV_24" number:i++ bank:0 select:MB(0x30, 24) read:MB(0x38, 24) write:MB(0x34, 24) support:SUP1];
                lo[@"GPIODV_25"] = [PGWXLayout layoutWithName:@"GPIODV_25" number:i++ bank:0 select:MB(0x30, 25) read:MB(0x38, 25) write:MB(0x34, 25) support:SUP1];
                lo[@"GPIODV_26"] = [PGWXLayout layoutWithName:@"GPIODV_26" number:i++ bank:0 select:MB(0x30, 26) read:MB(0x38, 26) write:MB(0x34, 26) support:SUP1];
                lo[@"GPIODV_27"] = [PGWXLayout layoutWithName:@"GPIODV_27" number:i++ bank:0 select:MB(0x30, 27) read:MB(0x38, 27) write:MB(0x34, 27) support:SUP1];
                lo[@"GPIODV_28"] = [PGWXLayout layoutWithName:@"GPIODV_28" number:i++ bank:0 select:MB(0x30, 28) read:MB(0x38, 28) write:MB(0x34, 28) support:SUP1];
                lo[@"GPIODV_29"] = [PGWXLayout layoutWithName:@"GPIODV_29" number:i++ bank:0 select:MB(0x30, 29) read:MB(0x38, 29) write:MB(0x34, 29) support:SUP1];
                lo[@"GPIOY_0"]   = [PGWXLayout layoutWithName:@"GPIOY_0" number:i++ bank:0 select:MB(0x3C, 0) read:MB(0x44, 0) write:MB(0x40, 0) support:SUP1];
                lo[@"GPIOY_1"]   = [PGWXLayout layoutWithName:@"GPIOY_1" number:i++ bank:0 select:MB(0x3C, 1) read:MB(0x44, 1) write:MB(0x40, 1) support:SUP1];
                lo[@"GPIOY_2"]   = [PGWXLayout layoutWithName:@"GPIOY_2" number:i++ bank:0 select:MB(0x3C, 2) read:MB(0x44, 2) write:MB(0x40, 2) support:SUP1];
                lo[@"GPIOY_3"]   = [PGWXLayout layoutWithName:@"GPIOY_3" number:i++ bank:0 select:MB(0x3C, 3) read:MB(0x44, 3) write:MB(0x40, 3) support:SUP1];
                lo[@"GPIOY_4"]   = [PGWXLayout layoutWithName:@"GPIOY_4" number:i++ bank:0 select:MB(0x3C, 4) read:MB(0x44, 4) write:MB(0x40, 4) support:SUP1];
                lo[@"GPIOY_5"]   = [PGWXLayout layoutWithName:@"GPIOY_5" number:i++ bank:0 select:MB(0x3C, 5) read:MB(0x44, 5) write:MB(0x40, 5) support:SUP1];
                lo[@"GPIOY_6"]   = [PGWXLayout layoutWithName:@"GPIOY_6" number:i++ bank:0 select:MB(0x3C, 6) read:MB(0x44, 6) write:MB(0x40, 6) support:SUP1];
                lo[@"GPIOY_7"]   = [PGWXLayout layoutWithName:@"GPIOY_7" number:i++ bank:0 select:MB(0x3C, 7) read:MB(0x44, 7) write:MB(0x40, 7) support:SUP1];
                lo[@"GPIOY_8"]   = [PGWXLayout layoutWithName:@"GPIOY_8" number:i++ bank:0 select:MB(0x3C, 8) read:MB(0x44, 8) write:MB(0x40, 8) support:SUP1];
                lo[@"GPIOY_9"]   = [PGWXLayout layoutWithName:@"GPIOY_9" number:i++ bank:0 select:MB(0x3C, 9) read:MB(0x44, 9) write:MB(0x40, 9) support:SUP1];
                lo[@"GPIOY_10"]  = [PGWXLayout layoutWithName:@"GPIOY_10" number:i++ bank:0 select:MB(0x3C, 10) read:MB(0x44, 10) write:MB(0x40, 10) support:SUP1];
                lo[@"GPIOY_11"]  = [PGWXLayout layoutWithName:@"GPIOY_11" number:i++ bank:0 select:MB(0x3C, 11) read:MB(0x44, 11) write:MB(0x40, 11) support:SUP1];
                lo[@"GPIOY_12"]  = [PGWXLayout layoutWithName:@"GPIOY_12" number:i++ bank:0 select:MB(0x3C, 12) read:MB(0x44, 12) write:MB(0x40, 12) support:SUP1];
                lo[@"GPIOY_13"]  = [PGWXLayout layoutWithName:@"GPIOY_13" number:i++ bank:0 select:MB(0x3C, 13) read:MB(0x44, 13) write:MB(0x40, 13) support:SUP1];
                lo[@"GPIOY_14"]  = [PGWXLayout layoutWithName:@"GPIOY_14" number:i++ bank:0 select:MB(0x3C, 14) read:MB(0x44, 14) write:MB(0x40, 14) support:SUP1];
                lo[@"GPIOY_15"]  = [PGWXLayout layoutWithName:@"GPIOY_15" number:i++ bank:0 select:MB(0x3C, 15) read:MB(0x44, 15) write:MB(0x40, 15) support:SUP1];
                lo[@"GPIOY_16"]  = [PGWXLayout layoutWithName:@"GPIOY_16" number:i++ bank:0 select:MB(0x3C, 16) read:MB(0x44, 16) write:MB(0x40, 16) support:SUP1];
                lo[@"GPIOX_0"]   = [PGWXLayout layoutWithName:@"GPIOX_0" number:i++ bank:0 select:MB(0x60, 0) read:MB(0x68, 0) write:MB(0x64, 0) support:SUP1];
                lo[@"GPIOX_1"]   = [PGWXLayout layoutWithName:@"GPIOX_1" number:i++ bank:0 select:MB(0x60, 1) read:MB(0x68, 1) write:MB(0x64, 1) support:SUP1];
                lo[@"GPIOX_2"]   = [PGWXLayout layoutWithName:@"GPIOX_2" number:i++ bank:0 select:MB(0x60, 2) read:MB(0x68, 2) write:MB(0x64, 2) support:SUP1];
                lo[@"GPIOX_3"]   = [PGWXLayout layoutWithName:@"GPIOX_3" number:i++ bank:0 select:MB(0x60, 3) read:MB(0x68, 3) write:MB(0x64, 3) support:SUP1];
                lo[@"GPIOX_4"]   = [PGWXLayout layoutWithName:@"GPIOX_4" number:i++ bank:0 select:MB(0x60, 4) read:MB(0x68, 4) write:MB(0x64, 4) support:SUP1];
                lo[@"GPIOX_5"]   = [PGWXLayout layoutWithName:@"GPIOX_5" number:i++ bank:0 select:MB(0x60, 5) read:MB(0x68, 5) write:MB(0x64, 5) support:SUP1];
                lo[@"GPIOX_6"]   = [PGWXLayout layoutWithName:@"GPIOX_6" number:i++ bank:0 select:MB(0x60, 6) read:MB(0x68, 6) write:MB(0x64, 6) support:SUP1];
                lo[@"GPIOX_7"]   = [PGWXLayout layoutWithName:@"GPIOX_7" number:i++ bank:0 select:MB(0x60, 7) read:MB(0x68, 7) write:MB(0x64, 7) support:SUP1];
                lo[@"GPIOX_8"]   = [PGWXLayout layoutWithName:@"GPIOX_8" number:i++ bank:0 select:MB(0x60, 8) read:MB(0x68, 8) write:MB(0x64, 8) support:SUP1];
                lo[@"GPIOX_9"]   = [PGWXLayout layoutWithName:@"GPIOX_9" number:i++ bank:0 select:MB(0x60, 9) read:MB(0x68, 9) write:MB(0x64, 9) support:SUP1];
                lo[@"GPIOX_10"]  = [PGWXLayout layoutWithName:@"GPIOX_10" number:i++ bank:0 select:MB(0x60, 10) read:MB(0x68, 10) write:MB(0x64, 10) support:SUP1];
                lo[@"GPIOX_11"]  = [PGWXLayout layoutWithName:@"GPIOX_11" number:i++ bank:0 select:MB(0x60, 11) read:MB(0x68, 11) write:MB(0x64, 11) support:SUP1];
                lo[@"GPIOX_12"]  = [PGWXLayout layoutWithName:@"GPIOX_12" number:i++ bank:0 select:MB(0x60, 12) read:MB(0x68, 12) write:MB(0x64, 12) support:SUP1];
                lo[@"GPIOX_13"]  = [PGWXLayout layoutWithName:@"GPIOX_13" number:i++ bank:0 select:MB(0x60, 13) read:MB(0x68, 13) write:MB(0x64, 13) support:SUP1];
                lo[@"GPIOX_14"]  = [PGWXLayout layoutWithName:@"GPIOX_14" number:i++ bank:0 select:MB(0x60, 14) read:MB(0x68, 14) write:MB(0x64, 14) support:SUP1];
                lo[@"GPIOX_15"]  = [PGWXLayout layoutWithName:@"GPIOX_15" number:i++ bank:0 select:MB(0x60, 15) read:MB(0x68, 15) write:MB(0x64, 15) support:SUP1];
                lo[@"GPIOX_16"]  = [PGWXLayout layoutWithName:@"GPIOX_16" number:i++ bank:0 select:MB(0x60, 16) read:MB(0x68, 16) write:MB(0x64, 16) support:SUP1];
                lo[@"GPIOX_17"]  = [PGWXLayout layoutWithName:@"GPIOX_17" number:i++ bank:0 select:MB(0x60, 17) read:MB(0x68, 17) write:MB(0x64, 17) support:SUP1];
                lo[@"GPIOX_18"]  = [PGWXLayout layoutWithName:@"GPIOX_18" number:i++ bank:0 select:MB(0x60, 18) read:MB(0x68, 18) write:MB(0x64, 18) support:SUP1];
                lo[@"GPIOX_19"]  = [PGWXLayout layoutWithName:@"GPIOX_19" number:i++ bank:0 select:MB(0x60, 19) read:MB(0x68, 19) write:MB(0x64, 19) support:SUP1];
                lo[@"GPIOX_20"]  = [PGWXLayout layoutWithName:@"GPIOX_20" number:i++ bank:0 select:MB(0x60, 20) read:MB(0x68, 20) write:MB(0x64, 20) support:SUP1];
                lo[@"GPIOX_21"]  = [PGWXLayout layoutWithName:@"GPIOX_21" number:i++ bank:0 select:MB(0x60, 21) read:MB(0x68, 21) write:MB(0x64, 21) support:SUP1];
                lo[@"GPIOCLK_0"] = [PGWXLayout layoutWithName:@"GPIOCLK_0" number:i++ bank:0 select:MB(0x54, 28) read:MB(0x5C, 28) write:MB(0x58, 28) support:SUP1];
                lo[@"GPIOCLK_1"] = [PGWXLayout layoutWithName:@"GPIOCLK_1" number:i++ bank:0 select:MB(0x54, 29) read:MB(0x5C, 29) write:MB(0x58, 29) support:SUP1];
                lo[@"GPIOCLK_2"] = [PGWXLayout layoutWithName:@"GPIOCLK_2" number:i++ bank:0 select:MB(0x54, 30) read:MB(0x5C, 30) write:MB(0x58, 30) support:SUP1];
                lo[@"GPIOCLK_3"] = [PGWXLayout layoutWithName:@"GPIOCLK_3" number:i bank:0 select:MB(0x54, 31) read:MB(0x5C, 31) write:MB(0x58, 31) support:SUP1];

                self->_layout = [NSDictionary dictionaryWithDictionary:lo]; // Make it immutable...
            }
        }
        @finally {
            [self unlock];
        }

        return self->_layout;
    }

@end
