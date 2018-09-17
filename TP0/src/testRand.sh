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
# @Date:               17-Sep-2018 1:40:31 am
# @Last modified by:   Ignacio Santiago Husain
# @Last modified time: 17-Sep-2018 1:46:26 am
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
n=240;

head -c $n </dev/urandom >../tests/in.bin;
./tp0 -a encode -i ../tests/in.bin -o ../tests/out.b64;
./tp0 -a decode -i ../tests/out.b64 -o ../tests/out.bin;
if diff ../tests/in.bin ../tests/out.bin; then :; else
	echo ERROR: $n;
fi
echo ok: $n;
n=$(($n+1));
# rm -f ../tests/in.bin ../tests/out.b64 ../tests/out.bin
