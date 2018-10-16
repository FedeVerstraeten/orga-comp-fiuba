/* -----------------------------------------------------------
 @Title:   FIUBA - 66.20 Organización de Computadoras.
 @Project: TP1 - Conjunto de instrucciones MIPS.
--------------------------------------------------------------
 @Filename: base64_decode.h
--------------------------------------------------------------
 @Authors:
    Husain, Ignacio Santiago.
          santiago.husain at gmail dot com
    Pesado, Lucía.
          xxx at xxx dot xxx
    Verstraeten, Federico.
          federico.verstraeten at gmail dot com

 @Date:               15-Oct-2007 12:50:36 am
 @Last modified by:   Ignacio Santiago Husain
 @Last modified time: 16-Oct-2018 3:59:42 pm

 @Copyright(C):
     This file is part of
     'TP1 - Conjunto de instrucciones MIPS'. Unauthorized
     copying or use of this file via any medium is
     strictly prohibited.
--------------------------------------------------------------

Functions declarations for 'base64_decode.c'

----------------------------------------------------------- */
#ifndef BASE_64_DECODE__H
#define BASE_64_DECODE__H

#include "base64.h"

int base64_decode(int infd, int outfd);

#endif
