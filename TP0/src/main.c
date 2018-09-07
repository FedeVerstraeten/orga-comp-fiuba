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
 @Last modified time: 07-Sep-2018 4:03:34 pm

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
    {"resolution", required_argument, NULL, 'r'},
    {"center", required_argument, NULL, 'c'},
    {"width", required_argument, NULL, 'w'},
    {"height", required_argument, NULL, 'H'},
    {"seed", required_argument, NULL, 's'},
    {"output", required_argument, NULL, 'o'},
    {0, 0, 0, 0}};

char *shortOpts = "r:c:w:H:s:o:";

#define RESOLUTION_SEPARATOR_TOKEN 'x'
#define STD_STREAM_TOKEN "-"
#define IMAGINARY_UNIT_TOKEN 'i'
#define MAX_GREYSCALE 255
#define CONVERGENCE_UPPER_BOUND_SQUARED 4.0

typedef struct complex_t {
  float real;
  float imag;
} complex_t;

typedef struct fractalParams_t {
  int imageWidth, imageHeight;
  float complexPlaneWidth, complexPlaneHeight;
  complex_t complexPlaneCenter, fractalSeed;
  FILE *outputStream;
  unsigned int pixelQty;
} fractalParams_t;

typedef struct pixel_t {
  unsigned char brightness;
  complex_t complexPos;
} pixel_t;

/* Functions declarations. */
typedef enum outputCodes_ { outOK, outERROR } outputCode;

/* Functions definitions. */
outputCode optResolution(char *arg,
                         fractalParams_t *fractalParams) {
  char resolutionSeparator = 0;
  int varsRead = 0, imageWidth = 0, imageHeight = 0;

  varsRead = sscanf(arg, "%d%c%d", &imageWidth,
                    &resolutionSeparator, &imageHeight);

  if (varsRead != 3 ||
      resolutionSeparator != RESOLUTION_SEPARATOR_TOKEN ||
      imageHeight <= 0 || imageWidth <= 0) {
    fprintf(stderr, "ERROR: Invalid resolution.\n");
    return outERROR;
  }

  fractalParams->imageWidth = imageWidth;
  fractalParams->imageHeight = imageHeight;

  return outOK;
}

outputCode optCenter(char *arg,
                     fractalParams_t *fractalParams) {
  int varsRead = 0;
  char imaginaryUnit = 0;
  float centerRe = 0, centerIm = 0;

  varsRead = sscanf(arg, "%f%f%c", &centerRe, &centerIm,
                    &imaginaryUnit);

  if (varsRead != 3 ||
      imaginaryUnit != IMAGINARY_UNIT_TOKEN) {
    fprintf(stderr, "ERROR: Invalid center coordinates.\n");
    return outERROR;
  }

  (fractalParams->complexPlaneCenter).real = centerRe;
  (fractalParams->complexPlaneCenter).imag = centerIm;

  return outOK;
}

outputCode optWidth(char *arg,
                    fractalParams_t *fractalParams) {
  int varsRead = 0;
  float complexPlaneWidth = 0;

  varsRead = sscanf(arg, "%f", &complexPlaneWidth);

  if (varsRead != 1 || complexPlaneWidth <= 0) {
    fprintf(stderr, "ERROR: Invalid complex plane width.\n");
    return outERROR;
  }

  fractalParams->complexPlaneWidth = complexPlaneWidth;

  return outOK;
}

outputCode optHeight(char *arg,
                     fractalParams_t *fractalParams) {
  int varsRead = 0;
  float complexPlaneHeight = 0;

  varsRead = sscanf(arg, "%f", &complexPlaneHeight);

  if (varsRead != 1 || complexPlaneHeight <= 0) {
    fprintf(stderr, "ERROR: Invalid complex plane height.\n");
    return outERROR;
  }

  fractalParams->complexPlaneHeight = complexPlaneHeight;

  return outOK;
}

outputCode optSeed(char *arg,
                   fractalParams_t *fractalParams) {
  int varsRead = 0;
  char imaginaryUnit = 0;
  float seedRe = 0.0, seedIm = 0.0;

  varsRead =
      sscanf(arg, "%f%f%c", &seedRe, &seedIm, &imaginaryUnit);

  if (varsRead != 3 ||
      imaginaryUnit != IMAGINARY_UNIT_TOKEN) {
    fprintf(stderr, "ERROR: Invalid fractal seed.\n");
    return outERROR;
  }

  (fractalParams->fractalSeed).real = seedRe;
  (fractalParams->fractalSeed).imag = seedIm;

  return outOK;
}

outputCode optOutput(char *arg,
                     fractalParams_t *fractalParams) {
  if (arg == NULL) {
    fprintf(stderr, "ERROR: Invalid output stream.\n");
    return outERROR;
  }

  if (strcmp(arg, STD_STREAM_TOKEN) == 0) {
    fractalParams->outputStream = stdout;
  } else {
    fractalParams->outputStream = fopen(arg, "w");
  }

  if ((fractalParams->outputStream) == NULL) {
    fprintf(stderr, "ERROR: Can't open output stream.\n");
    return outERROR;
  }

  return outOK;
}

outputCode parseCmdline(int argc, char **argv,
                        fractalParams_t *fractalParams) {
  int indexptr = 0;
  int optCode;
  outputCode optOutCode = outERROR;

  while ((optCode = getopt_long(argc, argv, shortOpts,
                                cmdOptions, &indexptr)) !=
         -1) {
    switch (optCode) {
      case 'r':
        optOutCode = optResolution(optarg, fractalParams);
        break;
      case 'c':
        optOutCode = optCenter(optarg, fractalParams);
        break;
      case 'w':
        optOutCode = optWidth(optarg, fractalParams);
        break;
      case 'H':
        optOutCode = optHeight(optarg, fractalParams);
        break;
      case 's':
        optOutCode = optSeed(optarg, fractalParams);
        break;
      case 'o':
        optOutCode = optOutput(optarg, fractalParams);
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

outputCode initializePixels(pixel_t *pPixelArray,
                            fractalParams_t *fractalParams) {
  /* Pixel - Complex number asociation. */
  unsigned int row = 0, col = 0;
  float stepX = 0, stepY = 0;
  int pixelIndex = 0;

  /* Save these variables to avoid multiple calculations
   * inside the loops. */
  int imageHeight_ = fractalParams->imageHeight,
      imageWidth_ = fractalParams->imageWidth;

  stepX = (float)fractalParams->complexPlaneWidth /
          fractalParams->imageWidth;
  stepY = (float)fractalParams->complexPlaneHeight /
          fractalParams->imageHeight;

  for (row = 0; row < imageHeight_; row++) {
    for (col = 0; col < imageWidth_; col++) {
      pixelIndex = row * imageWidth_ + col;
      /* The iteration is row-wise (first set a row and then
       * iterate through the columns). */
      pPixelArray[pixelIndex].complexPos.real =
          -fractalParams->complexPlaneWidth / 2 +
          fractalParams->complexPlaneCenter.real +
          col * stepX;

      pPixelArray[pixelIndex].complexPos.imag =
          fractalParams->complexPlaneHeight / 2 +
          fractalParams->complexPlaneCenter.imag -
          row * stepY;
    }
  }
  return outOK;
}

outputCode calculateEscapeVelocity(
    pixel_t *pPixelArray, fractalParams_t *fractalParams) {
  /* Calculate brightness. */
  unsigned int iteration = 0;
  float currentComplexPixelReal = 0.0,
        currentComplexPixelImag = 0.0;
  unsigned int row = 0, col = 0;
  int pixelIndex = 0;

  /* Save these variables to avoid multiple calculations
   * inside the loops. */
  int imageHeight_ = fractalParams->imageHeight,
      imageWidth_ = fractalParams->imageWidth;

  /* The iteration is row-wise (first set a row and then
   * iterate through the columns). */
  for (row = 0; row < imageHeight_; row++) {
    for (col = 0; col < imageWidth_; col++) {
      pixelIndex = row * imageWidth_ + col;
      for (iteration = 0; iteration < MAX_GREYSCALE;
           iteration++) {
        /* Saving the real and imaginary parts in these
         * variables to avoid multiple accesses to the same
         * data. */

        currentComplexPixelReal =
            pPixelArray[pixelIndex].complexPos.real;
        currentComplexPixelImag =
            pPixelArray[pixelIndex].complexPos.imag;

        /* Check for convergence. */
        if ((currentComplexPixelReal *
                 currentComplexPixelReal +
             currentComplexPixelImag *
                 currentComplexPixelImag) >
            CONVERGENCE_UPPER_BOUND_SQUARED) {
          break;
        } else {
          /* Save data. */
          pPixelArray[pixelIndex].complexPos.real =
              currentComplexPixelReal *
                  currentComplexPixelReal -
              currentComplexPixelImag *
                  currentComplexPixelImag +
              fractalParams->fractalSeed.real;
          pPixelArray[pixelIndex].complexPos.imag =
              2.0 * currentComplexPixelReal *
                  currentComplexPixelImag +
              fractalParams->fractalSeed.imag;
        }
      }
      /* Save brightness. */
      pPixelArray[pixelIndex].brightness = iteration;
    }
  }
  return outOK;
}

outputCode generatePGMImage(pixel_t *pPixelArray,
                            fractalParams_t *fractalParams) {
  int streamWriteStatus = 0;
  int imageHeight_ = fractalParams->imageHeight,
      imageWidth_ = fractalParams->imageWidth;

  /* PGM header. */
  streamWriteStatus =
      fprintf(fractalParams->outputStream, "P2\n%d %d\n%d\n",
              imageWidth_, imageHeight_, MAX_GREYSCALE);
  if (streamWriteStatus < 0) {
    fprintf(stderr, "ERROR: Can't write to output stream.\n");
    return outERROR;
  }

  /* Output pixel's brightnesses. */

  /* Save these variables to avoid multiple calculations
   * inside the loops. */

  unsigned int row = 0, col = 0;

  for (row = 0; row < imageHeight_; row++) {
    for (col = 0; col < imageWidth_; col++) {
      streamWriteStatus = fprintf(
          fractalParams->outputStream, "%d ",
          pPixelArray[row * imageWidth_ + col].brightness);
      if (streamWriteStatus < 0) {
        fprintf(stderr,
                "ERROR: Can't write to output stream.\n");
        return outERROR;
      }
    }
    streamWriteStatus =
        fprintf(fractalParams->outputStream, "\n");
    if (streamWriteStatus < 0) {
      fprintf(stderr,
              "ERROR: Can't write to output stream.\n");
      return outERROR;
    }
  }

  return outOK;
}

int main(int argc, char **argv) {
  /* Set the default values. */
  fractalParams_t fractalParams = {
      640,
      480,
      2,
      2,
      {0.0, 0.0},
      {-0.726895347709114071439, 0.188887129043845954792},
      stdout,
      640 * 480};

  /* We parse the command line and check for errors. */
  outputCode cmdParsingState = outERROR;
  cmdParsingState = parseCmdline(argc, argv, &fractalParams);
  if (cmdParsingState == outERROR) {
    fprintf(stderr, "ERROR: Program exited with errors.\n");
    exit(EXIT_FAILURE);
  }

  /* Intialize each pixel. */
  fractalParams.pixelQty =
      fractalParams.imageWidth * fractalParams.imageHeight;

  pixel_t *pPixelArray = (pixel_t *)calloc(
      fractalParams.pixelQty, sizeof(pixel_t));

  if (pPixelArray == NULL) {
    fprintf(stderr, "ERROR: Can't allocate memory.\n");
    exit(EXIT_FAILURE);
  }

  outputCode initPixelsState = outERROR;
  initPixelsState =
      initializePixels(pPixelArray, &fractalParams);
  if (initPixelsState == outERROR) {
    fprintf(stderr, "ERROR: Can't initialize pixels.\n");
    exit(EXIT_FAILURE);
  }

  /* Calculate escape velocity. */
  outputCode escapeVelCalculationState = outERROR;
  escapeVelCalculationState =
      calculateEscapeVelocity(pPixelArray, &fractalParams);
  if (escapeVelCalculationState == outERROR) {
    fprintf(stderr,
            "ERROR: Can't calculate escape velocity.\n");
    exit(EXIT_FAILURE);
  }

  /* Generate the PGM image. */
  outputCode genPGMImageState = outERROR;
  genPGMImageState =
      generatePGMImage(pPixelArray, &fractalParams);
  if (genPGMImageState == outERROR) {
    fprintf(stderr, "ERROR: Can't generate PGM image.\n");
    exit(EXIT_FAILURE);
  }

  /* Close and free what is left. */
  fclose(fractalParams.outputStream);
  free(pPixelArray);

  return EXIT_SUCCESS;
}
