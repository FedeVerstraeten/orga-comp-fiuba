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
 @Last modified time: 18-Sep-2018 6:43:30 pm

 @Copyright(C):
    This file is part of 'TP0 - Infraestructura basica.'.
    Unauthorized copying or use of this file via any medium
    is strictly prohibited.
--------------------------------------------------------------

PUT DESCRIPTION HERE.

----------------------------------------------------------- */
#include "encoder.h"

unsigned char base256ToBase64(char *outChar, const char inChar)
{
  unsigned char headByte = BYTE_ZEROS;
  unsigned char prevByte = BYTE_ZEROS;
  static unsigned char tailByte = BYTE_ZEROS;
  static unsigned char bitMask = BYTE_ENC_MASK;
  static unsigned int shiftRightBit = 2;
  unsigned char encodedCharsCount = 0;

  /* Backup the previous tailByte*/
  prevByte = tailByte;

  /*Padding: The last encoded block contain less 6bit*/
  if ((inChar == EOF))
  {
    if (shiftRightBit == 6)
    {
      headByte = (prevByte | BYTE_ZEROS);
      strncpy(outChar, &translationTableB64[headByte], 1);
      strncat(outChar, PADDING, 1);
      return (encodedCharsCount + 2);
    }
    else if (shiftRightBit == 4)
    {
      headByte = (prevByte | BYTE_ZEROS);
      strncpy(outChar, &translationTableB64[headByte], 1);
      strncat(outChar, PADDING, 1);
      strncat(outChar, PADDING, 1);
      return (encodedCharsCount + 3);
    }
    else
      return encodedCharsCount;
  }

  /* Save the head of input char*/
  headByte = inChar & bitMask;

  /* Shift right 2, 4 or 6bit the headByte*/
  headByte >>= shiftRightBit;

  /* Save the tail input char*/
  tailByte = inChar & (~bitMask);

  /* Shift left 4, 2 or 0bit the tailByte*/
  tailByte <<= (MAX6BIT - shiftRightBit);

  /* Merge previous tailByte and current headByte*/
  headByte = (prevByte | headByte);

  /*Print translation in outChar*/
  strncpy(outChar, &translationTableB64[headByte], 1);
  encodedCharsCount++;

  shiftRightBit += 2;

  /* Shift left 2 bits the mask */
  if (!(bitMask <<= 2))
  {
    /* Restart mask at the beginning */
    bitMask = BYTE_ENC_MASK;
    shiftRightBit = 2;

    /* Print tailByte and clear*/
    strncat(outChar, &translationTableB64[tailByte], 1);
    encodedCharsCount++;

    tailByte = BYTE_ZEROS;
  }

  return encodedCharsCount;
}

outputCode encode(params_t *params)
{
  /* TODO:  revisar si estos char pueden o deben ser unsigned. */
  char inChar;
  char outChar[MAX_OUT_BUFFER] = {};
  unsigned char totalEncodedCharsCount = 0, encodedCharsCount = 0;

  do
  {
    /* Clear outChar. */
    memset(outChar, 0, sizeof(outChar));
    inChar = getc(params->inputStream);
    if (ferror(params->inputStream))
    {
      fprintf(stderr, ERROR_INPUT_STREAM_READING_MSG);
      return outERROR;
    }
    encodedCharsCount = base256ToBase64(outChar, inChar);

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

    fputs(outChar, params->outputStream);
    if (ferror(params->outputStream))
    {
      fprintf(stderr, ERROR_OUTPUT_STREAM_WRITING_MSG);
      return outERROR;
    }

  } while (inChar != EOF);

  return outOK;
}
