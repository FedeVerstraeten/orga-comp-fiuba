/* -----------------------------------------------------------
 @Title:   FIUBA - 66.20 Organización de Computadoras.
 @Project: TP1 - Conjunto de instrucciones MIPS.
--------------------------------------------------------------
 @Filename: flushBuffer.c
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
 @Last modified time: 10-Oct-2018 3:33:00 pm

 @Copyright(C):
     This file is part of
     'TP1 - Conjunto de instrucciones MIPS'. Unauthorized
     copying or use of this file via any medium is
     strictly prohibited.
--------------------------------------------------------------

Function that writes a given buffer to a stream given by
the file descriptor associated with the buffer.

----------------------------------------------------------- */
#include "flushBuffer.h"

int flushBuffer(buffer_t* buffer)
{
  /* Variable for saving the 'errno' after reading or
   * writing.*/
  int errsv;
  size_t bytesToWrite = buffer->index;
  size_t bytesWriten = 0;

  unsigned char* relativeIndex = buffer->buffer;

  while (bytesWriten < bytesToWrite)
  {
    bytesToWrite -= bytesWriten;
    relativeIndex += bytesWriten;
    bytesWriten = write(buffer->fd, relativeIndex, bytesToWrite);
    errsv = errno;
    if (errsv)
    {
      return errsv;
    }
  }

  buffer->index = 0;

  return 0;
}
