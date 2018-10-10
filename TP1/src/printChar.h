/* -----------------------------------------------------------
 @Title:   FIUBA - 66.20 Organización de Computadoras.
 @Project: TP1 - Conjunto de instrucciones MIPS.
--------------------------------------------------------------
 @Filename: printChar.h
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
 @Last modified time: 10-Oct-2018 5:48:31 pm

 @Copyright(C):
     This file is part of
     'TP1 - Conjunto de instrucciones MIPS'. Unauthorized
     copying or use of this file via any medium is
     strictly prohibited.
--------------------------------------------------------------

Header file for function that prints characters located in a
buffer.

----------------------------------------------------------- */
#ifndef PRINTCHAR__H
#define PRINTCHAR__H

#include <errno.h>
#include <unistd.h>
#include "buffer_t.h"

int printChar(buffer_t* buffer, unsigned char c);

#endif
