/******************************************************************************************************************************//**
 *     PROJECT: PGWiringX
 *    FILENAME: PGWXLayout.m
 *         IDE: AppCode
 *      AUTHOR: Galen Rhodes
 *        DATE: 6/22/17 4:07 PM
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

#import <Rubicon/Rubicon.h>
#import "PGWXLayout.h"
#import "PGWXBit.h"

@implementation PGWXLayout {
    }

    @synthesize name = _name;
    @synthesize bank = _bank;
    @synthesize select = _select;
    @synthesize set = _set;
    @synthesize clear = _clear;
    @synthesize read = _read;
    @synthesize support = _support;
    @synthesize mode = _mode;
    @synthesize fd = _fd;

    -(instancetype)initWithName:(NSString *)name
                           bank:(NSUInteger)bank
                         select:(PGWXBit *)sel
                           read:(PGWXBit *)read
                            set:(PGWXBit *)set
                          clear:(PGWXBit *)clear
                        support:(NSUInteger)sup {
        self = [super init];

        if(self) {
            _name    = name.copy;
            _bank    = bank;
            _select  = sel;
            _set     = set;
            _clear   = clear;
            _read    = read;
            _support = sup;
            _fd      = -1;
            _mode    = PGWX_PINMODE_NOT_SET;
        }

        return self;
    }

    -(BOOL)isEqual:(id)other {
        return (other && ((self == other) || ([other isKindOfClass:[self class]] ? [self _isEqualToLayout:other] : [super isEqual:other])));
    }

    -(BOOL)isEqualToLayout:(PGWXLayout *)layout {
        return (layout && ((self == layout) || [self _isEqualToLayout:layout]));
    }

    -(BOOL)_isEqualToLayout:(PGWXLayout *)layout {
        return (PGObjectsEqual(self.name, layout.name) && (self.bank == layout.bank));
    }

    -(NSUInteger)hash {
        return (((31u + _name.hash) * 31u) + (NSUInteger)_bank);
    }

    +(instancetype)layoutWithName:(NSString *)name
                             bank:(NSUInteger)bank
                           select:(PGWXBit *)sel
                             read:(PGWXBit *)read
                              set:(PGWXBit *)set
                            clear:(PGWXBit *)clear
                          support:(NSUInteger)sup {
        return [[self alloc] initWithName:name bank:bank select:sel read:read set:set clear:clear support:sup];
    }

    +(instancetype)layoutWithName:(NSString *)name bank:(NSUInteger)bank select:(PGWXBit *)select read:(PGWXBit *)read write:(PGWXBit *)write support:(NSUInteger)support {
        return [[self alloc] initWithName:name bank:bank select:select read:read set:write clear:write support:support];
    }

    +(instancetype)layoutWithName:(NSString *)name bank:(NSUInteger)bank select:(PGWXBit *)select readWrite:(PGWXBit *)readWrite support:(NSUInteger)support {
        return [[self alloc] initWithName:name bank:bank select:select read:readWrite set:readWrite clear:readWrite support:support];
    }

@end
