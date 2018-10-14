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
 @Last modified by:   root
 @Last modified time: 14-Oct-2018 1:11:20 am

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

unsigned char base256ToBase64(char *outBlock, unsigned char inChar,
                              char inputEnded) {
  unsigned char headByte = 0, prevByte = 0;
  static unsigned char tailByte = 0;
  static unsigned char bitMask = ENCODER_MASK;
  static unsigned int shiftRightBit = 2;
  unsigned char encodedCharsCount = 0;

  /* Backup the previous tailByte. */
  prevByte = tailByte;

  /* Padding: The last encoded block contains less than 6 bits,
   * and we flush the encoding buffer. */
  if (inputEnded == 1) {
    if (shiftRightBit == 6) {
      headByte = (prevByte | 0);
      strncpy(outBlock, &translationTableB64[headByte], 1);
      /* TODO: Fede, cuando hagas la concatenacion a mano sin
       * strcat(), fijate de usar PADDING y no PADDING_STR, ya
       * que el primero es un char, y el segundo es un char con
       * el \0 al final. */
      strncat(outBlock, PADDING_STR, 1);
      return (encodedCharsCount + 2);
    } else if (shiftRightBit == 4) {
      headByte = (prevByte | 0);
      strncpy(outBlock, &translationTableB64[headByte], 1);
      strncat(outBlock, PADDING_STR, 1);
      strncat(outBlock, PADDING_STR, 1);
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
  strncpy(outBlock, &translationTableB64[headByte], 1);
  encodedCharsCount++;

  shiftRightBit += 2;

  /* Shift left 2 bits the mask. */
  if (!(bitMask <<= 2)) {
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
