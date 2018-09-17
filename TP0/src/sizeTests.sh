#!/bin/bash

# ------------------------------------------------------------
# @Title:   FIUBA - 66.20 Organizacion de Computadoras.
# @Project: TP0 - Infraestructura basica.
# ------------------------------------------------------------
# @Filename: runTests.sh
# ------------------------------------------------------------
# @Authors:
#    Husain, Ignacio Santiago.
#          santiago.husain at gmail dot com
#		 Pesado, Lucia.
#	   luupesado at gmail dot com
#    Verstraeten, Federico.
#          federico.verstraeten at gmail dot com
#
# @Date:               07-Sep-2018 2:12:07 pm
# @Last modified by:   Ignacio Santiago Husain
# @Last modified time: 17-Sep-2018 1:22:21 am
#
# @Copyright (C):
#    This file is part of 'TP0 - Infraestructura basica.'.
#    Unauthorized copying or use of this file via any medium
#    is strictly prohibited.
# ------------------------------------------------------------
#
# Script to test errors in the program arguments.
#
# To remove newlines from a textfile, use
# printf %s "$(cat file)" > file
#
# To print contents of a file, including control characters, do:
# oc -c file
#
# ------------------------------------------------------------

# Program name to test.
PROGRAM_NAME='./tp0'

# Colors to be used.
RED="\e[31m"
GREEN="\e[32m"
CYAN="\e[96m"
YELLOW="\e[93m"
BOLD="\033[1m"
DEFAULT="\e[0m"

# Helper and formatting functions definitions.
function header() {
  echo -e "$CYAN------------------------------------------------------$DEFAULT"
  echo -e "$CYAN$1$DEFAULT"
  echo -e "$CYAN------------------------------------------------------$DEFAULT"
}

# ------------------------------------------------------------
# Input-output validation tests.
# ------------------------------------------------------------
function IO_validation_passed(){
	echo -e "$GREEN\0PASSED: $DEFAULT $1"
}
function IO_validation_failed(){
	echo -e "$RED\0FAILED $DEFAULT $1"
}

TESTS_DIR="../tests";
mkdir $TESTS_DIR;

  header "TEST5: input-output should be the same."

  n=32;

  	head -c $n </dev/urandom >$TESTS_DIR/in.bin;
  	$PROGRAM_NAME -a encode -i $TESTS_DIR/in.bin -o $TESTS_DIR/out.b64;
  	$PROGRAM_NAME -a decode -i $TESTS_DIR/out.b64 -o $TESTS_DIR/out.bin;

    diff_result="$(diff $TESTS_DIR/in.bin $TESTS_DIR/out.bin)";

  	if [[ -z ${diff_result} ]]; then :;
  		IO_validation_passed "n = $n";
  	else
  		IO_validation_failed "n = $n";
  	fi

  	rm -f $TESTS_DIR/in.bin $TESTS_DIR/out.b64 $TESTS_DIR/out.bin
