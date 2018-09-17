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
          luupesado at gmail dot com
    Verstraeten, Federico.
          federico.verstraeten at gmail dot com

 @Date:               12-Sep-2018 11:21:30 am
 @Last modified by:   Ignacio Santiago Husain
 @Last modified time: 17-Sep-2018 12:12:06 am

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
  for (i = 0; i < SIZEINDEX; i++)
  {
    if (inChar[i] == PADDING_DEC)
    {
      indexTable[i] = PADD_INDEX;
      continue;
    }

    for (j = 0; j < SIZETABLEB64; ++j)
    {
      if (inChar[i] == translationTableB64[j])
      {
        indexTable[i] = j;
        break;
      }
    }
    if (j >= SIZETABLEB64)
    {
      fprintf(stderr, "ERROR: Character is not in Base64 Table\n");
      return outERROR;
    }
  }

  for (i = 0; i < SIZEINDEX; i++)
  {
    accumBit += 2;
    charHolder = (unsigned int)indexTable[i];
    charHolder <<= (SIZEINDEX - 1 - i) * sizeof(unsigned char) * BIT_PER_BYTE;
    charHolder <<= accumBit;
    bitPattern = (bitPattern | charHolder);
  }

  i = 0;
  do
  {
    /* Extract the decoded character from bitPattern */
    charHolder = (bitPattern & bitMask);

    /* Shift right the decoded character to the correct position. */
    charHolder >>= (SIZEINDEX - 1 - i) * sizeof(unsigned char) * BIT_PER_BYTE;

    /* Store in outChar */
    outChar[i] = (unsigned char)charHolder;

    /* Shift right 0,8,16...bits the bitMask */
    bitMask >>= sizeof(unsigned char) * BIT_PER_BYTE;
    i++;
  } while (charHolder != 0 && (i < SIZEINDEX));

  return outOK;
}

outputCode decode(params_t *params)
{
  /* TODO: code this function. Assume that 'params' are
   * already well initialized. */
  unsigned char readChar;
  unsigned char inChar[SIZEINDEX] = {};
  unsigned char outChar[OUTPUT_BLOCK_SIZE] = {};
  int i = 0;

  while (1)
  {
    for (i = 0; i < SIZEINDEX; ++i)
    {
      readChar = (unsigned int)getc(params->inputStream);
      if (ferror(params->inputStream))
      {
        fprintf(stderr, ERROR_INPUT_STREAM_READING_MSG);
        return outERROR;
      }
      if (feof(params->inputStream))
      {
        if (i != 0)
        {
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
      // {
      //   return outOK;
      // }
      // else
      // {
      //   fprintf(stderr, "ERROR: Reach EOF before 4 byte block read\n");
      //   return outERROR;
      // }

      /* Discards NewLines detected */
      if (readChar != '\n')
      {
        inChar[i] = readChar;
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

  return outERROR;
}
