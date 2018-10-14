/* -----------------------------------------------------------
 @Title:   FIUBA - 66.20 Organización de Computadoras.
 @Project: TP1 - Conjunto de instrucciones MIPS.
--------------------------------------------------------------
 @Filename: base64.h
--------------------------------------------------------------
 @Authors:
    Husain, Ignacio Santiago.
          santiago.husain at gmail dot com
    Pesado, Lucía.
          xxx at xxx dot xxx
    Verstraeten, Federico.
          federico.verstraeten at gmail dot com

 @Date:               07-Oct-2018 10:19:49 pm
 @Last modified by:   root
 @Last modified time: 14-Oct-2018 2:47:43 am

 @Copyright(C):
     This file is part of
     'TP1 - Conjunto de instrucciones MIPS'. Unauthorized
     copying or use of this file via any medium is
     strictly prohibited.
--------------------------------------------------------------

Header file for codec implementation.

----------------------------------------------------------- */
#ifndef BASE64__H
#define BASE64__H

#include <errno.h>
#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <unistd.h>

#include "base256ToBase64.h"
#include "base64ToBase256.h"
#include "base64_decode.h"

#define DECODER_MASK 0xFF000000
#define B64_CHARS_PER_BLOCK 4
#define PADD_INDEX 0
#define OUTPUT_BLOCK_SIZE 3
#define BITS_PER_BYTE 8

#define ENCODER_MASK 0xFC
#define TAIL_MAX_BITS_TO_SHIFT 6
#define ENCODER_OUTPUT_CHARS 2
#define MAX_LINE_LENGHT 76

#define PADDING '='
#define PADDING_CHAR '='
#define PADDING_STR "="
#define SIZETABLEB64 64

static const char translationTableB64[SIZETABLEB64] =
    "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz01234"
    "56789+/";

extern const char *errmsg[];

#define BUFFER_IDX_OFFSET 0
#define BUFFER_SIZE_OFFSET 4
#define BUFFER_FILE_DESCRIPTOR_OFFSET 8
#define BUFFER_ARRAY_OFFSET 12

#define BUFFER_SIZE 1024

typedef struct buffer_t {
  int index;
  int size;
  int fd;
  unsigned char buffer[BUFFER_SIZE];
} buffer_t;

#ifndef ERROR_INVALID_INPUT_STREAM
#define ERROR_INVALID_INPUT_STREAM "ERROR: Invalid input stream.\n"
#endif
#ifndef ERROR_OPENING_INPUT_STREAM
#define ERROR_OPENING_INPUT_STREAM "ERROR: Can't open input stream.\n"
#endif
#ifndef ERROR_INVALID_OUTPUT_STREAM
#define ERROR_INVALID_OUTPUT_STREAM "ERROR: Invalid output stream.\n"
#endif
#ifndef ERROR_OPENING_OUTPUT_STREAM
#define ERROR_OPENING_OUTPUT_STREAM "ERROR: Can't open output stream.\n"
#endif
#ifndef ERROR_ACTION_INVALID_ARGUMENT
#define ERROR_ACTION_INVALID_ARGUMENT "ERROR: Invalid action argument.\n"
#endif
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

/* These values must correspond with 'errmsg' array in base64.c
 * file. */
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
