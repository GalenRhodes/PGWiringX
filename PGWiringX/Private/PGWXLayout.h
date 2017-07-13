/******************************************************************************************************************************//**
 *     PROJECT: PGWiringX
 *    FILENAME: PGWXLayout.h
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

#ifndef __PGWiringX_PGWXLayout_H_
#define __PGWiringX_PGWXLayout_H_

#import <PGWiringX/PGWXSupport.h>

@class PGWXBit;

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const PGWXFunctionNotSupportedMessage;
FOUNDATION_EXPORT NSString *const PGWXModeNotSetMessage;

@interface PGWXLayout : NSObject<NSLocking>

    @property(nonatomic, readonly) NSString    *name;
    @property(nonatomic, readonly) NSUInteger  number;
    @property(nonatomic, readonly) NSUInteger  bank;
    @property(nonatomic, readonly) NSString    *sysfsPath;
    @property(nonatomic, readonly) PGWXBit     *select;
    @property(nonatomic, readonly) PGWXBit     *set;
    @property(nonatomic, readonly) PGWXBit     *clear;
    @property(nonatomic, readonly) PGWXBit     *read;
    @property(nonatomic, readonly) NSUInteger  support;
    @property(nonatomic, readonly) PGWXPinMode mode;
    @property(nonatomic, readonly) PGWXISRMode irqMode;
    @property(atomic, readwrite) uintptr_t     baseAddr;
    @property(atomic, readwrite) int           fd;
    @property(atomic, readwrite) BOOL          sysfsWithName;

    -(instancetype)initWithName:(NSString *)name
                         number:(NSUInteger)number
                           bank:(NSUInteger)bank
                         select:(PGWXBit *)sel
                           read:(PGWXBit *)read
                            set:(PGWXBit *)set
                          clear:(PGWXBit *)clear
                        support:(NSUInteger)sup;

    +(instancetype)layoutWithName:(NSString *)name number:(NSUInteger)number
                             bank:(NSUInteger)bank
                           select:(PGWXBit *)sel
                             read:(PGWXBit *)read
                              set:(PGWXBit *)set
                            clear:(PGWXBit *)clear
                          support:(NSUInteger)sup;

    +(instancetype)layoutWithName:(NSString *)name
                           number:(NSUInteger)number
                             bank:(NSUInteger)bank
                           select:(PGWXBit *)select
                             read:(PGWXBit *)read
                            write:(PGWXBit *)write
                          support:(NSUInteger)support;

    +(instancetype)layoutWithName:(NSString *)name
                           number:(NSUInteger)number
                             bank:(NSUInteger)bank
                           select:(PGWXBit *)select
                        readWrite:(PGWXBit *)readWrite
                          support:(NSUInteger)support;

    -(BOOL)isEqual:(id)other;

    -(BOOL)isEqualToLayout:(PGWXLayout *)layout;

    -(NSUInteger)hash;

    -(uint32_t)socRead:(uintptr_t)address;

    -(void)socWrite:(uint32_t)value address:(uintptr_t)address;

    -(void)setModeInputImpl;

    -(void)setModeOutputImpl;

    -(void)digitalWriteImpl:(PGWXPinState)value;

    -(void)digitalClearImpl;

    -(void)digitalSetImpl;

    -(BOOL)setMode:(PGWXPinMode)mode error:(NSError **)error;

    -(PGWXPinState)digitalReadImpl;

    -(int32_t)analogReadImpl;

    -(BOOL)digitalWrite:(PGWXPinState)value error:(NSError **)error;

    -(PGWXPinState)digitalRead:(NSError **)error;

    -(int32_t)analogRead:(NSError **)error;

    -(BOOL)setISR:(PGWXISRMode)mode error:(NSError **)error;

    -(BOOL)waitForInterruptWithTimeout:(NSUInteger)timeout error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END

#endif //__PGWiringX_PGWXLayout_H_
