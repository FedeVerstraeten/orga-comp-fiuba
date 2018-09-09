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
 @Last modified by:   pluto
 @Last modified time: 09-Sep-2018 5:20:44 pm

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

typedef struct params_t
{
  char *action;
  FILE *inputStream;
  FILE *outputStream;
} params_t;

typedef enum outputCodes_ { outOK, outERROR } outputCode;

/* Functions declarations. */
outputCode applyTransformation(params_t *params);
outputCode parseCmdline(int argc, char **argv, params_t *params);
outputCode optAction(char *arg, params_t *params);
outputCode optOutput(char *arg, params_t *params);
outputCode optInput(char *arg, params_t *params);
void optHelp(char *arg);
void optVersion(void);

/* Functions definitions. */
void optVersion(void)
{
  fprintf(stderr, "%s\n", VERSION);

  exit(EXIT_SUCCESS);
}

void optHelp(char *arg)
{
  if (arg == NULL)
  {
    fprintf(stderr, "ERROR: Invalid argument.\n");
    exit(EXIT_FAILURE);
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

  exit(EXIT_SUCCESS);
}

#define STD_STREAM_TOKEN "-"
outputCode optInput(char *arg, params_t *params)
{
  if (arg == NULL)
  {
    fprintf(stderr, "ERROR: Invalid input stream.\n");
    return outERROR;
  }

  if (strcmp(arg, STD_STREAM_TOKEN) == 0)
  {
    params->inputStream = stdin;
  }
  else
  {
    /* TODO: 'r' or 'rb'? */
    params->inputStream = fopen(arg, "rb");
  }

  if ((params->inputStream) == NULL)
  {
    fprintf(stderr, "ERROR: Can't open input stream.\n");
    return outERROR;
  }

  return outOK;
}

outputCode optOutput(char *arg, params_t *params)
{
  if (arg == NULL)
  {
    fprintf(stderr, "ERROR: Invalid output stream.\n");
    return outERROR;
  }

  if (strcmp(arg, STD_STREAM_TOKEN) == 0)
  {
    params->outputStream = stdout;
  }
  else
  {
    params->outputStream = fopen(arg, "wb");
  }

  if ((params->outputStream) == NULL)
  {
    fprintf(stderr, "ERROR: Can't open output stream.\n");
    return outERROR;
  }

  return outOK;
}

#define ENCODE_STR_TOKEN "encode"
#define DECODE_STR_TOKEN "decode"

outputCode optAction(char *arg, params_t *params)
{
  if (arg == NULL)
  {
    fprintf(stderr, "ERROR: Invalid argument.\n");
    return outERROR;
  }

  if (strcmp(arg, ENCODE_STR_TOKEN) == 0)
  {
    params->action = ENCODE_STR_TOKEN;
  }
  else if (strcmp(arg, DECODE_STR_TOKEN) == 0)
  {
    params->action = DECODE_STR_TOKEN;
  }
  else
  {
    fprintf(stderr, "ERROR: Invalid argument.\n");
    return outERROR;
  }

  return outOK;
}

outputCode parseCmdline(int argc, char **argv, params_t *params)
{
  int indexptr = 0;
  int optCode;

  outputCode optOutCode = outERROR;
  char *programName = argv[0];

  /* Set the default values. */
  params->action = "encode";
  params->inputStream = stdin;
  params->outputStream = stdout;

  /* 'version' and 'help' have no arguments. The rest, do
   * have, and are mandatory.*/
  char *shortOpts = "Vhi:o:a:";

  while ((optCode =
              getopt_long(argc, argv, shortOpts, cmdOptions, &indexptr)) != -1)
  {
    switch (optCode)
    {
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
    if (optOutCode == outERROR)
    {
      return outERROR;
    }
  }

  return outOK;
}

outputCode applyTransformation(params_t *params)
{
  /* TODO: code this function. Assume that 'params' are
   * already well initialized. */
  int inChar, outChar;

  while ((inChar = getc(params->inputStream)) != EOF)
  {
    outChar = inChar;
    putc(outChar, params->outputStream);
    if (ferror(params->outputStream))
    {
      fprintf(stderr, "Output error when writing.\n");
      exit(EXIT_FAILURE);
    }
  }

  if (ferror(params->inputStream))
  {
    fprintf(stderr, "Input error when reading.\n");
    exit(EXIT_FAILURE);
  }

  return outOK;
}

int main(int argc, char **argv)
{
  params_t params;

  /* Initialize memory block with zeroes.*/
  memset(&params, 0, sizeof(params_t));

  /* We parse the command line and check for errors. */
  outputCode cmdParsingState = parseCmdline(argc, argv, &params);
  if (cmdParsingState == outERROR)
  {
    fprintf(stderr, "ERROR: Program exited with errors.\n");
    exit(EXIT_FAILURE);
  }

  outputCode transformationState = applyTransformation(&params);
  if (transformationState == outERROR)
  {
    fprintf(stderr, "ERROR: Transformation exited with errors.\n");
    exit(EXIT_FAILURE);
  }

  /* Close and free what is left. */
  fclose(params.inputStream);
  fclose(params.outputStream);

  return EXIT_SUCCESS;
}
