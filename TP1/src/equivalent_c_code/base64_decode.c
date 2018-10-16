/* -----------------------------------------------------------
 @Title:   FIUBA - 66.20 Organización de Computadoras.
 @Project: TP0 - Infraestructura básica.
--------------------------------------------------------------
 @Filename: base64_decode.c
--------------------------------------------------------------
 @Authors:
    Husain, Ignacio Santiago.
          santiago.husain at gmail dot com
    Pesado, Lucía.
          xxx at xxx dot xxx
    Verstraeten, Federico.
          federico.verstraeten at gmail dot com

 @Date:               15-Oct-2007 12:51:25 am
 @Last modified by:   root
 @Last modified time: 15-Oct-2018 11:02:18 pm

 @Copyright(C):
    This file is part of 'TP0 - Infraestructura básica.'.
    Unauthorized copying or use of this file via any medium
    is strictly prohibited.
--------------------------------------------------------------

PUT DESCRIPTION HERE.

----------------------------------------------------------- */
#include "base64_decode.h"

int base64_decode(int infd, int outfd) {
  unsigned char readChar = 0;
  unsigned char inBlock[B64_CHARS_PER_BLOCK] = {};
  unsigned char outBlock[OUTPUT_BLOCK_SIZE] = {};
  unsigned char index1, index2 = 0;
  unsigned char decodedCharsCount = 0;
  int decodingState = 4;

  ssize_t bytesRead = 0;
  size_t nbytes = 0;

  nbytes = sizeof(readChar);

  /* Variable for saving the 'errno' after reading or
   * writing.*/
  int errsv;

  /* Set an output buffer. */
  buffer_t outputBuffer;
  outputBuffer.fd = outfd;
  outputBuffer.index = 0;
  outputBuffer.size = BUFFER_SIZE;

  while (1) {
    decodedCharsCount = 0;

    /* Load input buffer */
    for (index1 = 0; index1 < B64_CHARS_PER_BLOCK; ++index1) {
      /* Read from the input stream. */
      bytesRead = read(infd, &readChar, nbytes);
      errsv = errno;
      if (errsv) {
        return ERROR_NUMBER_INPUT_STREAM_READING_MSG;
      }

      /* Discard detected whitespaces. */
      if (readChar == '\n' || readChar == '\t' || readChar == ' ') {
        index1--;
        continue;
      } else {
        inBlock[index1] = readChar;
      }

      /* EOF */
      if (bytesRead == 0) {
        /* If there are still chars in the buffer, we flush it.
         */
        if (index1 != 0) {
          decodingState = b64To256(outBlock, inBlock, &decodedCharsCount);
          if (decodingState != 0) {
            return decodingState;
          }

          for (index2 = 0; index2 < decodedCharsCount - 1; ++index2) {
            errsv = printChar(&outputBuffer, outBlock[index2]);
            if (errsv) {
              return ERROR_NUMBER_OUTPUT_STREAM_WRITING_MSG;
            }
          }
        }

        flushBuffer(&outputBuffer);

        return 0;
      }
    }

    /* Translate inBlock into base256 */
    decodingState = b64To256(outBlock, inBlock, &decodedCharsCount);
    if (decodingState != 0) {
      return decodingState;
    }

    for (index2 = 0; index2 < decodedCharsCount - 1; ++index2) {
      errsv = printChar(&outputBuffer, outBlock[index2]);
      if (errsv) {
        return ERROR_NUMBER_OUTPUT_STREAM_WRITING_MSG;
      }
    }
  }

  flushBuffer(&outputBuffer);

  return ERROR_NUMBER_OUTPUT_STREAM_WRITING_MSG;
}
