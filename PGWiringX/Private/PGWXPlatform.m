/******************************************************************************************************************************//**
 *     PROJECT: PGWiringX
 *    FILENAME: PGWXPlatform.m
 *         IDE: AppCode
 *      AUTHOR: Galen Rhodes
 *        DATE: 6/26/17 3:02 PM
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

#import "PGWXPlatform.h"

@implementation PGWXPlatform {
        NSRecursiveLock *_lock;
    }

    -(instancetype)init:(NSError **)error {
        self = [super init];

        if(self) {
            if([self class] == [PGWXPlatform class]) {
                PGWXMakeError(error, 118, PGFormat(@"Only concrete subclasses of %@ can be created.", NSStringFromClass([self class])));
                self = nil;
            }
            _lock = [NSRecursiveLock new];
        }

        return self;
    }

    -(void)lock {
        [_lock lock];
    }

    -(void)unlock {
        [_lock unlock];
    }

    -(NSString *)boardName {
        return nil;
    }

    -(PGWXSOC *)soc {
        return nil;
    }

    -(NSArray<NSString *> *)gpioMap {
        return [NSArray new];
    }

    -(NSArray<NSString *> *)irqMap {
        return self.gpioMap;
    }

    -(NSString *)pinNameForPin:(NSUInteger)pin {
        return ((pin < self.gpioMap.count) ? (self.gpioMap[pin]) : (@""));
    }

    -(NSString *)irqPinNameForPin:(NSUInteger)pin {
        return ((pin < self.irqMap.count) ? (self.irqMap[pin]) : (@""));
    }

    -(void)fixErrorMessage:(NSUInteger)pin error:(NSError **)error {
        if(error) {
            NSString *message = (*error).localizedDescription;
            if([message isEqual:PGWXInvalidPinNumberErrorMessage]) PGWXMakeError(error, PGWXInvalidPinNumberErrorCode, PGFormat(message, @(pin)));
        }
    }

    -(BOOL)setMode:(PGWXPinMode)mode forPin:(NSUInteger)pin error:(NSError **)error {
        BOOL results = [self.soc setMode:mode forPinNamed:[self pinNameForPin:pin] error:error];
        [self fixErrorMessage:pin error:error];
        return results;
    }

    -(BOOL)digitalWrite:(PGWXPinState)value toPin:(NSUInteger)pin error:(NSError **)error {
        BOOL results = [self.soc digitalWrite:value toPinNamed:[self pinNameForPin:pin] error:error];
        [self fixErrorMessage:pin error:error];
        return results;
    }

    -(BOOL)setISR:(PGWXISRMode)mode forPin:(NSUInteger)pin error:(NSError **)error {
        BOOL results = [self.soc setISR:mode forPinNamed:[self irqPinNameForPin:pin] error:error];
        [self fixErrorMessage:pin error:error];
        return results;
    }

    -(PGWXPinState)digitalReadFromPin:(NSUInteger)pin error:(NSError **)error {
        PGWXPinState results = [self.soc digitalReadFromPinNamed:[self pinNameForPin:pin] error:error];
        [self fixErrorMessage:pin error:error];
        return results;
    }

    -(int32_t)analogReadFromPin:(NSUInteger)pin error:(NSError **)error {
        int32_t results = [self.soc analogReadFromPinNamed:[self pinNameForPin:pin] error:error];
        [self fixErrorMessage:pin error:error];
        return results;
    }

    -(BOOL)waitForInterruptOnPin:(NSUInteger)pin timeout:(NSUInteger)timeout error:(NSError **)error {
        BOOL results = [self.soc waitForInterruptOnPinNamed:[self irqPinNameForPin:pin] timeout:timeout error:error];
        [self fixErrorMessage:pin error:error];
        return results;
    }

    -(BOOL)isValidPin:(NSUInteger)pin {
        return [self.soc isValidPinNamed:[self pinNameForPin:pin]];
    }

    -(BOOL)isValidIRQPin:(NSUInteger)pin {
        return [self.soc isValidIRQPinNamed:[self irqPinNameForPin:pin]];
    }

@end
