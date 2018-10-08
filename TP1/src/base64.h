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
 @Last modified by:   Ignacio Santiago Husain
 @Last modified time: 08-Oct-2018 3:54:53 pm

 @Copyright(C):
     This file is part of
     'TP1 - Conjunto de instrucciones MIPS'. Unauthorized
     copying or use of this file via any medium is
     strictly prohibited.
--------------------------------------------------------------

PUT DESCRIPTION HERE.

----------------------------------------------------------- */
#ifndef BASE64__H
#define BASE64__H

#include <errno.h>
#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <unistd.h>
#include "common.h"
#include "messages.h"

#define DECODER_MASK 0xFF000000
#define B64_CHARS_PER_BLOCK 4
#define PADD_INDEX 0
#define OUTPUT_BLOCK_SIZE 3
#define BITS_PER_BYTE 8

#define ENCODER_MASK 0xFC
#define TAIL_MAX_BITS_TO_SHIFT 6
#define ENCODER_OUTPUT_CHARS 4
#define MAX_LINE_LENGHT 76

#define PADDING '='
#define PADDING_STR "="
#define SIZETABLEB64 64

static const char translationTableB64[SIZETABLEB64] =
    "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz01234"
    "56789+/";

extern const char *errmsg[];

unsigned char base256ToBase64(char *outChar, unsigned char inChar,
                              char inputEnded);
int base64_encode(params_t *params, int infd, int outfd);

int base64ToBase256(unsigned char *outBlock, unsigned char *inBlock,
                    unsigned char *decCount);
int base64_decode(params_t *params, int infd, int outfd);

#endif
