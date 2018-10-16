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
 @Last modified time: 16-Oct-2018 3:55:13 pm

 @Copyright(C):
     This file is part of
     'TP1 - Conjunto de instrucciones MIPS'. Unauthorized
     copying or use of this file via any medium is
     strictly prohibited.
--------------------------------------------------------------

Header file for codec implementation. It contains the
functions declarations of the ASM-coded functions used
by 'main.c'

----------------------------------------------------------- */
#ifndef BASE64__H
#define BASE64__H

#include <stdio.h>
#include <string.h>
#include "common.h"
#include "messages.h"

#define DECODER_MASK 0xFF000000
#define B64_CHARS_PER_BLOCK 4
#define PADDING_DEC '='
#define PADD_INDEX 0
#define OUTPUT_BLOCK_SIZE 3
#define BITS_PER_BYTE 8

#define ENCODER_MASK 0xFC
#define TAIL_MAX_BITS_TO_SHIFT 6
#define PADDING "="
#define ENCODER_OUTPUT_CHARS 4
#define MAX_LINE_LENGHT 76

extern const char *errmsg[];

unsigned char base256ToBase64(char *outChar, unsigned int inChar);
int base64_encode(params_t *params);

outputCode base64ToBase256(unsigned char *outBlock, unsigned char *inBlock,
                           unsigned char *decCount);
int base64_decode(params_t *params);

#endif
