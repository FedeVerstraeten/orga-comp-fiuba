/* -----------------------------------------------------------
 @Title:   FIUBA - 66.20 Organización de Computadoras.
 @Project: TP0 - Infraestructura básica.
--------------------------------------------------------------
 @Filename: base64ToBase256.h
--------------------------------------------------------------
 @Authors:
    Husain, Ignacio Santiago.
          santiago.husain at gmail dot com
    Pesado, Lucía.
          xxx at xxx dot xxx
    Verstraeten, Federico.
          federico.verstraeten at gmail dot com

 @Date:               15-Oct-2007 12:52:00 am
 @Last modified by:   root
 @Last modified time: 14-Oct-2018 12:53:18 am

 @Copyright(C):
    This file is part of 'TP0 - Infraestructura básica.'.
    Unauthorized copying or use of this file via any medium
    is strictly prohibited.
--------------------------------------------------------------

PUT DESCRIPTION HERE.

----------------------------------------------------------- */
#ifndef BASE64TOBASE256__H
#define BASE64TOBASE256__H

#include "base64.h"

int base64ToBase256(unsigned char *outBlock, unsigned char *inBlock,
                    unsigned char *decCount);

#endif
