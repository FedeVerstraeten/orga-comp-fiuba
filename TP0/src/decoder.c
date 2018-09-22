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
 @Last modified time: 18-Sep-2018 3:28:13 pm

 @Copyright(C):
    This file is part of 'TP0 - Infraestructura basica.'.
    Unauthorized copying or use of this file via any medium
    is strictly prohibited.
--------------------------------------------------------------

PUT DESCRIPTION HERE.

----------------------------------------------------------- */
#include "decoder.h"

outputCode base64ToBase256(unsigned char outChar[], unsigned char inChar[], unsigned char *decCount)
{
  unsigned int bitMask = BYTE_DEC_MASK;
  size_t index1 = 0;
  size_t index2 = 0;
  unsigned char indexTable[SIZEINDEX] = {0, 0, 0, 0};
  unsigned int charHolder = 0;
  unsigned int bitPattern = 0;
  unsigned char accumBit = 0;

  /* Search char index in translationTableB64 */
  for (index1 = 0; index1 < SIZEINDEX; index1++)
  {
    if (inChar[index1] == PADDING_DEC)
    {
      indexTable[index1] = PADD_INDEX;
      continue;
    }

    for (index2 = 0; index2 < SIZETABLEB64; ++index2)
    {
      if (inChar[index1] == translationTableB64[index2])
      {
        indexTable[index1] = index2;
        (*decCount)++;
        break;
      }
    }
    if (index2 >= SIZETABLEB64)
    {
      fprintf(stderr, "ERROR: Character is not in Base64 Table\n");
      return outERROR;
    }
  }

  /* bitPattern generation using indexTable */
  for (index1 = 0; index1 < SIZEINDEX; index1++)
  {
    accumBit += 2;
    charHolder = (unsigned int)indexTable[index1];
    charHolder <<= (SIZEINDEX - 1 - index1) * sizeof(unsigned char) * BIT_PER_BYTE;
    charHolder <<= accumBit;
    bitPattern = (bitPattern | charHolder);
  }

  index1 = 0;
  do
  {
    /* Extract the decoded character from bitPattern */
    charHolder = (bitPattern & bitMask);

    /* Shift right the decoded character to the correct position. */
    charHolder >>= (SIZEINDEX - 1 - index1) * sizeof(unsigned char) * BIT_PER_BYTE;

    /* Store in outChar */
    outChar[index1] = (unsigned char)charHolder;

    /* Shift right 0,8,16...bits the bitMask */
    bitMask >>= sizeof(unsigned char) * BIT_PER_BYTE;
    index1++;
  } while (index1 < OUTPUT_BLOCK_SIZE);

  return outOK;
}

outputCode decode(params_t *params)
{
  unsigned char readChar;
  unsigned char inChar[SIZEINDEX] = {};
  unsigned char outChar[OUTPUT_BLOCK_SIZE] = {};
  unsigned char index1 = 0;
  unsigned char decodedCharsCount = 0;
  unsigned char i = 0;

  while (1)
  {
    decodedCharsCount = 0;
    
    /* Load input buffer inChar */
    for (index1 = 0; index1 < SIZEINDEX; ++index1)
    {
      readChar = getc(params->inputStream);
      if (ferror(params->inputStream))
      {
        fprintf(stderr, ERROR_INPUT_STREAM_READING_MSG);
        return outERROR;
      }

      /* Discards WhiteSpaces detected */
      if (readChar == '\n' || readChar == '\t' || readChar == ' ')
      {
        index1--;
        continue;
      }
      else
      {
        inChar[index1] = readChar;
      }

      /* EOF */
      if (feof(params->inputStream))
      {
        /* If there are still chars in the buffer, we flush it. */
        if (index1 != 0)
        {
          if (base64ToBase256(outChar, inChar,&decodedCharsCount) == outERROR)
          {
            return outERROR;
          }

          for (i = 0; i < decodedCharsCount-1; ++i)
          {
            fputc(outChar[i],params->outputStream);
          }
          if (ferror(params->outputStream))
          {
            fprintf(stderr, ERROR_OUTPUT_STREAM_WRITING_MSG);
            return outERROR;
          }
        }
        return outOK;
      }
    }

    /* Translate inChar into base256 */
    if (base64ToBase256(outChar, inChar,&decodedCharsCount) == outERROR)
    {
      return outERROR;
    }

    for (i = 0; i < decodedCharsCount-1; ++i)
    {
      fputc(outChar[i],params->outputStream);
    }

    if (ferror(params->outputStream))
    {
      fprintf(stderr, ERROR_OUTPUT_STREAM_WRITING_MSG);
      return outERROR;
    }
  }

  return outERROR;
}
