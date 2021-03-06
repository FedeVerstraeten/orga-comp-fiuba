# ------------------------------------------------------------
# @Title:   FIUBA - 66.20 Organizacion de Computadoras.
# @Project: TP1 - Conjunto de instrucciones MIPS.
# ------------------------------------------------------------
# @Filename: makefile
# ------------------------------------------------------------
# @Authors:
#    Husain, Ignacio Santiago.
#          santiago.husain at gmail dot com
#		 Pesado, Lucia.
#	   			 luupesado at gmail dot com
#    Verstraeten, Federico.
#          federico.verstraeten at gmail dot com
#
# @Date:               07-Sep-2018 12:57:50 pm
# @Last modified by:   Ignacio Santiago Husain
# @Last modified time: 16-Oct-2018 3:27:57 pm
#
# @Copyright(C):
#     This file is part of
#     'TP1 - Conjunto de instrucciones MIPS'. Unauthorized
#     copying or use of this file via any medium is
#     strictly prohibited.
# ------------------------------------------------------------
#
# The source files must have .c extension.
# The object code must have .o extension.
# The header files must have .h extension.
#
# To compile, execute 'make'.
# To clean all the compilation files, issue the command
# 'make clean'.
#
# ------------------------------------------------------------
# List all the header and object files separated by a blank
# space.
_DEPS = base64_s.h base64.h
_SRC1 = main.c base64.S flushBuffer.S printChar.S
_SRC2 = base64_encode.S base64_decode.S b256To64.S b64To256.S addPadding.S
_OBJ1 = main.o base64.o flushBuffer.o printChar.o
_OBJ2 = base64_encode.o base64_decode.o b256To64.o b64To256.o addPadding.o
# ------------------------------------------------------------
# Configuration.
CC = gcc
CFLAGS = -Wall -I. -O0 -DNETBSD3
OUTPUT1 = tp1
# ------------------------------------------------------------
all: $(OUTPUT1)

$(OUTPUT1): $(_SRC1) $(_SRC2) $(_DEPS)
	$(CC) $(CFLAGS) -o $@ $(_SRC1) $(_SRC2)

assembly:
	$(CC) $(CFLAGS) -S $(_SRC1) $(_SRC2) -mrnames

.PHONY: clean assembly

clean:
	rm -f ./*.o ./*~ ./*.core ./*~
	rm -f $(OUTPUT1)
