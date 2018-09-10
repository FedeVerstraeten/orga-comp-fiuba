#!/bin/bash

# ------------------------------------------------------------
# @Title:   FIUBA - 66.20 Organización de Computadoras.
# @Project: TP0 - Infraestructura básica.
# ------------------------------------------------------------
# @Filename: runTests.sh
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
# @Last modified time: 10-Sep-2018 11:41:17 am
#
# @Copyright (C):
#    This file is part of 'TP0 - Infraestructura básica.'.
#    Unauthorized copying or use of this file via any medium
#    is strictly prohibited.
# ------------------------------------------------------------
#
# Script to test errors in the program arguments.
#
# ------------------------------------------------------------

# Program name to test.
EXEC='./tp0'

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

function msg_true () {
  echo -e "$GREEN\0PASSED \n $DEFAULT PROGRAM OUTPUT:\n\t$1"
}

function msg_false () {
  echo -e "$RED\0NOT PASSED \n $DEFAULT PROGRAM OUTPUT:\n\t$1"
}

function msg_testing() {
  echo -e "Testing: $BOLD$1$DEFAULT"
}

function success_msg() {
  echo -e "  $GREEN$1$DEFAULT"
}

function error_msg() {
  echo -e "  $RED$1$DEFAULT"
}

# Define the expected outputs of each of the test cases with its associated
# test functions.
EXPECTED_OUTPUT_INVALID_INPUT_STREAM=("ERROR: Can't open input stream.")

function test_parameter_input_stream(){
  header "TEST: bad 'input' option parameters"

	commands=("-i 1")

	for i in "${commands[@]}"
	do

		msg_testing "$EXEC $i"

		PROGRAM_OUTPUT=$($EXEC $i 2>&1)

    if [[ "$EXPECTED_OUTPUT_INVALID_INPUT_STREAM" == "$PROGRAM_OUTPUT" ]]; then
      msg_true "$PROGRAM_OUTPUT"
    else
      msg_false "$PROGRAM_OUTPUT"
    fi

	done
}

EXPECTED_OUTPUT_INVALID_OUTPUT_STREAM=("ERROR: Can't open output stream.")

function test_parameter_output_stream(){
  header "TEST: bad 'output' option parameters"

	commands=("-o .")

	for i in "${commands[@]}"
	do

		msg_testing "$EXEC $i"

		PROGRAM_OUTPUT=$($EXEC $i 2>&1)

    if [[ "$EXPECTED_OUTPUT_INVALID_OUTPUT_STREAM" == "$PROGRAM_OUTPUT" ]]; then
      msg_true "$PROGRAM_OUTPUT"
    else
      msg_false "$PROGRAM_OUTPUT"
    fi

	done
}

EXPECTED_OUTPUT_INVALID_ACTION=("ERROR: Invalid argument.")

function test_parameter_action(){
  header "TEST: bad 'action' option parameters"

	commands=("-a bad_action")

	for i in "${commands[@]}"
	do

		msg_testing "$EXEC $i"

		PROGRAM_OUTPUT=$($EXEC $i 2>&1)

    if [[ "$EXPECTED_OUTPUT_INVALID_ACTION" == "$PROGRAM_OUTPUT" ]]; then
      msg_true "$PROGRAM_OUTPUT"
    else
      msg_false "$PROGRAM_OUTPUT"
    fi

	done
}

EXPECTED_OUTPUT_VALID_PARAMETERS=()

function test_valid_parameters(){
  header "TEST: all options with correct parameters."

	commands=(	"-a encode -i ../tests/test1.bin -o ../tests/test1_out.bin"
  "-a decode -i ../tests/test1_out.bin -o ../tests/test2.bin")

	for i in "${commands[@]}"
	do

		msg_testing "$EXEC $i"

		PROGRAM_OUTPUT=$($EXEC $i 2>&1)


    if [[ "$EXPECTED_OUTPUT_VALID_PARAMETERS" == "$PROGRAM_OUTPUT" ]]; then
      msg_true "$PROGRAM_OUTPUT"
    else
      msg_false "$PROGRAM_OUTPUT"
    fi

	done
}

# Run the tests.

test_parameter_input_stream
test_parameter_output_stream
test_parameter_action
test_valid_parameters
