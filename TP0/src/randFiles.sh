#!/bin/bash

# ------------------------------------------------------------
# @Title:   FIUBA - 66.20 Organización de Computadoras.
# @Project: TP0 - Infraestructura básica.
# ------------------------------------------------------------
# @Filename: randFiles.sh
# ------------------------------------------------------------
# @Authors:
#    Álvarez, Natalia Nayla.
#          xxx at xxx dot xxx
#    Husain, Ignacio Santiago.
#          santiago.husain at gmail dot com
#    Verstraeten, Federico.
#          federico.verstraeten at gmail dot com
#
# @Date:               08-Sep-2018 10:06:05 pm
# @Last modified by:   Ignacio Santiago Husain
# @Last modified time: 09-Sep-2018 4:28:28 pm
#
# @Copyright (C):
#    This file is part of 'TP0 - Infraestructura básica.'.
#    Unauthorized copying or use of this file via any medium
#    is strictly prohibited.
# ------------------------------------------------------------
#
# Script that generates random binary files of increasing size
# (doubling size in each step) and then coded and decoded
# using our codec tool to check if it is working fine.
#
# ------------------------------------------------------------

TESTS_DIR="../tests";
mkdir $TESTS_DIR;
PROGRAM_NAME="tp0";
n=1;
while :; do

	head -c $n </dev/urandom >$TESTS_DIR/in.bin;
	./$PROGRAM_NAME -a encode -i $TESTS_DIR/in.bin -o $TESTS_DIR/out.b64;
	./$PROGRAM_NAME -a decode -i $TESTS_DIR/out.b64 -o $TESTS_DIR/out.bin;

	if diff $TESTS_DIR/in.bin $TESTS_DIR/out.bin; then :; else
		echo ERROR: $n;
		break;
	fi

	echo ok: $n;
	n=$((n*2));
	rm -f $TESTS_DIR/in.bin $TESTS_DIR/out.b64 $TESTS_DIR/out.bin
done