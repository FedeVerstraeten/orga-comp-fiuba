/* -----------------------------------------------------------
 @Title:   FIUBA - 66.20 Organización de Computadoras.
 @Project: TP0 - Infraestructura básica.
--------------------------------------------------------------
 @Filename: common.h
--------------------------------------------------------------
 @Authors:
    Husain, Ignacio Santiago.
          santiago.husain at gmail dot com
    Pesado, Lucía.
          xxx at xxx dot xxx
    Verstraeten, Federico.
          federico.verstraeten at gmail dot com

 @Date:               12-Sep-2018 11:36:31 am
 @Last modified by:   Ignacio Santiago Husain
 @Last modified time: 12-Sep-2018 1:12:23 pm

 @Copyright(C):
    This file is part of 'TP0 - Infraestructura básica.'.
    Unauthorized copying or use of this file via any medium
    is strictly prohibited.
--------------------------------------------------------------

Common program structures.

----------------------------------------------------------- */
#ifndef COMMON__H
#define COMMON__H

#ifndef VERSION
#define VERSION "1.0.0"
#endif

#define SIZETABLEB64 64

static const char translationTableB64[SIZETABLEB64] =
    "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

typedef struct params_t
{
  char *action;
  FILE *inputStream;
  FILE *outputStream;
} params_t;

typedef enum outputCodes_ { outOK, outERROR } outputCode;

#endif
