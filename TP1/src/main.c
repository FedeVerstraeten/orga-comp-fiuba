/* -----------------------------------------------------------
 @Title:   FIUBA - 66.20 Organizacion de Computadoras.
 @Project: TP1 - Conjunto de instrucciones MIPS.
--------------------------------------------------------------
 @Filename: main.c
--------------------------------------------------------------
 @Authors:
    Husain, Ignacio Santiago.
          santiago.husain at gmail dot com
    Pesado, Lucia.
          luupesado at gmail dot com
    Verstraeten, Federico.
          federico.verstraeten at gmail dot com

 @Date:               07-Sep-2018 3:46:28 pm
 @Last modified by:   Ignacio Santiago Husain
 @Last modified time: 07-Oct-2018 11:05:02 pm

 @Copyright(C):
     This file is part of
     'TP1 - Conjunto de instrucciones MIPS'. Unauthorized
     copying or use of this file via any medium is
     strictly prohibited.
--------------------------------------------------------------

Program entry point.

----------------------------------------------------------- */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "base64.h"
#include "common.h"
#include "parser.h"

int main(int argc, char **argv)
{
  params_t params;

  /* We parse the command line and check for errors. */
  outputCode cmdParsingState = parseCmdline(argc, argv, &params);
  if (cmdParsingState == outERROR)
  {
    exit(EXIT_FAILURE);
  }

  int transformationState;
  if (strcmp(params.action, ENCODE_STR_TOKEN) == 0)
  {
    transformationState = base64_encode(&params);
  }
  else
  {
    transformationState = base64_decode(&params);
  }
  if (transformationState != 0)
  {
    fprintf(stderr, "%s", errmsg[transformationState]);
    exit(EXIT_FAILURE);
  }

  /* Close and free what is left. */
  fclose(params.inputStream);
  fclose(params.outputStream);

  return EXIT_SUCCESS;
}
