/******************************************************************************************************************************//**
 *     PROJECT: PGWiringX
 *    FILENAME: PGWXI2CChannel.m
 *         IDE: AppCode
 *      AUTHOR: Galen Rhodes
 *        DATE: 7/5/17 3:18 PM
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

#import "PGWXI2CChannel.h"
#import "PGWiringX.h"

@interface PGWXI2CChannel()

    -(instancetype)initWithWiringX:(nonnull PGWiringX *)wiringX error:(NSError **)error;

@end

@implementation PGWXI2CChannel {
        int             _fd;
        PGWiringX       *_wiringX;
        NSRecursiveLock *_lock;
    }

    -(instancetype)init {
        self = [super init];

        if(self) {
            self = nil;
            @throw [NSException exceptionWithName:NSGenericException reason:@"Cannot create a standalone instance." userInfo:nil];
        }

        return self;
    }

    -(instancetype)initWithWiringX:(PGWiringX *)wiringX error:(NSError **)error {
        self = [super init];

        if(self) {
            if(wiringX == nil) {
                PGWXMakeError(error, 104, @"WiringX instance missing.");
                self = nil;
            }
            else {
                _wiringX = wiringX;
                _fd      = -1;
                _lock    = [NSRecursiveLock new];
            }
        }

        return self;
    }

    -(void)lock {
        [_lock lock];
    }

    -(void)unlock {
        [_lock unlock];
    }

    -(void)dealloc {
        [self close];
    }

    -(NSInteger)read:(NSError **)error {
        return 0;
    }

    -(NSInteger)readReg8:(NSInteger)reg error:(NSError **)error {
        return 0;
    }

    -(NSUInteger)readReg16:(NSInteger)reg error:(NSError **)error {
        return 0;
    }

    -(BOOL)write:(NSInteger)data error:(NSError **)error {
        return NO;
    }

    -(BOOL)write:(NSInteger)data reg8:(NSInteger)reg error:(NSError **)error {
        return NO;
    }

    -(BOOL)write:(NSInteger)data reg16:(NSInteger)reg error:(NSError **)error {
        return NO;
    }

    -(void)close {
        [self lock];

        @try {
            if(_fd > 0) {
                close(_fd);
                _fd = -1;
            }
        }
        @finally {
            [self unlock];
        }
    }

@end
