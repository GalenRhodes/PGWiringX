/******************************************************************************************************************************//**
 *     PROJECT: PGWiringX
 *    FILENAME: PGWXSOCNXP.m
 *         IDE: AppCode
 *      AUTHOR: Galen Rhodes
 *        DATE: 6/26/17 2:26 PM
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

#import "PGWXSOCNXP.h"
#import "PGWXBit.h"

#define MB(b, o) PGWXMakeBit((b),(o))
#define SUP1    (PGWX_FUNCTION_DIGITAL)

#define PGWXLAYOUTIMX6DQRM(ar) NSUInteger i = 0;\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO00" number:i++ bank:0 select:MB(0xE0220, 0x0) readWrite:MB(0x9C000, 0x00) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO01" number:i++ bank:0 select:MB(0xE0224, 0x0) readWrite:MB(0x9C000, 0x01) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO02" number:i++ bank:0 select:MB(0xE0234, 0x0) readWrite:MB(0x9C000, 0x02) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO03" number:i++ bank:0 select:MB(0xE022C, 0x0) readWrite:MB(0x9C000, 0x03) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO04" number:i++ bank:0 select:MB(0xE0238, 0x0) readWrite:MB(0x9C000, 0x04) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO05" number:i++ bank:0 select:MB(0xE023C, 0x0) readWrite:MB(0x9C000, 0x05) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO06" number:i++ bank:0 select:MB(0xE0230, 0x0) readWrite:MB(0x9C000, 0x06) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO07" number:i++ bank:0 select:MB(0xE0240, 0x0) readWrite:MB(0x9C000, 0x07) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO08" number:i++ bank:0 select:MB(0xE0244, 0x0) readWrite:MB(0x9C000, 0x08) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO09" number:i++ bank:0 select:MB(0xE0228, 0x0) readWrite:MB(0x9C000, 0x09) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO10" number:i++ bank:0 select:MB(0xE0354, 0x0) readWrite:MB(0x9C000, 0x0A) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO11" number:i++ bank:0 select:MB(0xE0358, 0x0) readWrite:MB(0x9C000, 0x0B) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO12" number:i++ bank:0 select:MB(0xE035C, 0x0) readWrite:MB(0x9C000, 0x0C) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO13" number:i++ bank:0 select:MB(0xE0050, 0x0) readWrite:MB(0x9C000, 0x0D) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO14" number:i++ bank:0 select:MB(0xE004C, 0x0) readWrite:MB(0x9C000, 0x0E) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO15" number:i++ bank:0 select:MB(0xE0054, 0x0) readWrite:MB(0x9C000, 0x0D) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO16" number:i++ bank:0 select:MB(0xE0340, 0x0) readWrite:MB(0x9C000, 0x10) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO17" number:i++ bank:0 select:MB(0xE033C, 0x0) readWrite:MB(0x9C000, 0x11) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO18" number:i++ bank:0 select:MB(0xE0348, 0x0) readWrite:MB(0x9C000, 0x12) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO19" number:i++ bank:0 select:MB(0xE034C, 0x0) readWrite:MB(0x9C000, 0x13) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO20" number:i++ bank:0 select:MB(0xE0350, 0x0) readWrite:MB(0x9C000, 0x14) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO21" number:i++ bank:0 select:MB(0xE0344, 0x0) readWrite:MB(0x9C000, 0x15) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO22" number:i++ bank:0 select:MB(0xE01D0, 0x0) readWrite:MB(0x9C000, 0x16) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO23" number:i++ bank:0 select:MB(0xE01D4, 0x0) readWrite:MB(0x9C000, 0x17) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO24" number:i++ bank:0 select:MB(0xE01D8, 0x0) readWrite:MB(0x9C000, 0x18) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO25" number:i++ bank:0 select:MB(0xE01DC, 0x0) readWrite:MB(0x9C000, 0x19) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO26" number:i++ bank:0 select:MB(0xE01E0, 0x0) readWrite:MB(0x9C000, 0x1A) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO27" number:i++ bank:0 select:MB(0xE01E4, 0x0) readWrite:MB(0x9C000, 0x1B) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO28" number:i++ bank:0 select:MB(0xE01E8, 0x0) readWrite:MB(0x9C000, 0x1C) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO29" number:i++ bank:0 select:MB(0xE01EC, 0x0) readWrite:MB(0x9C000, 0x1D) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO30" number:i++ bank:0 select:MB(0xE01F0, 0x0) readWrite:MB(0x9C000, 0x1E) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO31" number:i++ bank:0 select:MB(0xE01F4, 0x0) readWrite:MB(0x9C000, 0x1F) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO00" number:i++ bank:0 select:MB(0xE02FC, 0x0) readWrite:MB(0xA0000, 0x00) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO01" number:i++ bank:0 select:MB(0xE0300, 0x0) readWrite:MB(0xA0000, 0x01) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO02" number:i++ bank:0 select:MB(0xE0304, 0x0) readWrite:MB(0xA0000, 0x02) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO03" number:i++ bank:0 select:MB(0xE0308, 0x0) readWrite:MB(0xA0000, 0x03) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO04" number:i++ bank:0 select:MB(0xE030C, 0x0) readWrite:MB(0xA0000, 0x04) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO05" number:i++ bank:0 select:MB(0xE0310, 0x0) readWrite:MB(0xA0000, 0x05) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO06" number:i++ bank:0 select:MB(0xE0314, 0x0) readWrite:MB(0xA0000, 0x06) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO07" number:i++ bank:0 select:MB(0xE0318, 0x0) readWrite:MB(0xA0000, 0x07) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO08" number:i++ bank:0 select:MB(0xE031C, 0x0) readWrite:MB(0xA0000, 0x08) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO09" number:i++ bank:0 select:MB(0xE0320, 0x0) readWrite:MB(0xA0000, 0x09) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO10" number:i++ bank:0 select:MB(0xE0324, 0x0) readWrite:MB(0xA0000, 0x0A) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO11" number:i++ bank:0 select:MB(0xE0328, 0x0) readWrite:MB(0xA0000, 0x0B) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO12" number:i++ bank:0 select:MB(0xE032C, 0x0) readWrite:MB(0xA0000, 0x0C) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO13" number:i++ bank:0 select:MB(0xE0330, 0x0) readWrite:MB(0xA0000, 0x0D) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO14" number:i++ bank:0 select:MB(0xE0334, 0x0) readWrite:MB(0xA0000, 0x0E) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO15" number:i++ bank:0 select:MB(0xE0338, 0x0) readWrite:MB(0xA0000, 0x0F) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO16" number:i++ bank:0 select:MB(0xE00DC, 0x0) readWrite:MB(0xA0000, 0x10) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO17" number:i++ bank:0 select:MB(0xE00E0, 0x0) readWrite:MB(0xA0000, 0x11) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO18" number:i++ bank:0 select:MB(0xE00E4, 0x0) readWrite:MB(0xA0000, 0x12) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO19" number:i++ bank:0 select:MB(0xE00E8, 0x0) readWrite:MB(0xA0000, 0x13) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO20" number:i++ bank:0 select:MB(0xE00EC, 0x0) readWrite:MB(0xA0000, 0x14) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO21" number:i++ bank:0 select:MB(0xE00F0, 0x0) readWrite:MB(0xA0000, 0x15) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO22" number:i++ bank:0 select:MB(0xE00F4, 0x0) readWrite:MB(0xA0000, 0x16) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO23" number:i++ bank:0 select:MB(0xE00F8, 0x0) readWrite:MB(0xA0000, 0x17) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO24" number:i++ bank:0 select:MB(0xE00FC, 0x0) readWrite:MB(0xA0000, 0x18) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO25" number:i++ bank:0 select:MB(0xE0100, 0x0) readWrite:MB(0xA0000, 0x19) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO26" number:i++ bank:0 select:MB(0xE0104, 0x0) readWrite:MB(0xA0000, 0x1A) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO27" number:i++ bank:0 select:MB(0xE0108, 0x0) readWrite:MB(0xA0000, 0x1B) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO28" number:i++ bank:0 select:MB(0xE010C, 0x0) readWrite:MB(0xA0000, 0x1C) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO29" number:i++ bank:0 select:MB(0xE0110, 0x0) readWrite:MB(0xA0000, 0x1D) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO30" number:i++ bank:0 select:MB(0xE008C, 0x0) readWrite:MB(0xA0000, 0x1E) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO31" number:i++ bank:0 select:MB(0xE00B0, 0x0) readWrite:MB(0xA0000, 0x1F) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO00" number:i++ bank:0 select:MB(0xE0114, 0x0) readWrite:MB(0xA4000, 0x00) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO01" number:i++ bank:0 select:MB(0xE0118, 0x0) readWrite:MB(0xA4000, 0x01) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO02" number:i++ bank:0 select:MB(0xE011C, 0x0) readWrite:MB(0xA4000, 0x02) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO03" number:i++ bank:0 select:MB(0xE0120, 0x0) readWrite:MB(0xA4000, 0x03) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO04" number:i++ bank:0 select:MB(0xE0124, 0x0) readWrite:MB(0xA4000, 0x04) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO05" number:i++ bank:0 select:MB(0xE0128, 0x0) readWrite:MB(0xA4000, 0x05) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO06" number:i++ bank:0 select:MB(0xE012C, 0x0) readWrite:MB(0xA4000, 0x06) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO07" number:i++ bank:0 select:MB(0xE0130, 0x0) readWrite:MB(0xA4000, 0x07) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO08" number:i++ bank:0 select:MB(0xE0134, 0x0) readWrite:MB(0xA4000, 0x08) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO09" number:i++ bank:0 select:MB(0xE0138, 0x0) readWrite:MB(0xA4000, 0x09) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO10" number:i++ bank:0 select:MB(0xE013C, 0x0) readWrite:MB(0xA4000, 0x0A) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO11" number:i++ bank:0 select:MB(0xE0140, 0x0) readWrite:MB(0xA4000, 0x0B) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO12" number:i++ bank:0 select:MB(0xE0144, 0x0) readWrite:MB(0xA4000, 0x0C) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO13" number:i++ bank:0 select:MB(0xE0148, 0x0) readWrite:MB(0xA4000, 0x0D) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO14" number:i++ bank:0 select:MB(0xE014C, 0x0) readWrite:MB(0xA4000, 0x0E) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO15" number:i++ bank:0 select:MB(0xE0150, 0x0) readWrite:MB(0xA4000, 0x0F) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO16" number:i++ bank:0 select:MB(0xE0090, 0x0) readWrite:MB(0xA4000, 0x10) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO17" number:i++ bank:0 select:MB(0xE0094, 0x0) readWrite:MB(0xA4000, 0x11) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO18" number:i++ bank:0 select:MB(0xE0098, 0x0) readWrite:MB(0xA4000, 0x12) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO19" number:i++ bank:0 select:MB(0xE009C, 0x0) readWrite:MB(0xA4000, 0x13) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO20" number:i++ bank:0 select:MB(0xE00A0, 0x0) readWrite:MB(0xA4000, 0x14) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO21" number:i++ bank:0 select:MB(0xE00A4, 0x0) readWrite:MB(0xA4000, 0x15) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO22" number:i++ bank:0 select:MB(0xE00A8, 0x0) readWrite:MB(0xA4000, 0x16) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO23" number:i++ bank:0 select:MB(0xE00AC, 0x0) readWrite:MB(0xA4000, 0x17) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO24" number:i++ bank:0 select:MB(0xE00B4, 0x0) readWrite:MB(0xA4000, 0x18) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO25" number:i++ bank:0 select:MB(0xE00B8, 0x0) readWrite:MB(0xA4000, 0x19) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO26" number:i++ bank:0 select:MB(0xE00BC, 0x0) readWrite:MB(0xA4000, 0x1A) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO27" number:i++ bank:0 select:MB(0xE00C0, 0x0) readWrite:MB(0xA4000, 0x1B) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO28" number:i++ bank:0 select:MB(0xE00C4, 0x0) readWrite:MB(0xA4000, 0x1C) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO29" number:i++ bank:0 select:MB(0xE00C8, 0x0) readWrite:MB(0xA4000, 0x1D) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO30" number:i++ bank:0 select:MB(0xE00CC, 0x0) readWrite:MB(0xA4000, 0x1E) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO31" number:i++ bank:0 select:MB(0xE00D0, 0x0) readWrite:MB(0xA4000, 0x1F) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO05" number:i++ bank:0 select:MB(0xE0254, 0x0) readWrite:MB(0xA8000, 0x05) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO06" number:i++ bank:0 select:MB(0xE01F8, 0x0) readWrite:MB(0xA8000, 0x06) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO07" number:i++ bank:0 select:MB(0xE01FC, 0x0) readWrite:MB(0xA8000, 0x07) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO08" number:i++ bank:0 select:MB(0xE0200, 0x0) readWrite:MB(0xA8000, 0x08) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO09" number:i++ bank:0 select:MB(0xE0204, 0x0) readWrite:MB(0xA8000, 0x09) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO10" number:i++ bank:0 select:MB(0xE0208, 0x0) readWrite:MB(0xA8000, 0x0A) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO11" number:i++ bank:0 select:MB(0xE020C, 0x0) readWrite:MB(0xA8000, 0x0B) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO12" number:i++ bank:0 select:MB(0xE0210, 0x0) readWrite:MB(0xA8000, 0x0B) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO13" number:i++ bank:0 select:MB(0xE0214, 0x0) readWrite:MB(0xA8000, 0x0C) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO14" number:i++ bank:0 select:MB(0xE0218, 0x0) readWrite:MB(0xA8000, 0x0D) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO15" number:i++ bank:0 select:MB(0xE021C, 0x0) readWrite:MB(0xA8000, 0x0E) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO16" number:i++ bank:0 select:MB(0xE015C, 0x0) readWrite:MB(0xA8000, 0x10) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO17" number:i++ bank:0 select:MB(0xE0160, 0x0) readWrite:MB(0xA8000, 0x11) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO18" number:i++ bank:0 select:MB(0xE0164, 0x0) readWrite:MB(0xA8000, 0x12) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO19" number:i++ bank:0 select:MB(0xE0168, 0x0) readWrite:MB(0xA8000, 0x13) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO20" number:i++ bank:0 select:MB(0xE016C, 0x0) readWrite:MB(0xA8000, 0x14) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO21" number:i++ bank:0 select:MB(0xE0170, 0x0) readWrite:MB(0xA8000, 0x15) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO22" number:i++ bank:0 select:MB(0xE0174, 0x0) readWrite:MB(0xA8000, 0x16) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO23" number:i++ bank:0 select:MB(0xE0178, 0x0) readWrite:MB(0xA8000, 0x17) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO24" number:i++ bank:0 select:MB(0xE017C, 0x0) readWrite:MB(0xA8000, 0x18) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO25" number:i++ bank:0 select:MB(0xE0180, 0x0) readWrite:MB(0xA8000, 0x19) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO26" number:i++ bank:0 select:MB(0xE0184, 0x0) readWrite:MB(0xA8000, 0x1A) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO27" number:i++ bank:0 select:MB(0xE0188, 0x0) readWrite:MB(0xA8000, 0x1B) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO28" number:i++ bank:0 select:MB(0xE018C, 0x0) readWrite:MB(0xA8000, 0x1C) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO29" number:i++ bank:0 select:MB(0xE0190, 0x0) readWrite:MB(0xA8000, 0x1D) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO30" number:i++ bank:0 select:MB(0xE0194, 0x0) readWrite:MB(0xA8000, 0x1E) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO31" number:i++ bank:0 select:MB(0xE0198, 0x0) readWrite:MB(0xA8000, 0x1F) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO00" number:i++ bank:0 select:MB(0xE0154, 0x0) readWrite:MB(0xAC000, 0x00) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO02" number:i++ bank:0 select:MB(0xE0088, 0x0) readWrite:MB(0xAC000, 0x02) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO04" number:i++ bank:0 select:MB(0xE00D4, 0x0) readWrite:MB(0xAC000, 0x04) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO05" number:i++ bank:0 select:MB(0xE019C, 0x0) readWrite:MB(0xAC000, 0x05) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO06" number:i++ bank:0 select:MB(0xE01A0, 0x0) readWrite:MB(0xAC000, 0x06) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO07" number:i++ bank:0 select:MB(0xE01A4, 0x0) readWrite:MB(0xAC000, 0x07) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO08" number:i++ bank:0 select:MB(0xE01A8, 0x0) readWrite:MB(0xAC000, 0x08) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO09" number:i++ bank:0 select:MB(0xE01AC, 0x0) readWrite:MB(0xAC000, 0x09) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO10" number:i++ bank:0 select:MB(0xE01B0, 0x0) readWrite:MB(0xAC000, 0x0A) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO11" number:i++ bank:0 select:MB(0xE01B4, 0x0) readWrite:MB(0xAC000, 0x0B) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO12" number:i++ bank:0 select:MB(0xE01B8, 0x0) readWrite:MB(0xAC000, 0x0C) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO13" number:i++ bank:0 select:MB(0xE01BC, 0x0) readWrite:MB(0xAC000, 0x0D) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO14" number:i++ bank:0 select:MB(0xE01C0, 0x0) readWrite:MB(0xAC000, 0x0E) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO15" number:i++ bank:0 select:MB(0xE01C4, 0x0) readWrite:MB(0xAC000, 0x0F) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO16" number:i++ bank:0 select:MB(0xE01C8, 0x0) readWrite:MB(0xAC000, 0x10) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO17" number:i++ bank:0 select:MB(0xE01CC, 0x0) readWrite:MB(0xAC000, 0x11) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO18" number:i++ bank:0 select:MB(0xE0258, 0x0) readWrite:MB(0xAC000, 0x12) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO19" number:i++ bank:0 select:MB(0xE025C, 0x0) readWrite:MB(0xAC000, 0x13) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO20" number:i++ bank:0 select:MB(0xE0260, 0x0) readWrite:MB(0xAC000, 0x14) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO21" number:i++ bank:0 select:MB(0xE0264, 0x0) readWrite:MB(0xAC000, 0x15) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO22" number:i++ bank:0 select:MB(0xE0268, 0x0) readWrite:MB(0xAC000, 0x16) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO23" number:i++ bank:0 select:MB(0xE026C, 0x0) readWrite:MB(0xAC000, 0x17) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO24" number:i++ bank:0 select:MB(0xE0270, 0x0) readWrite:MB(0xAC000, 0x18) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO25" number:i++ bank:0 select:MB(0xE0274, 0x0) readWrite:MB(0xAC000, 0x19) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO26" number:i++ bank:0 select:MB(0xE0278, 0x0) readWrite:MB(0xAC000, 0x1A) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO27" number:i++ bank:0 select:MB(0xE027C, 0x0) readWrite:MB(0xAC000, 0x1B) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO28" number:i++ bank:0 select:MB(0xE0280, 0x0) readWrite:MB(0xAC000, 0x1C) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO29" number:i++ bank:0 select:MB(0xE0284, 0x0) readWrite:MB(0xAC000, 0x1D) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO30" number:i++ bank:0 select:MB(0xE0288, 0x0) readWrite:MB(0xAC000, 0x1E) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO31" number:i++ bank:0 select:MB(0xE028C, 0x0) readWrite:MB(0xAC000, 0x1F) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO00" number:i++ bank:0 select:MB(0xE0290, 0x0) readWrite:MB(0xB0000, 0x00) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO01" number:i++ bank:0 select:MB(0xE0294, 0x0) readWrite:MB(0xB0000, 0x01) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO02" number:i++ bank:0 select:MB(0xE0298, 0x0) readWrite:MB(0xB0000, 0x02) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO03" number:i++ bank:0 select:MB(0xE029C, 0x0) readWrite:MB(0xB0000, 0x03) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO04" number:i++ bank:0 select:MB(0xE02A0, 0x0) readWrite:MB(0xB0000, 0x04) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO05" number:i++ bank:0 select:MB(0xE02A4, 0x0) readWrite:MB(0xB0000, 0x05) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO06" number:i++ bank:0 select:MB(0xE00D8, 0x0) readWrite:MB(0xB0000, 0x06) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO07" number:i++ bank:0 select:MB(0xE02D4, 0x0) readWrite:MB(0xB0000, 0x07) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO08" number:i++ bank:0 select:MB(0xE02D8, 0x0) readWrite:MB(0xB0000, 0x08) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO09" number:i++ bank:0 select:MB(0xE02DC, 0x0) readWrite:MB(0xB0000, 0x09) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO10" number:i++ bank:0 select:MB(0xE02E0, 0x0) readWrite:MB(0xB0000, 0x0A) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO11" number:i++ bank:0 select:MB(0xE02E4, 0x0) readWrite:MB(0xB0000, 0x0B) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO14" number:i++ bank:0 select:MB(0xE02E8, 0x0) readWrite:MB(0xB0000, 0x0E) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO15" number:i++ bank:0 select:MB(0xE02EC, 0x0) readWrite:MB(0xB0000, 0x0F) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO16" number:i++ bank:0 select:MB(0xE02F0, 0x0) readWrite:MB(0xB0000, 0x10) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO17" number:i++ bank:0 select:MB(0xE02A8, 0x0) readWrite:MB(0xB0000, 0x11) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO18" number:i++ bank:0 select:MB(0xE02AC, 0x0) readWrite:MB(0xB0000, 0x12) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO19" number:i++ bank:0 select:MB(0xE0058, 0x0) readWrite:MB(0xB0000, 0x13) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO20" number:i++ bank:0 select:MB(0xE005C, 0x0) readWrite:MB(0xB0000, 0x14) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO21" number:i++ bank:0 select:MB(0xE0060, 0x0) readWrite:MB(0xB0000, 0x15) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO22" number:i++ bank:0 select:MB(0xE0064, 0x0) readWrite:MB(0xB0000, 0x16) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO23" number:i++ bank:0 select:MB(0xE0068, 0x0) readWrite:MB(0xB0000, 0x17) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO24" number:i++ bank:0 select:MB(0xE006C, 0x0) readWrite:MB(0xB0000, 0x18) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO25" number:i++ bank:0 select:MB(0xE0070, 0x0) readWrite:MB(0xB0000, 0x19) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO26" number:i++ bank:0 select:MB(0xE0074, 0x0) readWrite:MB(0xB0000, 0x20) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO27" number:i++ bank:0 select:MB(0xE0078, 0x0) readWrite:MB(0xB0000, 0x21) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO28" number:i++ bank:0 select:MB(0xE007C, 0x0) readWrite:MB(0xB0000, 0x22) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO29" number:i++ bank:0 select:MB(0xE0080, 0x0) readWrite:MB(0xB0000, 0x23) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO30" number:i++ bank:0 select:MB(0xE0084, 0x0) readWrite:MB(0xB0000, 0x24) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO31" number:i++ bank:0 select:MB(0xE0158, 0x0) readWrite:MB(0xB0000, 0x1F) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO7_IO00" number:i++ bank:0 select:MB(0xE02B0, 0x0) readWrite:MB(0xB4000, 0x00) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO7_IO01" number:i++ bank:0 select:MB(0xE02B4, 0x0) readWrite:MB(0xB4000, 0x01) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO7_IO02" number:i++ bank:0 select:MB(0xE02B8, 0x0) readWrite:MB(0xB4000, 0x02) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO7_IO03" number:i++ bank:0 select:MB(0xE02BC, 0x0) readWrite:MB(0xB4000, 0x03) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO7_IO04" number:i++ bank:0 select:MB(0xE02C0, 0x0) readWrite:MB(0xB4000, 0x04) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO7_IO05" number:i++ bank:0 select:MB(0xE02C4, 0x0) readWrite:MB(0xB4000, 0x05) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO7_IO06" number:i++ bank:0 select:MB(0xE02C8, 0x0) readWrite:MB(0xB4000, 0x06) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO7_IO07" number:i++ bank:0 select:MB(0xE02CC, 0x0) readWrite:MB(0xB4000, 0x07) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO7_IO08" number:i++ bank:0 select:MB(0xE02D0, 0x0) readWrite:MB(0xB4000, 0x08) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO7_IO09" number:i++ bank:0 select:MB(0xE02F4, 0x0) readWrite:MB(0xB4000, 0x09) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO7_IO10" number:i++ bank:0 select:MB(0xE02F8, 0x0) readWrite:MB(0xB4000, 0x0A) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO7_IO11" number:i++ bank:0 select:MB(0xE0248, 0x0) readWrite:MB(0xB4000, 0x0B) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO7_IO12" number:i++ bank:0 select:MB(0xE024C, 0x0) readWrite:MB(0xB4000, 0x0C) support:SUP1]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO7_IO13" number:i++ bank:0 select:MB(0xE0250, 0x0) readWrite:MB(0xB4000, 0x0D) support:SUP1]];

#define PGWXLAYOUTIMX6SDLRM(ar) NSUInteger i = 0;\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO00" number:i++ bank:0 select:MB(0xE020C, 0x0) readWrite:MB(0x9C000, 0x00) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO01" number:i++ bank:0 select:MB(0xE0210, 0x0) readWrite:MB(0x9C000, 0x01) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO02" number:i++ bank:0 select:MB(0xE0224, 0x0) readWrite:MB(0x9C000, 0x02) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO03" number:i++ bank:0 select:MB(0xE0228, 0x0) readWrite:MB(0x9C000, 0x03) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO04" number:i++ bank:0 select:MB(0xE022C, 0x0) readWrite:MB(0x9C000, 0x04) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO05" number:i++ bank:0 select:MB(0xE0230, 0x0) readWrite:MB(0x9C000, 0x05) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO06" number:i++ bank:0 select:MB(0xE0234, 0x0) readWrite:MB(0x9C000, 0x06) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO07" number:i++ bank:0 select:MB(0xE0238, 0x0) readWrite:MB(0x9C000, 0x07) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO08" number:i++ bank:0 select:MB(0xE023C, 0x0) readWrite:MB(0x9C000, 0x08) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO09" number:i++ bank:0 select:MB(0xE0240, 0x0) readWrite:MB(0x9C000, 0x09) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO10" number:i++ bank:0 select:MB(0xE02F4, 0x0) readWrite:MB(0x9C000, 0x0A) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO11" number:i++ bank:0 select:MB(0xE02F8, 0x0) readWrite:MB(0x9C000, 0x0B) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO12" number:i++ bank:0 select:MB(0xE0308, 0x0) readWrite:MB(0x9C000, 0x0C) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO13" number:i++ bank:0 select:MB(0xE0304, 0x0) readWrite:MB(0x9C000, 0x0D) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO14" number:i++ bank:0 select:MB(0xE0300, 0x0) readWrite:MB(0x9C000, 0x0E) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO15" number:i++ bank:0 select:MB(0xE02FC, 0x0) readWrite:MB(0x9C000, 0x0D) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO16" number:i++ bank:0 select:MB(0xE02E4, 0x0) readWrite:MB(0x9C000, 0x10) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO17" number:i++ bank:0 select:MB(0xE02E8, 0x0) readWrite:MB(0x9C000, 0x11) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO18" number:i++ bank:0 select:MB(0xE02E0, 0x0) readWrite:MB(0x9C000, 0x12) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO19" number:i++ bank:0 select:MB(0xE02EC, 0x0) readWrite:MB(0x9C000, 0x13) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO20" number:i++ bank:0 select:MB(0xE02DC, 0x0) readWrite:MB(0x9C000, 0x14) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO21" number:i++ bank:0 select:MB(0xE02F0, 0x0) readWrite:MB(0x9C000, 0x15) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO22" number:i++ bank:0 select:MB(0xE01EC, 0x0) readWrite:MB(0x9C000, 0x16) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO23" number:i++ bank:0 select:MB(0xE01F0, 0x0) readWrite:MB(0x9C000, 0x17) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO24" number:i++ bank:0 select:MB(0xE01F4, 0x0) readWrite:MB(0x9C000, 0x18) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO25" number:i++ bank:0 select:MB(0xE01E4, 0x0) readWrite:MB(0x9C000, 0x19) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO26" number:i++ bank:0 select:MB(0xE01FC, 0x0) readWrite:MB(0x9C000, 0x1A) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO27" number:i++ bank:0 select:MB(0xE01F8, 0x0) readWrite:MB(0x9C000, 0x1B) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO28" number:i++ bank:0 select:MB(0xE0200, 0x0) readWrite:MB(0x9C000, 0x1C) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO29" number:i++ bank:0 select:MB(0xE0208, 0x0) readWrite:MB(0x9C000, 0x1D) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO30" number:i++ bank:0 select:MB(0xE0204, 0x0) readWrite:MB(0x9C000, 0x1E) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO1_IO31" number:i++ bank:0 select:MB(0xE01E8, 0x0) readWrite:MB(0x9C000, 0x1F) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO00" number:i++ bank:0 select:MB(0xE0284, 0x0) readWrite:MB(0xA0000, 0x00) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO01" number:i++ bank:0 select:MB(0xE0288, 0x0) readWrite:MB(0xA0000, 0x01) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO02" number:i++ bank:0 select:MB(0xE028C, 0x0) readWrite:MB(0xA0000, 0x02) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO03" number:i++ bank:0 select:MB(0xE0290, 0x0) readWrite:MB(0xA0000, 0x03) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO04" number:i++ bank:0 select:MB(0xE0294, 0x0) readWrite:MB(0xA0000, 0x04) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO05" number:i++ bank:0 select:MB(0xE0298, 0x0) readWrite:MB(0xA0000, 0x05) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO06" number:i++ bank:0 select:MB(0xE029C, 0x0) readWrite:MB(0xA0000, 0x06) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO07" number:i++ bank:0 select:MB(0xE02A0, 0x0) readWrite:MB(0xA0000, 0x07) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO08" number:i++ bank:0 select:MB(0xE0340, 0x0) readWrite:MB(0xA0000, 0x08) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO09" number:i++ bank:0 select:MB(0xE0344, 0x0) readWrite:MB(0xA0000, 0x09) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO10" number:i++ bank:0 select:MB(0xE0348, 0x0) readWrite:MB(0xA0000, 0x0A) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO11" number:i++ bank:0 select:MB(0xE034C, 0x0) readWrite:MB(0xA0000, 0x0B) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO12" number:i++ bank:0 select:MB(0xE0350, 0x0) readWrite:MB(0xA0000, 0x0C) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO13" number:i++ bank:0 select:MB(0xE0354, 0x0) readWrite:MB(0xA0000, 0x0D) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO14" number:i++ bank:0 select:MB(0xE0358, 0x0) readWrite:MB(0xA0000, 0x0E) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO15" number:i++ bank:0 select:MB(0xE035C, 0x0) readWrite:MB(0xA0000, 0x0F) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO16" number:i++ bank:0 select:MB(0xE0128, 0x0) readWrite:MB(0xA0000, 0x10) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO17" number:i++ bank:0 select:MB(0xE0124, 0x0) readWrite:MB(0xA0000, 0x11) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO18" number:i++ bank:0 select:MB(0xE0120, 0x0) readWrite:MB(0xA0000, 0x12) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO19" number:i++ bank:0 select:MB(0xE011C, 0x0) readWrite:MB(0xA0000, 0x13) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO20" number:i++ bank:0 select:MB(0xE0118, 0x0) readWrite:MB(0xA0000, 0x14) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO21" number:i++ bank:0 select:MB(0xE0114, 0x0) readWrite:MB(0xA0000, 0x15) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO22" number:i++ bank:0 select:MB(0xE0110, 0x0) readWrite:MB(0xA0000, 0x16) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO23" number:i++ bank:0 select:MB(0xE013C, 0x0) readWrite:MB(0xA0000, 0x17) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO24" number:i++ bank:0 select:MB(0xE0140, 0x0) readWrite:MB(0xA0000, 0x18) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO25" number:i++ bank:0 select:MB(0xE01D8, 0x0) readWrite:MB(0xA0000, 0x19) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO26" number:i++ bank:0 select:MB(0xE01DC, 0x0) readWrite:MB(0xA0000, 0x1A) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO27" number:i++ bank:0 select:MB(0xE01D4, 0x0) readWrite:MB(0xA0000, 0x1B) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO28" number:i++ bank:0 select:MB(0xE01C4, 0x0) readWrite:MB(0xA0000, 0x1C) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO29" number:i++ bank:0 select:MB(0xE01C8, 0x0) readWrite:MB(0xA0000, 0x1D) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO30" number:i++ bank:0 select:MB(0xE01CC, 0x0) readWrite:MB(0xA0000, 0x1E) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO2_IO31" number:i++ bank:0 select:MB(0xE01D0, 0x0) readWrite:MB(0xA0000, 0x1F) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO00" number:i++ bank:0 select:MB(0xE0184, 0x0) readWrite:MB(0xA4000, 0x00) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO01" number:i++ bank:0 select:MB(0xE0188, 0x0) readWrite:MB(0xA4000, 0x01) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO02" number:i++ bank:0 select:MB(0xE01A4, 0x0) readWrite:MB(0xA4000, 0x02) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO03" number:i++ bank:0 select:MB(0xE01A8, 0x0) readWrite:MB(0xA4000, 0x03) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO04" number:i++ bank:0 select:MB(0xE01AC, 0x0) readWrite:MB(0xA4000, 0x04) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO05" number:i++ bank:0 select:MB(0xE01B0, 0x0) readWrite:MB(0xA4000, 0x05) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO06" number:i++ bank:0 select:MB(0xE01B4, 0x0) readWrite:MB(0xA4000, 0x06) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO07" number:i++ bank:0 select:MB(0xE01B8, 0x0) readWrite:MB(0xA4000, 0x07) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO08" number:i++ bank:0 select:MB(0xE01BC, 0x0) readWrite:MB(0xA4000, 0x08) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO09" number:i++ bank:0 select:MB(0xE01C0, 0x0) readWrite:MB(0xA4000, 0x09) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO10" number:i++ bank:0 select:MB(0xE018C, 0x0) readWrite:MB(0xA4000, 0x0A) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO11" number:i++ bank:0 select:MB(0xE0190, 0x0) readWrite:MB(0xA4000, 0x0B) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO12" number:i++ bank:0 select:MB(0xE0194, 0x0) readWrite:MB(0xA4000, 0x0C) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO13" number:i++ bank:0 select:MB(0xE0198, 0x0) readWrite:MB(0xA4000, 0x0D) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO14" number:i++ bank:0 select:MB(0xE019C, 0x0) readWrite:MB(0xA4000, 0x0E) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO15" number:i++ bank:0 select:MB(0xE01A0, 0x0) readWrite:MB(0xA4000, 0x0F) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO16" number:i++ bank:0 select:MB(0xE0144, 0x0) readWrite:MB(0xA4000, 0x10) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO17" number:i++ bank:0 select:MB(0xE0148, 0x0) readWrite:MB(0xA4000, 0x11) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO18" number:i++ bank:0 select:MB(0xE014C, 0x0) readWrite:MB(0xA4000, 0x12) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO19" number:i++ bank:0 select:MB(0xE0150, 0x0) readWrite:MB(0xA4000, 0x13) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO20" number:i++ bank:0 select:MB(0xE0154, 0x0) readWrite:MB(0xA4000, 0x14) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO21" number:i++ bank:0 select:MB(0xE0158, 0x0) readWrite:MB(0xA4000, 0x15) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO22" number:i++ bank:0 select:MB(0xE015C, 0x0) readWrite:MB(0xA4000, 0x16) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO23" number:i++ bank:0 select:MB(0xE0160, 0x0) readWrite:MB(0xA4000, 0x17) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO24" number:i++ bank:0 select:MB(0xE0164, 0x0) readWrite:MB(0xA4000, 0x18) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO25" number:i++ bank:0 select:MB(0xE0168, 0x0) readWrite:MB(0xA4000, 0x19) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO26" number:i++ bank:0 select:MB(0xE016C, 0x0) readWrite:MB(0xA4000, 0x1A) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO27" number:i++ bank:0 select:MB(0xE0170, 0x0) readWrite:MB(0xA4000, 0x1B) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO28" number:i++ bank:0 select:MB(0xE0174, 0x0) readWrite:MB(0xA4000, 0x1C) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO29" number:i++ bank:0 select:MB(0xE0178, 0x0) readWrite:MB(0xA4000, 0x1D) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO30" number:i++ bank:0 select:MB(0xE017C, 0x0) readWrite:MB(0xA4000, 0x1E) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO3_IO31" number:i++ bank:0 select:MB(0xE0180, 0x0) readWrite:MB(0xA4000, 0x1F) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO05" number:i++ bank:0 select:MB(0xE0220, 0x0) readWrite:MB(0xA8000, 0x05) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO06" number:i++ bank:0 select:MB(0xE0244, 0x0) readWrite:MB(0xA8000, 0x06) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO07" number:i++ bank:0 select:MB(0xE0258, 0x0) readWrite:MB(0xA8000, 0x07) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO08" number:i++ bank:0 select:MB(0xE0248, 0x0) readWrite:MB(0xA8000, 0x08) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO09" number:i++ bank:0 select:MB(0xE025C, 0x0) readWrite:MB(0xA8000, 0x09) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO10" number:i++ bank:0 select:MB(0xE024C, 0x0) readWrite:MB(0xA8000, 0x0A) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO11" number:i++ bank:0 select:MB(0xE0260, 0x0) readWrite:MB(0xA8000, 0x0B) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO12" number:i++ bank:0 select:MB(0xE0250, 0x0) readWrite:MB(0xA8000, 0x0B) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO13" number:i++ bank:0 select:MB(0xE0264, 0x0) readWrite:MB(0xA8000, 0x0C) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO14" number:i++ bank:0 select:MB(0xE0254, 0x0) readWrite:MB(0xA8000, 0x0D) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO15" number:i++ bank:0 select:MB(0xE0268, 0x0) readWrite:MB(0xA8000, 0x0E) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO16" number:i++ bank:0 select:MB(0xE009C, 0x0) readWrite:MB(0xA8000, 0x10) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO17" number:i++ bank:0 select:MB(0xE00A0, 0x0) readWrite:MB(0xA8000, 0x11) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO18" number:i++ bank:0 select:MB(0xE00A4, 0x0) readWrite:MB(0xA8000, 0x12) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO19" number:i++ bank:0 select:MB(0xE00A8, 0x0) readWrite:MB(0xA8000, 0x13) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO20" number:i++ bank:0 select:MB(0xE00AC, 0x0) readWrite:MB(0xA8000, 0x14) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO21" number:i++ bank:0 select:MB(0xE00B0, 0x0) readWrite:MB(0xA8000, 0x15) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO22" number:i++ bank:0 select:MB(0xE00B4, 0x0) readWrite:MB(0xA8000, 0x16) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO23" number:i++ bank:0 select:MB(0xE00E0, 0x0) readWrite:MB(0xA8000, 0x17) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO24" number:i++ bank:0 select:MB(0xE00F4, 0x0) readWrite:MB(0xA8000, 0x18) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO25" number:i++ bank:0 select:MB(0xE00F8, 0x0) readWrite:MB(0xA8000, 0x19) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO26" number:i++ bank:0 select:MB(0xE00FC, 0x0) readWrite:MB(0xA8000, 0x1A) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO27" number:i++ bank:0 select:MB(0xE0100, 0x0) readWrite:MB(0xA8000, 0x1B) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO28" number:i++ bank:0 select:MB(0xE0104, 0x0) readWrite:MB(0xA8000, 0x1C) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO29" number:i++ bank:0 select:MB(0xE0108, 0x0) readWrite:MB(0xA8000, 0x1D) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO30" number:i++ bank:0 select:MB(0xE010C, 0x0) readWrite:MB(0xA8000, 0x1E) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO4_IO31" number:i++ bank:0 select:MB(0xE00B8, 0x0) readWrite:MB(0xA8000, 0x1F) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO00" number:i++ bank:0 select:MB(0xE01E0, 0x0) readWrite:MB(0xAC000, 0x00) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO02" number:i++ bank:0 select:MB(0xE0134, 0x0) readWrite:MB(0xAC000, 0x02) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO04" number:i++ bank:0 select:MB(0xE0130, 0x0) readWrite:MB(0xAC000, 0x04) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO05" number:i++ bank:0 select:MB(0xE00BC, 0x0) readWrite:MB(0xAC000, 0x05) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO06" number:i++ bank:0 select:MB(0xE00C0, 0x0) readWrite:MB(0xAC000, 0x06) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO07" number:i++ bank:0 select:MB(0xE00C4, 0x0) readWrite:MB(0xAC000, 0x07) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO08" number:i++ bank:0 select:MB(0xE00C8, 0x0) readWrite:MB(0xAC000, 0x08) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO09" number:i++ bank:0 select:MB(0xE00CC, 0x0) readWrite:MB(0xAC000, 0x09) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO10" number:i++ bank:0 select:MB(0xE00D0, 0x0) readWrite:MB(0xAC000, 0x0A) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO11" number:i++ bank:0 select:MB(0xE00D4, 0x0) readWrite:MB(0xAC000, 0x0B) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO12" number:i++ bank:0 select:MB(0xE00D8, 0x0) readWrite:MB(0xAC000, 0x0C) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO13" number:i++ bank:0 select:MB(0xE00DC, 0x0) readWrite:MB(0xAC000, 0x0D) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO14" number:i++ bank:0 select:MB(0xE00E4, 0x0) readWrite:MB(0xAC000, 0x0E) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO15" number:i++ bank:0 select:MB(0xE00E8, 0x0) readWrite:MB(0xAC000, 0x0F) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO16" number:i++ bank:0 select:MB(0xE00EC, 0x0) readWrite:MB(0xAC000, 0x10) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO17" number:i++ bank:0 select:MB(0xE00F0, 0x0) readWrite:MB(0xAC000, 0x11) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO18" number:i++ bank:0 select:MB(0xE0094, 0x0) readWrite:MB(0xAC000, 0x12) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO19" number:i++ bank:0 select:MB(0xE0090, 0x0) readWrite:MB(0xAC000, 0x13) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO20" number:i++ bank:0 select:MB(0xE008C, 0x0) readWrite:MB(0xAC000, 0x14) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO21" number:i++ bank:0 select:MB(0xE0098, 0x0) readWrite:MB(0xAC000, 0x15) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO22" number:i++ bank:0 select:MB(0xE0074, 0x0) readWrite:MB(0xAC000, 0x16) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO23" number:i++ bank:0 select:MB(0xE0078, 0x0) readWrite:MB(0xAC000, 0x17) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO24" number:i++ bank:0 select:MB(0xE007C, 0x0) readWrite:MB(0xAC000, 0x18) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO25" number:i++ bank:0 select:MB(0xE0080, 0x0) readWrite:MB(0xAC000, 0x19) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO26" number:i++ bank:0 select:MB(0xE0084, 0x0) readWrite:MB(0xAC000, 0x1A) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO27" number:i++ bank:0 select:MB(0xE0088, 0x0) readWrite:MB(0xAC000, 0x1B) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO28" number:i++ bank:0 select:MB(0xE004C, 0x0) readWrite:MB(0xAC000, 0x1C) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO29" number:i++ bank:0 select:MB(0xE0050, 0x0) readWrite:MB(0xAC000, 0x1D) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO30" number:i++ bank:0 select:MB(0xE0054, 0x0) readWrite:MB(0xAC000, 0x1E) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO5_IO31" number:i++ bank:0 select:MB(0xE0058, 0x0) readWrite:MB(0xAC000, 0x1F) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO00" number:i++ bank:0 select:MB(0xE005C, 0x0) readWrite:MB(0xB0000, 0x00) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO01" number:i++ bank:0 select:MB(0xE0060, 0x0) readWrite:MB(0xB0000, 0x01) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO02" number:i++ bank:0 select:MB(0xE0064, 0x0) readWrite:MB(0xB0000, 0x02) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO03" number:i++ bank:0 select:MB(0xE0068, 0x0) readWrite:MB(0xB0000, 0x03) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO04" number:i++ bank:0 select:MB(0xE006C, 0x0) readWrite:MB(0xB0000, 0x04) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO05" number:i++ bank:0 select:MB(0xE0070, 0x0) readWrite:MB(0xB0000, 0x05) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO06" number:i++ bank:0 select:MB(0xE012C, 0x0) readWrite:MB(0xB0000, 0x06) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO07" number:i++ bank:0 select:MB(0xE0270, 0x0) readWrite:MB(0xB0000, 0x07) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO08" number:i++ bank:0 select:MB(0xE026C, 0x0) readWrite:MB(0xB0000, 0x08) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO09" number:i++ bank:0 select:MB(0xE02A8, 0x0) readWrite:MB(0xB0000, 0x09) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO10" number:i++ bank:0 select:MB(0xE02A4, 0x0) readWrite:MB(0xB0000, 0x0A) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO11" number:i++ bank:0 select:MB(0xE0274, 0x0) readWrite:MB(0xB0000, 0x0B) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO14" number:i++ bank:0 select:MB(0xE0278, 0x0) readWrite:MB(0xB0000, 0x0E) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO15" number:i++ bank:0 select:MB(0xE027C, 0x0) readWrite:MB(0xB0000, 0x0F) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO16" number:i++ bank:0 select:MB(0xE0280, 0x0) readWrite:MB(0xB0000, 0x10) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO17" number:i++ bank:0 select:MB(0xE0330, 0x0) readWrite:MB(0xB0000, 0x11) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO18" number:i++ bank:0 select:MB(0xE032C, 0x0) readWrite:MB(0xB0000, 0x12) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO19" number:i++ bank:0 select:MB(0xE02D8, 0x0) readWrite:MB(0xB0000, 0x13) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO20" number:i++ bank:0 select:MB(0xE02C4, 0x0) readWrite:MB(0xB0000, 0x14) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO21" number:i++ bank:0 select:MB(0xE02C8, 0x0) readWrite:MB(0xB0000, 0x15) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO22" number:i++ bank:0 select:MB(0xE02CC, 0x0) readWrite:MB(0xB0000, 0x16) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO23" number:i++ bank:0 select:MB(0xE02D0, 0x0) readWrite:MB(0xB0000, 0x17) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO24" number:i++ bank:0 select:MB(0xE02BC, 0x0) readWrite:MB(0xB0000, 0x18) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO25" number:i++ bank:0 select:MB(0xE02AC, 0x0) readWrite:MB(0xB0000, 0x19) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO26" number:i++ bank:0 select:MB(0xE02D4, 0x0) readWrite:MB(0xB0000, 0x20) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO27" number:i++ bank:0 select:MB(0xE02B0, 0x0) readWrite:MB(0xB0000, 0x21) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO28" number:i++ bank:0 select:MB(0xE02B4, 0x0) readWrite:MB(0xB0000, 0x22) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO29" number:i++ bank:0 select:MB(0xE02B8, 0x0) readWrite:MB(0xB0000, 0x23) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO30" number:i++ bank:0 select:MB(0xE02C0, 0x0) readWrite:MB(0xB0000, 0x24) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO6_IO31" number:i++ bank:0 select:MB(0xE0138, 0x0) readWrite:MB(0xB0000, 0x1F) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO7_IO00" number:i++ bank:0 select:MB(0xE0328, 0x0) readWrite:MB(0xB4000, 0x00) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO7_IO01" number:i++ bank:0 select:MB(0xE0324, 0x0) readWrite:MB(0xB4000, 0x01) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO7_IO02" number:i++ bank:0 select:MB(0xE0310, 0x0) readWrite:MB(0xB4000, 0x02) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO7_IO03" number:i++ bank:0 select:MB(0xE030C, 0x0) readWrite:MB(0xB4000, 0x03) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO7_IO04" number:i++ bank:0 select:MB(0xE0314, 0x0) readWrite:MB(0xB4000, 0x04) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO7_IO05" number:i++ bank:0 select:MB(0xE0318, 0x0) readWrite:MB(0xB4000, 0x05) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO7_IO06" number:i++ bank:0 select:MB(0xE031C, 0x0) readWrite:MB(0xB4000, 0x06) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO7_IO07" number:i++ bank:0 select:MB(0xE0320, 0x0) readWrite:MB(0xB4000, 0x07) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO7_IO08" number:i++ bank:0 select:MB(0xE0334, 0x0) readWrite:MB(0xB4000, 0x08) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO7_IO09" number:i++ bank:0 select:MB(0xE033C, 0x0) readWrite:MB(0xB4000, 0x09) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO7_IO10" number:i++ bank:0 select:MB(0xE0338, 0x0) readWrite:MB(0xB4000, 0x0A) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO7_IO11" number:i++ bank:0 select:MB(0xE0214, 0x0) readWrite:MB(0xB4000, 0x0B) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO7_IO12" number:i++ bank:0 select:MB(0xE0218, 0x0) readWrite:MB(0xB4000, 0x0C) support:(SUP1)]];\
    [ar addObject:[PGWXLayout layoutWithName:@"GPIO7_IO13" number:i++ bank:0 select:MB(0xE021C, 0x0) readWrite:MB(0xB4000, 0x0D) support:(SUP1)]];

#define IM (PGWX_ISR_MODE_RISING | PGWX_ISR_MODE_FALLING | PGWX_ISR_MODE_BOTH | PGWX_ISR_MODE_NONE)
#define PS (1024 * 1024)
#define BA @[[PGWXAddr address:0x02000000 offset:0x00000000]]

@implementation PGWXSOCNXPIMX6DQRM {
    }

    -(instancetype)initWithGPIOMap:(NSArray<NSString *> *)gpioMap irqMap:(nullable NSArray<NSString *> *)irqMap error:(NSError *_Nullable *)error {
        NSMutableArray *lo = [NSMutableArray new];
        PGWXLAYOUTIMX6DQRM(lo);
        return (self = [super initWithBrandName:@"NXP" chipSet:@"IMX6DQRM" layout:lo gpioMap:gpioMap irqMap:irqMap isrModes:IM pageSize:PS baseAddresses:BA error:error]);
    }

@end

@implementation PGWXSOCNXPIMX6SDLRM {
    }

    -(instancetype)initWithGPIOMap:(NSArray<NSString *> *)gpioMap irqMap:(nullable NSArray<NSString *> *)irqMap error:(NSError *_Nullable *)error {
        NSMutableArray *lo = [NSMutableArray new];
        PGWXLAYOUTIMX6SDLRM(lo);
        return (self = [super initWithBrandName:@"NXP" chipSet:@"IMX6DLRM" layout:lo gpioMap:gpioMap irqMap:irqMap isrModes:IM pageSize:PS baseAddresses:BA error:error]);
    }

@end
