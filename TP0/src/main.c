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
 @Last modified time: 09-Sep-2018 1:05:29 am

 @Copyright(C):
    This file is part of 'TP0 - Infraestructura básica.'.
    Unauthorized copying or use of this file via any medium
    is strictly prohibited.
--------------------------------------------------------------

Check memory leaks with the following command:
valgrind --tool=memcheck --leak-check=full \
--show-leak-kinds=all -v ./tp0

----------------------------------------------------------- */
#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#ifndef VERSION
#define VERSION "1.0.0"
#endif

/* Data structures and miscellaneous definitions. */
/* The options are distinguished by the ASCII code of the
 * 'char' variables. */
struct option cmdOptions[] = {{"version", no_argument, NULL, 'V'},
                              {"help", no_argument, NULL, 'h'},
                              {"input", required_argument, NULL, 'i'},
                              {"output", required_argument, NULL, 'o'},
                              {"action", required_argument, NULL, 'a'},
                              {0, 0, 0, 0}};

typedef struct {
  /* TODO: or an 'unsigned char' or an 'unsigned int'? */
  char *bufferArray;
  int bufferIndex;
  int bufferSize;
  int fileDescriptor;
} buffer_t;

typedef struct params_t {
  char *action;
  FILE *inputStream;
  FILE *outputStream;
  buffer_t *inputBuffer;
  buffer_t *outputBuffer;
} params_t;

/* Functions declarations. */
typedef enum outputCodes_ { outOK, outERROR } outputCode;

/* Functions definitions. */
outputCode optVersion(void) {
  fprintf(stderr, "%s\n", VERSION);

  return outOK;
}

outputCode optHelp(char *arg) {
  if (arg == NULL) {
    fprintf(stderr, "ERROR: Invalid argument.\n");
    return outERROR;
  }
  fprintf(stderr, "Usage:\n");
  fprintf(stderr, "  %s -h\n", arg);
  fprintf(stderr, "  %s -V\n", arg);
  fprintf(stderr, "  %s [options]\n", arg);
  fprintf(stderr, "Options:\n");
  fprintf(stderr, "-V, --version\tPrint version and quit.\n");
  fprintf(stderr, "-i, --input\tLocation of the input file.\n");
  fprintf(stderr, "-o, --output\tLocation of the output file.\n");
  fprintf(stderr,
          "-a, --action\tProgram action: encode (default) or decode.\n");
  fprintf(stderr, "Examples:\n");
  fprintf(stderr, "  %s -a encode -i ~/input -o ~/output\n", arg);
  fprintf(stderr, "  %s -a decode\n", arg);

  return outOK;
}

#define STD_STREAM_TOKEN "-"
outputCode optInput(char *arg, params_t *params) {
  if (arg == NULL) {
    fprintf(stderr, "ERROR: Invalid input stream.\n");
    return outERROR;
  }

  if (strcmp(arg, STD_STREAM_TOKEN) == 0) {
    params->inputStream = stdin;
  } else {
    /* TODO: 'r' or 'rb'? */
    params->inputStream = fopen(arg, "rb");
  }

  if ((params->inputStream) == NULL) {
    fprintf(stderr, "ERROR: Can't open input stream.\n");
    return outERROR;
  }

  return outOK;
}

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

#define ENCODE_STR_TOKEN "encode"
#define DECODE_STR_TOKEN "decode"

outputCode optAction(char *arg, params_t *params) {
  if (arg == NULL) {
    fprintf(stderr, "ERROR: Invalid argument.\n");
    return outERROR;
  }

  if (strcmp(arg, ENCODE_STR_TOKEN) == 0) {
    params->action = ENCODE_STR_TOKEN;
  } else if (strcmp(arg, DECODE_STR_TOKEN) == 0) {
    params->action = DECODE_STR_TOKEN;
  } else {
    fprintf(stderr, "ERROR: Invalid argument.\n");
    return outERROR;
  }

  return outOK;
}

#define N_BUFFER_SIZE 3 * 1000

outputCode parseCmdline(int argc, char **argv, params_t *params) {
  int indexptr = 0;
  int optCode;

  outputCode optOutCode = outERROR;
  char *programName = argv[0];

  /* Set the default values. */
  params->action = "encode";
  params->inputStream = stdin;
  params->outputStream = stdout;
  params->outputBuffer->bufferIndex = 0;
  params->outputBuffer->bufferSize = N_BUFFER_SIZE;
  /* TODO: or an 'unsigned char' or an 'unsigned int'? */
  params->outputBuffer->bufferArray =
      (char *)calloc(params->outputBuffer->bufferSize, sizeof(char));
  params->outputBuffer->fileDescriptor = fileno(params->outputStream);

  params->inputBuffer->bufferIndex = 0;
  params->inputBuffer->bufferSize = N_BUFFER_SIZE;
  /* TODO: or an 'unsigned char' or an 'unsigned int'? */
  params->inputBuffer->bufferArray =
      (char *)calloc(params->inputBuffer->bufferSize, sizeof(char));
  params->inputBuffer->fileDescriptor = fileno(params->outputStream);

  /* 'version' and 'help' have no arguments. The rest, do
   * have, and are mandatory.*/
  char *shortOpts = "Vhi:o:a:";

  while ((optCode = getopt_long(argc, argv, shortOpts, cmdOptions,
                                &indexptr)) != -1) {
    switch (optCode) {
      case 'V':
        optOutCode = optVersion();
        break;
      case 'h':
        optOutCode = optHelp(programName);
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

outputCode applyTransformation(params_t *params) {
  /* TODO: code this function. Assume that 'params' are
   * already well initialized. */
  return outOK;
}

void outputChar(params_t *params, int c) {
  buffer_t *outputBuffer = params->outputBuffer;
  outputBuffer->bufferArray[outputBuffer->bufferIndex] = (unsigned)c;
  outputBuffer->bufferIndex++;

  size_t bytesToWrite = outputBuffer->bufferIndex;

  if (outputBuffer->bufferIndex == outputBuffer->bufferSize) {
    size_t bytesWriten = 0;

    char *auxIndex = outputBuffer->bufferArray;

    while (bytesWriten < bytesToWrite) {
      bytesToWrite = bytesToWrite - bytesWriten;
      auxIndex = auxIndex + bytesWriten;
      bytesWriten = write(outputBuffer->fileDescriptor, auxIndex, bytesToWrite);
    }

    outputBuffer->bufferIndex = 0;
  }
}

/* TODO: do the same for the input buffer?. */
void flushOutputBuffer(params_t *params) {
  /*
  if (fflush(parms->fp) != 0) {
          fprintf(stderr, "cannot flush output file.\n");
          exit(1);
  }
  */
  buffer_t *outputBuffer = params->outputBuffer;
  size_t bytesToWrite = outputBuffer->bufferIndex;
  size_t bytesWriten = 0;

  char *auxIndex = outputBuffer->bufferArray;

  while (bytesWriten < bytesToWrite) {
    bytesToWrite = bytesToWrite - bytesWriten;
    auxIndex = auxIndex + bytesWriten;
    bytesWriten = write(outputBuffer->fileDescriptor, auxIndex, bytesToWrite);
  }

  outputBuffer->bufferIndex = 0;
}

int main(int argc, char **argv) {
  params_t params;
  buffer_t inputBufferInfo;
  buffer_t outputBufferInfo;

  /* Initialize memory block with zeroes.*/
  memset(&params, 0, sizeof(params_t));
  params.inputBuffer = memset(&inputBufferInfo, 0, sizeof(buffer_t));
  params.outputBuffer = memset(&outputBufferInfo, 0, sizeof(buffer_t));

  /* We parse the command line and check for errors. */
  outputCode cmdParsingState = parseCmdline(argc, argv, &params);
  if (cmdParsingState == outERROR) {
    fprintf(stderr, "ERROR: Program exited with errors.\n");
    exit(EXIT_FAILURE);
  }

  outputCode transformationState = applyTransformation(&params);
  if (transformationState == outERROR) {
    fprintf(stderr, "ERROR: Transformation exited with errors.\n");
    exit(EXIT_FAILURE);
  }

  /* Close and free what is left. */
  flushOutputBuffer(&params);
  fclose(params.inputStream);
  fclose(params.outputStream);
  free(params.inputBuffer->bufferArray);
  free(params.outputBuffer->bufferArray);

  return EXIT_SUCCESS;
}
