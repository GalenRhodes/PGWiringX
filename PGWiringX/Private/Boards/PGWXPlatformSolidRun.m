/******************************************************************************************************************************//**
 *     PROJECT: PGWiringX
 *    FILENAME: PGWXPlatformSolidRun.m
 *         IDE: AppCode
 *      AUTHOR: Galen Rhodes
 *        DATE: 6/26/17 2:59 PM
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

#import "PGWXPlatformSolidRun.h"
#import "PGWXSOCNXP.h"
#import "PGWiringX.h"

/*
|3v|5v|
| 8|5v|
| 9|0v|
| 7|15|
|0v|16|
| 0| 1|
| 2|0v|
| 3| 4|
|3v| 5|
|12|0v|
|13| 6|
|14|10|
|0v|11|

|-----|
|SPDIF|
|-----|
*/
@implementation PGWXPlatformSolidRunHummingboardBaseProDQ {
    @public
        NSArray<NSString *> *_gpioMap;
        NSArray<NSString *> *_irqMap;
        PGWXSOC             *_soc;
    }

    -(NSString *)boardName {
        return PGWX_HummingboardBaseDQ;
    }

    -(NSArray<NSString *> *)gpioMap {
        [self lock];

        @try {
            if(_gpioMap.count == 0) {
                _gpioMap = @[
                        @"GPIO3_IO09",
                        @"GPIO3_IO08",
                        @"GPIO3_IO07",
                        @"GPIO3_IO06",
                        @"GPIO7_IO02",
                        @"GPIO7_IO03",
                        @"GPIO3_IO03",
                        @"GPIO1_IO01",
                        @"GPIO3_IO18",
                        @"GPIO3_IO17",
                        @"GPIO2_IO26",
                        @"GPIO2_IO27",
                        @"GPIO2_IO24",
                        @"GPIO2_IO25",
                        @"GPIO2_IO23",
                        @"GPIO5_IO28",
                        @"GPIO5_IO29"
                ];
            }
        }
        @finally {
            [self unlock];
        }
        return _gpioMap;
    }

    -(NSArray<NSString *> *)irqMap {
        [self lock];

        @try {
            if(_irqMap.count == 0) {
                _irqMap = @[
                        @"GPIO3_IO09",
                        @"GPIO3_IO08",
                        @"GPIO3_IO07",
                        @"GPIO3_IO06",
                        @"GPIO7_IO02",
                        @"GPIO7_IO03",
                        @"GPIO3_IO03",
                        @"GPIO1_IO01",
                        @"",
                        @"",
                        @"",
                        @"",
                        @"",
                        @"",
                        @"",
                        @"",
                        @""
                ];
            }
        }
        @finally {
            [self unlock];
        }
        return _irqMap;
    }

    -(PGWXSOC *)soc {
        [self lock];

        @try {
            if(_soc == nil) {
                _soc = [[PGWXSOCNXPIMX6DQRM alloc] init:nil];
            }
        }
        @finally {
            [self unlock];
        }
        return _soc;
    }

@end

/*
|3v|5v|
| 8|5v|
| 9|0v|
| 7|15|
|0v|16|
| 0| 1|
| 2|0v|
| 3| 4|
|3v| 5|
|12|0v|
|13| 6|
|14|10|
|0v|11|

|-----|
|SPDIF|
|-----|
*/
@implementation PGWXPlatformSolidRunHummingboardBaseProSDL {
    }

    -(NSString *)boardName {
        return PGWX_HummingboardBaseSDL;
    }

@end

/*
-------
  MIC
-------
| 0| 1| 2|0v|
| 3| 4| 5| 6|
| 7| 8| 9|10|
|11|12|13|14|
|15|16|17|18|
|19|20|21|22|

|23|24|25|26|
|27|28|29|30|
|31|32|5v|3v|
|--|
|IR|
|--|

*/
@implementation PGWXPlatformSolidRunHummingboardGateEdgeSDL {
    @public
        NSArray<NSString *> *_gpioMap;
        NSArray<NSString *> *_irqMap;
        PGWXSOC             *_soc;
    }

    -(NSString *)boardName {
        return PGWX_HummingboardEdgeSDL;
    }

    -(PGWXSOC *)soc {
        [self lock];

        @try {
            if(_soc == nil) {
                _soc = [[PGWXSOCNXPIMX6SDLRM alloc] init:nil];
            }
        }
        @finally {
            [self unlock];
        }
        return _soc;
    }

    -(NSArray<NSString *> *)gpioMap {
        [self lock];

        @try {
            if(_gpioMap.count == 0) {
                _gpioMap = @[
                        @"GPIO7_IO12",
                        @"GPIO7_IO11",
                        @"GPIO2_IO22",
                        @"GPIO3_IO27",
                        @"GPIO3_IO26",
                        @"GPIO3_IO30",
                        @"GPIO3_IO31",
                        @"GPIO5_IO04",
                        @"GPIO6_IO06",
                        @"GPIO2_IO16",
                        @"GPIO2_IO17",
                        @"GPIO2_IO18",
                        @"GPIO2_IO19",
                        @"GPIO2_IO20",
                        @"GPIO2_IO21",
                        @"GPIO2_IO28",
                        @"GPIO2_IO29",
                        @"GPIO3_IO00",
                        @"GPIO3_IO01",
                        @"GPIO3_IO12",
                        @"GPIO3_IO15",
                        @"GPIO3_IO14",
                        @"GPIO3_IO13",
                        @"GPIO3_IO02",
                        @"GPIO3_IO03",
                        @"GPIO3_IO04",
                        @"GPIO3_IO05",
                        @"GPIO3_IO06",
                        @"GPIO3_IO07",
                        @"GPIO3_IO08",
                        @"GPIO3_IO09",
                        @"GPIO3_IO11",
                        @"GPIO3_IO10"
                ];
            }
        }
        @finally {
            [self unlock];
        }
        return _gpioMap;
    }

    -(NSArray<NSString *> *)irqMap {
        [self lock];

        @try {
            if(_irqMap.count == 0) {
                _irqMap = @[
                        @"GPIO7_IO12",
                        @"",
                        @"GPIO2_IO22",
                        @"GPIO3_IO27",
                        @"GPIO3_IO26",
                        @"GPIO3_IO30",
                        @"GPIO3_IO31",
                        @"",
                        @"",
                        @"",
                        @"",
                        @"",
                        @"",
                        @"",
                        @"",
                        @"",
                        @"",
                        @"",
                        @"",
                        @"GPIO3_IO06",
                        @"",
                        @"",
                        @"",
                        @"",
                        @"GPIO3_IO03",
                        @"",
                        @"",
                        @"GPIO3_IO06",
                        @"GPIO3_IO07",
                        @"GPIO3_IO08",
                        @"GPIO3_IO09",
                        @"",
                        @""
                ];
            }
        }
        @finally {
            [self unlock];
        }
        return _irqMap;
    }

@end

/*
-------
  MIC
-------
| 0| 1| 2|0v|
| 3| 4| 5| 6|
| 7| 8| 9|10|
|11|12|13|14|
|15|16|17|18|
|19|20|21|22|

|23|24|25|26|
|27|28|29|30|
|31|32|5v|3v|
|--|
|IR|
|--|

--------
mikroBUS
--------

i	LABEL	PINFUNC			PAD			GPIO		wiringNo
1	AN		MB_AN			-
2	RST		POR_B			-
3	CS		ECSPI2_SS0		EIM_RW		GPIO2_IO26	33
4	SCK		ECSPI2_SCLK		EIM_CS0		GPIO2_IO23	34
5	MISO	ECSPI2_MISO		EIM_OE		GPIO2_IO25	35
6	MOSI	ECSPI2_MOSI		EIM_CS1		GPIO2_IO24	36
7	3V3		-
8	GND		-
9	PWM		PWM1_OUT		DISP0_DAT8	GPIO4_IO29	37
10	INT		ECSPI2_SS1		EIM_LBA		GPIO2_IO27	38
11	RX		UART3_TX_DATA	EIM_D24		GPIO3_IO24	39
12	TX		UART3_RX_DATA	EIM_D25		GPIO3_IO25	40
13	SCL		I2C3_SCL		EIM_D17		GPIO3_IO17	41
14	SDA		I2C3_SDA		EIM_D18		GPIO3_IO18	42
15	5V0		-
16	GND		-

*/
@implementation PGWXPlatformSolidRunHummingboardGateEdgeDQ {
    }

    -(NSString *)boardName {
        return PGWX_HummingboardEdgeDQ;
    }

    -(PGWXSOC *)soc {
        [self lock];

        @try {
            if(_soc == nil) {
                _soc = [[PGWXSOCNXPIMX6DQRM alloc] init:nil];
            }
        }
        @finally {
            [self unlock];
        }
        return _soc;
    }

    -(NSArray<NSString *> *)gpioMap {
        [self lock];

        @try {
            if(_gpioMap.count == 0) {
                NSMutableArray *ar = super.gpioMap.mutableCopy;
                [ar addObjectsFromArray:@[
                        @"GPIO2_IO26", @"GPIO2_IO23", @"GPIO2_IO25", @"GPIO2_IO24", @"GPIO4_IO29", @"GPIO2_IO27", @"GPIO3_IO24", @"GPIO3_IO25", @"GPIO3_IO17", @"GPIO3_IO18"
                ]];
                _gpioMap = [NSArray arrayWithArray:ar];
            }
        }
        @finally {
            [self unlock];
        }
        return _gpioMap;
    }

    -(NSArray<NSString *> *)irqMap {
        [self lock];

        @try {
            if(_irqMap.count == 0) {
                NSMutableArray *ar = super.irqMap.mutableCopy;
                [ar addObjectsFromArray:@[ @"", @"", @"", @"", @"", @"", @"", @"", @"", @"" ]];
                _irqMap = [NSArray arrayWithArray:ar];
            }
        }
        @finally {
            [self unlock];
        }
        return _irqMap;
    }

@end

