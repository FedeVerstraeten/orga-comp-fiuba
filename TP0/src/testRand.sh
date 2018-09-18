#!/bin/bash

# ------------------------------------------------------------
# @Title:   FIUBA - 66.20 Organización de Computadoras.
# @Project: TP0 - Infraestructura básica.
# ------------------------------------------------------------
# @Filename: testRand.sh
# ------------------------------------------------------------
# @Authors:
#    Husain, Ignacio Santiago.
#          santiago.husain at gmail dot com
#    Pesado, Lucía.
#          xxx at xxx dot xxx
#    Verstraeten, Federico.
#          federico.verstraeten at gmail dot com
#
# @Date:               18-Sep-2018 1:40:09 pm
# @Last modified by:   Ignacio Santiago Husain
# @Last modified time: 18-Sep-2018 2:36:32 pm
#
# @Copyright (C):
#    This file is part of 'TP0 - Infraestructura básica.'.
#    Unauthorized copying or use of this file via any medium
#    is strictly prohibited.
# ------------------------------------------------------------
#
# PUT DESCRIPTION HERE.
#
# ------------------------------------------------------------

PROGRAM_NAME='./tp0'

TESTS_DIR="../tests";

# Colors to be used.
RED="\e[31m"
GREEN="\e[32m"
DEFAULT="\e[0m"

function error_msg() {
  echo -e "  $RED$1$DEFAULT"
}

function IO_validation_passed(){
	echo -e "$GREEN\0PASSED: $DEFAULT $1"
}
function IO_validation_failed(){
	echo -e "$RED\0FAILED $DEFAULT $1"
}

# --------------------------------------------------------------------------
n=200;

head -c $n </dev/urandom >$TESTS_DIR/in.bin;
# yes | head -c $n >$TESTS_DIR/in.bin;
$PROGRAM_NAME -a encode -i $TESTS_DIR/in.bin -o $TESTS_DIR/out.b64;
$PROGRAM_NAME -a decode -i $TESTS_DIR/out.b64 -o $TESTS_DIR/out.bin;

diff_result="$(diff $TESTS_DIR/in.bin $TESTS_DIR/out.bin)";

if [[ -z ${diff_result} ]]; then :;
	IO_validation_passed "n = $n";
else
	IO_validation_failed "n = $n";
  error_msg "in.bin";
  cat $TESTS_DIR/in.bin | od -A x -t x1z -v;
  error_msg "out.b64";
  cat $TESTS_DIR/out.b64 | od -A x -t x1z -v;
  error_msg "out.bin";
  cat $TESTS_DIR/out.bin | od -A x -t x1z -v;
fi
