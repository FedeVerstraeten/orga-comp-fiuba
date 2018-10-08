/* -----------------------------------------------------------
 @Title:   FIUBA - 66.20 Organizacion de Computadoras.
 @Project: TP1 - Conjunto de instrucciones MIPS.
--------------------------------------------------------------
 @Filename: base64.c
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
 @Last modified time: 07-Oct-2018 11:02:09 pm

 @Copyright(C):
     This file is part of
     'TP1 - Conjunto de instrucciones MIPS'. Unauthorized
     copying or use of this file via any medium is
     strictly prohibited.
--------------------------------------------------------------

Codec implementation.

----------------------------------------------------------- */
#include "base64.h"

/* Error messages indices:
    1 - ERROR_OUTPUT_STREAM_WRITING_MSG
    2 - ERROR_INPUT_STREAM_READING_MSG
    3 - ERROR_B64_CHAR_NOT_FOUND_MSG
*/
const char *errmsg[] = {0, ERROR_OUTPUT_STREAM_WRITING_MSG,
                        ERROR_INPUT_STREAM_READING_MSG,
                        ERROR_B64_CHAR_NOT_FOUND_MSG};

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
/*int base64_encode(int infd, int outfd)*/
int base64_encode(params_t *params)
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
      return 2;
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
        return 1;
      }
      totalEncodedCharsCount = encodedCharsCount;
    }

    /* Print output stream. */
    fputs(outBlock, params->outputStream);
    if (ferror(params->outputStream))
    {
      return 1;
    }
  } while (inChar != EOF);

  return 0;
}

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
      return 3;
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

  return 0;
}

/* int base64_decode(int infd, int outfd) */
int base64_decode(params_t *params)
{
  unsigned char readChar;
  unsigned char inBlock[B64_CHARS_PER_BLOCK] = {};
  unsigned char outBlock[OUTPUT_BLOCK_SIZE] = {};
  unsigned char index1, index2 = 0;
  unsigned char decodedCharsCount = 0;
  int conversionOutput = 4;

  while (1)
  {
    decodedCharsCount = 0;

    /* Load input buffer */
    for (index1 = 0; index1 < B64_CHARS_PER_BLOCK; ++index1)
    {
      readChar = getc(params->inputStream);
      if (ferror(params->inputStream))
      {
        return 2;
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
          conversionOutput =
              base64ToBase256(outBlock, inBlock, &decodedCharsCount);
          if (conversionOutput != 0)
          {
            return conversionOutput;
          }

          for (index2 = 0; index2 < decodedCharsCount - 1; ++index2)
          {
            fputc(outBlock[index2], params->outputStream);
          }
          if (ferror(params->outputStream))
          {
            return 1;
          }
        }
        return 0;
      }
    }

    /* Translate inBlock into base256 */
    conversionOutput = base64ToBase256(outBlock, inBlock, &decodedCharsCount);
    if (conversionOutput != 0)
    {
      return conversionOutput;
    }

    for (index2 = 0; index2 < decodedCharsCount - 1; ++index2)
    {
      fputc(outBlock[index2], params->outputStream);
    }

    if (ferror(params->outputStream))
    {
      return 1;
    }
  }

  return conversionOutput;
}
