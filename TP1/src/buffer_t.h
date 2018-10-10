/* -----------------------------------------------------------
 @Title:   FIUBA - 66.20 Organización de Computadoras.
 @Project: TP1 - Conjunto de instrucciones MIPS.
--------------------------------------------------------------
 @Filename: buffer_t.h
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
 @Last modified time: 10-Oct-2018 5:36:39 pm

 @Copyright(C):
     This file is part of
     'TP1 - Conjunto de instrucciones MIPS'. Unauthorized
     copying or use of this file via any medium is
     strictly prohibited.
--------------------------------------------------------------

Generic char buffer definition.

----------------------------------------------------------- */
#ifndef BUFFER_T__H
#define BUFFER_T__H

#include <stdio.h>
#include <stdlib.h>

#define BUFFER_IDX_OFFSET 0
#define BUFFER_SIZE_OFFSET 4
#define BUFFER_FILE_DESCRIPTOR_OFFSET 8
#define BUFFER_ARRAY_OFFSET 12

#define BUFFER_SIZE 1024

typedef struct buffer_t
{
  int index;
  int size;
  int fd;
  unsigned char buffer[BUFFER_SIZE];
} buffer_t;

#endif
