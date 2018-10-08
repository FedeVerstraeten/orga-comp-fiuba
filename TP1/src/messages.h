/* -----------------------------------------------------------
 @Title:   FIUBA - 66.20 Organizacion de Computadoras.
 @Project: TP1 - Conjunto de instrucciones MIPS.
--------------------------------------------------------------
 @Filename: messages.h
--------------------------------------------------------------
 @Authors:
    Husain, Ignacio Santiago.
          santiago.husain at gmail dot com
    Pesado, Lucia.
          luupesado at gmail dot com
    Verstraeten, Federico.
          federico.verstraeten at gmail dot com

 @Date:               12-Sep-2018 11:32:42 am
 @Last modified by:   Ignacio Santiago Husain
 @Last modified time: 08-Oct-2018 3:54:51 pm

 @Copyright(C):
     This file is part of
     'TP1 - Conjunto de instrucciones MIPS'. Unauthorized
     copying or use of this file via any medium is
     strictly prohibited.
--------------------------------------------------------------

Program's common messages.

----------------------------------------------------------- */
#ifndef MESSAGES__H
#define MESSAGES__H

#ifndef ERROR_INVALID_INPUT_STREAM
#define ERROR_INVALID_INPUT_STREAM "ERROR: Invalid input stream.\n"
#endif
#ifndef ERROR_OPENING_INPUT_STREAM
#define ERROR_OPENING_INPUT_STREAM "ERROR: Can't open input stream.\n"
#endif
#ifndef ERROR_INVALID_OUTPUT_STREAM
#define ERROR_INVALID_OUTPUT_STREAM "ERROR: Invalid output stream.\n"
#endif
#ifndef ERROR_OPENING_OUTPUT_STREAM
#define ERROR_OPENING_OUTPUT_STREAM "ERROR: Can't open output stream.\n"
#endif
#ifndef ERROR_ACTION_INVALID_ARGUMENT
#define ERROR_ACTION_INVALID_ARGUMENT "ERROR: Invalid action argument.\n"
#endif
#ifndef ERROR_OUTPUT_STREAM_WRITING_MSG
#define ERROR_OUTPUT_STREAM_WRITING_MSG \
  "ERROR: Output error when writing stream.\n"
#endif
#ifndef ERROR_INPUT_STREAM_READING_MSG
#define ERROR_INPUT_STREAM_READING_MSG \
  "ERROR: Input error when reading stream.\n"
#endif
#ifndef ERROR_B64_CHAR_NOT_FOUND_MSG
#define ERROR_B64_CHAR_NOT_FOUND_MSG \
  "ERROR: Character is not in Base64 Table.\n"
#endif

/* These values must correspond with 'errmsg' array in base64.c
 * file. */
#ifndef ERROR_NUMBER_OUTPUT_STREAM_WRITING_MSG
#define ERROR_NUMBER_OUTPUT_STREAM_WRITING_MSG 1
#endif

#ifndef ERROR_NUMBER_INPUT_STREAM_READING_MSG
#define ERROR_NUMBER_INPUT_STREAM_READING_MSG 2
#endif

#ifndef ERROR_NUMBER_B64_CHAR_NOT_FOUND_MSG
#define ERROR_NUMBER_B64_CHAR_NOT_FOUND_MSG 3
#endif

#endif
