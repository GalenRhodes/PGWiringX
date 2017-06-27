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

#define PGWXMAPPRO @[\
    [PGWXPinName pinName:@"GPIO3_IO09" withNumber: 73],\
    [PGWXPinName pinName:@"GPIO3_IO08" withNumber: 72],\
    [PGWXPinName pinName:@"GPIO3_IO07" withNumber: 71],\
    [PGWXPinName pinName:@"GPIO3_IO06" withNumber: 70],\
    [PGWXPinName pinName:@"GPIO7_IO02" withNumber:185],\
    [PGWXPinName pinName:@"GPIO7_IO03" withNumber:186],\
    [PGWXPinName pinName:@"GPIO3_IO03" withNumber: 67],\
    [PGWXPinName pinName:@"GPIO1_IO01" withNumber:  1],\
    [PGWXPinName pinName:@"GPIO3_IO18" withNumber: 82],\
    [PGWXPinName pinName:@"GPIO3_IO17" withNumber: 81],\
    [PGWXPinName pinName:@"GPIO2_IO26" withNumber: 58],\
    [PGWXPinName pinName:@"GPIO2_IO27" withNumber: 59],\
    [PGWXPinName pinName:@"GPIO2_IO24" withNumber: 56],\
    [PGWXPinName pinName:@"GPIO2_IO25" withNumber: 57],\
    [PGWXPinName pinName:@"GPIO2_IO23" withNumber: 55],\
    [PGWXPinName pinName:@"GPIO5_IO28" withNumber:149],\
    [PGWXPinName pinName:@"GPIO5_IO29" withNumber:150]]

#define PGWXIRQPRO @[\
    [PGWXPinName pinName:@"GPIO3_IO09" withNumber: 73],\
    [PGWXPinName pinName:@"GPIO3_IO08" withNumber: 72],\
    [PGWXPinName pinName:@"GPIO3_IO07" withNumber: 71],\
    [PGWXPinName pinName:@"GPIO3_IO06" withNumber: 70],\
    [PGWXPinName pinName:@"GPIO7_IO02" withNumber:185],\
    [PGWXPinName pinName:@"GPIO7_IO03" withNumber:186],\
    [PGWXPinName pinName:@"GPIO3_IO03" withNumber: 67],\
    [PGWXPinName pinName:@"GPIO1_IO01" withNumber:  1],\
    [PGWXPinName pinName:@"(Padding)"  withNumber: -1],\
    [PGWXPinName pinName:@"(Padding)"  withNumber: -1],\
    [PGWXPinName pinName:@"(Padding)"  withNumber: -1],\
    [PGWXPinName pinName:@"(Padding)"  withNumber: -1],\
    [PGWXPinName pinName:@"(Padding)"  withNumber: -1],\
    [PGWXPinName pinName:@"(Padding)"  withNumber: -1],\
    [PGWXPinName pinName:@"(Padding)"  withNumber: -1],\
    [PGWXPinName pinName:@"(Padding)"  withNumber: -1],\
    [PGWXPinName pinName:@"(Padding)"  withNumber: -1]]

#define PGWXMAPEDGE1 [PGWXPinName pinName:@"GPIO7_IO12" withNumber:195],\
    [PGWXPinName pinName:@"GPIO7_IO11" withNumber:194],\
    [PGWXPinName pinName:@"GPIO2_IO22" withNumber:54],\
    [PGWXPinName pinName:@"GPIO3_IO27" withNumber:91],\
    [PGWXPinName pinName:@"GPIO3_IO26" withNumber:90],\
    [PGWXPinName pinName:@"GPIO3_IO30" withNumber:94],\
    [PGWXPinName pinName:@"GPIO3_IO31" withNumber:95],\
    [PGWXPinName pinName:@"GPIO5_IO04" withNumber:125],\
    [PGWXPinName pinName:@"GPIO6_IO06" withNumber:159],\
    [PGWXPinName pinName:@"GPIO2_IO16" withNumber:48],\
    [PGWXPinName pinName:@"GPIO2_IO17" withNumber:47],\
    [PGWXPinName pinName:@"GPIO2_IO18" withNumber:50],\
    [PGWXPinName pinName:@"GPIO2_IO19" withNumber:51],\
    [PGWXPinName pinName:@"GPIO2_IO20" withNumber:52],\
    [PGWXPinName pinName:@"GPIO2_IO21" withNumber:53],\
    [PGWXPinName pinName:@"GPIO2_IO28" withNumber:60],\
    [PGWXPinName pinName:@"GPIO2_IO29" withNumber:61],\
    [PGWXPinName pinName:@"GPIO3_IO00" withNumber:64],\
    [PGWXPinName pinName:@"GPIO3_IO01" withNumber:65],\
    [PGWXPinName pinName:@"GPIO3_IO12" withNumber:76],\
    [PGWXPinName pinName:@"GPIO3_IO15" withNumber:79],\
    [PGWXPinName pinName:@"GPIO3_IO14" withNumber:78],\
    [PGWXPinName pinName:@"GPIO3_IO13" withNumber:77],\
    [PGWXPinName pinName:@"GPIO3_IO02" withNumber:66],\
    [PGWXPinName pinName:@"GPIO3_IO03" withNumber:67],\
    [PGWXPinName pinName:@"GPIO3_IO04" withNumber:68],\
    [PGWXPinName pinName:@"GPIO3_IO05" withNumber:69],\
    [PGWXPinName pinName:@"GPIO3_IO06" withNumber:70],\
    [PGWXPinName pinName:@"GPIO3_IO07" withNumber:71],\
    [PGWXPinName pinName:@"GPIO3_IO08" withNumber:72],\
    [PGWXPinName pinName:@"GPIO3_IO09" withNumber:73],\
    [PGWXPinName pinName:@"GPIO3_IO11" withNumber:75],\
    [PGWXPinName pinName:@"GPIO3_IO10" withNumber:74]

#define PGWXMAPEDGE2 [PGWXPinName pinName:@"GPIO2_IO26" withNumber:58],\
    [PGWXPinName pinName:@"GPIO2_IO23" withNumber:55],\
    [PGWXPinName pinName:@"GPIO2_IO25" withNumber:57],\
    [PGWXPinName pinName:@"GPIO2_IO24" withNumber:56],\
    [PGWXPinName pinName:@"GPIO4_IO29" withNumber:120],\
    [PGWXPinName pinName:@"GPIO2_IO27" withNumber:59],\
    [PGWXPinName pinName:@"GPIO3_IO24" withNumber:88],\
    [PGWXPinName pinName:@"GPIO3_IO25" withNumber:89],\
    [PGWXPinName pinName:@"GPIO3_IO17" withNumber:81],\
    [PGWXPinName pinName:@"GPIO3_IO18" withNumber:82]

#define PGWXIRQEDGE1 [PGWXPinName pinName:@"GPIO7_IO12" withNumber:195], \
    [PGWXPinName pinName:@"(Padding)" withNumber:-1], \
    [PGWXPinName pinName:@"GPIO2_IO22" withNumber:54], \
    [PGWXPinName pinName:@"GPIO3_IO27" withNumber:91], \
    [PGWXPinName pinName:@"GPIO3_IO26" withNumber:90], \
    [PGWXPinName pinName:@"GPIO3_IO30" withNumber:94], \
    [PGWXPinName pinName:@"GPIO3_IO31" withNumber:95], \
    [PGWXPinName pinName:@"(Padding)" withNumber:-1], \
    [PGWXPinName pinName:@"(Padding)" withNumber:-1], \
    [PGWXPinName pinName:@"(Padding)" withNumber:-1], \
    [PGWXPinName pinName:@"(Padding)" withNumber:-1], \
    [PGWXPinName pinName:@"(Padding)" withNumber:-1], \
    [PGWXPinName pinName:@"(Padding)" withNumber:-1], \
    [PGWXPinName pinName:@"(Padding)" withNumber:-1], \
    [PGWXPinName pinName:@"(Padding)" withNumber:-1], \
    [PGWXPinName pinName:@"(Padding)" withNumber:-1], \
    [PGWXPinName pinName:@"(Padding)" withNumber:-1], \
    [PGWXPinName pinName:@"(Padding)" withNumber:-1], \
    [PGWXPinName pinName:@"(Padding)" withNumber:-1], \
    [PGWXPinName pinName:@"GPIO3_IO06" withNumber:70], \
    [PGWXPinName pinName:@"(Padding)" withNumber:-1], \
    [PGWXPinName pinName:@"(Padding)" withNumber:-1], \
    [PGWXPinName pinName:@"(Padding)" withNumber:-1], \
    [PGWXPinName pinName:@"(Padding)" withNumber:-1], \
    [PGWXPinName pinName:@"GPIO3_IO03" withNumber:67], \
    [PGWXPinName pinName:@"(Padding)" withNumber:-1], \
    [PGWXPinName pinName:@"(Padding)" withNumber:-1], \
    [PGWXPinName pinName:@"GPIO3_IO06" withNumber:70], \
    [PGWXPinName pinName:@"GPIO3_IO07" withNumber:71], \
    [PGWXPinName pinName:@"GPIO3_IO08" withNumber:72], \
    [PGWXPinName pinName:@"GPIO3_IO09" withNumber:73], \
    [PGWXPinName pinName:@"(Padding)" withNumber:-1], \
    [PGWXPinName pinName:@"(Padding)" withNumber:-1]

#define PGWXIRQEDGE2 [PGWXPinName pinName:@"(Padding)" withNumber:-1], \
    [PGWXPinName pinName:@"(Padding)" withNumber:-1], \
    [PGWXPinName pinName:@"(Padding)" withNumber:-1], \
    [PGWXPinName pinName:@"(Padding)" withNumber:-1], \
    [PGWXPinName pinName:@"(Padding)" withNumber:-1], \
    [PGWXPinName pinName:@"(Padding)" withNumber:-1], \
    [PGWXPinName pinName:@"(Padding)" withNumber:-1], \
    [PGWXPinName pinName:@"(Padding)" withNumber:-1], \
    [PGWXPinName pinName:@"(Padding)" withNumber:-1], \
    [PGWXPinName pinName:@"(Padding)" withNumber:-1]

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
    }

    -(instancetype)init:(NSError **)error {
        PGWXSOC *soc = [[PGWXSOCNXPIMX6DQRM alloc] initWithGPIOMap:PGWXMAPPRO irqMap:PGWXIRQPRO error:error];
        return (self = [super initWithBoardName:@"Hummingboard Base/Pro DQ" soc:soc error:error]);
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

    -(instancetype)init:(NSError **)error {
        PGWXSOC *soc = [[PGWXSOCNXPIMX6SDLRM alloc] initWithGPIOMap:PGWXMAPPRO irqMap:PGWXIRQPRO error:error];
        return (self = [super initWithBoardName:@"Hummingboard Base/Pro SDL" soc:soc error:error]);
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

    -(instancetype)init:(NSError **)error {
        PGWXSOC *soc = [[PGWXSOCNXPIMX6DQRM alloc] initWithGPIOMap:@[PGWXMAPEDGE1, PGWXMAPEDGE2] irqMap:@[PGWXIRQEDGE1, PGWXIRQEDGE2] error:error];
        return (self = [super initWithBoardName:@"Hummingboard Gate/Edge DQ" soc:soc error:error]);
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
    }

    -(instancetype)init:(NSError **)error {
        PGWXSOC *soc = [[PGWXSOCNXPIMX6SDLRM alloc] initWithGPIOMap:@[PGWXMAPEDGE1] irqMap:@[PGWXIRQEDGE1] error:error];
        return (self = [super initWithBoardName:@"Hummingboard Gate/Edge SDL" soc:soc error:error]);
    }

@end

