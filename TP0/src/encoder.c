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
          xxx at xxx dot xxx
    Verstraeten, Federico.
          federico.verstraeten at gmail dot com

 @Date:               12-Sep-2018 11:21:26 am
 @Last modified by:   Ignacio Santiago Husain
 @Last modified time: 12-Sep-2018 1:11:10 pm

 @Copyright(C):
    This file is part of 'TP0 - Infraestructura basica.'.
    Unauthorized copying or use of this file via any medium
    is strictly prohibited.
--------------------------------------------------------------

PUT DESCRIPTION HERE.

----------------------------------------------------------- */
#include "encoder.h"

void base256ToBase64(char *outChar, const char inChar)
{
  unsigned char headByte = BYTE_ZEROS;
  unsigned char prevByte = BYTE_ZEROS;
  static unsigned char tailByte = BYTE_ZEROS;
  static unsigned char bitMask = BYTE_ENC_MASK;
  static unsigned int shiftRightBit = 2;

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
      return;
    }
    else if (shiftRightBit == 4)
    {
      headByte = (prevByte | BYTE_ZEROS);
      strncpy(outChar, &translationTableB64[headByte], 1);
      strncat(outChar, PADDING, 1);
      strncat(outChar, PADDING, 1);
      return;
    }
    else
      return;
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

  shiftRightBit += 2;

  /* Shift left 2 bits the mask */
  if (!(bitMask <<= 2))
  {
    /* Restart mask at the beginning */
    bitMask = BYTE_ENC_MASK;
    shiftRightBit = 2;

    /* Print tailByte and clear*/
    strncat(outChar, &translationTableB64[tailByte], 1);
    tailByte = BYTE_ZEROS;
  };
}

outputCode encode(params_t *params)
{
  /* TODO:  revisar si estos char pueden o deben ser unsigned. */
  char inChar;
  char outChar[MAXOUTBUFFER] = {};

  do
  {
    memset(outChar, 0, sizeof(outChar));  // clear outChar
    inChar = getc(params->inputStream);
    base256ToBase64(outChar, inChar);
    fputs(outChar, params->outputStream);
    if (ferror(params->outputStream))
    {
      fprintf(stderr, ERROR_OUTPUT_STREAM_WRITING_MSG);
      return outERROR;
    }
  } while (inChar != EOF);

  if (ferror(params->inputStream))
  {
    fprintf(stderr, ERROR_INPUT_STREAM_READING_MSG);
    return outERROR;
  }

  return outOK;
}

/* TODO: SOLO PARA PRUEBAS. BORRARLA. */
outputCode encodeIdentity(params_t *params)
{
  int inChar, outChar;

  while ((inChar = getc(params->inputStream)) != EOF)
  {
    outChar = inChar;
    putc(outChar, params->outputStream);
    if (ferror(params->outputStream))
    {
      fprintf(stderr, ERROR_OUTPUT_STREAM_WRITING_MSG);
      return outERROR;
    }
  }

  if (ferror(params->inputStream))
  {
    fprintf(stderr, ERROR_INPUT_STREAM_READING_MSG);
    return outERROR;
  }

  return outOK;
}
