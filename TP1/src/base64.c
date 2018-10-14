/* -----------------------------------------------------------
 @Title:   FIUBA - 66.20 Organizacion de Computadoras.
 @Project: TP1 - Conjunto de instrucciones MIPS.
--------------------------------------------------------------
 @Filename: base64.c
--------------------------------------------------------------
 @Authors:
    Husain, Ignacio Santiago.
          santiago.husain at gmail dot com
    Pesado, Lucia.
          luupesado at gmail dot com
    Verstraeten, Federico.
          federico.verstraeten at gmail dot com

 @Date:               12-Sep-2018 11:21:30 am
 @Last modified by:   root
 @Last modified time: 14-Oct-2018 12:53:07 am

 @Copyright(C):
     This file is part of
     'TP1 - Conjunto de instrucciones MIPS'. Unauthorized
     copying or use of this file via any medium is
     strictly prohibited.
--------------------------------------------------------------

Codec implementation.

----------------------------------------------------------- */
#include "base64.h"

/* Error messages indices:
    1 - ERROR_OUTPUT_STREAM_WRITING_MSG
    2 - ERROR_INPUT_STREAM_READING_MSG
    3 - ERROR_B64_CHAR_NOT_FOUND_MSG
*/
const char *errmsg[] = {0, ERROR_OUTPUT_STREAM_WRITING_MSG,
                        ERROR_INPUT_STREAM_READING_MSG,
                        ERROR_B64_CHAR_NOT_FOUND_MSG};
