/******************************************************************************************************************************//**
 *     PROJECT: PGWiringX
 *    FILENAME: PGWXAddr.m
 *         IDE: AppCode
 *      AUTHOR: Galen Rhodes
 *        DATE: 6/22/17 3:36 PM
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
#import "PGWXAddr.h"

@implementation PGWXAddr {
    }

    @synthesize address = _address;
    @synthesize offset = _offset;

    -(instancetype)initWithAddress:(NSUInteger)address offset:(NSUInteger)offset {
        self = [super init];

        if(self) {
            _address = address;
            _offset  = offset;
        }

        return self;
    }

    +(instancetype)address:(NSUInteger)address offset:(NSUInteger)offset {
        static NSMutableDictionary<NSString *, PGWXAddr *> *_dict = nil;

        @synchronized([PGWXAddr class]) {
            if(_dict == nil) _dict = [NSMutableDictionary new];
            NSString *key    = PGFormat(@"%lu:%lu", address, offset);
            PGWXAddr *anAddr = _dict[key];
            if(anAddr == nil) _dict[key] = (anAddr = [[self alloc] initWithAddress:address offset:offset]);
            return anAddr;
        }
    }

    -(BOOL)isEqual:(id)other {
        return (other && ((self == other) || ([other isMemberOfClass:[self class]] ? [self isEqualToAddr:other] : [super isEqual:other])));
    }

    -(BOOL)isEqualToAddr:(PGWXAddr *)addr {
        return (addr && ((self == addr) || ((_address == addr->_address) && (_offset == addr->_offset))));
    }

    -(NSUInteger)hash {
        return (((31u + _address) * 31u) + _offset);
    }

    -(id)copyWithZone:(nullable NSZone *)zone {
        return self;  // These are immutable objects so just return a copy of itself.
    }

@end
