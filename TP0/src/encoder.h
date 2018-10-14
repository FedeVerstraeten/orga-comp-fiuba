/* -----------------------------------------------------------
 @Title:   FIUBA - 66.20 Organizacion de Computadoras.
 @Project: TP0 - Infraestructura basica.
--------------------------------------------------------------
 @Filename: encoder.h
--------------------------------------------------------------
 @Authors:
    Husain, Ignacio Santiago.
          santiago.husain at gmail dot com
    Pesado, Lucia.
          luupesado at gmail dot com
    Verstraeten, Federico.
          federico.verstraeten at gmail dot com

 @Date:               12-Sep-2018 11:52:58 am
 @Last modified by:   Ignacio Santiago Husain
 @Last modified time: 24-Sep-2018 11:29:36 am

 @Copyright(C):
    This file is part of 'TP0 - Infraestructura basica.'.
    Unauthorized copying or use of this file via any medium
    is strictly prohibited.
--------------------------------------------------------------

Encoder definitions and declarations.

----------------------------------------------------------- */
#ifndef ENCODER__H
#define ENCODER__H

#include <stdio.h>
#include <string.h>
#include "common.h"
#include "messages.h"

#define ENCODER_MASK 0xFC
#define TAIL_MAX_BITS_TO_SHIFT 6
#define PADDING_CHAR '='
#define PADDING "="
#define ENCODER_OUTPUT_CHARS 4
#define MAX_LINE_LENGHT 76

void addPadding(char *outBlock,const char pad,int numberPad);
unsigned char base256ToBase64(char *outChar, unsigned int inChar);
outputCode encode(params_t *params);

#endif
