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
 @Last modified by:   santiago
 @Last modified time: 15-Oct-2018 11:36:52 pm

 @Copyright(C):
     This file is part of
     'TP1 - Conjunto de instrucciones MIPS'. Unauthorized
     copying or use of this file via any medium is
     strictly prohibited.
--------------------------------------------------------------

Program entry point.

----------------------------------------------------------- */
#include "base64.h"
#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#ifndef STD_STREAM_TOKEN
#define STD_STREAM_TOKEN "-"
#endif

/* Actions definitions */
#ifndef ENCODE_STR_TOKEN
#define ENCODE_STR_TOKEN "encode"
#endif
#ifndef DECODE_STR_TOKEN
#define DECODE_STR_TOKEN "decode"
#endif

#ifndef VERSION
#define VERSION "1.0.0"
#endif

typedef struct params_t {
  char *action;
  FILE *inputStream;
  FILE *outputStream;
} params_t;

typedef enum outputCodes_ { outOK, outERROR } outputCode;

/* The options are distinguished by the ASCII code of the
 * 'char' variables. */
struct option cmdOptions[] = {{"version", no_argument, NULL, 'V'},
                              {"help", no_argument, NULL, 'h'},
                              {"input", required_argument, NULL, 'i'},
                              {"output", required_argument, NULL, 'o'},
                              {"action", required_argument, NULL, 'a'},
                              {0, 0, 0, 0}};

void optVersion(void) {
  fprintf(stderr, "%s\n", VERSION);

  exit(EXIT_SUCCESS);
}

void optHelp(char *arg) {
  if (arg == NULL) {
    fprintf(stderr, ERROR_ACTION_INVALID_ARGUMENT);
    exit(EXIT_FAILURE);
  }
  fprintf(stderr, "Usage:\n");
  fprintf(stderr, "  %s -h\n", arg);
  fprintf(stderr, "  %s -V\n", arg);
  fprintf(stderr, "  %s [options]\n", arg);
  fprintf(stderr, "Options:\n");
  fprintf(stderr, "-V, --version\tPrint version and quit.\n");
  fprintf(stderr, "-h, --help\tPrint this information.\n");
  fprintf(stderr, "-i, --input\tLocation of the input file.\n");
  fprintf(stderr, "-o, --output\tLocation of the output file.\n");
  fprintf(stderr,
          "-a, --action\tProgram action: encode (default) or decode.\n");
  fprintf(stderr, "Examples:\n");
  fprintf(stderr, "  %s -a encode -i ~/input -o ~/output\n", arg);
  fprintf(stderr, "  %s -a decode\n", arg);

  exit(EXIT_SUCCESS);
}

outputCode validateStreamName(char *streamName) {
  if (streamName == NULL) {
    return outERROR;
  }

  if (!strcmp(streamName, ".") || !strcmp(streamName, "..") ||
      !strcmp(streamName, "/") || !strcmp(streamName, "//")) {
    return outERROR;
  }

  return outOK;
}

outputCode optInput(char *arg, params_t *params) {
  if (validateStreamName(arg) == outERROR) {
    fprintf(stderr, ERROR_INVALID_INPUT_STREAM);
    return outERROR;
  }

  if (strcmp(arg, STD_STREAM_TOKEN) == 0) {
    params->inputStream = stdin;
  } else {
    params->inputStream = fopen(arg, "rb");
  }

  if ((params->inputStream) == NULL) {
    fprintf(stderr, ERROR_OPENING_INPUT_STREAM);
    return outERROR;
  }

  return outOK;
}

outputCode optOutput(char *arg, params_t *params) {
  if (validateStreamName(arg) == outERROR) {
    fprintf(stderr, ERROR_INVALID_OUTPUT_STREAM);
    return outERROR;
  }

  if (strcmp(arg, STD_STREAM_TOKEN) == 0) {
    params->outputStream = stdout;
  } else {
    params->outputStream = fopen(arg, "wb");
  }

  if ((params->outputStream) == NULL) {
    fprintf(stderr, ERROR_OPENING_OUTPUT_STREAM);
    return outERROR;
  }

  return outOK;
}

outputCode optAction(char *arg, params_t *params) {
  if (arg == NULL) {
    fprintf(stderr, ERROR_ACTION_INVALID_ARGUMENT);
    return outERROR;
  }

  if (strcmp(arg, ENCODE_STR_TOKEN) == 0) {
    params->action = ENCODE_STR_TOKEN;
  } else if (strcmp(arg, DECODE_STR_TOKEN) == 0) {
    params->action = DECODE_STR_TOKEN;
  } else {
    fprintf(stderr, ERROR_ACTION_INVALID_ARGUMENT);
    return outERROR;
  }

  return outOK;
}

outputCode parseCmdline(int argc, char **argv, params_t *params) {
  int indexptr = 0;
  int optCode;

  outputCode optOutCode = outERROR;
  char *programName = argv[0];

  /* Set the default values. */
  params->action = ENCODE_STR_TOKEN;
  params->inputStream = stdin;
  params->outputStream = stdout;

  /* 'version' and 'help' have no arguments. The rest, do
   * have, and are mandatory.*/
  char *shortOpts = "Vhi:o:a:";

  while ((optCode = getopt_long(argc, argv, shortOpts, cmdOptions,
                                &indexptr)) != -1) {
    switch (optCode) {
    case 'V':
      optVersion();
      break;
    case 'h':
      optHelp(programName);
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
  params_t params;

  /* We parse the command line and check for errors. */
  outputCode cmdParsingState = parseCmdline(argc, argv, &params);
  if (cmdParsingState == outERROR) {
    exit(EXIT_FAILURE);
  }

  int codecState;
  int infd = fileno(params.inputStream);
  int outfd = fileno(params.outputStream);

  if (strcmp(params.action, ENCODE_STR_TOKEN) == 0) {
    codecState = base64_encode(infd, outfd);
  } else {
    codecState = base64_decode(infd, outfd);
  }
  if (codecState != 0) {
    fprintf(stderr, "%s", errmsg[codecState]);
    exit(EXIT_FAILURE);
  }

  /* Close and free what is left. */
  fclose(params.inputStream);
  fclose(params.outputStream);

  return EXIT_SUCCESS;
}
