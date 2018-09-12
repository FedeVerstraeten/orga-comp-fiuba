/* -----------------------------------------------------------
 @Title:   FIUBA - 66.20 Organización de Computadoras.
 @Project: TP0 - Infraestructura básica.
--------------------------------------------------------------
 @Filename: encoder.h
--------------------------------------------------------------
 @Authors:
    Husain, Ignacio Santiago.
          santiago.husain at gmail dot com
    Pesado, Lucía.
          xxx at xxx dot xxx
    Verstraeten, Federico.
          federico.verstraeten at gmail dot com

 @Date:               12-Sep-2018 11:52:58 am
 @Last modified by:   Ignacio Santiago Husain
 @Last modified time: 12-Sep-2018 1:12:26 pm

 @Copyright(C):
    This file is part of 'TP0 - Infraestructura básica.'.
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
#define MAXOUTBUFFER 5

void base256ToBase64(char *outChar, const char inChar);
outputCode encode(params_t *params);
/* TODO: SOLO PARA PRUEBAS. BORRARLA. */
outputCode encodeIdentity(params_t *params);

#endif
