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
 @Last modified by:   pluto
 @Last modified time: 18-Sep-2018 12:45:56 pm

 @Copyright(C):
    This file is part of 'TP0 - Infraestructura basica.'.
    Unauthorized copying or use of this file via any medium
    is strictly prohibited.
--------------------------------------------------------------

PUT DESCRIPTION HERE.

----------------------------------------------------------- */
#ifndef ENCODER__H
#define ENCODER__H

#include <stdio.h>
#include <string.h>
#include "common.h"
#include "messages.h"

#define BYTE_ENC_MASK 0xFC
#define BYTE_ZEROS 0x00
#define MAX6BIT 6
#define PADDING "="
#define MAX_OUT_BUFFER 5
#define MAX_LINE_LENGHT 76

unsigned char base256ToBase64(int *outChar, const int inChar);
outputCode encode(params_t *params);

#endif
