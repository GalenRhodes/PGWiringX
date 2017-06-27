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

#define PGWXRPIMAP1 @[\
    [PGWXPinName pinName:@"FSEL17" withNumber:17],\
    [PGWXPinName pinName:@"FSEL18" withNumber:18],\
    [PGWXPinName pinName:@"FSEL27" withNumber:21],\
    [PGWXPinName pinName:@"FSEL22" withNumber:22],\
    [PGWXPinName pinName:@"FSEL23" withNumber:23],\
    [PGWXPinName pinName:@"FSEL24" withNumber:24],\
    [PGWXPinName pinName:@"FSEL25" withNumber:25],\
    [PGWXPinName pinName:@"FSEL4"  withNumber: 4],\
    [PGWXPinName pinName:@"FSEL2"  withNumber: 0],\
    [PGWXPinName pinName:@"FSEL3"  withNumber: 1],\
    [PGWXPinName pinName:@"FSEL8"  withNumber: 8],\
    [PGWXPinName pinName:@"FSEL7"  withNumber: 7],\
    [PGWXPinName pinName:@"FSEL10" withNumber:10],\
    [PGWXPinName pinName:@"FSEL9"  withNumber: 9],\
    [PGWXPinName pinName:@"FSEL11" withNumber:11],\
    [PGWXPinName pinName:@"FSEL14" withNumber:14],\
    [PGWXPinName pinName:@"FSEL15" withNumber:15]]

#define PGWXRPIMAP2 @[\
    [PGWXPinName pinName:@"FSEL17" withNumber:17],\
    [PGWXPinName pinName:@"FSEL18" withNumber:18],\
    [PGWXPinName pinName:@"FSEL27" withNumber:27],\
    [PGWXPinName pinName:@"FSEL22" withNumber:22],\
    [PGWXPinName pinName:@"FSEL23" withNumber:23],\
    [PGWXPinName pinName:@"FSEL24" withNumber:24],\
    [PGWXPinName pinName:@"FSEL25" withNumber:25],\
    [PGWXPinName pinName:@"FSEL4"  withNumber: 4],\
    [PGWXPinName pinName:@"FSEL2"  withNumber: 2],\
    [PGWXPinName pinName:@"FSEL3"  withNumber: 3],\
    [PGWXPinName pinName:@"FSEL8"  withNumber: 8],\
    [PGWXPinName pinName:@"FSEL7"  withNumber: 7],\
    [PGWXPinName pinName:@"FSEL10" withNumber:10],\
    [PGWXPinName pinName:@"FSEL9"  withNumber: 9],\
    [PGWXPinName pinName:@"FSEL11" withNumber:11],\
    [PGWXPinName pinName:@"FSEL14" withNumber:14],\
    [PGWXPinName pinName:@"FSEL15" withNumber:15],\
    [PGWXPinName pinName:@"FSEL28" withNumber:28],\
    [PGWXPinName pinName:@"FSEL29" withNumber:29],\
    [PGWXPinName pinName:@"FSEL30" withNumber:30],\
    [PGWXPinName pinName:@"FSEL31" withNumber:31]]

#define PGWXRPIMAP3 @[\
    [PGWXPinName pinName:@"FSEL17"    withNumber:17],\
    [PGWXPinName pinName:@"FSEL18"    withNumber:18],\
    [PGWXPinName pinName:@"FSEL27"    withNumber:27],\
    [PGWXPinName pinName:@"FSEL22"    withNumber:22],\
    [PGWXPinName pinName:@"FSEL23"    withNumber:23],\
    [PGWXPinName pinName:@"FSEL24"    withNumber:24],\
    [PGWXPinName pinName:@"FSEL25"    withNumber:25],\
    [PGWXPinName pinName:@"FSEL4"     withNumber: 4],\
    [PGWXPinName pinName:@"FSEL2"     withNumber: 2],\
    [PGWXPinName pinName:@"FSEL3"     withNumber: 3],\
    [PGWXPinName pinName:@"FSEL8"     withNumber: 8],\
    [PGWXPinName pinName:@"FSEL7"     withNumber: 7],\
    [PGWXPinName pinName:@"FSEL10"    withNumber:10],\
    [PGWXPinName pinName:@"FSEL9"     withNumber: 9],\
    [PGWXPinName pinName:@"FSEL11"    withNumber:11],\
    [PGWXPinName pinName:@"FSEL14"    withNumber:14],\
    [PGWXPinName pinName:@"FSEL15"    withNumber:15],\
    [PGWXPinName pinName:@"(Padding)" withNumber:-1],\
    [PGWXPinName pinName:@"(Padding)" withNumber:-1],\
    [PGWXPinName pinName:@"(Padding)" withNumber:-1],\
    [PGWXPinName pinName:@"(Padding)" withNumber:-1],\
    [PGWXPinName pinName:@"FSEL5"     withNumber: 5],\
    [PGWXPinName pinName:@"FSEL6"     withNumber: 6],\
    [PGWXPinName pinName:@"FSEL13"    withNumber:13],\
    [PGWXPinName pinName:@"FSEL19"    withNumber:19],\
    [PGWXPinName pinName:@"FSEL26"    withNumber:26],\
    [PGWXPinName pinName:@"FSEL12"    withNumber:12],\
    [PGWXPinName pinName:@"FSEL16"    withNumber:16],\
    [PGWXPinName pinName:@"FSEL20"    withNumber:20],\
    [PGWXPinName pinName:@"FSEL21"    withNumber:21],\
    [PGWXPinName pinName:@"FSEL0"     withNumber: 0],\
    [PGWXPinName pinName:@"FSEL1"     withNumber: 1]]

@implementation PGWXPlatformRaspberryPi1B1 {
    }

    -(instancetype)init:(NSError **)error {
        PGWXSOC *soc = [[PGWXSOCBroadcomm2835 alloc] initWithGPIOMap:PGWXRPIMAP1 irqMap:nil error:error];
        return (self = [super initWithBoardName:@"Raspberry PI-1B1" soc:soc error:error]);
    }

@end

@implementation PGWXPlatformRaspberryPi1B2 {
    }

    -(instancetype)init:(NSError **)error {
        PGWXSOC *soc = [[PGWXSOCBroadcomm2835 alloc] initWithGPIOMap:PGWXRPIMAP2 irqMap:nil error:error];
        return (self = [super initWithBoardName:@"Raspberry PI-1B2" soc:soc error:error]);
    }

@end

@implementation PGWXPlatformRaspberryPiZero {
    }

    -(instancetype)init:(NSError **)error {
        PGWXSOC *soc = [[PGWXSOCBroadcomm2835 alloc] initWithGPIOMap:PGWXRPIMAP2 irqMap:nil error:error];
        return (self = [super initWithBoardName:@"Raspberry PI-Zero" soc:soc error:error]);
    }

@end

@implementation PGWXPlatformRaspberryPi1BP {
    }

    -(instancetype)init:(NSError **)error {
        PGWXSOC *soc = [[PGWXSOCBroadcomm2835 alloc] initWithGPIOMap:PGWXRPIMAP3 irqMap:nil error:error];
        return (self = [super initWithBoardName:@"Raspberry PI-1B+" soc:soc error:error]);
    }

@end

@implementation PGWXPlatformRaspberryPi2 {
    }

    -(instancetype)init:(NSError **)error {
        PGWXSOC *soc = [[PGWXSOCBroadcomm2836 alloc] initWithGPIOMap:PGWXRPIMAP3 irqMap:nil error:error];
        return (self = [super initWithBoardName:@"Raspberry PI-2" soc:soc error:error]);
    }

@end

@implementation PGWXPlatformRaspberryPi3 {
    }

    -(instancetype)init:(NSError **)error {
        PGWXSOC *soc = [[PGWXSOCBroadcomm2837 alloc] initWithGPIOMap:PGWXRPIMAP3 irqMap:nil error:error];
        return (self = [super initWithBoardName:@"Raspberry PI-3" soc:soc error:error]);
    }

@end
