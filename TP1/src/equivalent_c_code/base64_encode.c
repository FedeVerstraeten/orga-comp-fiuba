/* -----------------------------------------------------------
 @Title:   FIUBA - 66.20 Organización de Computadoras.
 @Project: TP0 - Infraestructura básica.
--------------------------------------------------------------
 @Filename: base64_encode.c
--------------------------------------------------------------
 @Authors:
    Husain, Ignacio Santiago.
          santiago.husain at gmail dot com
    Pesado, Lucía.
          xxx at xxx dot xxx
    Verstraeten, Federico.
          federico.verstraeten at gmail dot com

 @Date:               15-Oct-2007 12:11:01 am
 @Last modified by:   root
 @Last modified time: 15-Oct-2018 11:05:09 pm

 @Copyright(C):
    This file is part of 'TP0 - Infraestructura básica.'.
    Unauthorized copying or use of this file via any medium
    is strictly prohibited.
--------------------------------------------------------------

PUT DESCRIPTION HERE.

----------------------------------------------------------- */
#include "base64.h"

int base64_encode(int infd, int outfd) {
  unsigned char inChar = 0;
  unsigned char totalEncodedCharsCount = 0, encodedCharsCount = 0;
  char inputEnded = 0;
  ssize_t bytesRead = 0;
  size_t nbytes = 0, nOutputBlock = 0, index1 = 0;
  /* Variable for saving the 'errno' after reading or
   * writing.*/
  int errsv;
  /* Set an output buffer. */
  buffer_t outputBuffer;
  char outBlock[ENCODER_OUTPUT_CHARS] = {};

  nbytes = sizeof(inChar);
  nOutputBlock = sizeof(outBlock);

  outputBuffer.fd = outfd;
  outputBuffer.index = 0;
  outputBuffer.size = BUFFER_SIZE;

  do {
    /* Clear outBlock. */
    for (index1 = 0; index1 < ENCODER_OUTPUT_CHARS; ++index1)
      outBlock[index1] = 0;

    /* Read from the input stream. */
    bytesRead = read(infd, &inChar, nbytes);
    errsv = errno;
    if (errsv) {
      return ERROR_NUMBER_INPUT_STREAM_READING_MSG;
    }

    if (bytesRead == 0) {
      inputEnded = 1;
    }

    /* Encoding to Base64. */
    encodedCharsCount = b256To64(outBlock, inChar, inputEnded);

    if ((totalEncodedCharsCount + encodedCharsCount) <= MAX_LINE_LENGHT) {
      totalEncodedCharsCount += encodedCharsCount;
    } else {
      errsv = printChar(&outputBuffer, '\n');
      if (errsv) {
        return ERROR_NUMBER_OUTPUT_STREAM_WRITING_MSG;
      }
      totalEncodedCharsCount = encodedCharsCount;
    }

    /* Print output stream. */
    index1 = 0;
    while (outBlock[index1] != '\0') {
      errsv = printChar(&outputBuffer, outBlock[index1]);
      if (errsv) {
        return ERROR_NUMBER_OUTPUT_STREAM_WRITING_MSG;
      }
      index1++;
    }
  } while (bytesRead > 0);

  flushBuffer(&outputBuffer);

  return 0;
}
