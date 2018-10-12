#!/bin/sh

# ------------------------------------------------------------
# @Title:   FIUBA - 66.20 Organizacion de Computadoras.
# @Project: TP1 - Conjunto de instrucciones MIPS.
# ------------------------------------------------------------
# @Filename: runTests.sh
# ------------------------------------------------------------
# @Authors:
#    Husain, Ignacio Santiago.
#          santiago.husain at gmail dot com
#		 Pesado, Lucia.
#	         luupesado at gmail dot com
#    Verstraeten, Federico.
#          federico.verstraeten at gmail dot com
#
# @Date:               07-Sep-2018 2:12:07 pm
# @Last modified by:   Santiago
# @Last modified time: 12-Oct-2018 8:15:14 pm
#
# @Copyright(C):
#     This file is part of
#     'TP1 - Conjunto de instrucciones MIPS'. Unauthorized
#     copying or use of this file via any medium is
#     strictly prohibited.
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
PROGRAM_NAME='./tp1'

# Failed tests counter.
failedTests=0;

# Colors to be used.
RED="\e[31m";
GREEN="\e[32m";
CYAN="\e[96m";
YELLOW="\e[93m";
BOLD="\033[1m";
DEFAULT="\e[0m";

# Helper and formatting functions definitions.
 header() {
  echo -e "$CYAN------------------------------------------------------$DEFAULT";
  echo -e "$CYAN$1$DEFAULT";
  echo -e "$CYAN------------------------------------------------------$DEFAULT";
}

 msg_true() {
  echo -e "$GREEN\0PASSED \n $DEFAULT PROGRAM OUTPUT:\n\t$1";
}

 msg_false() {
  echo -e "$RED\0FAILED \n $DEFAULT PROGRAM OUTPUT:\n\t$1";
}

 msg_testing() {
  echo -e "Testing: $BOLD$1$DEFAULT";
}

 success_msg() {
  echo -e "  $GREEN$1$DEFAULT";
}

 error_msg() {
  echo -e "  $RED$1$DEFAULT";
}

# ------------------------------------------------------------
# Input-output validation tests.
# ------------------------------------------------------------
 IO_validation_passed(){
	echo -e "$GREEN\0PASSED: $DEFAULT $1"
}
 IO_validation_failed(){
	echo -e "$RED\0FAILED $DEFAULT $1"
}

TESTS_DIR="../tests";
mkdir $TESTS_DIR;

 test5_IO_validation(){
  header "TEST5: input-output should be the same."

  n=1024;
  nLimit=$((1024*100));

  while [ $n -le $nLimit ]
  do
  	 head -c $n </dev/urandom >$TESTS_DIR/in.bin;
  	$PROGRAM_NAME -a encode -i $TESTS_DIR/in.bin -o $TESTS_DIR/out.b64;
  	$PROGRAM_NAME -a decode -i $TESTS_DIR/out.b64 -o $TESTS_DIR/out.bin;

  	if diff $TESTS_DIR/in.bin $TESTS_DIR/out.bin; then :;
  		IO_validation_passed "n = $n";
  	else
  		IO_validation_failed "n = $n";
      error_msg "in.bin";
      cat $TESTS_DIR/in.bin | od -t c;
      error_msg "out.b64";
      cat $TESTS_DIR/out.b64 | od -t c;
      error_msg "out.bin";
      cat $TESTS_DIR/out.bin | od -t c;
      failedTests=$(($failedTests+1));
  		break;
  	fi

  	n=$(($n*2));

  	rm -f $TESTS_DIR/in.bin $TESTS_DIR/out.b64 $TESTS_DIR/out.bin
  done
}

test5_IO_validation

header "Test suite ended."

if [ $failedTests -eq "0" ]; then
  success_msg "All tests passed.";
else
  error_msg "Failed tests: $failedTests";
fi
