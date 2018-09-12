/* -----------------------------------------------------------
 @Title:   FIUBA - 66.20 Organizacion de Computadoras.
 @Project: TP0 - Infraestructura basica.
--------------------------------------------------------------
 @Filename: decoder.c
--------------------------------------------------------------
 @Authors:
    Husain, Ignacio Santiago.
          santiago.husain at gmail dot com
    Pesado, Lucia.
          xxx at xxx dot xxx
    Verstraeten, Federico.
          federico.verstraeten at gmail dot com

 @Date:               12-Sep-2018 11:21:30 am
 @Last modified by:   Ignacio Santiago Husain
 @Last modified time: 12-Sep-2018 1:03:55 pm

 @Copyright(C):
    This file is part of 'TP0 - Infraestructura basica.'.
    Unauthorized copying or use of this file via any medium
    is strictly prohibited.
--------------------------------------------------------------

PUT DESCRIPTION HERE.

----------------------------------------------------------- */
#include "decoder.h"

outputCode base64ToBase256(unsigned char outChar[], unsigned char inChar[])
{
  unsigned int bitMask = BYTE_DEC_MASK;
  size_t i = 0;
  size_t j = 0;
  unsigned char indexTable[SIZEINDEX] = {0, 0, 0, 0};
  unsigned int charHolder = 0;
  unsigned int bitPattern = 0;
  unsigned char accumBit = 0;

  /* Search char index in translationTableB64 */
  for (i = 0; i < 4; i++)
  {
    // fprintf(stderr, "%c\n",inChar[i]);
    for (j = 0; j < SIZETABLEB64; j++)
    {
      if (inChar[i] == translationTableB64[j])
      {
        indexTable[i] = j;
        // fprintf(stderr, "%c\n",indexTable[i]);
        break;
      }
      // else if (inChar[i] == PADDING_DEC)
      // {
      //   indexTable[i] = BYTE_ZEROS;
      //   break;
      // }
    }
    if (j >= SIZETABLEB64)
    {
      fprintf(stderr, "ERROR: Character is not in Base64 Table\n");
      fprintf(stderr, "j=%d\n", j);
      return outOK;
    }
  }

  for (i = 0; i < SIZEINDEX; i++)
  {
    accumBit += 2;
    charHolder = (unsigned int)indexTable[i];
    charHolder <<= ((SIZEINDEX - 1 - i) * sizeof(unsigned char) * 8);
    charHolder <<= accumBit;
    bitPattern = (bitPattern | charHolder);
  }

  i = 0;
  do
  {
    bitMask >>= i * sizeof(unsigned char) * 8;
    charHolder = (bitPattern & bitMask);
    charHolder >>= (SIZEINDEX - 1 - i) * sizeof(unsigned char) * 8;
    outChar[i] = (unsigned char)charHolder;
    i++;
  } while (charHolder != 0 && (i < SIZEINDEX));

  return outOK;
}

outputCode decode(params_t *params)
{
  /* TODO: code this function. Assume that 'params' are
   * already well initialized. */
  unsigned char auxChar;
  unsigned char inChar[4];
  unsigned char outChar[3] = {0, 0, 0};
  char i = 0;

  while (1)
  {
    memset(outChar, 0, 3 * sizeof(outChar));  // clear outChar
    for (i = 0; i < 4; ++i)
    {
      auxChar = getc(params->inputStream);
      if (ferror(params->inputStream))
      {
        fprintf(stderr, ERROR_INPUT_STREAM_READING_MSG);
        return outERROR;
      }
      if (auxChar == EOF)
      {
        if (i == 0)
        {
          return outOK;
        }
        else
        {
          fprintf(stderr, "ERROR: Reach EOF before 4 byte block read\n");
          return outERROR;
        }
      }
      if (auxChar != '\n')
      {
        inChar[i] = auxChar;
      }
      else
      {
        i--;
      }
    }
    if (base64ToBase256(outChar, inChar) == outERROR)
    {
      return outERROR;
    }

    fputs(outChar, params->outputStream);
    if (ferror(params->outputStream))
    {
      fprintf(stderr, ERROR_OUTPUT_STREAM_WRITING_MSG);
      return outERROR;
    }
  }

  return outOK;
}

/* TODO: SOLO PARA PRUEBAS. BORRARLA. */
outputCode decodeIdentity(params_t *params)
{
  /* TODO: code this function. Assume that 'params' are
   * already well initialized. */
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
