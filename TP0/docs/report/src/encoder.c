/* -----------------------------------------------------------
 @Title:   FIUBA - 66.20 Organizacion de Computadoras.
 @Project: TP0 - Infraestructura basica.
--------------------------------------------------------------
 @Filename: encoder.c
--------------------------------------------------------------
 @Authors:
    Husain, Ignacio Santiago.
          santiago.husain at gmail dot com
    Pesado, Lucia.
          luupesado at gmail dot com
    Verstraeten, Federico.
          federico.verstraeten at gmail dot com

 @Date:               12-Sep-2018 11:21:26 am
 @Last modified by:   Ignacio Santiago Husain
 @Last modified time: 24-Sep-2018 11:29:21 am

 @Copyright(C):
    This file is part of 'TP0 - Infraestructura basica.'.
    Unauthorized copying or use of this file via any medium
    is strictly prohibited.
--------------------------------------------------------------

Encoder implementation.

----------------------------------------------------------- */
#include "encoder.h"

unsigned char base256ToBase64(char *outBlock, unsigned int inChar)
{
  unsigned char headByte = 0, prevByte = 0;
  static unsigned char tailByte = 0;
  static unsigned char bitMask = ENCODER_MASK;
  static unsigned int shiftRightBit = 2;
  unsigned char encodedCharsCount = 0;

  /* Backup the previous tailByte. */
  prevByte = tailByte;

  /* Padding: The last encoded block contains less than 6 bits. */
  if ((inChar == EOF))
  {
    if (shiftRightBit == 6)
    {
      headByte = (prevByte | 0);
      strncpy(outBlock, &translationTableB64[headByte], 1);
      strncat(outBlock, PADDING, 1);
      return (encodedCharsCount + 2);
    }
    else if (shiftRightBit == 4)
    {
      headByte = (prevByte | 0);
      strncpy(outBlock, &translationTableB64[headByte], 1);
      strncat(outBlock, PADDING, 1);
      strncat(outBlock, PADDING, 1);
      return (encodedCharsCount + 3);
    }
    else
      return encodedCharsCount;
  }

  /* Save the head of input char. */
  headByte = inChar & bitMask;

  /* Shift right 2, 4 or 6bit the headByte. */
  headByte >>= shiftRightBit;

  /* Save the tail input char. */
  tailByte = inChar & (~bitMask);

  /* Shift left 4, 2 or 0bit the tailByte. */
  tailByte <<= (TAIL_MAX_BITS_TO_SHIFT - shiftRightBit);

  /* Merge previous tailByte and current headByte. */
  headByte = (prevByte | headByte);

  /*Print translation in outBlock*/
  strncpy(outBlock, &translationTableB64[headByte], 1);
  encodedCharsCount++;

  shiftRightBit += 2;

  /* Shift left 2 bits the mask. */
  if (!(bitMask <<= 2))
  {
    /* Restart mask at the beginning. */
    bitMask = ENCODER_MASK;
    shiftRightBit = 2;

    /* Print tailByte and clear. */
    strncat(outBlock, &translationTableB64[tailByte], 1);
    encodedCharsCount++;

    tailByte = 0;
  }

  return encodedCharsCount;
}

outputCode encode(params_t *params)
{
  unsigned int inChar;
  char outBlock[ENCODER_OUTPUT_CHARS] = {};
  unsigned char totalEncodedCharsCount = 0, encodedCharsCount = 0;

  do
  {
    /* Clear outBlock. */
    memset(outBlock, 0, sizeof(outBlock));

    /* Read inputStream and store as integer. */
    inChar = getc(params->inputStream);

    if (ferror(params->inputStream))
    {
      fprintf(stderr, ERROR_INPUT_STREAM_READING_MSG);
      return outERROR;
    }

    /* Encoding to Base64. */
    encodedCharsCount = base256ToBase64(outBlock, inChar);

    if ((totalEncodedCharsCount + encodedCharsCount) <= MAX_LINE_LENGHT)
    {
      totalEncodedCharsCount += encodedCharsCount;
    }
    else
    {
      fputs("\n", params->outputStream);
      if (ferror(params->outputStream))
      {
        fprintf(stderr, ERROR_OUTPUT_STREAM_WRITING_MSG);
        return outERROR;
      }
      totalEncodedCharsCount = encodedCharsCount;
    }

    /* Print output stream. */
    fputs(outBlock, params->outputStream);
    if (ferror(params->outputStream))
    {
      fprintf(stderr, ERROR_OUTPUT_STREAM_WRITING_MSG);
      return outERROR;
    }
  } while (inChar != EOF);

  return outOK;
}
