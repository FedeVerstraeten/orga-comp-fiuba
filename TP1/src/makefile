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
# @Last modified time: 08-Oct-2018 4:20:08 pm
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
_DEPS = messages.h common.h parser.h base64.h
_SRC = main.c parser.c base64.c
_OBJ = main.o parser.o base64.o
# ------------------------------------------------------------
# Configuration.
CC = gcc
CFLAGS = -ansi -Wall -I. -O0
OUTPUT1 = tp1
# ------------------------------------------------------------
all: $(OUTPUT1)

$(OUTPUT1): $(_OBJ)
	$(CC) $(CFLAGS) -o $(OUTPUT1) $(_OBJ)

assembly:
	$(CC) $(CFLAGS) -S $(_SRC) $(ARGS)

.PHONY: clean assembly

clean:
	rm -f ./*.o *~ core ./*~ ./*.s
	rm -f $(OUTPUT1)
