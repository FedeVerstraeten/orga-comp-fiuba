/* -----------------------------------------------------------
 @Title:   FIUBA - 66.20 Organización de Computadoras.
 @Project: TP1 - Conjunto de instrucciones MIPS.
--------------------------------------------------------------
 @Filename: addPadding.c
--------------------------------------------------------------
 @Authors:
    Husain, Ignacio Santiago.
          santiago.husain at gmail dot com
    Pesado, Lucía.
          xxx at xxx dot xxx
    Verstraeten, Federico.
          federico.verstraeten at gmail dot com

 @Date:               17-Oct-2007 3:59:08 am
 @Last modified by:   Ignacio Santiago Husain
 @Last modified time: 16-Oct-2018 3:48:52 pm

 @Copyright(C):
     This file is part of
     'TP1 - Conjunto de instrucciones MIPS'. Unauthorized
     copying or use of this file via any medium is
     strictly prohibited.
--------------------------------------------------------------

Function to add padding characters to the output block.

----------------------------------------------------------- */
#include "addPadding.h"

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
