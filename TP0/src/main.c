/* -----------------------------------------------------------
 @Title:   FIUBA - 66.20 Organizacion de Computadoras.
 @Project: TP0 - Infraestructura basica.
--------------------------------------------------------------
 @Filename: main.c
--------------------------------------------------------------
 @Authors:
    Husain, Ignacio Santiago.
          santiago.husain at gmail dot com
    Pesado, Lucia.
          xxx at xxx dot xxx
    Verstraeten, Federico.
          federico.verstraeten at gmail dot com

 @Date:               07-Sep-2018 3:46:28 pm
 @Last modified by:   Ignacio Santiago Husain
 @Last modified time: 12-Sep-2018 12:41:28 pm

 @Copyright(C):
    This file is part of 'TP0 - Infraestructura basica.'.
    Unauthorized copying or use of this file via any medium
    is strictly prohibited.
--------------------------------------------------------------

Check memory leaks with the following command:
valgrind --tool=memcheck --leak-check=full \
--show-leak-kinds=all -v ./tp0

----------------------------------------------------------- */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "common.h"
#include "decoder.h"
#include "encoder.h"
#include "parser.h"

int main(int argc, char **argv)
{
  params_t params;

  /* Initialize memory block with zeroes.*/
  memset(&params, 0, sizeof(params_t));

  /* We parse the command line and check for errors. */
  outputCode cmdParsingState = parseCmdline(argc, argv, &params);
  if (cmdParsingState == outERROR)
  {
    exit(EXIT_FAILURE);
  }

  outputCode transformationState;
  if (strcmp(params.action, ENCODE_STR_TOKEN) == 0)
  {
    transformationState = encode(&params);  // encodeIdentity encode
  }
  else
  {
    transformationState = decodeIdentity(&params);  // decodeIdentity decode
  }
  if (transformationState == outERROR)
  {
    exit(EXIT_FAILURE);
  }

  /* Close and free what is left. */
  fclose(params.inputStream);
  fclose(params.outputStream);

  return EXIT_SUCCESS;
}
