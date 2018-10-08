/* -----------------------------------------------------------
 @Title:   FIUBA - 66.20 Organizacion de Computadoras.
 @Project: TP1 - Conjunto de instrucciones MIPS.
--------------------------------------------------------------
 @Filename: common.h
--------------------------------------------------------------
 @Authors:
    Husain, Ignacio Santiago.
          santiago.husain at gmail dot com
    Pesado, Lucia.
          luupesado at gmail dot com
    Verstraeten, Federico.
          federico.verstraeten at gmail dot com

 @Date:               12-Sep-2018 11:36:31 am
 @Last modified by:   Ignacio Santiago Husain
 @Last modified time: 08-Oct-2018 2:43:02 pm

 @Copyright(C):
     This file is part of
     'TP1 - Conjunto de instrucciones MIPS'. Unauthorized
     copying or use of this file via any medium is
     strictly prohibited.
--------------------------------------------------------------

Common program structures.

----------------------------------------------------------- */
#ifndef COMMON__H
#define COMMON__H

#ifndef VERSION
#define VERSION "1.0.0"
#endif

typedef struct params_t
{
  char *action;
  FILE *inputStream;
  FILE *outputStream;
} params_t;

typedef enum outputCodes_ { outOK, outERROR } outputCode;

#endif
