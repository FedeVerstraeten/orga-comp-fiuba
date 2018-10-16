/* -----------------------------------------------------------
 @Title:   FIUBA - 66.20 Organización de Computadoras.
 @Project: TP1 - Conjunto de instrucciones MIPS.
--------------------------------------------------------------
 @Filename: flushBuffer.h
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
 @Last modified time: 16-Oct-2018 3:57:46 pm

 @Copyright(C):
     This file is part of
     'TP1 - Conjunto de instrucciones MIPS'. Unauthorized
     copying or use of this file via any medium is
     strictly prohibited.
--------------------------------------------------------------

Header file for function to flush a given buffer.

----------------------------------------------------------- */
#ifndef FLUSHBUFFER__H
#define FLUSHBUFFER__H

#include <errno.h>
#include <unistd.h>
#include "buffer_t.h"
#include "messages.h"

int flushBuffer(buffer_t* buffer);

#endif
