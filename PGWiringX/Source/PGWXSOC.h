/******************************************************************************************************************************//**
 *     PROJECT: PGWiringX
 *    FILENAME: PGWXSOC.h
 *         IDE: AppCode
 *      AUTHOR: Galen Rhodes
 *        DATE: 6/26/17 9:47 AM
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

#ifndef __PGWiringX_PGWXSOC_H_
#define __PGWiringX_PGWXSOC_H_

#import "PGWXLayout.h"
#import "PGWXAddr.h"

NS_ASSUME_NONNULL_BEGIN

@interface PGWXSOC : NSObject

    @property(nonatomic, readonly, copy) NSString                               *brandName;
    @property(nonatomic, readonly, copy) NSString                               *chipSet;
    @property(nonatomic, readonly, copy) NSArray<NSString *>                    *gpioMap;
    @property(nonatomic, readonly, copy) NSArray<NSString *>                    *irqMap;
    @property(nonatomic, readonly, copy) NSDictionary<NSString *, PGWXLayout *> *layout;
    @property(nonatomic, readonly) NSUInteger                                   isrModes;
    @property(nonatomic, readonly) NSUInteger                                   pageSize;
    @property(nonatomic, readonly) NSArray<PGWXAddr *>                          *baseAddresses;

    -(instancetype)initWithBrandName:(NSString *)brandName
                             chipSet:(NSString *)chipSet
                              layout:(NSArray<PGWXLayout *> *)layout
                             gpioMap:(NSArray<NSString *> *)gpioMap
                              irqMap:(nullable NSArray<NSString *> *)irqMap
                            isrModes:(NSUInteger)isrModes
                            pageSize:(NSUInteger)pageSize
                       baseAddresses:(NSArray<PGWXAddr *> *)baseAddresses
                               error:(NSError *_Nullable *)error;

    -(instancetype)initWithBrandName:(NSString *)brandName
                             chipSet:(NSString *)chipSet
                              layout:(NSArray<PGWXLayout *> *)layout
                             gpioMap:(NSArray<NSString *> *)gpioMap
                              irqMap:(nullable NSArray<NSString *> *)irqMap
                            isrModes:(NSUInteger)isrModes
                            pageSize:(NSUInteger)pageSize
                       baseAddresses:(NSArray<PGWXAddr *> *)baseAddresses
                       sysfsWithName:(BOOL)sysfsWithName
                               error:(NSError *_Nullable *)error;

    -(BOOL)setMode:(PGWXPinMode)mode forPin:(NSUInteger)pin error:(NSError *_Nullable *)error;

    -(BOOL)digitalWrite:(PGWXPinState)value toPin:(NSUInteger)pin error:(NSError *_Nullable *)error;

    -(PGWXPinState)digitalReadFromPin:(NSUInteger)pin error:(NSError *_Nullable *)error;

    -(NSInteger)analogReadFromPin:(NSUInteger)pin error:(NSError *_Nullable *)error;

    -(BOOL)setISR:(PGWXISRMode)mode forPin:(NSUInteger)pin error:(NSError *_Nullable *)error;

    -(BOOL)waitForInterruptOnPin:(NSUInteger)pin timeout:(NSUInteger)timeout error:(NSError *_Nullable *)error;

    -(BOOL)isValidPin:(NSUInteger)pin;

    -(int)selectableFdForPin:(NSUInteger)pin error:(NSError *_Nullable *)error;

    -(BOOL)sysfsExportPin:(NSUInteger)pin error:(NSError *_Nullable *)error;

    -(BOOL)sysfsUnexportPin:(NSUInteger)pin error:(NSError *_Nullable *)error;

    -(BOOL)sysfsCheckPin:(NSUInteger)pin error:(NSError *_Nullable *)error;

    -(BOOL)sysfsDigitalWrite:(PGWXPinState)value toPin:(NSUInteger)pin error:(NSError *_Nullable *)error;

    -(PGWXPinState)sysfsDigitalReadFromPin:(NSUInteger)pin error:(NSError *_Nullable *)error;

@end

NS_ASSUME_NONNULL_END

#endif //__PGWiringX_PGWXSOC_H_
