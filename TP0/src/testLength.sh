#!/bin/bash

# ------------------------------------------------------------
# @Title:   FIUBA - 66.20 Organización de Computadoras.
# @Project: TP0 - Infraestructura básica.
# ------------------------------------------------------------
# @Filename: testLength.sh
# ------------------------------------------------------------
# @Authors:
#    Husain, Ignacio Santiago.
#          santiago.husain at gmail dot com
#    Pesado, Lucía.
#          xxx at xxx dot xxx
#    Verstraeten, Federico.
#          federico.verstraeten at gmail dot com
#
# @Date:               17-Sep-2018 11:07:15 am
# @Last modified by:   pluto
# @Last modified time: 17-Sep-2018 11:43:55 am
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

test57_IO_validation
