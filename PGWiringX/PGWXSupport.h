/******************************************************************************************************************************//**
 *     PROJECT: PGWiringX
 *    FILENAME: PGWXSupport.h
 *         IDE: AppCode
 *      AUTHOR: Galen Rhodes
 *        DATE: 6/26/17 10:39 AM
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

#ifndef __PGWiringX_PGWXSupport_H_
#define __PGWiringX_PGWXSupport_H_

#import <Rubicon/Rubicon.h>

/* @f:0 */
typedef enum {
    PGWX_LOW  = 0,
    PGWX_HIGH = 1
} PGWXPinState;

typedef enum {
    PGWX_FUNCTION_UNKNOWN   = 0,
    PGWX_FUNCTION_DIGITAL   = 2,
    PGWX_FUNCTION_ANALOG    = 4,
    PGWX_FUNCTION_I2C       = 16,
    PGWX_FUNCTION_I2S       = 32,
    PGWX_FUNCTION_SPI       = 64,
    PGWX_FUNCTION_PWM       = 128,
    PGWX_FUNCTION_INTERRUPT = 256
} PGWXPinFunction;

typedef enum {
    PGWX_PINMODE_NOT_SET   = 0,
    PGWX_PINMODE_INPUT     = 2,
    PGWX_PINMODE_OUTPUT    = 4,
    PGWX_PINMODE_INTERRUPT = 8
} PGWXPinMode;

typedef enum {
    PGWX_ISR_MODE_UNKNOWN = 0,
    PGWX_ISR_MODE_RISING  = 2,
    PGWX_ISR_MODE_FALLING = 4,
    PGWX_ISR_MODE_BOTH    = 8,
    PGWX_ISR_MODE_NONE    = 16
} PGWXISRMode;
/* @f:1 */

FOUNDATION_EXPORT NSError *_Nonnull PGWXMakeError(NSError *_Nullable *_Nullable error, NSInteger code, NSString *_Nonnull message);

FOUNDATION_EXPORT NSError *_Nonnull PGWXMakeOSError(NSError *_Nullable *_Nullable error, int osErr);

FOUNDATION_EXPORT NSString *_Nonnull const PGWXErrorDomain;

NS_INLINE NSString *_Nonnull PGWXISRModeName(const PGWXISRMode isrMode) {
    NSString *isrModeName = @"";

    switch(isrMode) {
        case PGWX_ISR_MODE_RISING:
            isrModeName = @"rising";
            break;
        case PGWX_ISR_MODE_FALLING:
            isrModeName = @"falling";
            break;
        case PGWX_ISR_MODE_BOTH:
            isrModeName = @"both";
            break;
        case PGWX_ISR_MODE_NONE:
            isrModeName = @"none";
            break;
        case PGWX_ISR_MODE_UNKNOWN:
            isrModeName = @"";
            break;
    }

    return isrModeName;
}

#endif //__PGWiringX_PGWXSupport_H_
