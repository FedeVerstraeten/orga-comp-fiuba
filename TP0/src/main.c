/* -----------------------------------------------------------
 @Title:   FIUBA - 66.20 Organización de Computadoras.
 @Project: TP0 - Infraestructura básica.
--------------------------------------------------------------
 @Filename: main.c
--------------------------------------------------------------
 @Authors:
    Álvarez, Natalia Nayla.
          xxx at xxx dot xxx
    Husain, Ignacio Santiago.
          santiago.husain at gmail dot com
    Verstraeten, Federico.
          federico.verstraeten at gmail dot com

 @Date:               07-Sep-2018 3:46:28 pm
 @Last modified by:   Ignacio Santiago Husain
 @Last modified time: 08-Sep-2018 11:29:27 am

 @Copyright(C):
    This file is part of 'TP0 - Infraestructura básica.'.
    Unauthorized copying or use of this file via any medium
    is strictly prohibited.
--------------------------------------------------------------

Check memory leaks with the following command:
valgrind --tool=memcheck --leak-check=full \
--show-leak-kinds=all -v ./tp0 --output image1.pgm

----------------------------------------------------------- */
#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Data structures and miscellaneous definitions. */

/* The options are distinguished by the ASCII code of the
 * 'char' variables. */
struct option cmdOptions[] = {
    {"version", required_argument, NULL, 'V'},
    {"help", required_argument, NULL, 'h'},
    {"input", required_argument, NULL, 'i'},
    {"output", required_argument, NULL, 'o'},
    {"action", required_argument, NULL, 'a'},
    {0, 0, 0, 0}};

char *shortOpts = "V:h:i:o:a:";

#define STD_STREAM_TOKEN "-"

typedef struct params_t { FILE *outputStream; } params_t;

/* Functions declarations. */
typedef enum outputCodes_ { outOK, outERROR } outputCode;

/* Functions definitions. */
outputCode optOutput(char *arg, params_t *params) {
  if (arg == NULL) {
    fprintf(stderr, "ERROR: Invalid output stream.\n");
    return outERROR;
  }

  if (strcmp(arg, STD_STREAM_TOKEN) == 0) {
    params->outputStream = stdout;
  } else {
    params->outputStream = fopen(arg, "w");
  }

  if ((params->outputStream) == NULL) {
    fprintf(stderr, "ERROR: Can't open output stream.\n");
    return outERROR;
  }

  return outOK;
}

outputCode parseCmdline(int argc, char **argv,
                        params_t *params) {
  int indexptr = 0;
  int optCode;
  outputCode optOutCode = outERROR;

  while ((optCode = getopt_long(argc, argv, shortOpts,
                                cmdOptions, &indexptr)) !=
         -1) {
    switch (optCode) {
      case 'V':
        optOutCode = optVersion(optarg, params);
        break;
      case 'h':
        optOutCode = optHelp(optarg, params);
        break;
      case 'i':
        optOutCode = optInput(optarg, params);
        break;
      case 'o':
        optOutCode = optOutput(optarg, params);
        break;
      case 'a':
        optOutCode = optAction(optarg, params);
        break;
      case '?':
        /* getopt_long already printed an error message. */
        optOutCode = outERROR;
        break;
    }
    if (optOutCode == outERROR) {
      return outERROR;
    }
  }

  return outOK;
}

int main(int argc, char **argv) {
  /* Set the default values. */
  params_t params = {stdout};

  /* We parse the command line and check for errors. */
  outputCode cmdParsingState = outERROR;
  cmdParsingState = parseCmdline(argc, argv, &params);
  if (cmdParsingState == outERROR) {
    fprintf(stderr, "ERROR: Program exited with errors.\n");
    exit(EXIT_FAILURE);
  }

  /* Close and free what is left. */
  fclose(params.outputStream);

  return EXIT_SUCCESS;
}
