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
#		 			 xxx at xxx dot xxx
#    Verstraeten, Federico.
#          federico.verstraeten at gmail dot com
#
# @Date:               07-Sep-2018 2:12:07 pm
# @Last modified by:   Ignacio Santiago Husain
# @Last modified time: 12-Sep-2018 1:19:56 pm
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

function msg_true () {
  echo -e "$GREEN\0PASSED \n $DEFAULT PROGRAM OUTPUT:\n\t$1"
}

function msg_false () {
  echo -e "$RED\0FAILED \n $DEFAULT PROGRAM OUTPUT:\n\t$1"
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

# ------------------------------------------------------------
# Input parameters tests.
# ------------------------------------------------------------

# Define the expected outputs of each of the test cases with its associated
# test functions.
EXPECTED_OUTPUT_INEXISTENT_INPUT_STREAM=("ERROR: Can't open input stream.")

function test1_parameter_input_inexistent_stream(){
  header "TEST1: inexistent 'input' stream."

	commands=(
  "-i 1"
  "-i hola.bin"
  )

	for i in "${commands[@]}"
	do

		msg_testing "$PROGRAM_NAME $i"

		PROGRAM_OUTPUT=$($PROGRAM_NAME $i 2>&1)

    if [[ "$EXPECTED_OUTPUT_INEXISTENT_INPUT_STREAM" == "$PROGRAM_OUTPUT" ]]; then
      msg_true "$PROGRAM_OUTPUT"
    else
      msg_false "$PROGRAM_OUTPUT"
    fi

	done
}

EXPECTED_OUTPUT_INPUT_NO_ARGUMENT=("./tp0: option requires an argument -- 'i'")

function test11_parameter_input_no_argument(){
  header "TEST11: no 'input' option parameters."

	commands=("-i ")

	for i in "${commands[@]}"
	do

		msg_testing "$PROGRAM_NAME $i"

		PROGRAM_OUTPUT=$($PROGRAM_NAME $i 2>&1)

    if [[ "$EXPECTED_OUTPUT_INPUT_NO_ARGUMENT" == "$PROGRAM_OUTPUT" ]]; then
      msg_true "$PROGRAM_OUTPUT"
    else
      msg_false "$PROGRAM_OUTPUT"
    fi

	done
}

EXPECTED_OUTPUT_INPUT_INVALID_STREAM=("ERROR: Invalid input stream.")

function test12_parameter_input_invalid_stream(){
  header "TEST12: invalid 'input' stream."

	commands=(
  "-i ."
  "-i .."
  "-i /"
  "-i //"
  )

	for i in "${commands[@]}"
	do

		msg_testing "$PROGRAM_NAME $i"

		PROGRAM_OUTPUT=$($PROGRAM_NAME $i 2>&1)

    if [[ "$EXPECTED_OUTPUT_INPUT_INVALID_STREAM" == "$PROGRAM_OUTPUT" ]]; then
      msg_true "$PROGRAM_OUTPUT"
    else
      msg_false "$PROGRAM_OUTPUT"
    fi

	done
}

EXPECTED_OUTPUT_INVALID_OUTPUT_STREAM=("ERROR: Invalid output stream.")

function test2_parameter_output_stream(){
  header "TEST2: invalid 'output' stream."

	commands=(
  "-i ../tests/test1.bin -o ."
  "-i ../tests/test1.bin -o .."
  "-i ../tests/test1.bin -o /"
  "-i ../tests/test1.bin -o //"
  )

	for i in "${commands[@]}"
	do

		msg_testing "$PROGRAM_NAME $i"

		PROGRAM_OUTPUT=$($PROGRAM_NAME $i 2>&1)

    if [[ "$EXPECTED_OUTPUT_INVALID_OUTPUT_STREAM" == "$PROGRAM_OUTPUT" ]]; then
      msg_true "$PROGRAM_OUTPUT"
    else
      msg_false "$PROGRAM_OUTPUT"
    fi

	done
}

EXPECTED_OUTPUT_OUTPUT_NO_ARGUMENT=("./tp0: option requires an argument -- 'o'")

function test21_parameter_output_no_argument(){
  header "TEST21: no 'output' option parameters."

	commands=("-o ")

	for i in "${commands[@]}"
	do

		msg_testing "$PROGRAM_NAME $i"

		PROGRAM_OUTPUT=$($PROGRAM_NAME $i 2>&1)

    if [[ "$EXPECTED_OUTPUT_OUTPUT_NO_ARGUMENT" == "$PROGRAM_OUTPUT" ]]; then
      msg_true "$PROGRAM_OUTPUT"
    else
      msg_false "$PROGRAM_OUTPUT"
    fi

	done
}

EXPECTED_OUTPUT_INVALID_ACTION=("ERROR: Invalid action argument.")

function test3_parameter_action(){
  header "TEST3: invalid 'action' parameters."

	commands=(
  "-a bad_action"
  "-a 1"
  "-a ."
  "-a .."
  "-a /"
  "-a //"
  "-a $"
  )

	for i in "${commands[@]}"
	do

		msg_testing "$PROGRAM_NAME $i"

		PROGRAM_OUTPUT=$($PROGRAM_NAME $i 2>&1)

    if [[ "$EXPECTED_OUTPUT_INVALID_ACTION" == "$PROGRAM_OUTPUT" ]]; then
      msg_true "$PROGRAM_OUTPUT"
    else
      msg_false "$PROGRAM_OUTPUT"
    fi

	done
}

EXPECTED_OUTPUT_ACTION_NO_ARGUMENT=("./tp0: option requires an argument -- 'a'")

function test31_parameter_action_no_argument(){
  header "TEST31: no 'action' option parameters."

	commands=("-a ")

	for i in "${commands[@]}"
	do

		msg_testing "$PROGRAM_NAME $i"

		PROGRAM_OUTPUT=$($PROGRAM_NAME $i 2>&1)

    if [[ "$EXPECTED_OUTPUT_ACTION_NO_ARGUMENT" == "$PROGRAM_OUTPUT" ]]; then
      msg_true "$PROGRAM_OUTPUT"
    else
      msg_false "$PROGRAM_OUTPUT"
    fi

	done
}

EXPECTED_OUTPUT_VALID_PARAMETERS=()

function test4_valid_parameters(){
  header "TEST4: all options with correct parameters."

	commands=(
  "-a encode -i ../tests/test1.bin -o ../tests/test1_out.bin"
  "-a decode -i ../tests/test1_out.bin -o ../tests/test2.bin")

	for i in "${commands[@]}"
	do

		msg_testing "$PROGRAM_NAME $i"

		PROGRAM_OUTPUT=$($PROGRAM_NAME $i 2>&1)


    if [[ "$EXPECTED_OUTPUT_VALID_PARAMETERS" == "$PROGRAM_OUTPUT" ]]; then
      msg_true "$PROGRAM_OUTPUT"
    else
      msg_false "$PROGRAM_OUTPUT"
    fi

	done
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

function test5_IO_validation(){
  header "TEST5: input-output should be the same."

  n=1;
  nLimit=$((1024*2));

  while [ $n -le $nLimit ]
  do
  	head -c $n </dev/urandom >$TESTS_DIR/in.bin;
  	$PROGRAM_NAME -a encode -i $TESTS_DIR/in.bin -o $TESTS_DIR/out.b64;
  	$PROGRAM_NAME -a decode -i $TESTS_DIR/out.b64 -o $TESTS_DIR/out.bin;

    diff_result="$(diff $TESTS_DIR/in.bin $TESTS_DIR/out.bin)";

  	if [[ -z ${diff_result} ]]; then :;
  		IO_validation_passed "n = $n";
  	else
  		IO_validation_failed "n = $n";
  		break;
  	fi

  	n=$((n*2));

  	rm -f $TESTS_DIR/in.bin $TESTS_DIR/out.b64 $TESTS_DIR/out.bin
  done
}

function test51_IO_validation(){
  header "TEST51: input known text with known encoding."

  $PROGRAM_NAME -a encode -i $TESTS_DIR/leviathan.input -o $TESTS_DIR/leviathan_out.b64;

  diff_result="$(diff $TESTS_DIR/leviathan_out.b64 $TESTS_DIR/leviathan_out_truth.b64)";

  if [[ -z ${diff_result} ]]; then :;
    IO_validation_passed "No differences.";
  else
    IO_validation_failed "Differences: \n${diff_result}";
  fi
}

function test52_IO_validation(){
  header "TEST52: Encode letter 'M'."

  program_output="$(echo -n M | $PROGRAM_NAME)";
  correct_output="TQ==";
  diff_result="$(diff  <(echo "$program_output" ) <(echo "$correct_output"))";

  if [[ -z ${diff_result} ]]; then :;
    IO_validation_passed "No differences.";
  else
    IO_validation_failed "Differences: \n${diff_result}";
  fi
}

function test53_IO_validation(){
  header "TEST53: Encode 'Ma'."

  program_output="$(echo -n Ma | $PROGRAM_NAME)";
  correct_output="TWE=";
  diff_result="$(diff  <(echo "$program_output" ) <(echo "$correct_output"))";

  if [[ -z ${diff_result} ]]; then :;
    IO_validation_passed "No differences.";
  else
    IO_validation_failed "Differences: \n${diff_result}";
  fi
}

function test54_IO_validation(){
  header "TEST54: Encode 'Man'."

  program_output="$(echo -n Man | $PROGRAM_NAME)";
  correct_output="TWFu";
  diff_result="$(diff  <(echo "$program_output" ) <(echo "$correct_output"))";

  if [[ -z ${diff_result} ]]; then :;
    IO_validation_passed "No differences.";
  else
    IO_validation_failed "Differences: \n${diff_result}";
  fi
}

function test55_IO_validation(){
  header "TEST55: Encode and decode 'Man'."

  program_output="$(echo Man | $PROGRAM_NAME | $PROGRAM_NAME -a decode)";
  correct_output="Man";
  diff_result="$(diff  <(echo "$program_output" ) <(echo "$correct_output"))";

  if [[ -z ${diff_result} ]]; then :;
    IO_validation_passed "No differences.";
  else
    IO_validation_failed "Differences: \n${diff_result}";
  fi
}

function test56_IO_validation(){
  header "TEST56: Check bit by bit."

  program_output="$(echo xyz | $PROGRAM_NAME | $PROGRAM_NAME -a decode | od -t c)";
  correct_output="
  0000000 x y z \n
  0000004";
  diff_result="$(diff  <(echo "$program_output" ) <(echo "$correct_output"))";

  if [[ -z ${diff_result} ]]; then :;
    IO_validation_passed "No differences.";
  else
    IO_validation_failed "Differences: \n${diff_result}";
  fi
}

function test57_IO_validation(){
  header "TEST57: Check max line length and number of encoded bytes."

  program_output_line_count="$(echo -n "$(yes | head -c 1024 | $PROGRAM_NAME -a encode)" | wc -l)";
  # TODO: No estoy seguro de este número.
  correct_output_line_count="13";
  diff_result_line_count="$(diff  <(echo "$program_output_line_count" ) <(echo "$correct_output_line_count"))";

  if [[ -z ${diff_result_line_count} ]]; then :;
    IO_validation_passed "No differences in line count.";
  else
    IO_validation_failed "Differences in line count:
    Program output:${program_output_line_count}
    Correct output:${correct_output_line_count}";
  fi

  program_output_word_count="$(yes | head -c 1024 | $PROGRAM_NAME -a encode | $PROGRAM_NAME -a decode | wc -c)";
  correct_output_word_count="1024";
  diff_result_word_count="$(diff  <(echo "$program_output_word_count" ) <(echo "$correct_output_word_count"))";

  if [[ -z ${diff_result_word_count} ]]; then :;
    IO_validation_passed "No differences in word count.";
  else
    IO_validation_failed "Differences in word count:
    Program output:${program_output_word_count}
    Correct output:${correct_output_word_count}";
  fi
}

# ------------------------------------------------------------
# Encoding-Decoding execution times tests.
# ------------------------------------------------------------
function test6_encoding_execution_times(){
  header "TEST6: encoding execution times."

  n=1;
  nLimit=$((1024*10000));

  while [ $n -le $nLimit ]
  do
  	head -c $n </dev/urandom >$TESTS_DIR/in.bin;
    ts=$(date +%s%N);
    $PROGRAM_NAME -a encode -i $TESTS_DIR/in.bin -o $TESTS_DIR/out.b64;
    tt=$((($(date +%s%N) - $ts)/1000000));
    printf 'n: %-10d %10s %.2f [ms]\n' "$n" " " "$tt"

  	n=$((n*2));

  	rm -f $TESTS_DIR/in.bin $TESTS_DIR/out.b64 $TESTS_DIR/out.bin
  done
}

function test7_decoding_execution_times(){
  header "TEST7: decoding execution times."

  n=1;
  nLimit=$((1024*10000));

  while [ $n -le $nLimit ]
  do
  	head -c $n </dev/urandom >$TESTS_DIR/in.bin;
    $PROGRAM_NAME -a encode -i $TESTS_DIR/in.bin -o $TESTS_DIR/out.b64;
    ts=$(date +%s%N);
    $PROGRAM_NAME -a decode -i $TESTS_DIR/out.b64 -o $TESTS_DIR/out.bin;
    tt=$((($(date +%s%N) - $ts)/1000000));
    printf 'n: %-10d %10s %.2f [ms]\n' "$n" " " "$tt"

  	n=$((n*2));

  	rm -f $TESTS_DIR/in.bin $TESTS_DIR/out.b64 $TESTS_DIR/out.bin
  done
}

# ------------------------------------------------------------
# Run the tests.
# ------------------------------------------------------------
test1_parameter_input_inexistent_stream
test11_parameter_input_no_argument
test12_parameter_input_invalid_stream
test2_parameter_output_stream
test21_parameter_output_no_argument
test3_parameter_action
test31_parameter_action_no_argument
test4_valid_parameters
test5_IO_validation
test51_IO_validation
test52_IO_validation
test53_IO_validation
test54_IO_validation
test55_IO_validation
test56_IO_validation
test57_IO_validation
#test6_encoding_execution_times
#test7_decoding_execution_times

header "Test suite ended."
