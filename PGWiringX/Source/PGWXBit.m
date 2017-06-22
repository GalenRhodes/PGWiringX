/******************************************************************************************************************************//**
 *     PROJECT: PGWiringX
 *    FILENAME: PGWXBit.m
 *         IDE: AppCode
 *      AUTHOR: Galen Rhodes
 *        DATE: 6/22/17 3:46 PM
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
#import "PGWXBit.h"

@implementation PGWXBit {
    }

    @synthesize bit = _bit;
    @synthesize offset = _offset;

    -(instancetype)initWithBit:(NSUInteger)bit offset:(NSUInteger)offset {
        self = [super init];

        if(self) {
            _bit    = bit;
            _offset = offset;
        }

        return self;
    }

    +(instancetype)bitWithBit:(NSUInteger)bit offset:(NSUInteger)offset {
        static NSMutableDictionary<NSString *, PGWXBit *> *_dict = nil;

        @synchronized([PGWXBit class]) {
            if(_dict == nil) _dict = [NSMutableDictionary new];
            NSString *key  = PGFormat(@"%lu:%lu", bit, offset);
            PGWXBit  *aBit = _dict[key];
            if(aBit == nil) _dict[key] = (aBit = [[self alloc] initWithBit:bit offset:offset]);
            return aBit;
        }
    }

    -(BOOL)isEqual:(id)other {
        return (other && ((self == other) || ([other isMemberOfClass:[self class]] ? [self isEqualToBit:other] : [super isEqual:other])));
    }

    -(BOOL)isEqualToBit:(PGWXBit *)bit {
        return (bit && ((self == bit) || ((_bit == bit->_bit) && (_offset == bit->_offset))));
    }

    -(NSUInteger)hash {
        return (((31u + _bit) * 31u) + _offset);
    }

    -(id)copyWithZone:(nullable NSZone *)zone {
        return self;  // These are immutable objects so just return a copy of itself.
    }

@end
