/* -----------------------------------------------------------
 @Title:   FIUBA - 66.20 Organización de Computadoras.
 @Project: TP1 - Conjunto de instrucciones MIPS.
--------------------------------------------------------------
 @Filename: b64To256.c
--------------------------------------------------------------
 @Authors:
    Husain, Ignacio Santiago.
          santiago.husain at gmail dot com
    Pesado, Lucía.
          xxx at xxx dot xxx
    Verstraeten, Federico.
          federico.verstraeten at gmail dot com

 @Date:               15-Oct-2007 12:51:56 am
 @Last modified by:   santiago
 @Last modified time: 16-Oct-2018 3:20:03 am

 @Copyright(C):
     This file is part of
     'TP1 - Conjunto de instrucciones MIPS'. Unauthorized
     copying or use of this file via any medium is
     strictly prohibited.
--------------------------------------------------------------

PUT DESCRIPTION HERE.

----------------------------------------------------------- */
#include "base64.h"

int b64To256(unsigned char *outBlock, unsigned char *inBlock,
             unsigned char *decCount) {
  unsigned int bitMask = DECODER_MASK;
  unsigned char index1 = 0, index2 = 0;
  unsigned char indexTable[B64_CHARS_PER_BLOCK] = {0, 0, 0, 0};
  unsigned int charHolder = 0;
  /* Variable to hold the output block of 4 bytes. */
  unsigned int bitPattern = 0;
  unsigned char accumBit = 0;

  /* Search char index in translationTableB64 */
  for (index1 = 0; index1 < B64_CHARS_PER_BLOCK; index1++) {
    if (inBlock[index1] == PADDING) {
      indexTable[index1] = PADD_INDEX;
      continue;
    }

    for (index2 = 0; index2 < SIZETABLEB64; ++index2) {
      if (inBlock[index1] == translationTableB64[index2]) {
        indexTable[index1] = index2;
        (*decCount)++;
        break;
      }
    }
    if (index2 >= SIZETABLEB64) {
      return ERROR_NUMBER_B64_CHAR_NOT_FOUND_MSG;
    }
  }

  /* bitPattern generation using indexTable */
  for (index1 = 0; index1 < B64_CHARS_PER_BLOCK; index1++) {
    accumBit += 2;
    charHolder = (unsigned int)indexTable[index1];
    charHolder <<= (B64_CHARS_PER_BLOCK - 1 - index1) * sizeof(unsigned char) *
                   BITS_PER_BYTE;
    charHolder <<= accumBit;
    bitPattern = (bitPattern | charHolder);
  }

  index1 = 0;
  do {
    /* Extract the decoded character from bitPattern */
    charHolder = (bitPattern & bitMask);

    /* Shift right the decoded character to the correct
     * position. */
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
