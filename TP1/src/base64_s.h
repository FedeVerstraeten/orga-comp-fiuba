/* -----------------------------------------------------------
 @Title:   FIUBA - 66.20 Organización de Computadoras.
 @Project: TP1 - Conjunto de instrucciones MIPS.
--------------------------------------------------------------
 @Filename: base64_s.h
--------------------------------------------------------------
 @Authors:
    Husain, Ignacio Santiago.
          santiago.husain at gmail dot com
    Pesado, Lucía.
          xxx at xxx dot xxx
    Verstraeten, Federico.
          federico.verstraeten at gmail dot com

 @Date:               07-Oct-2018 10:19:49 pm
 @Last modified by:   santiago
 @Last modified time: 16-Oct-2018 8:25:59 am

 @Copyright(C):
     This file is part of
     'TP1 - Conjunto de instrucciones MIPS'. Unauthorized
     copying or use of this file via any medium is
     strictly prohibited.
--------------------------------------------------------------

Header file for codec implementation.

----------------------------------------------------------- */
#ifndef BASE64_S__H
#define BASE64_S__H

#include <mips/regdef.h>
#include <sys/syscall.h>
#include <sys/errno.h>

#define ASCII_NULL 0
#define ASCII_LF 10
#define ASCII_TAB 9
#define ASCII_SPACE 32

#define SIZEOF_UCHAR 1

#define DECODER_MASK 0xFF000000
#define B64_CHARS_PER_BLOCK 4
#define PAD_INDEX 0
#define OUTPUT_BLOCK_SIZE 3
#define BITS_PER_BYTE 8

#define ENCODER_MASK 0xFC
#define TAIL_MAX_BITS_TO_SHIFT 6
#define ENCODER_OUTPUT_CHARS 3
#define MAX_LINE_LENGHT 76

#define PADDING '='
#define PADDING_CHAR '='
#define PADDING_STR "="
#define PADDING_ASCII 61
#define SIZETABLEB64 64

#define BUFFER_IDX_OFFSET 0
#define BUFFER_SIZE_OFFSET 4
#define BUFFER_FILE_DESCRIPTOR_OFFSET 8
#define BUFFER_ARRAY_OFFSET 12

#define BUFFER_SIZE 1024

#ifndef ERROR_OUTPUT_STREAM_WRITING_MSG
#define ERROR_OUTPUT_STREAM_WRITING_MSG                                        \
  "ERROR: Output error when writing stream.\n"
#endif
#ifndef ERROR_INPUT_STREAM_READING_MSG
#define ERROR_INPUT_STREAM_READING_MSG                                         \
  "ERROR: Input error when reading stream.\n"
#endif
#ifndef ERROR_B64_CHAR_NOT_FOUND_MSG
#define ERROR_B64_CHAR_NOT_FOUND_MSG                                           \
  "ERROR: Character is not in Base64 Table.\n"
#endif

/* These values must correspond with 'errmsg' array. */
#ifndef ERROR_NUMBER_OUTPUT_STREAM_WRITING_MSG
#define ERROR_NUMBER_OUTPUT_STREAM_WRITING_MSG 1
#endif

#ifndef ERROR_NUMBER_INPUT_STREAM_READING_MSG
#define ERROR_NUMBER_INPUT_STREAM_READING_MSG 2
#endif

#ifndef ERROR_NUMBER_B64_CHAR_NOT_FOUND_MSG
#define ERROR_NUMBER_B64_CHAR_NOT_FOUND_MSG 3
#endif

#endif
