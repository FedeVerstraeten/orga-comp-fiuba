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
 @Last modified time: 24-Sep-2018 11:51:05 am

 @Copyright(C):
    This file is part of 'TP0 - Infraestructura basica.'.
    Unauthorized copying or use of this file via any medium
    is strictly prohibited.
--------------------------------------------------------------

Decoder implementation.

----------------------------------------------------------- */
#include "decoder.h"

outputCode base64ToBase256(unsigned char *outBlock, unsigned char *inBlock,
                           unsigned char *decCount)
{
  unsigned int bitMask = DECODER_MASK;
  unsigned char index1 = 0, index2 = 0;
  unsigned char indexTable[B64_CHARS_PER_BLOCK] = {0, 0, 0, 0};
  unsigned int charHolder = 0;
  /* Variable to hold the output block of 4 bytes. */
  unsigned int bitPattern = 0;
  unsigned char accumBit = 0;

  /* Search char index in translationTableB64 */
  for (index1 = 0; index1 < B64_CHARS_PER_BLOCK; index1++)
  {
    if (inBlock[index1] == PADDING_DEC)
    {
      indexTable[index1] = PADD_INDEX;
      continue;
    }

    for (index2 = 0; index2 < SIZETABLEB64; ++index2)
    {
      if (inBlock[index1] == translationTableB64[index2])
      {
        indexTable[index1] = index2;
        (*decCount)++;
        break;
      }
    }
    if (index2 >= SIZETABLEB64)
    {
      fprintf(stderr, ERROR_B64_CHAR_NOT_FOUND_MSG);
      return outERROR;
    }
  }

  /* bitPattern generation using indexTable */
  for (index1 = 0; index1 < B64_CHARS_PER_BLOCK; index1++)
  {
    accumBit += 2;
    charHolder = (unsigned int)indexTable[index1];
    charHolder <<= (B64_CHARS_PER_BLOCK - 1 - index1) * sizeof(unsigned char) *
                   BITS_PER_BYTE;
    charHolder <<= accumBit;
    bitPattern = (bitPattern | charHolder);
  }

  index1 = 0;
  do
  {
    /* Extract the decoded character from bitPattern */
    charHolder = (bitPattern & bitMask);

    /* Shift right the decoded character to the correct position. */
    charHolder >>= (B64_CHARS_PER_BLOCK - 1 - index1) * sizeof(unsigned char) *
                   BITS_PER_BYTE;

    /* Store in outBlock */
    outBlock[index1] = (unsigned char)charHolder;

    /* Shift right 0,8,16...bits the bitMask */
    bitMask >>= sizeof(unsigned char) * BITS_PER_BYTE;
    index1++;
  } while (index1 < OUTPUT_BLOCK_SIZE);

  return outOK;
}

outputCode decode(params_t *params)
{
  unsigned char readChar;
  unsigned char inBlock[B64_CHARS_PER_BLOCK] = {};
  unsigned char outBlock[OUTPUT_BLOCK_SIZE] = {};
  unsigned char index1, index2 = 0;
  unsigned char decodedCharsCount = 0;

  while (1)
  {
    decodedCharsCount = 0;

    /* Load input buffer */
    for (index1 = 0; index1 < B64_CHARS_PER_BLOCK; ++index1)
    {
      readChar = getc(params->inputStream);
      if (ferror(params->inputStream))
      {
        fprintf(stderr, ERROR_INPUT_STREAM_READING_MSG);
        return outERROR;
      }

      /* Discard detected whitespaces. */
      if (readChar == '\n' || readChar == '\t' || readChar == ' ')
      {
        index1--;
        continue;
      }
      else
      {
        inBlock[index1] = readChar;
      }

      /* EOF */
      if (feof(params->inputStream))
      {
        /* If there are still chars in the buffer, we flush it. */
        if (index1 != 0)
        {
          if (base64ToBase256(outBlock, inBlock, &decodedCharsCount) ==
              outERROR)
          {
            return outERROR;
          }

          for (index2 = 0; index2 < decodedCharsCount - 1; ++index2)
          {
            fputc(outBlock[index2], params->outputStream);
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

    /* Translate inBlock into base256 */
    if (base64ToBase256(outBlock, inBlock, &decodedCharsCount) == outERROR)
    {
      return outERROR;
    }

    for (index2 = 0; index2 < decodedCharsCount - 1; ++index2)
    {
      fputc(outBlock[index2], params->outputStream);
    }

    if (ferror(params->outputStream))
    {
      fprintf(stderr, ERROR_OUTPUT_STREAM_WRITING_MSG);
      return outERROR;
    }
  }

  return outERROR;
}
