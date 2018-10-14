/* -----------------------------------------------------------
 @Title:   FIUBA - 66.20 Organización de Computadoras.
 @Project: TP0 - Infraestructura básica.
--------------------------------------------------------------
 @Filename: base256ToBase64.h
--------------------------------------------------------------
 @Authors:
    Husain, Ignacio Santiago.
          santiago.husain at gmail dot com
    Pesado, Lucía.
          xxx at xxx dot xxx
    Verstraeten, Federico.
          federico.verstraeten at gmail dot com

 @Date:               15-Oct-2007 12:24:29 am
 @Last modified by:   root
 @Last modified time: 14-Oct-2018 1:07:06 am

 @Copyright(C):
    This file is part of 'TP0 - Infraestructura básica.'.
    Unauthorized copying or use of this file via any medium
    is strictly prohibited.
--------------------------------------------------------------

PUT DESCRIPTION HERE.

----------------------------------------------------------- */
#ifndef BASE256TOBASE64__H
#define BASE256TOBASE64__H

#include "base64.h"

unsigned char base256ToBase64(char *outChar, unsigned char inChar,
                              char inputEnded);

void addPadding(char *outBlock, const char pad, int numberPad);

#endif
