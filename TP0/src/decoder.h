/* -----------------------------------------------------------
 @Title:   FIUBA - 66.20 Organizacion de Computadoras.
 @Project: TP0 - Infraestructura basica.
--------------------------------------------------------------
 @Filename: decoder.h
--------------------------------------------------------------
 @Authors:
    Husain, Ignacio Santiago.
          santiago.husain at gmail dot com
    Pesado, Lucia.
          xxx at xxx dot xxx
    Verstraeten, Federico.
          federico.verstraeten at gmail dot com

 @Date:               12-Sep-2018 11:53:31 am
 @Last modified by:   Ignacio Santiago Husain
 @Last modified time: 12-Sep-2018 1:12:13 pm

 @Copyright(C):
    This file is part of 'TP0 - Infraestructura basica.'.
    Unauthorized copying or use of this file via any medium
    is strictly prohibited.
--------------------------------------------------------------

PUT DESCRIPTION HERE.

----------------------------------------------------------- */
#ifndef DECODER__H
#define DECODER__H

#include <stdio.h>
#include <string.h>
#include "common.h"
#include "messages.h"

#define BYTE_DEC_MASK 0xF000
#define SIZEINDEX 4
#define PADDING_DEC '='

outputCode base64ToBase256(unsigned char outChar[], unsigned char inChar[]);
outputCode decode(params_t *params);
/* TODO: SOLO PARA PRUEBAS. BORRARLA. */
outputCode decodeIdentity(params_t *params);

#endif
