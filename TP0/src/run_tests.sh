#!/bin/bash

# ------------------------------------------------------------
# @Title:   FIUBA - 66.20 Organización de Computadoras.
# @Project: TP0 - Infraestructura básica.
# ------------------------------------------------------------
# @Filename: run_tests.sh
# ------------------------------------------------------------
# @Authors:
#    Álvarez, Natalia Nayla.
#          xxx at xxx dot xxx
#    Husain, Ignacio Santiago.
#          santiago.husain at gmail dot com
#    Verstraeten, Federico.
#          federico.verstraeten at gmail dot com
#
# @Date:               07-Sep-2018 2:12:07 pm
# @Last modified by:   Ignacio Santiago Husain
# @Last modified time: 08-Sep-2018 11:38:22 am
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

RED="\e[31m"
GREEN="\e[32m"
CYAN="\e[96m"
YELLOW="\e[93m"
BOLD="\033[1m"
DEFAULT="\e[0m"
EXEC='./tp0'


function header() {
  echo -e "$CYAN#####################################$DEFAULT"
  echo -e "$CYAN$1$DEFAULT"
  echo -e "$CYAN#####################################$DEFAULT"
}

function msg_true () {
  echo -e "$GREEN\0PASSED $DEFAULT:\n$1 = $GREEN $2 $DEFAULT"
}

function msg_false () {
  echo -e "$RED\0NOT EQUAL $DEFAULT:\n$1 = $YELLOW $2 $DEFAULT"
  echo -e "EXPECTED:\n$1"
}

function msg() {
  echo -e "  $BOLD$1$DEFAULT"
}

function success_msg() {
  echo -e "  $GREEN$1$DEFAULT"
}

function error_msg() {
  echo -e "  $RED$1$DEFAULT"
}

EXPECTED_OUTPUT_FILE=("ERROR: Can't open output stream.
ERROR: Program exited with errors.")

EXPECTED_OUTPUT_VALID_PARAMETERS=("SUCCESS: Output file has been written successfully")

function test_parameter_file(){
  header "TEST VALIDACION PARAMETRO 'FILE'"

	commands=("-o .")

	for i in "${commands[@]}"
	do

		msg "$EXEC $i"

		ACTUAL_OUTPUT=$($EXEC $i 2>&1)


    if [[ "$EXPECTED_OUTPUT_FILE" == "$ACTUAL_OUTPUT" ]]; then
      msg_true "$EXPECTED_OUTPUT_FILE" "$ACTUAL_OUTPUT"
    else
      msg_false "$EXPECTED_OUTPUT_FILE" "$ACTUAL_OUTPUT"
    fi

	done
}

test_parameter_file
