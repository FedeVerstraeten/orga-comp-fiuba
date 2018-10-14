/* -----------------------------------------------------------
 @Title:   FIUBA - 66.20 Organización de Computadoras.
 @Project: TP1 - Conjunto de instrucciones MIPS.
--------------------------------------------------------------
 @Filename: printChar.c
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
 @Last modified time: 14-Oct-2018 2:02:59 am

 @Copyright(C):
     This file is part of
     'TP1 - Conjunto de instrucciones MIPS'. Unauthorized
     copying or use of this file via any medium is
     strictly prohibited.
--------------------------------------------------------------

Function that prints characters located in a buffer.

----------------------------------------------------------- */
#include "base64.h"
#include <errno.h>
#include <unistd.h>

int printChar(buffer_t *buffer, unsigned char c) {
  /* Variable for saving the 'errno' after reading or
   * writing.*/
  int errsv;
  size_t bytesToWrite;
  size_t bytesWriten;
  unsigned char *relativeIndex;

  buffer->buffer[buffer->index] = c;
  buffer->index++;

  bytesToWrite = buffer->index;

  if (buffer->index == buffer->size) {
    bytesWriten = 0;
    relativeIndex = buffer->buffer;

    while (bytesWriten < bytesToWrite) {
      bytesToWrite -= bytesWriten;
      relativeIndex += bytesWriten;
      bytesWriten = write(buffer->fd, relativeIndex, bytesToWrite);
      errsv = errno;
      if (errsv) {
        return errsv;
      }
    }

    buffer->index = 0;
  }

  return 0;
}
