/* -----------------------------------------------------------
 @Title:   FIUBA - 66.20 Organización de Computadoras.
 @Project: TP0 - Infraestructura básica.
--------------------------------------------------------------
 @Filename: base256ToBase64.c
--------------------------------------------------------------
 @Authors:
    Husain, Ignacio Santiago.
          santiago.husain at gmail dot com
    Pesado, Lucía.
          xxx at xxx dot xxx
    Verstraeten, Federico.
          federico.verstraeten at gmail dot com
 @Date:               15-Oct-2007 12:24:22 am
 @Last modified by:   santiago
 @Last modified time: 16-Oct-2018 3:37:27 am
 @Copyright(C):
    This file is part of 'TP0 - Infraestructura básica.'.
    Unauthorized copying or use of this file via any medium
    is strictly prohibited.
--------------------------------------------------------------
PUT DESCRIPTION HERE.
----------------------------------------------------------- */
#include "base256ToBase64.h"

void addPadding(char *outBlock, const char pad, int numberPad) {
  int i = 0;
  while (outBlock[i] != '\0')
    i++;
  while (numberPad > 0) {
    outBlock[i] = pad;
    numberPad--;
    i++;
  }
  outBlock[i + 1] = '\0';
}

unsigned char b256To64(char *outBlock, unsigned char inChar, char inputEnded) {
  unsigned char headByte = 0, prevByte = 0;
  static unsigned char tailByte = 0;
  static unsigned char bitMask = ENCODER_MASK;
  static unsigned int shiftRightBit = 2;
  unsigned char encodedCharsCount = 0;
  int i = 0;

  /* Clear outBlock. */
  for (i = 0; i < ENCODER_OUTPUT_CHARS; ++i)
    outBlock[i] = 0;

  /* Backup the previous tailByte. */
  prevByte = tailByte;

  /* Padding: The last encoded block contains less than 6 bits,
   * and we flush the encoding buffer. */
  if (inputEnded == 1) {
    if (shiftRightBit == 6) {
      headByte = (prevByte | 0);
      outBlock[0] = translationTableB64[headByte];
      addPadding(outBlock, PADDING, 1);
      return (encodedCharsCount + 2);
    } else if (shiftRightBit == 4) {
      headByte = (prevByte | 0);
      outBlock[0] = translationTableB64[headByte];
      addPadding(outBlock, PADDING, 2);
      return (encodedCharsCount + 3);
    } else
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
  outBlock[0] = translationTableB64[headByte];
  encodedCharsCount++;

  shiftRightBit += 2;

  /* Shift left 2 bits the mask. */
  if (!(bitMask <<= 2)) {
    /* Restart mask at the beginning. */
    bitMask = ENCODER_MASK;
    shiftRightBit = 2;

    /* Print tailByte and clear. */
    outBlock[1] = translationTableB64[tailByte];
    encodedCharsCount++;

    tailByte = 0;
  }

  return encodedCharsCount;
}
