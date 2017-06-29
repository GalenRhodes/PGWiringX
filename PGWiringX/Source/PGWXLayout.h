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

#import <Cocoa/Cocoa.h>

@class PGWXBit;

typedef enum { PGWX_LOW = 0, PGWX_HIGH = 1 } PGWXPinState;

typedef enum {
    PGWX_FUNCTION_UNKNOWN = 0, PGWX_FUNCTION_DIGITAL = 2, PGWX_FUNCTION_ANALOG = 4, PGWX_FUNCTION_I2C = 16, PGWX_FUNCTION_INTERRUPT = 32
}                                            PGWXPinFunction;

typedef enum {
    PGWX_PINMODE_NOT_SET = 0, PGWX_PINMODE_INPUT = 2, PGWX_PINMODE_OUTPUT = 4, PGWX_PINMODE_INTERRUPT = 8
}                                            PGWXPinMode;

typedef enum {
    PGWX_ISR_MODE_UNKNOWN = 0, PGWX_ISR_MODE_RISING = 2, PGWX_ISR_MODE_FALLING = 4, PGWX_ISR_MODE_BOTH = 8, PGWX_ISR_MODE_NONE = 16
}                                            PGWXISRMode;

NS_ASSUME_NONNULL_BEGIN

@interface PGWXLayout : NSObject<NSLocking>

    @property(nonatomic, readonly) NSString   *name;
    @property(nonatomic, readonly) NSUInteger number;
    @property(nonatomic, readonly) NSUInteger bank;
    @property(nonatomic, readonly) NSString   *sysfsPath;
    @property(nonatomic, readonly) PGWXBit    *select;
    @property(nonatomic, readonly) PGWXBit    *set;
    @property(nonatomic, readonly) PGWXBit    *clear;
    @property(nonatomic, readonly) PGWXBit    *read;
    @property(nonatomic, readonly) NSUInteger support;
    @property(atomic, readwrite) PGWXPinMode  mode;
    @property(atomic, readwrite) int          fd;
    @property(atomic, readwrite) BOOL         sysfsWithName;

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

    -(BOOL)sysfsExport:(NSError *_Nullable *)error;

    -(BOOL)sysfsUnexport:(NSError *_Nullable *)error;

    -(BOOL)sysfsWrite:(NSString *)value toSubPath:(NSString *)subPath error:(NSError *_Nullable *)error;

    -(nullable NSError *)sysfsDigitalWrite:(PGWXPinState)value;

    -(PGWXPinState)sysfsDigitalRead:(NSError *_Nullable *)error;

    -(BOOL)sysfsValidate:(NSError *_Nullable *)error;

    -(BOOL)sysfsCheck:(NSError *_Nullable *)error;

@end

NS_ASSUME_NONNULL_END

#endif //__PGWiringX_PGWXLayout_H_
