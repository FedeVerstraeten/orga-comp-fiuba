# ------------------------------------------------------------
# @Title:   FIUBA - 66.20 Organizacion de Computadoras.
# @Project: TP1 - Conjunto de instrucciones MIPS.
# ------------------------------------------------------------
# @Filename: makefile_c
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
# @Last modified by:   root
# @Last modified time: 12-Oct-2018 6:24:22 pm
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
_DEPS = messages.h common.h parser.h base64.h printChar.h flushBuffer.h
_SRC = main.c parser.c base64.c flushBuffer.c printChar.S
_OBJ = main.o parser.o base64.o flushBuffer.o printChar.o
# ------------------------------------------------------------
# Configuration.
CC = gcc
CFLAGS = -Wall -I. -O0 -DNETBSD3 -g
OUTPUT1 = tp1
# ------------------------------------------------------------
all: $(OUTPUT1)

$(OUTPUT1): $(_SRC) $(_DEPS)
	$(CC) $(CFLAGS) -o $@ $(_SRC)

assembly:
	$(CC) $(CFLAGS) -S $(_SRC) -mrnames

.PHONY: clean assembly

clean:
	rm -f ./*.o ./*~ ./*.core ./*~ ./*.s
	rm -f $(OUTPUT1)
