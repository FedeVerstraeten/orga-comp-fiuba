# ------------------------------------------------------------
# @Title:   FIUBA - 66.20 Organizacion de Computadoras.
# @Project: TP0 - Infraestructura basica.
# ------------------------------------------------------------
# @Filename: makefile
# ------------------------------------------------------------
# @Authors:
#    Husain, Ignacio Santiago.
#          santiago.husain at gmail dot com
#		 Pesado, Lucia.
#	   luupesado at gmail dot com
#    Verstraeten, Federico.
#          federico.verstraeten at gmail dot com
#
# @Date:               07-Sep-2018 12:57:50 pm
# @Last modified by:   Ignacio Santiago Husain
# @Last modified time: 12-Sep-2018 12:39:52 pm
#
# @Copyright (C):
#    This file is part of 'TP0 - Infraestructura basica.'.
#    Unauthorized copying or use of this file via any medium
#    is strictly prohibited.
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
_DEPS = messages.h common.h parser.h encoder.h decoder.h
_SRC = main.c parser.c encoder.c decoder.c
_OBJ = main.o parser.o encoder.o decoder.o
# ------------------------------------------------------------
# Configuration.
CC = gcc
CFLAGS = -Wall -I. -O0
OUTPUT1 = tp0
# ------------------------------------------------------------
%.o: %.c $(_DEPS)
	$(CC) $(CFLAGS) -c -o $@ $<

all: $(OUTPUT1)

$(OUTPUT1): $(_OBJ)
	$(CC) $(CFLAGS) -o $@ $^

assembly:
	$(CC) $(CFLAGS) -S $(_SRC) $(ARGS)

.PHONY: clean assembly

clean:
	rm -f ./*.o *~ core ./*~ ./*.s
	rm -f $(OUTPUT1)
