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

#define MB(b, o)  PGWXMakeBit((b),(o))
#define AD(a, o)  [PGWXAddr address:(a) offset:(o)]
#define SUP1     (PGWX_FUNCTION_DIGITAL)
#define SUP2     (SUP1 | PGWX_FUNCTION_INTERRUPT)
#define SUP3     (SUP2 | PGWX_FUNCTION_I2C)

@implementation PGWXSOCSamsungExynos5422 {
    @public
        NSArray<PGWXAddr *>                    *_baseAddresses;
        NSDictionary<NSString *, PGWXLayout *> *_layout;
    }

    -(NSString *)brandName {
        return @"Samsung";
    }

    -(NSString *)chipSet {
        return @"Exynos5422";
    }

    -(NSArray<PGWXAddr *> *)baseAddresses {
        [self lock];

        @try {
            if(_baseAddresses.count == 0) {
                _baseAddresses = @[AD(0x13400000, 0x00), AD(0x13410000, 0x00), AD(0x14000000, 0x00), AD(0x14010000, 0x00), AD(0x03860000, 0x00)];
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
                NSMutableDictionary *lo = [NSMutableDictionary new];
                NSUInteger          i   = 0;

                lo[@"GPIO_Y70"] = [PGWXLayout layoutWithName:@"GPIO_Y70" number:i++ bank:0 select:MB(0x000, 0x00) readWrite:MB(0x004, 0x00) support:SUP2];
                lo[@"GPIO_Y71"] = [PGWXLayout layoutWithName:@"GPIO_Y71" number:i++ bank:0 select:MB(0x000, 0x04) readWrite:MB(0x004, 0x01) support:SUP2];
                lo[@"GPIO_Y72"] = [PGWXLayout layoutWithName:@"GPIO_Y72" number:i++ bank:0 select:MB(0x000, 0x08) readWrite:MB(0x004, 0x02) support:SUP2];
                lo[@"GPIO_Y73"] = [PGWXLayout layoutWithName:@"GPIO_Y73" number:i++ bank:0 select:MB(0x000, 0x0C) readWrite:MB(0x004, 0x03) support:SUP2];
                lo[@"GPIO_Y74"] = [PGWXLayout layoutWithName:@"GPIO_Y74" number:i++ bank:0 select:MB(0x000, 0x10) readWrite:MB(0x004, 0x04) support:SUP2];
                lo[@"GPIO_Y75"] = [PGWXLayout layoutWithName:@"GPIO_Y75" number:i++ bank:0 select:MB(0x000, 0x14) readWrite:MB(0x004, 0x05) support:SUP2];
                lo[@"GPIO_Y76"] = [PGWXLayout layoutWithName:@"GPIO_Y76" number:i++ bank:0 select:MB(0x000, 0x18) readWrite:MB(0x004, 0x06) support:SUP2];
                lo[@"GPIO_Y77"] = [PGWXLayout layoutWithName:@"GPIO_Y77" number:i++ bank:0 select:MB(0x000, 0x1C) readWrite:MB(0x004, 0x07) support:SUP2];
                lo[@"GPIO_X00"] = [PGWXLayout layoutWithName:@"GPIO_X00" number:i++ bank:0 select:MB(0xC00, 0x00) readWrite:MB(0xC04, 0x00) support:SUP2];
                lo[@"GPIO_X01"] = [PGWXLayout layoutWithName:@"GPIO_X01" number:i++ bank:0 select:MB(0xC00, 0x04) readWrite:MB(0xC04, 0x01) support:SUP2];
                lo[@"GPIO_X02"] = [PGWXLayout layoutWithName:@"GPIO_X02" number:i++ bank:0 select:MB(0xC00, 0x08) readWrite:MB(0xC04, 0x02) support:SUP2];
                lo[@"GPIO_X03"] = [PGWXLayout layoutWithName:@"GPIO_X03" number:i++ bank:0 select:MB(0xC00, 0x0C) readWrite:MB(0xC04, 0x03) support:SUP2];
                lo[@"GPIO_X04"] = [PGWXLayout layoutWithName:@"GPIO_X04" number:i++ bank:0 select:MB(0xC00, 0x10) readWrite:MB(0xC04, 0x04) support:SUP2];
                lo[@"GPIO_X05"] = [PGWXLayout layoutWithName:@"GPIO_X05" number:i++ bank:0 select:MB(0xC00, 0x14) readWrite:MB(0xC04, 0x05) support:SUP2];
                lo[@"GPIO_X06"] = [PGWXLayout layoutWithName:@"GPIO_X06" number:i++ bank:0 select:MB(0xC00, 0x18) readWrite:MB(0xC04, 0x06) support:SUP2];
                lo[@"GPIO_X07"] = [PGWXLayout layoutWithName:@"GPIO_X07" number:i++ bank:0 select:MB(0xC00, 0x1C) readWrite:MB(0xC04, 0x07) support:SUP2];
                lo[@"GPIO_X10"] = [PGWXLayout layoutWithName:@"GPIO_X10" number:i++ bank:0 select:MB(0xC20, 0x00) readWrite:MB(0xC24, 0x00) support:SUP2];
                lo[@"GPIO_X11"] = [PGWXLayout layoutWithName:@"GPIO_X11" number:i++ bank:0 select:MB(0xC20, 0x04) readWrite:MB(0xC24, 0x01) support:SUP2];
                lo[@"GPIO_X12"] = [PGWXLayout layoutWithName:@"GPIO_X12" number:i++ bank:0 select:MB(0xC20, 0x08) readWrite:MB(0xC24, 0x02) support:SUP2];
                lo[@"GPIO_X13"] = [PGWXLayout layoutWithName:@"GPIO_X13" number:i++ bank:0 select:MB(0xC20, 0x0C) readWrite:MB(0xC24, 0x03) support:SUP2];
                lo[@"GPIO_X14"] = [PGWXLayout layoutWithName:@"GPIO_X14" number:i++ bank:0 select:MB(0xC20, 0x10) readWrite:MB(0xC24, 0x04) support:SUP2];
                lo[@"GPIO_X15"] = [PGWXLayout layoutWithName:@"GPIO_X15" number:i++ bank:0 select:MB(0xC20, 0x14) readWrite:MB(0xC24, 0x05) support:SUP2];
                lo[@"GPIO_X16"] = [PGWXLayout layoutWithName:@"GPIO_X16" number:i++ bank:0 select:MB(0xC20, 0x18) readWrite:MB(0xC24, 0x06) support:SUP2];
                lo[@"GPIO_X17"] = [PGWXLayout layoutWithName:@"GPIO_X17" number:i++ bank:0 select:MB(0xC20, 0x1C) readWrite:MB(0xC24, 0x07) support:SUP2];
                lo[@"GPIO_X20"] = [PGWXLayout layoutWithName:@"GPIO_X20" number:i++ bank:0 select:MB(0xC40, 0x00) readWrite:MB(0xC44, 0x00) support:SUP2];
                lo[@"GPIO_X21"] = [PGWXLayout layoutWithName:@"GPIO_X21" number:i++ bank:0 select:MB(0xC40, 0x04) readWrite:MB(0xC44, 0x01) support:SUP2];
                lo[@"GPIO_X22"] = [PGWXLayout layoutWithName:@"GPIO_X22" number:i++ bank:0 select:MB(0xC40, 0x08) readWrite:MB(0xC44, 0x02) support:SUP2];
                lo[@"GPIO_X23"] = [PGWXLayout layoutWithName:@"GPIO_X23" number:i++ bank:0 select:MB(0xC40, 0x0C) readWrite:MB(0xC44, 0x03) support:SUP2];
                lo[@"GPIO_X24"] = [PGWXLayout layoutWithName:@"GPIO_X24" number:i++ bank:0 select:MB(0xC40, 0x10) readWrite:MB(0xC44, 0x04) support:SUP2];
                lo[@"GPIO_X25"] = [PGWXLayout layoutWithName:@"GPIO_X25" number:i++ bank:0 select:MB(0xC40, 0x14) readWrite:MB(0xC44, 0x05) support:SUP2];
                lo[@"GPIO_X26"] = [PGWXLayout layoutWithName:@"GPIO_X26" number:i++ bank:0 select:MB(0xC40, 0x18) readWrite:MB(0xC44, 0x06) support:SUP2];
                lo[@"GPIO_X27"] = [PGWXLayout layoutWithName:@"GPIO_X27" number:i++ bank:0 select:MB(0xC40, 0x1C) readWrite:MB(0xC44, 0x07) support:SUP2];
                lo[@"GPIO_X30"] = [PGWXLayout layoutWithName:@"GPIO_X30" number:i++ bank:0 select:MB(0xC60, 0x00) readWrite:MB(0xC64, 0x00) support:SUP2];
                lo[@"GPIO_X31"] = [PGWXLayout layoutWithName:@"GPIO_X31" number:i++ bank:0 select:MB(0xC60, 0x04) readWrite:MB(0xC64, 0x01) support:SUP2];
                lo[@"GPIO_X32"] = [PGWXLayout layoutWithName:@"GPIO_X32" number:i++ bank:0 select:MB(0xC60, 0x08) readWrite:MB(0xC64, 0x02) support:SUP2];
                lo[@"GPIO_X33"] = [PGWXLayout layoutWithName:@"GPIO_X33" number:i++ bank:0 select:MB(0xC60, 0x0C) readWrite:MB(0xC64, 0x03) support:SUP2];
                lo[@"GPIO_X34"] = [PGWXLayout layoutWithName:@"GPIO_X34" number:i++ bank:0 select:MB(0xC60, 0x10) readWrite:MB(0xC64, 0x04) support:SUP2];
                lo[@"GPIO_X35"] = [PGWXLayout layoutWithName:@"GPIO_X35" number:i++ bank:0 select:MB(0xC60, 0x14) readWrite:MB(0xC64, 0x05) support:SUP2];
                lo[@"GPIO_X36"] = [PGWXLayout layoutWithName:@"GPIO_X36" number:i++ bank:0 select:MB(0xC60, 0x18) readWrite:MB(0xC64, 0x06) support:SUP2];
                lo[@"GPIO_X37"] = [PGWXLayout layoutWithName:@"GPIO_X37" number:i++ bank:0 select:MB(0xC60, 0x1C) readWrite:MB(0xC64, 0x07) support:SUP2];
                lo[@"GPIO_C00"] = [PGWXLayout layoutWithName:@"GPIO_C00" number:i++ bank:1 select:MB(0x000, 0x00) readWrite:MB(0x004, 0x00) support:SUP2];
                lo[@"GPIO_C01"] = [PGWXLayout layoutWithName:@"GPIO_C01" number:i++ bank:1 select:MB(0x000, 0x04) readWrite:MB(0x004, 0x01) support:SUP2];
                lo[@"GPIO_C02"] = [PGWXLayout layoutWithName:@"GPIO_C02" number:i++ bank:1 select:MB(0x000, 0x08) readWrite:MB(0x004, 0x02) support:SUP2];
                lo[@"GPIO_C03"] = [PGWXLayout layoutWithName:@"GPIO_C03" number:i++ bank:1 select:MB(0x000, 0x0C) readWrite:MB(0x004, 0x03) support:SUP2];
                lo[@"GPIO_C04"] = [PGWXLayout layoutWithName:@"GPIO_C04" number:i++ bank:1 select:MB(0x000, 0x10) readWrite:MB(0x004, 0x04) support:SUP2];
                lo[@"GPIO_C05"] = [PGWXLayout layoutWithName:@"GPIO_C05" number:i++ bank:1 select:MB(0x000, 0x14) readWrite:MB(0x004, 0x05) support:SUP2];
                lo[@"GPIO_C06"] = [PGWXLayout layoutWithName:@"GPIO_C06" number:i++ bank:1 select:MB(0x000, 0x18) readWrite:MB(0x004, 0x06) support:SUP2];
                lo[@"GPIO_C07"] = [PGWXLayout layoutWithName:@"GPIO_C07" number:i++ bank:1 select:MB(0x000, 0x1C) readWrite:MB(0x004, 0x07) support:SUP2];
                lo[@"GPIO_C10"] = [PGWXLayout layoutWithName:@"GPIO_C10" number:i++ bank:1 select:MB(0x020, 0x00) readWrite:MB(0x024, 0x00) support:SUP2];
                lo[@"GPIO_C11"] = [PGWXLayout layoutWithName:@"GPIO_C11" number:i++ bank:1 select:MB(0x020, 0x04) readWrite:MB(0x024, 0x01) support:SUP2];
                lo[@"GPIO_C12"] = [PGWXLayout layoutWithName:@"GPIO_C12" number:i++ bank:1 select:MB(0x020, 0x08) readWrite:MB(0x024, 0x02) support:SUP2];
                lo[@"GPIO_C13"] = [PGWXLayout layoutWithName:@"GPIO_C13" number:i++ bank:1 select:MB(0x020, 0x0C) readWrite:MB(0x024, 0x03) support:SUP2];
                lo[@"GPIO_C14"] = [PGWXLayout layoutWithName:@"GPIO_C14" number:i++ bank:1 select:MB(0x020, 0x10) readWrite:MB(0x024, 0x04) support:SUP2];
                lo[@"GPIO_C15"] = [PGWXLayout layoutWithName:@"GPIO_C15" number:i++ bank:1 select:MB(0x020, 0x14) readWrite:MB(0x024, 0x05) support:SUP2];
                lo[@"GPIO_C16"] = [PGWXLayout layoutWithName:@"GPIO_C16" number:i++ bank:1 select:MB(0x020, 0x18) readWrite:MB(0x024, 0x06) support:SUP2];
                lo[@"GPIO_C17"] = [PGWXLayout layoutWithName:@"GPIO_C17" number:i++ bank:1 select:MB(0x020, 0x1C) readWrite:MB(0x024, 0x07) support:SUP2];
                lo[@"GPIO_C20"] = [PGWXLayout layoutWithName:@"GPIO_C20" number:i++ bank:1 select:MB(0x040, 0x00) readWrite:MB(0x044, 0x00) support:SUP2];
                lo[@"GPIO_C21"] = [PGWXLayout layoutWithName:@"GPIO_C21" number:i++ bank:1 select:MB(0x040, 0x04) readWrite:MB(0x044, 0x01) support:SUP2];
                lo[@"GPIO_C22"] = [PGWXLayout layoutWithName:@"GPIO_C22" number:i++ bank:1 select:MB(0x040, 0x08) readWrite:MB(0x044, 0x02) support:SUP2];
                lo[@"GPIO_C23"] = [PGWXLayout layoutWithName:@"GPIO_C23" number:i++ bank:1 select:MB(0x040, 0x0C) readWrite:MB(0x044, 0x03) support:SUP2];
                lo[@"GPIO_C24"] = [PGWXLayout layoutWithName:@"GPIO_C24" number:i++ bank:1 select:MB(0x040, 0x10) readWrite:MB(0x044, 0x04) support:SUP2];
                lo[@"GPIO_C25"] = [PGWXLayout layoutWithName:@"GPIO_C25" number:i++ bank:1 select:MB(0x040, 0x14) readWrite:MB(0x044, 0x05) support:SUP2];
                lo[@"GPIO_C26"] = [PGWXLayout layoutWithName:@"GPIO_C26" number:i++ bank:1 select:MB(0x040, 0x18) readWrite:MB(0x044, 0x06) support:SUP2];
                lo[@"GPIO_C30"] = [PGWXLayout layoutWithName:@"GPIO_C30" number:i++ bank:1 select:MB(0x060, 0x00) readWrite:MB(0x064, 0x00) support:SUP2];
                lo[@"GPIO_C31"] = [PGWXLayout layoutWithName:@"GPIO_C31" number:i++ bank:1 select:MB(0x060, 0x04) readWrite:MB(0x064, 0x01) support:SUP2];
                lo[@"GPIO_C32"] = [PGWXLayout layoutWithName:@"GPIO_C32" number:i++ bank:1 select:MB(0x060, 0x08) readWrite:MB(0x064, 0x02) support:SUP2];
                lo[@"GPIO_C33"] = [PGWXLayout layoutWithName:@"GPIO_C33" number:i++ bank:1 select:MB(0x060, 0x0C) readWrite:MB(0x064, 0x03) support:SUP2];
                lo[@"GPIO_C40"] = [PGWXLayout layoutWithName:@"GPIO_C40" number:i++ bank:1 select:MB(0x080, 0x00) readWrite:MB(0x084, 0x00) support:SUP2];
                lo[@"GPIO_C41"] = [PGWXLayout layoutWithName:@"GPIO_C41" number:i++ bank:1 select:MB(0x080, 0x04) readWrite:MB(0x084, 0x01) support:SUP2];
                lo[@"GPIO_D10"] = [PGWXLayout layoutWithName:@"GPIO_D10" number:i++ bank:1 select:MB(0x0A0, 0x00) readWrite:MB(0x0A4, 0x00) support:SUP2];
                lo[@"GPIO_D11"] = [PGWXLayout layoutWithName:@"GPIO_D11" number:i++ bank:1 select:MB(0x0A0, 0x04) readWrite:MB(0x0A4, 0x01) support:SUP2];
                lo[@"GPIO_D12"] = [PGWXLayout layoutWithName:@"GPIO_D12" number:i++ bank:1 select:MB(0x0A0, 0x08) readWrite:MB(0x0A4, 0x02) support:SUP2];
                lo[@"GPIO_D13"] = [PGWXLayout layoutWithName:@"GPIO_D13" number:i++ bank:1 select:MB(0x0A0, 0x0C) readWrite:MB(0x0A4, 0x03) support:SUP2];
                lo[@"GPIO_D14"] = [PGWXLayout layoutWithName:@"GPIO_D14" number:i++ bank:1 select:MB(0x0A0, 0x10) readWrite:MB(0x0A4, 0x04) support:SUP2];
                lo[@"GPIO_D15"] = [PGWXLayout layoutWithName:@"GPIO_D15" number:i++ bank:1 select:MB(0x0A0, 0x14) readWrite:MB(0x0A4, 0x05) support:SUP2];
                lo[@"GPIO_D16"] = [PGWXLayout layoutWithName:@"GPIO_D16" number:i++ bank:1 select:MB(0x0A0, 0x18) readWrite:MB(0x0A4, 0x06) support:SUP2];
                lo[@"GPIO_D17"] = [PGWXLayout layoutWithName:@"GPIO_D17" number:i++ bank:1 select:MB(0x0A0, 0x1C) readWrite:MB(0x0A4, 0x07) support:SUP2];
                lo[@"GPIO_Y00"] = [PGWXLayout layoutWithName:@"GPIO_Y00" number:i++ bank:1 select:MB(0x0C0, 0x00) readWrite:MB(0x0C4, 0x00) support:SUP1];
                lo[@"GPIO_Y01"] = [PGWXLayout layoutWithName:@"GPIO_Y01" number:i++ bank:1 select:MB(0x0C0, 0x04) readWrite:MB(0x0C4, 0x01) support:SUP1];
                lo[@"GPIO_Y02"] = [PGWXLayout layoutWithName:@"GPIO_Y02" number:i++ bank:1 select:MB(0x0C0, 0x08) readWrite:MB(0x0C4, 0x02) support:SUP1];
                lo[@"GPIO_Y03"] = [PGWXLayout layoutWithName:@"GPIO_Y03" number:i++ bank:1 select:MB(0x0C0, 0x0C) readWrite:MB(0x0C4, 0x03) support:SUP1];
                lo[@"GPIO_Y04"] = [PGWXLayout layoutWithName:@"GPIO_Y04" number:i++ bank:1 select:MB(0x0C0, 0x10) readWrite:MB(0x0C4, 0x04) support:SUP1];
                lo[@"GPIO_Y05"] = [PGWXLayout layoutWithName:@"GPIO_Y05" number:i++ bank:1 select:MB(0x0C0, 0x14) readWrite:MB(0x0C4, 0x05) support:SUP1];
                lo[@"GPIO_Y10"] = [PGWXLayout layoutWithName:@"GPIO_Y10" number:i++ bank:1 select:MB(0x0E0, 0x00) readWrite:MB(0x0E4, 0x00) support:SUP1];
                lo[@"GPIO_Y11"] = [PGWXLayout layoutWithName:@"GPIO_Y11" number:i++ bank:1 select:MB(0x0E0, 0x04) readWrite:MB(0x0E4, 0x01) support:SUP1];
                lo[@"GPIO_Y12"] = [PGWXLayout layoutWithName:@"GPIO_Y12" number:i++ bank:1 select:MB(0x0E0, 0x08) readWrite:MB(0x0E4, 0x02) support:SUP1];
                lo[@"GPIO_Y13"] = [PGWXLayout layoutWithName:@"GPIO_Y13" number:i++ bank:1 select:MB(0x0E0, 0x0C) readWrite:MB(0x0E4, 0x03) support:SUP1];
                lo[@"GPIO_Y20"] = [PGWXLayout layoutWithName:@"GPIO_Y20" number:i++ bank:1 select:MB(0x100, 0x00) readWrite:MB(0x104, 0x00) support:SUP1];
                lo[@"GPIO_Y21"] = [PGWXLayout layoutWithName:@"GPIO_Y21" number:i++ bank:1 select:MB(0x100, 0x04) readWrite:MB(0x104, 0x01) support:SUP1];
                lo[@"GPIO_Y22"] = [PGWXLayout layoutWithName:@"GPIO_Y22" number:i++ bank:1 select:MB(0x100, 0x08) readWrite:MB(0x104, 0x02) support:SUP1];
                lo[@"GPIO_Y23"] = [PGWXLayout layoutWithName:@"GPIO_Y23" number:i++ bank:1 select:MB(0x100, 0x0C) readWrite:MB(0x104, 0x03) support:SUP1];
                lo[@"GPIO_Y24"] = [PGWXLayout layoutWithName:@"GPIO_Y24" number:i++ bank:1 select:MB(0x100, 0x10) readWrite:MB(0x104, 0x04) support:SUP1];
                lo[@"GPIO_Y25"] = [PGWXLayout layoutWithName:@"GPIO_Y25" number:i++ bank:1 select:MB(0x100, 0x14) readWrite:MB(0x104, 0x05) support:SUP1];
                lo[@"GPIO_Y30"] = [PGWXLayout layoutWithName:@"GPIO_Y30" number:i++ bank:1 select:MB(0x120, 0x00) readWrite:MB(0x124, 0x00) support:SUP1];
                lo[@"GPIO_Y31"] = [PGWXLayout layoutWithName:@"GPIO_Y31" number:i++ bank:1 select:MB(0x120, 0x04) readWrite:MB(0x124, 0x01) support:SUP1];
                lo[@"GPIO_Y32"] = [PGWXLayout layoutWithName:@"GPIO_Y32" number:i++ bank:1 select:MB(0x120, 0x08) readWrite:MB(0x124, 0x02) support:SUP1];
                lo[@"GPIO_Y33"] = [PGWXLayout layoutWithName:@"GPIO_Y33" number:i++ bank:1 select:MB(0x120, 0x0C) readWrite:MB(0x124, 0x03) support:SUP1];
                lo[@"GPIO_Y34"] = [PGWXLayout layoutWithName:@"GPIO_Y34" number:i++ bank:1 select:MB(0x120, 0x10) readWrite:MB(0x124, 0x04) support:SUP1];
                lo[@"GPIO_Y35"] = [PGWXLayout layoutWithName:@"GPIO_Y35" number:i++ bank:1 select:MB(0x120, 0x14) readWrite:MB(0x124, 0x05) support:SUP1];
                lo[@"GPIO_Y36"] = [PGWXLayout layoutWithName:@"GPIO_Y36" number:i++ bank:1 select:MB(0x120, 0x18) readWrite:MB(0x124, 0x06) support:SUP1];
                lo[@"GPIO_Y37"] = [PGWXLayout layoutWithName:@"GPIO_Y37" number:i++ bank:1 select:MB(0x120, 0x1C) readWrite:MB(0x124, 0x07) support:SUP1];
                lo[@"GPIO_Y40"] = [PGWXLayout layoutWithName:@"GPIO_Y40" number:i++ bank:1 select:MB(0x140, 0x00) readWrite:MB(0x144, 0x00) support:SUP1];
                lo[@"GPIO_Y41"] = [PGWXLayout layoutWithName:@"GPIO_Y41" number:i++ bank:1 select:MB(0x140, 0x04) readWrite:MB(0x144, 0x01) support:SUP1];
                lo[@"GPIO_Y42"] = [PGWXLayout layoutWithName:@"GPIO_Y42" number:i++ bank:1 select:MB(0x140, 0x08) readWrite:MB(0x144, 0x02) support:SUP1];
                lo[@"GPIO_Y43"] = [PGWXLayout layoutWithName:@"GPIO_Y43" number:i++ bank:1 select:MB(0x140, 0x0C) readWrite:MB(0x144, 0x03) support:SUP1];
                lo[@"GPIO_Y44"] = [PGWXLayout layoutWithName:@"GPIO_Y44" number:i++ bank:1 select:MB(0x140, 0x10) readWrite:MB(0x144, 0x04) support:SUP1];
                lo[@"GPIO_Y45"] = [PGWXLayout layoutWithName:@"GPIO_Y45" number:i++ bank:1 select:MB(0x140, 0x14) readWrite:MB(0x144, 0x05) support:SUP1];
                lo[@"GPIO_Y46"] = [PGWXLayout layoutWithName:@"GPIO_Y46" number:i++ bank:1 select:MB(0x140, 0x18) readWrite:MB(0x144, 0x06) support:SUP1];
                lo[@"GPIO_Y47"] = [PGWXLayout layoutWithName:@"GPIO_Y47" number:i++ bank:1 select:MB(0x140, 0x1C) readWrite:MB(0x144, 0x07) support:SUP1];
                lo[@"GPIO_Y50"] = [PGWXLayout layoutWithName:@"GPIO_Y50" number:i++ bank:1 select:MB(0x160, 0x00) readWrite:MB(0x164, 0x00) support:SUP1];
                lo[@"GPIO_Y51"] = [PGWXLayout layoutWithName:@"GPIO_Y51" number:i++ bank:1 select:MB(0x160, 0x04) readWrite:MB(0x164, 0x01) support:SUP1];
                lo[@"GPIO_Y52"] = [PGWXLayout layoutWithName:@"GPIO_Y52" number:i++ bank:1 select:MB(0x160, 0x08) readWrite:MB(0x164, 0x02) support:SUP1];
                lo[@"GPIO_Y53"] = [PGWXLayout layoutWithName:@"GPIO_Y53" number:i++ bank:1 select:MB(0x160, 0x0C) readWrite:MB(0x164, 0x03) support:SUP1];
                lo[@"GPIO_Y54"] = [PGWXLayout layoutWithName:@"GPIO_Y54" number:i++ bank:1 select:MB(0x160, 0x10) readWrite:MB(0x164, 0x04) support:SUP1];
                lo[@"GPIO_Y55"] = [PGWXLayout layoutWithName:@"GPIO_Y55" number:i++ bank:1 select:MB(0x160, 0x14) readWrite:MB(0x164, 0x05) support:SUP1];
                lo[@"GPIO_Y56"] = [PGWXLayout layoutWithName:@"GPIO_Y56" number:i++ bank:1 select:MB(0x160, 0x18) readWrite:MB(0x164, 0x06) support:SUP1];
                lo[@"GPIO_Y57"] = [PGWXLayout layoutWithName:@"GPIO_Y57" number:i++ bank:1 select:MB(0x160, 0x1C) readWrite:MB(0x164, 0x07) support:SUP1];
                lo[@"GPIO_Y60"] = [PGWXLayout layoutWithName:@"GPIO_Y60" number:i++ bank:1 select:MB(0x180, 0x00) readWrite:MB(0x184, 0x00) support:SUP1];
                lo[@"GPIO_Y61"] = [PGWXLayout layoutWithName:@"GPIO_Y61" number:i++ bank:1 select:MB(0x180, 0x04) readWrite:MB(0x184, 0x01) support:SUP1];
                lo[@"GPIO_Y62"] = [PGWXLayout layoutWithName:@"GPIO_Y62" number:i++ bank:1 select:MB(0x180, 0x08) readWrite:MB(0x184, 0x02) support:SUP1];
                lo[@"GPIO_Y63"] = [PGWXLayout layoutWithName:@"GPIO_Y63" number:i++ bank:1 select:MB(0x180, 0x0C) readWrite:MB(0x184, 0x03) support:SUP1];
                lo[@"GPIO_Y64"] = [PGWXLayout layoutWithName:@"GPIO_Y64" number:i++ bank:1 select:MB(0x180, 0x10) readWrite:MB(0x184, 0x04) support:SUP1];
                lo[@"GPIO_Y65"] = [PGWXLayout layoutWithName:@"GPIO_Y65" number:i++ bank:1 select:MB(0x180, 0x14) readWrite:MB(0x184, 0x05) support:SUP1];
                lo[@"GPIO_Y66"] = [PGWXLayout layoutWithName:@"GPIO_Y66" number:i++ bank:1 select:MB(0x180, 0x18) readWrite:MB(0x184, 0x06) support:SUP1];
                lo[@"GPIO_Y67"] = [PGWXLayout layoutWithName:@"GPIO_Y67" number:i++ bank:1 select:MB(0x180, 0x1C) readWrite:MB(0x184, 0x07) support:SUP1];
                lo[@"GPIO_E00"] = [PGWXLayout layoutWithName:@"GPIO_E00" number:i++ bank:2 select:MB(0x000, 0x00) readWrite:MB(0x004, 0x00) support:SUP2];
                lo[@"GPIO_E01"] = [PGWXLayout layoutWithName:@"GPIO_E01" number:i++ bank:2 select:MB(0x000, 0x04) readWrite:MB(0x004, 0x01) support:SUP2];
                lo[@"GPIO_E02"] = [PGWXLayout layoutWithName:@"GPIO_E02" number:i++ bank:2 select:MB(0x000, 0x08) readWrite:MB(0x004, 0x02) support:SUP2];
                lo[@"GPIO_E03"] = [PGWXLayout layoutWithName:@"GPIO_E03" number:i++ bank:2 select:MB(0x000, 0x0C) readWrite:MB(0x004, 0x03) support:SUP2];
                lo[@"GPIO_E04"] = [PGWXLayout layoutWithName:@"GPIO_E04" number:i++ bank:2 select:MB(0x000, 0x10) readWrite:MB(0x004, 0x04) support:SUP2];
                lo[@"GPIO_E05"] = [PGWXLayout layoutWithName:@"GPIO_E05" number:i++ bank:2 select:MB(0x000, 0x14) readWrite:MB(0x004, 0x05) support:SUP2];
                lo[@"GPIO_E06"] = [PGWXLayout layoutWithName:@"GPIO_E06" number:i++ bank:2 select:MB(0x000, 0x18) readWrite:MB(0x004, 0x06) support:SUP2];
                lo[@"GPIO_E07"] = [PGWXLayout layoutWithName:@"GPIO_E07" number:i++ bank:2 select:MB(0x000, 0x1C) readWrite:MB(0x004, 0x07) support:SUP2];
                lo[@"GPIO_E10"] = [PGWXLayout layoutWithName:@"GPIO_E10" number:i++ bank:2 select:MB(0x020, 0x00) readWrite:MB(0x024, 0x00) support:SUP2];
                lo[@"GPIO_E11"] = [PGWXLayout layoutWithName:@"GPIO_E11" number:i++ bank:2 select:MB(0x020, 0x04) readWrite:MB(0x024, 0x01) support:SUP2];
                lo[@"GPIO_F00"] = [PGWXLayout layoutWithName:@"GPIO_F00" number:i++ bank:2 select:MB(0x040, 0x00) readWrite:MB(0x044, 0x00) support:SUP2];
                lo[@"GPIO_F01"] = [PGWXLayout layoutWithName:@"GPIO_F01" number:i++ bank:2 select:MB(0x040, 0x04) readWrite:MB(0x044, 0x01) support:SUP2];
                lo[@"GPIO_F02"] = [PGWXLayout layoutWithName:@"GPIO_F02" number:i++ bank:2 select:MB(0x040, 0x08) readWrite:MB(0x044, 0x02) support:SUP2];
                lo[@"GPIO_F03"] = [PGWXLayout layoutWithName:@"GPIO_F03" number:i++ bank:2 select:MB(0x040, 0x0C) readWrite:MB(0x044, 0x03) support:SUP2];
                lo[@"GPIO_F04"] = [PGWXLayout layoutWithName:@"GPIO_F04" number:i++ bank:2 select:MB(0x040, 0x10) readWrite:MB(0x044, 0x04) support:SUP2];
                lo[@"GPIO_F05"] = [PGWXLayout layoutWithName:@"GPIO_F05" number:i++ bank:2 select:MB(0x040, 0x14) readWrite:MB(0x044, 0x05) support:SUP2];
                lo[@"GPIO_F10"] = [PGWXLayout layoutWithName:@"GPIO_F10" number:i++ bank:2 select:MB(0x060, 0x00) readWrite:MB(0x064, 0x00) support:SUP2];
                lo[@"GPIO_F11"] = [PGWXLayout layoutWithName:@"GPIO_F11" number:i++ bank:2 select:MB(0x060, 0x04) readWrite:MB(0x064, 0x01) support:SUP2];
                lo[@"GPIO_F12"] = [PGWXLayout layoutWithName:@"GPIO_F12" number:i++ bank:2 select:MB(0x060, 0x08) readWrite:MB(0x064, 0x02) support:SUP2];
                lo[@"GPIO_F13"] = [PGWXLayout layoutWithName:@"GPIO_F13" number:i++ bank:2 select:MB(0x060, 0x0C) readWrite:MB(0x064, 0x03) support:SUP2];
                lo[@"GPIO_F14"] = [PGWXLayout layoutWithName:@"GPIO_F14" number:i++ bank:2 select:MB(0x060, 0x10) readWrite:MB(0x064, 0x04) support:SUP2];
                lo[@"GPIO_F15"] = [PGWXLayout layoutWithName:@"GPIO_F15" number:i++ bank:2 select:MB(0x060, 0x14) readWrite:MB(0x064, 0x05) support:SUP2];
                lo[@"GPIO_F16"] = [PGWXLayout layoutWithName:@"GPIO_F16" number:i++ bank:2 select:MB(0x060, 0x18) readWrite:MB(0x064, 0x06) support:SUP2];
                lo[@"GPIO_F17"] = [PGWXLayout layoutWithName:@"GPIO_F17" number:i++ bank:2 select:MB(0x060, 0x1C) readWrite:MB(0x064, 0x07) support:SUP2];
                lo[@"GPIO_G00"] = [PGWXLayout layoutWithName:@"GPIO_G00" number:i++ bank:2 select:MB(0x080, 0x00) readWrite:MB(0x084, 0x00) support:SUP2];
                lo[@"GPIO_G01"] = [PGWXLayout layoutWithName:@"GPIO_G01" number:i++ bank:2 select:MB(0x080, 0x04) readWrite:MB(0x084, 0x01) support:SUP2];
                lo[@"GPIO_G02"] = [PGWXLayout layoutWithName:@"GPIO_G02" number:i++ bank:2 select:MB(0x080, 0x08) readWrite:MB(0x084, 0x02) support:SUP2];
                lo[@"GPIO_G03"] = [PGWXLayout layoutWithName:@"GPIO_G03" number:i++ bank:2 select:MB(0x080, 0x0C) readWrite:MB(0x084, 0x03) support:SUP2];
                lo[@"GPIO_G04"] = [PGWXLayout layoutWithName:@"GPIO_G04" number:i++ bank:2 select:MB(0x080, 0x10) readWrite:MB(0x084, 0x04) support:SUP2];
                lo[@"GPIO_G05"] = [PGWXLayout layoutWithName:@"GPIO_G05" number:i++ bank:2 select:MB(0x080, 0x14) readWrite:MB(0x084, 0x05) support:SUP2];
                lo[@"GPIO_G06"] = [PGWXLayout layoutWithName:@"GPIO_G06" number:i++ bank:2 select:MB(0x080, 0x18) readWrite:MB(0x084, 0x06) support:SUP2];
                lo[@"GPIO_G07"] = [PGWXLayout layoutWithName:@"GPIO_G07" number:i++ bank:2 select:MB(0x080, 0x1C) readWrite:MB(0x084, 0x07) support:SUP2];
                lo[@"GPIO_G10"] = [PGWXLayout layoutWithName:@"GPIO_G10" number:i++ bank:2 select:MB(0x0A0, 0x00) readWrite:MB(0x0A4, 0x00) support:SUP2];
                lo[@"GPIO_G11"] = [PGWXLayout layoutWithName:@"GPIO_G11" number:i++ bank:2 select:MB(0x0A0, 0x04) readWrite:MB(0x0A4, 0x01) support:SUP2];
                lo[@"GPIO_G12"] = [PGWXLayout layoutWithName:@"GPIO_G12" number:i++ bank:2 select:MB(0x0A0, 0x08) readWrite:MB(0x0A4, 0x02) support:SUP2];
                lo[@"GPIO_G13"] = [PGWXLayout layoutWithName:@"GPIO_G13" number:i++ bank:2 select:MB(0x0A0, 0x0C) readWrite:MB(0x0A4, 0x03) support:SUP2];
                lo[@"GPIO_G14"] = [PGWXLayout layoutWithName:@"GPIO_G14" number:i++ bank:2 select:MB(0x0A0, 0x10) readWrite:MB(0x0A4, 0x04) support:SUP2];
                lo[@"GPIO_G15"] = [PGWXLayout layoutWithName:@"GPIO_G15" number:i++ bank:2 select:MB(0x0A0, 0x14) readWrite:MB(0x0A4, 0x05) support:SUP2];
                lo[@"GPIO_G16"] = [PGWXLayout layoutWithName:@"GPIO_G16" number:i++ bank:2 select:MB(0x0A0, 0x18) readWrite:MB(0x0A4, 0x06) support:SUP2];
                lo[@"GPIO_G17"] = [PGWXLayout layoutWithName:@"GPIO_G17" number:i++ bank:2 select:MB(0x0A0, 0x1C) readWrite:MB(0x0A4, 0x07) support:SUP2];
                lo[@"GPIO_G20"] = [PGWXLayout layoutWithName:@"GPIO_G20" number:i++ bank:2 select:MB(0x0C0, 0x00) readWrite:MB(0x0C4, 0x00) support:SUP2];
                lo[@"GPIO_G21"] = [PGWXLayout layoutWithName:@"GPIO_G21" number:i++ bank:2 select:MB(0x0C0, 0x04) readWrite:MB(0x0C4, 0x01) support:SUP2];
                lo[@"GPIO_J40"] = [PGWXLayout layoutWithName:@"GPIO_J40" number:i++ bank:2 select:MB(0x0E0, 0x00) readWrite:MB(0x0E4, 0x00) support:SUP2];
                lo[@"GPIO_J41"] = [PGWXLayout layoutWithName:@"GPIO_J41" number:i++ bank:2 select:MB(0x0E0, 0x04) readWrite:MB(0x0E4, 0x01) support:SUP2];
                lo[@"GPIO_J42"] = [PGWXLayout layoutWithName:@"GPIO_J42" number:i++ bank:2 select:MB(0x0E0, 0x08) readWrite:MB(0x0E4, 0x02) support:SUP2];
                lo[@"GPIO_J43"] = [PGWXLayout layoutWithName:@"GPIO_J43" number:i++ bank:2 select:MB(0x0E0, 0x0C) readWrite:MB(0x0E4, 0x03) support:SUP2];
                lo[@"GPIO_A00"] = [PGWXLayout layoutWithName:@"GPIO_A00" number:i++ bank:3 select:MB(0x000, 0x00) readWrite:MB(0x004, 0x00) support:SUP2];
                lo[@"GPIO_A01"] = [PGWXLayout layoutWithName:@"GPIO_A01" number:i++ bank:3 select:MB(0x000, 0x04) readWrite:MB(0x004, 0x01) support:SUP2];
                lo[@"GPIO_A02"] = [PGWXLayout layoutWithName:@"GPIO_A02" number:i++ bank:3 select:MB(0x000, 0x08) readWrite:MB(0x004, 0x02) support:SUP2];
                lo[@"GPIO_A03"] = [PGWXLayout layoutWithName:@"GPIO_A03" number:i++ bank:3 select:MB(0x000, 0x0C) readWrite:MB(0x004, 0x03) support:SUP2];
                lo[@"GPIO_A04"] = [PGWXLayout layoutWithName:@"GPIO_A04" number:i++ bank:3 select:MB(0x000, 0x10) readWrite:MB(0x004, 0x04) support:SUP2];
                lo[@"GPIO_A05"] = [PGWXLayout layoutWithName:@"GPIO_A05" number:i++ bank:3 select:MB(0x000, 0x14) readWrite:MB(0x004, 0x05) support:SUP2];
                lo[@"GPIO_A06"] = [PGWXLayout layoutWithName:@"GPIO_A06" number:i++ bank:3 select:MB(0x000, 0x18) readWrite:MB(0x004, 0x06) support:SUP3];
                lo[@"GPIO_A07"] = [PGWXLayout layoutWithName:@"GPIO_A07" number:i++ bank:3 select:MB(0x000, 0x1C) readWrite:MB(0x004, 0x07) support:SUP3];
                lo[@"GPIO_A10"] = [PGWXLayout layoutWithName:@"GPIO_A10" number:i++ bank:3 select:MB(0x020, 0x00) readWrite:MB(0x024, 0x00) support:SUP2];
                lo[@"GPIO_A11"] = [PGWXLayout layoutWithName:@"GPIO_A11" number:i++ bank:3 select:MB(0x020, 0x04) readWrite:MB(0x024, 0x01) support:SUP2];
                lo[@"GPIO_A12"] = [PGWXLayout layoutWithName:@"GPIO_A12" number:i++ bank:3 select:MB(0x020, 0x08) readWrite:MB(0x024, 0x02) support:SUP2];
                lo[@"GPIO_A13"] = [PGWXLayout layoutWithName:@"GPIO_A13" number:i++ bank:3 select:MB(0x020, 0x0C) readWrite:MB(0x024, 0x03) support:SUP2];
                lo[@"GPIO_A14"] = [PGWXLayout layoutWithName:@"GPIO_A14" number:i++ bank:3 select:MB(0x020, 0x10) readWrite:MB(0x024, 0x04) support:SUP2];
                lo[@"GPIO_A15"] = [PGWXLayout layoutWithName:@"GPIO_A15" number:i++ bank:3 select:MB(0x020, 0x14) readWrite:MB(0x024, 0x05) support:SUP2];
                lo[@"GPIO_A20"] = [PGWXLayout layoutWithName:@"GPIO_A20" number:i++ bank:3 select:MB(0x040, 0x00) readWrite:MB(0x044, 0x00) support:SUP3];
                lo[@"GPIO_A21"] = [PGWXLayout layoutWithName:@"GPIO_A21" number:i++ bank:3 select:MB(0x040, 0x04) readWrite:MB(0x044, 0x01) support:SUP3];
                lo[@"GPIO_A22"] = [PGWXLayout layoutWithName:@"GPIO_A22" number:i++ bank:3 select:MB(0x040, 0x08) readWrite:MB(0x044, 0x02) support:SUP3];
                lo[@"GPIO_A23"] = [PGWXLayout layoutWithName:@"GPIO_A23" number:i++ bank:3 select:MB(0x040, 0x0C) readWrite:MB(0x044, 0x03) support:SUP3];
                lo[@"GPIO_A24"] = [PGWXLayout layoutWithName:@"GPIO_A24" number:i++ bank:3 select:MB(0x040, 0x10) readWrite:MB(0x044, 0x04) support:SUP2];
                lo[@"GPIO_A25"] = [PGWXLayout layoutWithName:@"GPIO_A25" number:i++ bank:3 select:MB(0x040, 0x14) readWrite:MB(0x044, 0x05) support:SUP2];
                lo[@"GPIO_A26"] = [PGWXLayout layoutWithName:@"GPIO_A26" number:i++ bank:3 select:MB(0x040, 0x18) readWrite:MB(0x044, 0x06) support:SUP2];
                lo[@"GPIO_A27"] = [PGWXLayout layoutWithName:@"GPIO_A27" number:i++ bank:3 select:MB(0x040, 0x1C) readWrite:MB(0x044, 0x07) support:SUP2];
                lo[@"GPIO_B00"] = [PGWXLayout layoutWithName:@"GPIO_B00" number:i++ bank:3 select:MB(0x060, 0x00) readWrite:MB(0x064, 0x00) support:SUP3];
                lo[@"GPIO_B01"] = [PGWXLayout layoutWithName:@"GPIO_B01" number:i++ bank:3 select:MB(0x060, 0x04) readWrite:MB(0x064, 0x01) support:SUP3];
                lo[@"GPIO_B02"] = [PGWXLayout layoutWithName:@"GPIO_B02" number:i++ bank:3 select:MB(0x060, 0x08) readWrite:MB(0x064, 0x02) support:SUP3];
                lo[@"GPIO_B03"] = [PGWXLayout layoutWithName:@"GPIO_B03" number:i++ bank:3 select:MB(0x060, 0x0C) readWrite:MB(0x064, 0x03) support:SUP3];
                lo[@"GPIO_B04"] = [PGWXLayout layoutWithName:@"GPIO_B04" number:i++ bank:3 select:MB(0x060, 0x10) readWrite:MB(0x064, 0x04) support:SUP3];
                lo[@"GPIO_B10"] = [PGWXLayout layoutWithName:@"GPIO_B10" number:i++ bank:3 select:MB(0x080, 0x00) readWrite:MB(0x084, 0x00) support:SUP2];
                lo[@"GPIO_B11"] = [PGWXLayout layoutWithName:@"GPIO_B11" number:i++ bank:3 select:MB(0x080, 0x04) readWrite:MB(0x084, 0x01) support:SUP2];
                lo[@"GPIO_B12"] = [PGWXLayout layoutWithName:@"GPIO_B12" number:i++ bank:3 select:MB(0x080, 0x08) readWrite:MB(0x084, 0x02) support:SUP2];
                lo[@"GPIO_B13"] = [PGWXLayout layoutWithName:@"GPIO_B13" number:i++ bank:3 select:MB(0x080, 0x0C) readWrite:MB(0x084, 0x03) support:SUP2];
                lo[@"GPIO_B14"] = [PGWXLayout layoutWithName:@"GPIO_B14" number:i++ bank:3 select:MB(0x080, 0x10) readWrite:MB(0x084, 0x04) support:SUP2];
                lo[@"GPIO_B20"] = [PGWXLayout layoutWithName:@"GPIO_B20" number:i++ bank:3 select:MB(0x0A0, 0x00) readWrite:MB(0x0A4, 0x00) support:SUP2];
                lo[@"GPIO_B21"] = [PGWXLayout layoutWithName:@"GPIO_B21" number:i++ bank:3 select:MB(0x0A0, 0x04) readWrite:MB(0x0A4, 0x01) support:SUP2];
                lo[@"GPIO_B22"] = [PGWXLayout layoutWithName:@"GPIO_B22" number:i++ bank:3 select:MB(0x0A0, 0x08) readWrite:MB(0x0A4, 0x02) support:SUP3];
                lo[@"GPIO_B23"] = [PGWXLayout layoutWithName:@"GPIO_B23" number:i++ bank:3 select:MB(0x0A0, 0x0C) readWrite:MB(0x0A4, 0x03) support:SUP3];
                lo[@"GPIO_B30"] = [PGWXLayout layoutWithName:@"GPIO_B30" number:i++ bank:3 select:MB(0x0C0, 0x00) readWrite:MB(0x0C4, 0x00) support:SUP3];
                lo[@"GPIO_B31"] = [PGWXLayout layoutWithName:@"GPIO_B31" number:i++ bank:3 select:MB(0x0C0, 0x04) readWrite:MB(0x0C4, 0x01) support:SUP3];
                lo[@"GPIO_B32"] = [PGWXLayout layoutWithName:@"GPIO_B32" number:i++ bank:3 select:MB(0x0C0, 0x08) readWrite:MB(0x0C4, 0x02) support:SUP3];
                lo[@"GPIO_B33"] = [PGWXLayout layoutWithName:@"GPIO_B33" number:i++ bank:3 select:MB(0x0C0, 0x0C) readWrite:MB(0x0C4, 0x03) support:SUP3];
                lo[@"GPIO_B34"] = [PGWXLayout layoutWithName:@"GPIO_B34" number:i++ bank:3 select:MB(0x0C0, 0x10) readWrite:MB(0x0C4, 0x04) support:SUP3];
                lo[@"GPIO_B35"] = [PGWXLayout layoutWithName:@"GPIO_B35" number:i++ bank:3 select:MB(0x0C0, 0x14) readWrite:MB(0x0C4, 0x05) support:SUP3];
                lo[@"GPIO_B36"] = [PGWXLayout layoutWithName:@"GPIO_B36" number:i++ bank:3 select:MB(0x0C0, 0x18) readWrite:MB(0x0C4, 0x06) support:SUP3];
                lo[@"GPIO_B37"] = [PGWXLayout layoutWithName:@"GPIO_B37" number:i++ bank:3 select:MB(0x0C0, 0x1C) readWrite:MB(0x0C4, 0x07) support:SUP3];
                lo[@"GPIO_B40"] = [PGWXLayout layoutWithName:@"GPIO_B40" number:i++ bank:3 select:MB(0x0E0, 0x00) readWrite:MB(0x0E4, 0x00) support:SUP3];
                lo[@"GPIO_B41"] = [PGWXLayout layoutWithName:@"GPIO_B41" number:i++ bank:3 select:MB(0x0E0, 0x04) readWrite:MB(0x0E4, 0x01) support:SUP3];
                lo[@"GPIO_H00"] = [PGWXLayout layoutWithName:@"GPIO_H00" number:i++ bank:3 select:MB(0x100, 0x00) readWrite:MB(0x104, 0x00) support:SUP2];
                lo[@"GPIO_H01"] = [PGWXLayout layoutWithName:@"GPIO_H01" number:i++ bank:3 select:MB(0x100, 0x04) readWrite:MB(0x104, 0x01) support:SUP2];
                lo[@"GPIO_H02"] = [PGWXLayout layoutWithName:@"GPIO_H02" number:i++ bank:3 select:MB(0x100, 0x08) readWrite:MB(0x104, 0x02) support:SUP2];
                lo[@"GPIO_H03"] = [PGWXLayout layoutWithName:@"GPIO_H03" number:i++ bank:3 select:MB(0x100, 0x0C) readWrite:MB(0x104, 0x03) support:SUP2];
                lo[@"GPIO_H04"] = [PGWXLayout layoutWithName:@"GPIO_H04" number:i++ bank:3 select:MB(0x100, 0x10) readWrite:MB(0x104, 0x04) support:SUP2];
                lo[@"GPIO_H05"] = [PGWXLayout layoutWithName:@"GPIO_H05" number:i++ bank:3 select:MB(0x100, 0x14) readWrite:MB(0x104, 0x05) support:SUP2];
                lo[@"GPIO_H06"] = [PGWXLayout layoutWithName:@"GPIO_H06" number:i++ bank:3 select:MB(0x100, 0x18) readWrite:MB(0x104, 0x06) support:SUP2];
                lo[@"GPIO_H07"] = [PGWXLayout layoutWithName:@"GPIO_H07" number:i++ bank:3 select:MB(0x100, 0x1C) readWrite:MB(0x104, 0x07) support:SUP2];
                lo[@"GPIO_Z0"]  = [PGWXLayout layoutWithName:@"GPIO_Z0" number:i++ bank:4 select:MB(0x000, 0x00) readWrite:MB(0x004, 0x00) support:SUP2];
                lo[@"GPIO_Z1"]  = [PGWXLayout layoutWithName:@"GPIO_Z1" number:i++ bank:4 select:MB(0x000, 0x04) readWrite:MB(0x004, 0x01) support:SUP2];
                lo[@"GPIO_Z2"]  = [PGWXLayout layoutWithName:@"GPIO_Z2" number:i++ bank:4 select:MB(0x000, 0x08) readWrite:MB(0x004, 0x02) support:SUP2];
                lo[@"GPIO_Z3"]  = [PGWXLayout layoutWithName:@"GPIO_Z3" number:i++ bank:4 select:MB(0x000, 0x0C) readWrite:MB(0x004, 0x03) support:SUP2];
                lo[@"GPIO_Z4"]  = [PGWXLayout layoutWithName:@"GPIO_Z4" number:i++ bank:4 select:MB(0x000, 0x10) readWrite:MB(0x004, 0x04) support:SUP2];
                lo[@"GPIO_Z5"]  = [PGWXLayout layoutWithName:@"GPIO_Z5" number:i++ bank:4 select:MB(0x000, 0x14) readWrite:MB(0x004, 0x05) support:SUP2];
                lo[@"GPIO_Z6"]  = [PGWXLayout layoutWithName:@"GPIO_Z6" number:i bank:4 select:MB(0x000, 0x18) readWrite:MB(0x004, 0x06) support:SUP2];

                _layout = [NSDictionary dictionaryWithDictionary:lo];
            }
        }
        @finally {
            [self unlock];
        }

        return _layout;
    }

@end
