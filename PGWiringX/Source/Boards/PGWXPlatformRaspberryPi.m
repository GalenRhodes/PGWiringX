/******************************************************************************************************************************//**
 *     PROJECT: PGWiringX
 *    FILENAME: PGWXPlatformRaspberryPi.m
 *         IDE: AppCode
 *      AUTHOR: Galen Rhodes
 *        DATE: 6/26/17 2:58 PM
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

#import "PGWXPlatformRaspberryPi.h"
#import "PGWXSOCBroadcomm.h"
#import "PGWiringX.h"

#define PGWXRPIMAP1 @[ @"FSEL17", @"FSEL18", @"FSEL27", @"FSEL22", @"FSEL23", @"FSEL24", @"FSEL25", @"FSEL4", @"FSEL2", @"FSEL3", @"FSEL8", @"FSEL7", @"FSEL10", @"FSEL9",\
    @"FSEL11", @"FSEL14", @"FSEL15"]

#define PGWXRPIMAP2 @[ @"FSEL17", @"FSEL18", @"FSEL27", @"FSEL22", @"FSEL23", @"FSEL24", @"FSEL25", @"FSEL4", @"FSEL2", @"FSEL3", @"FSEL8", @"FSEL7", @"FSEL10", @"FSEL9",\
    @"FSEL11", @"FSEL14", @"FSEL15", @"FSEL28", @"FSEL29", @"FSEL30", @"FSEL31"]

#define PGWXRPIMAP3 @[ @"FSEL17", @"FSEL18", @"FSEL27", @"FSEL22", @"FSEL23", @"FSEL24", @"FSEL25", @"FSEL4", @"FSEL2", @"FSEL3", @"FSEL8", @"FSEL7", @"FSEL10", @"FSEL9",\
    @"FSEL11", @"FSEL14", @"FSEL15", @"", @"", @"", @"", @"FSEL5", @"FSEL6", @"FSEL13", @"FSEL19", @"FSEL26", @"FSEL12", @"FSEL16", @"FSEL20", @"FSEL21", @"FSEL0", @"FSEL1"]

@implementation PGWXPlatformRaspberryPi1B1 {
    }

    -(instancetype)init:(NSError *_Nullable *)error {
        PGWXSOC *soc = [[PGWXSOCBroadcomm2835 alloc] initWithGPIOMap:PGWXRPIMAP1 irqMap:nil error:error];
        return (self = [super initWithBoardName:PGWX_RaspberryPi1B1 soc:soc error:error]);
    }

@end

@implementation PGWXPlatformRaspberryPi1B2 {
    }

    -(instancetype)init:(NSError *_Nullable *)error {
        PGWXSOC *soc = [[PGWXSOCBroadcomm2835 alloc] initWithGPIOMap:PGWXRPIMAP2 irqMap:nil error:error];
        return (self = [super initWithBoardName:PGWX_RaspberryPi1B2 soc:soc error:error]);
    }

@end

@implementation PGWXPlatformRaspberryPiZero {
    }

    -(instancetype)init:(NSError *_Nullable *)error {
        PGWXSOC *soc = [[PGWXSOCBroadcomm2835 alloc] initWithGPIOMap:PGWXRPIMAP2 irqMap:nil error:error];
        return (self = [super initWithBoardName:PGWX_RaspberryPiZero soc:soc error:error]);
    }

@end

@implementation PGWXPlatformRaspberryPi1BPlus {
    }

    -(instancetype)init:(NSError *_Nullable *)error {
        PGWXSOC *soc = [[PGWXSOCBroadcomm2835 alloc] initWithGPIOMap:PGWXRPIMAP3 irqMap:nil error:error];
        return (self = [super initWithBoardName:PGWX_RaspberryPi1BPlus soc:soc error:error]);
    }

@end

@implementation PGWXPlatformRaspberryPi2 {
    }

    -(instancetype)init:(NSError *_Nullable *)error {
        PGWXSOC *soc = [[PGWXSOCBroadcomm2836 alloc] initWithGPIOMap:PGWXRPIMAP3 irqMap:nil error:error];
        return (self = [super initWithBoardName:PGWX_RaspberryPi2 soc:soc error:error]);
    }

@end

@implementation PGWXPlatformRaspberryPi3 {
    }

    -(instancetype)init:(NSError *_Nullable *)error {
        PGWXSOC *soc = [[PGWXSOCBroadcomm2837 alloc] initWithGPIOMap:PGWXRPIMAP3 irqMap:nil error:error];
        return (self = [super initWithBoardName:PGWX_RaspberryPi3 soc:soc error:error]);
    }

@end
