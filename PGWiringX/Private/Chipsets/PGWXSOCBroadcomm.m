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

#define MB(b, o)  PGWXMakeBit((b),(o))
#define SUP1      PGWX_FUNCTION_DIGITAL

@implementation PGWXSOCBroadcomm2835 {
    @public
        NSArray<PGWXAddr *>                    *_baseAddresses;
        NSDictionary<NSString *, PGWXLayout *> *_layout;
    }

    -(NSString *)brandName {
        return @"Broadcomm";
    }

    -(NSString *)chipSet {
        return @"2835";
    }

    -(NSDictionary<NSString *, PGWXLayout *> *)layout {
        [self lock];

        @try {
            if(self->_layout.count == 0) {
                NSUInteger          i   = 0;
                NSMutableDictionary *lo = [NSMutableDictionary new];

                lo[@"FSEL0"]  = [PGWXLayout layoutWithName:@"FSEL0" number:i++ bank:0 select:MB(0x00, 0) read:MB(0x34, 0) set:MB(0x1C, 0) clear:MB(0x28, 0) support:SUP1];
                lo[@"FSEL1"]  = [PGWXLayout layoutWithName:@"FSEL1" number:i++ bank:0 select:MB(0x00, 3) read:MB(0x34, 1) set:MB(0x1C, 1) clear:MB(0x28, 1) support:SUP1];
                lo[@"FSEL2"]  = [PGWXLayout layoutWithName:@"FSEL2" number:i++ bank:0 select:MB(0x00, 6) read:MB(0x34, 2) set:MB(0x1C, 2) clear:MB(0x28, 2) support:SUP1];
                lo[@"FSEL3"]  = [PGWXLayout layoutWithName:@"FSEL3" number:i++ bank:0 select:MB(0x00, 9) read:MB(0x34, 3) set:MB(0x1C, 3) clear:MB(0x28, 3) support:SUP1];
                lo[@"FSEL4"]  = [PGWXLayout layoutWithName:@"FSEL4" number:i++ bank:0 select:MB(0x00, 12) read:MB(0x34, 4) set:MB(0x1C, 4) clear:MB(0x28, 4) support:SUP1];
                lo[@"FSEL5"]  = [PGWXLayout layoutWithName:@"FSEL5" number:i++ bank:0 select:MB(0x00, 15) read:MB(0x34, 5) set:MB(0x1C, 5) clear:MB(0x28, 5) support:SUP1];
                lo[@"FSEL6"]  = [PGWXLayout layoutWithName:@"FSEL6" number:i++ bank:0 select:MB(0x00, 18) read:MB(0x34, 6) set:MB(0x1C, 6) clear:MB(0x28, 6) support:SUP1];
                lo[@"FSEL7"]  = [PGWXLayout layoutWithName:@"FSEL7" number:i++ bank:0 select:MB(0x00, 21) read:MB(0x34, 7) set:MB(0x1C, 7) clear:MB(0x28, 7) support:SUP1];
                lo[@"FSEL8"]  = [PGWXLayout layoutWithName:@"FSEL8" number:i++ bank:0 select:MB(0x00, 24) read:MB(0x34, 8) set:MB(0x1C, 8) clear:MB(0x28, 8) support:SUP1];
                lo[@"FSEL9"]  = [PGWXLayout layoutWithName:@"FSEL9" number:i++ bank:0 select:MB(0x00, 27) read:MB(0x34, 9) set:MB(0x1C, 9) clear:MB(0x28, 9) support:SUP1];
                lo[@"FSEL10"] = [PGWXLayout layoutWithName:@"FSEL10" number:i++ bank:0 select:MB(0x04, 0) read:MB(0x34, 10) set:MB(0x1C, 10) clear:MB(0x28, 10) support:SUP1];
                lo[@"FSEL11"] = [PGWXLayout layoutWithName:@"FSEL11" number:i++ bank:0 select:MB(0x04, 3) read:MB(0x34, 11) set:MB(0x1C, 11) clear:MB(0x28, 11) support:SUP1];
                lo[@"FSEL12"] = [PGWXLayout layoutWithName:@"FSEL12" number:i++ bank:0 select:MB(0x04, 6) read:MB(0x34, 12) set:MB(0x1C, 12) clear:MB(0x28, 12) support:SUP1];
                lo[@"FSEL13"] = [PGWXLayout layoutWithName:@"FSEL13" number:i++ bank:0 select:MB(0x04, 9) read:MB(0x34, 13) set:MB(0x1C, 13) clear:MB(0x28, 13) support:SUP1];
                lo[@"FSEL14"] = [PGWXLayout layoutWithName:@"FSEL14" number:i++ bank:0 select:MB(0x04, 12) read:MB(0x34, 14) set:MB(0x1C, 14) clear:MB(0x28, 14) support:SUP1];
                lo[@"FSEL15"] = [PGWXLayout layoutWithName:@"FSEL15" number:i++ bank:0 select:MB(0x04, 15) read:MB(0x34, 15) set:MB(0x1C, 15) clear:MB(0x28, 15) support:SUP1];
                lo[@"FSEL16"] = [PGWXLayout layoutWithName:@"FSEL16" number:i++ bank:0 select:MB(0x04, 18) read:MB(0x34, 16) set:MB(0x1C, 16) clear:MB(0x28, 16) support:SUP1];
                lo[@"FSEL17"] = [PGWXLayout layoutWithName:@"FSEL17" number:i++ bank:0 select:MB(0x04, 21) read:MB(0x34, 17) set:MB(0x1C, 17) clear:MB(0x28, 17) support:SUP1];
                lo[@"FSEL18"] = [PGWXLayout layoutWithName:@"FSEL18" number:i++ bank:0 select:MB(0x04, 24) read:MB(0x34, 18) set:MB(0x1C, 18) clear:MB(0x28, 18) support:SUP1];
                lo[@"FSEL19"] = [PGWXLayout layoutWithName:@"FSEL19" number:i++ bank:0 select:MB(0x04, 27) read:MB(0x34, 19) set:MB(0x1C, 19) clear:MB(0x28, 19) support:SUP1];
                lo[@"FSEL20"] = [PGWXLayout layoutWithName:@"FSEL20" number:i++ bank:0 select:MB(0x08, 0) read:MB(0x34, 20) set:MB(0x1C, 20) clear:MB(0x28, 20) support:SUP1];
                lo[@"FSEL21"] = [PGWXLayout layoutWithName:@"FSEL21" number:i++ bank:0 select:MB(0x08, 3) read:MB(0x34, 21) set:MB(0x1C, 21) clear:MB(0x28, 21) support:SUP1];
                lo[@"FSEL22"] = [PGWXLayout layoutWithName:@"FSEL22" number:i++ bank:0 select:MB(0x08, 6) read:MB(0x34, 22) set:MB(0x1C, 22) clear:MB(0x28, 22) support:SUP1];
                lo[@"FSEL23"] = [PGWXLayout layoutWithName:@"FSEL23" number:i++ bank:0 select:MB(0x08, 9) read:MB(0x34, 23) set:MB(0x1C, 23) clear:MB(0x28, 23) support:SUP1];
                lo[@"FSEL24"] = [PGWXLayout layoutWithName:@"FSEL24" number:i++ bank:0 select:MB(0x08, 12) read:MB(0x34, 24) set:MB(0x1C, 24) clear:MB(0x28, 24) support:SUP1];
                lo[@"FSEL25"] = [PGWXLayout layoutWithName:@"FSEL25" number:i++ bank:0 select:MB(0x08, 15) read:MB(0x34, 25) set:MB(0x1C, 25) clear:MB(0x28, 25) support:SUP1];
                lo[@"FSEL26"] = [PGWXLayout layoutWithName:@"FSEL26" number:i++ bank:0 select:MB(0x08, 18) read:MB(0x34, 26) set:MB(0x1C, 26) clear:MB(0x28, 26) support:SUP1];
                lo[@"FSEL27"] = [PGWXLayout layoutWithName:@"FSEL27" number:i++ bank:0 select:MB(0x08, 21) read:MB(0x34, 27) set:MB(0x1C, 27) clear:MB(0x28, 27) support:SUP1];
                lo[@"FSEL28"] = [PGWXLayout layoutWithName:@"FSEL28" number:i++ bank:0 select:MB(0x08, 24) read:MB(0x34, 28) set:MB(0x1C, 28) clear:MB(0x28, 28) support:SUP1];
                lo[@"FSEL29"] = [PGWXLayout layoutWithName:@"FSEL29" number:i++ bank:0 select:MB(0x08, 27) read:MB(0x34, 29) set:MB(0x1C, 29) clear:MB(0x28, 29) support:SUP1];
                lo[@"FSEL30"] = [PGWXLayout layoutWithName:@"FSEL30" number:i++ bank:0 select:MB(0x0C, 0) read:MB(0x34, 30) set:MB(0x1C, 30) clear:MB(0x28, 30) support:SUP1];
                lo[@"FSEL31"] = [PGWXLayout layoutWithName:@"FSEL31" number:i++ bank:0 select:MB(0x0C, 3) read:MB(0x34, 31) set:MB(0x1C, 31) clear:MB(0x28, 31) support:SUP1];
                lo[@"FSEL32"] = [PGWXLayout layoutWithName:@"FSEL32" number:i++ bank:0 select:MB(0x0C, 6) read:MB(0x38, 0) set:MB(0x20, 0) clear:MB(0x2C, 0) support:SUP1];
                lo[@"FSEL33"] = [PGWXLayout layoutWithName:@"FSEL33" number:i++ bank:0 select:MB(0x0C, 9) read:MB(0x38, 1) set:MB(0x20, 1) clear:MB(0x2C, 1) support:SUP1];
                lo[@"FSEL34"] = [PGWXLayout layoutWithName:@"FSEL34" number:i++ bank:0 select:MB(0x0C, 12) read:MB(0x38, 2) set:MB(0x20, 2) clear:MB(0x2C, 2) support:SUP1];
                lo[@"FSEL35"] = [PGWXLayout layoutWithName:@"FSEL35" number:i++ bank:0 select:MB(0x0C, 15) read:MB(0x38, 3) set:MB(0x20, 3) clear:MB(0x2C, 3) support:SUP1];
                lo[@"FSEL36"] = [PGWXLayout layoutWithName:@"FSEL36" number:i++ bank:0 select:MB(0x0C, 18) read:MB(0x38, 4) set:MB(0x20, 4) clear:MB(0x2C, 4) support:SUP1];
                lo[@"FSEL37"] = [PGWXLayout layoutWithName:@"FSEL37" number:i++ bank:0 select:MB(0x0C, 21) read:MB(0x38, 5) set:MB(0x20, 5) clear:MB(0x2C, 5) support:SUP1];
                lo[@"FSEL38"] = [PGWXLayout layoutWithName:@"FSEL38" number:i++ bank:0 select:MB(0x0C, 24) read:MB(0x38, 6) set:MB(0x20, 6) clear:MB(0x2C, 6) support:SUP1];
                lo[@"FSEL39"] = [PGWXLayout layoutWithName:@"FSEL39" number:i++ bank:0 select:MB(0x0C, 27) read:MB(0x38, 7) set:MB(0x20, 7) clear:MB(0x2C, 7) support:SUP1];
                lo[@"FSEL40"] = [PGWXLayout layoutWithName:@"FSEL40" number:i++ bank:0 select:MB(0x10, 0) read:MB(0x38, 8) set:MB(0x20, 8) clear:MB(0x2C, 8) support:SUP1];
                lo[@"FSEL41"] = [PGWXLayout layoutWithName:@"FSEL41" number:i++ bank:0 select:MB(0x10, 3) read:MB(0x38, 9) set:MB(0x20, 9) clear:MB(0x2C, 9) support:SUP1];
                lo[@"FSEL42"] = [PGWXLayout layoutWithName:@"FSEL42" number:i++ bank:0 select:MB(0x10, 6) read:MB(0x38, 10) set:MB(0x20, 10) clear:MB(0x2C, 10) support:SUP1];
                lo[@"FSEL43"] = [PGWXLayout layoutWithName:@"FSEL43" number:i++ bank:0 select:MB(0x10, 9) read:MB(0x38, 11) set:MB(0x20, 11) clear:MB(0x2C, 11) support:SUP1];
                lo[@"FSEL44"] = [PGWXLayout layoutWithName:@"FSEL44" number:i++ bank:0 select:MB(0x10, 12) read:MB(0x38, 12) set:MB(0x20, 12) clear:MB(0x2C, 12) support:SUP1];
                lo[@"FSEL45"] = [PGWXLayout layoutWithName:@"FSEL45" number:i++ bank:0 select:MB(0x10, 15) read:MB(0x38, 13) set:MB(0x20, 13) clear:MB(0x2C, 13) support:SUP1];
                lo[@"FSEL46"] = [PGWXLayout layoutWithName:@"FSEL46" number:i++ bank:0 select:MB(0x10, 18) read:MB(0x38, 14) set:MB(0x20, 14) clear:MB(0x2C, 14) support:SUP1];
                lo[@"FSEL47"] = [PGWXLayout layoutWithName:@"FSEL47" number:i++ bank:0 select:MB(0x10, 21) read:MB(0x38, 15) set:MB(0x20, 15) clear:MB(0x2C, 15) support:SUP1];
                lo[@"FSEL48"] = [PGWXLayout layoutWithName:@"FSEL48" number:i++ bank:0 select:MB(0x10, 24) read:MB(0x38, 16) set:MB(0x20, 16) clear:MB(0x2C, 16) support:SUP1];
                lo[@"FSEL49"] = [PGWXLayout layoutWithName:@"FSEL49" number:i++ bank:0 select:MB(0x10, 27) read:MB(0x38, 17) set:MB(0x20, 17) clear:MB(0x2C, 17) support:SUP1];
                lo[@"FSEL50"] = [PGWXLayout layoutWithName:@"FSEL50" number:i++ bank:0 select:MB(0x14, 0) read:MB(0x38, 18) set:MB(0x20, 18) clear:MB(0x2C, 18) support:SUP1];
                lo[@"FSEL51"] = [PGWXLayout layoutWithName:@"FSEL51" number:i++ bank:0 select:MB(0x14, 3) read:MB(0x38, 19) set:MB(0x20, 19) clear:MB(0x2C, 19) support:SUP1];
                lo[@"FSEL52"] = [PGWXLayout layoutWithName:@"FSEL52" number:i++ bank:0 select:MB(0x14, 6) read:MB(0x38, 20) set:MB(0x20, 20) clear:MB(0x2C, 20) support:SUP1];
                lo[@"FSEL53"] = [PGWXLayout layoutWithName:@"FSEL53" number:i bank:0 select:MB(0x14, 9) read:MB(0x38, 21) set:MB(0x20, 21) clear:MB(0x2C, 21) support:SUP1];

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
                self->_baseAddresses = @[[PGWXAddr address:0x20200000 offset:0x00000000]];
            }
        }
        @finally {
            [self unlock];
        }

        return self->_baseAddresses;
    }

@end

@implementation PGWXSOCBroadcomm2836 {
    }

    -(NSString *)chipSet {
        return @"2836";
    }

    -(NSArray<PGWXAddr *> *)baseAddresses {
        [self lock];

        @try {
            if(self->_baseAddresses.count == 0) {
                self->_baseAddresses = @[[PGWXAddr address:0x3F200000 offset:0x00000000]];
            }
        }
        @finally {
            [self unlock];
        }

        return self->_baseAddresses;
    }

@end

@implementation PGWXSOCBroadcomm2837 {
    }

    -(NSString *)chipSet {
        return @"2837";
    }

@end
