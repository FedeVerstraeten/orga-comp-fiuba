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
 @Last modified time: 11-Sep-2018 4:25:39 pm

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

/* Program messages definitions. */
#ifndef ERROR_INVALID_INPUT_STREAM
#define ERROR_INVALID_INPUT_STREAM "ERROR: Invalid input stream.\n"
#endif
#ifndef ERROR_OPENING_INPUT_STREAM
#define ERROR_OPENING_INPUT_STREAM "ERROR: Can't open input stream.\n"
#endif
#ifndef ERROR_INVALID_OUTPUT_STREAM
#define ERROR_INVALID_OUTPUT_STREAM "ERROR: Invalid output stream.\n"
#endif
#ifndef ERROR_OPENING_OUTPUT_STREAM
#define ERROR_OPENING_OUTPUT_STREAM "ERROR: Can't open output stream.\n"
#endif
#ifndef ERROR_ACTION_INVALID_ARGUMENT
#define ERROR_ACTION_INVALID_ARGUMENT "ERROR: Invalid action argument.\n"
#endif
#ifndef ERROR_OUTPUT_STREAM_WRITING_MSG
#define ERROR_OUTPUT_STREAM_WRITING_MSG "Output error when writing stream.\n"
#endif
#ifndef ERROR_INPUT_STREAM_READING_MSG
#define ERROR_INPUT_STREAM_READING_MSG "Input error when reading stream.\n"
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
outputCode encode(params_t *params);
/* TODO: SOLO PARA PRUEBAS. BORRARLA. */
outputCode encodeIdentity(params_t *params);
outputCode decode(params_t *params);
/* TODO: SOLO PARA PRUEBAS. BORRARLA. */
outputCode decodeIdentity(params_t *params);
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
    fprintf(stderr, ERROR_ACTION_INVALID_ARGUMENT);
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

#ifndef STD_STREAM_TOKEN
#define STD_STREAM_TOKEN "-"
#endif

outputCode validateStreamName(char *streamName)
{
  if (streamName == NULL)
  {
    return outERROR;
  }
  /* TODO: we could refactor this in a more elegant way. */
  if (!strcmp(streamName, ".") || !strcmp(streamName, "..") ||
      !strcmp(streamName, "/") || !strcmp(streamName, "//"))
  {
    return outERROR;
  }

  return outOK;
}

outputCode optInput(char *arg, params_t *params)
{
  if (validateStreamName(arg) == outERROR)
  {
    fprintf(stderr, ERROR_INVALID_INPUT_STREAM);
    return outERROR;
  }

  if (strcmp(arg, STD_STREAM_TOKEN) == 0)
  {
    params->inputStream = stdin;
  }
  else
  {
    params->inputStream = fopen(arg, "rb");
  }

  if ((params->inputStream) == NULL)
  {
    fprintf(stderr, ERROR_OPENING_INPUT_STREAM);
    return outERROR;
  }

  return outOK;
}

outputCode optOutput(char *arg, params_t *params)
{
  if (validateStreamName(arg) == outERROR)
  {
    fprintf(stderr, ERROR_INVALID_OUTPUT_STREAM);
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
    fprintf(stderr, ERROR_OPENING_OUTPUT_STREAM);
    return outERROR;
  }

  return outOK;
}

/* Actions definitions */
#ifndef ENCODE_STR_TOKEN
#define ENCODE_STR_TOKEN "encode"
#endif
#ifndef DECODE_STR_TOKEN
#define DECODE_STR_TOKEN "decode"
#endif

outputCode optAction(char *arg, params_t *params)
{
  if (arg == NULL)
  {
    fprintf(stderr, ERROR_ACTION_INVALID_ARGUMENT);
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
    fprintf(stderr, ERROR_ACTION_INVALID_ARGUMENT);
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
  params->action = ENCODE_STR_TOKEN;
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

//////////////////// ENCODER //////////////////////////

//#define MASK_6bits 0x0000003F
#define PADDING '='

static const char translationTableB64[] =
    "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

void base256ToBase64(unsigned char *inChars, unsigned char *outChars)
{
  int allInChars = 0;
  int auxWord = 0;
  int MASK_6bits = 0x0000003F;

  size_t i = 0;
  for (i = 0; i < 3; i++)
  {
    allInChars = ((auxWord | ((int)(*inChars + i)))
                  << (2 - i) * 8 * sizeof(unsigned char)) |
                 allInChars;
  }
  int tableIndex = 0;
  for (i = 0; i < 4; i++)
  {
    tableIndex = (allInChars & (MASK_6bits << (6 * i))) >> (6 * i);
    strncpy(outChars + i, &translationTableB64[tableIndex], 1);
  }
  // static unsigned char prevTailByte = BYTE_ZEROS;
  // unsigned char headByte = BYTE_ZEROS;
  // unsigned char tableIndex = BYTE_ZEROS;
  //
  // /*Padding: The last encoded block contain less 6bit*/
  // if ((inChar == EOF))
  // {
  //   headByte = (prevByte | BYTE_ZEROS);
  //   strncpy(outChar, &translationTableB64[headByte], 1);
  //
  //   if (shiftRightBit == 6)
  //   {
  //     strncat(outChar, PADDING, 1);
  //     return;
  //   }
  //   else if (shiftRightBit == 4)
  //   {
  //     strncat(outChar, PADDING, 1);
  //     strncat(outChar, PADDING, 1);
  //     return;
  //   }
  // }
  //
  // /* Get the 6 MSBs of the input char and shift to get the table index. */
  // headByte = (inChar & HEAD_MASK) >> 2;
  // /* Merge the prevTailByte of the previous input char with the headByte of
  // the
  //  * current char and then get the coding table index. */
  // tableIndex = ((prevTailByte | headByte) & HEAD_MASK) >> 2;
  // /* Save the corresponding char in the translation table as the output
  // encoded
  //  * char. */
  // strncpy(outChar, &translationTableB64[tableIndex], 1);
  // /* Save the tail of the input char for the next iteration (the last 2 MSB).
  // */
  // prevTailByte = inChar << 6;
}
outputCode flushConversionBuffer(unsigned char *buffer, params_t *params);
outputCode encode(params_t *params)
{
  unsigned char inChars[3];
  unsigned char outChars[4];
  memset(inChars, 0, sizeof(inChars));
  memset(outChars, 0, sizeof(outChars));

  int readChars = 0;

  while (1)
  {
    inChars[readChars] = (unsigned char)fgetc(params->inputStream);

    if (ferror(params->inputStream))
    {
      fprintf(stderr, ERROR_INPUT_STREAM_READING_MSG);
      return outERROR;
    }

    if (inChars[readChars] == EOF)
    {
      inChars[readChars] = PADDING;
      base256ToBase64(inChars, outChars);
      if (flushConversionBuffer(outChars, params) == outERROR)
      {
        return outERROR;
      }
      return outOK;
    }
    else
    {
      if (readChars == 2)
      {
        base256ToBase64(inChars, outChars);
        if (flushConversionBuffer(outChars, params) == outERROR)
        {
          return outERROR;
        }
        readChars = 0;
        memset(inChars, 0, sizeof(inChars));
        memset(outChars, 0, sizeof(outChars));
      }
    }
    readChars++;
  }
  /* If for any reason we reach this point, then there must be a not
   * contemplated error. */
  return outERROR;
}

outputCode flushConversionBuffer(unsigned char *buffer, params_t *params)
{
  int k = 0;
  for (k = 0; k < 4; k++)
  {
    putc(buffer[k], params->outputStream);
    if (ferror(params->outputStream))
    {
      fprintf(stderr, ERROR_OUTPUT_STREAM_WRITING_MSG);
      return outERROR;
    }
  }

  return outOK;
}
//////////////////// DECODER //////////////////////////

outputCode decode(params_t *params)
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
      fprintf(stderr, ERROR_OUTPUT_STREAM_WRITING_MSG);
      return outERROR;
    }
  }

  if (ferror(params->inputStream))
  {
    fprintf(stderr, ERROR_INPUT_STREAM_READING_MSG);
    return outERROR;
  }

  return outOK;
}

//////////////////// MAIN //////////////////////////

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
    transformationState = decode(&params);  // decodeIdentity decode
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

/* TODO: SOLO PARA PRUEBAS. BORRARLA. */
outputCode encodeIdentity(params_t *params)
{
  int inChar, outChar;

  while ((inChar = getc(params->inputStream)) != EOF)
  {
    outChar = inChar;
    putc(outChar, params->outputStream);
    if (ferror(params->outputStream))
    {
      fprintf(stderr, ERROR_OUTPUT_STREAM_WRITING_MSG);
      return outERROR;
    }
  }

  if (ferror(params->inputStream))
  {
    fprintf(stderr, ERROR_INPUT_STREAM_READING_MSG);
    return outERROR;
  }

  return outOK;
}

/* TODO: SOLO PARA PRUEBAS. BORRARLA. */
outputCode decodeIdentity(params_t *params)
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
      fprintf(stderr, ERROR_OUTPUT_STREAM_WRITING_MSG);
      return outERROR;
    }
  }

  if (ferror(params->inputStream))
  {
    fprintf(stderr, ERROR_INPUT_STREAM_READING_MSG);
    return outERROR;
  }

  return outOK;
}
