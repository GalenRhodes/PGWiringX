/******************************************************************************************************************************//**
 *     PROJECT: PGWiringX
 *    FILENAME: PGWXBogusI2C.h
 *         IDE: AppCode
 *      AUTHOR: Galen Rhodes
 *        DATE: 7/5/17 3:37 PM
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

#ifndef __PGWiringX_PGWXBogusI2C_H_
#define __PGWiringX_PGWXBogusI2C_H_
#ifdef __APPLE__
// @formatter:off

    #import  <Rubicon/Rubicon.h>
    #include <sys/ioctl.h>

    #define I2C_SLAVE    0x0703
    #define I2C_SMBUS    0x0720

    typedef uint32_t __u32;
    typedef uint16_t __u16;
    typedef uint8_t  __u8;
    typedef int32_t  __s32;
    typedef int16_t  __s16;
    typedef int8_t   __s8;

    struct i2c_smbus_ioctl_data {
        __u8                 read_write;
        __u8                 command;
        __u32                size;
        union i2c_smbus_data *data;
    };

    OS_INLINE __s32 i2c_smbus_access(int fd, char rw, int cmd, int size, union i2c_smbus_data *data) { return 0; }

    OS_INLINE __s32 i2c_smbus_read_byte(int fd) { return 0; }

    OS_INLINE __s32 i2c_smbus_write_byte(int fd, int value) { return 0; }

    OS_INLINE __s32 i2c_smbus_read_byte_data(int fd, int cmd) { return 0; }

    OS_INLINE __s32 i2c_smbus_write_byte_data(int fd, int cmd, int value) { return 0; }

    OS_INLINE __s32 i2c_smbus_read_word_data(int fd, int cmd) { return 0; }

    OS_INLINE __s32 i2c_smbus_write_word_data(int fd, int cmd, __u16 value) { return 0; }

// @formatter:on
#else
    #include "i2c-dev.h"
#endif

#endif //__PGWiringX_PGWXBogusI2C_H_
