# ------------------------------------------------------------
# @Title:   FIUBA - 66.20 Organización de Computadoras.
# @Project: TP0 - Infraestructura básica.
# ------------------------------------------------------------
# @Filename: makefile
# ------------------------------------------------------------
# @Authors:
#    Álvarez, Natalia Nayla.
#          xxx at xxx dot xxx
#    Husain, Ignacio Santiago.
#          santiago.husain at gmail dot com
#    Verstraeten, Federico.
#          federico.verstraeten at gmail dot com
#
# @Date:               07-Sep-2018 12:57:50 pm
# @Last modified by:   santiago
# @Last modified time: 07-Sep-2018 2:03:17 pm
#
# @Copyright (C):
#    This file is part of 'TP0 - Infraestructura básica.'.
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
_DEPS =
_SRC = main.c
_OBJ = main.o
# ------------------------------------------------------------
# Configuration.
CC = gcc
CFLAGS = -Wall -I. -O0
OUTPUT1 = tp0
# ------------------------------------------------------------
# Processing.
$(OUTPUT1): $(_OBJ)
	$(CC) $(CFLAGS) -o $(OUTPUT1) $(_OBJ)

assembly:
	$(CC) $(CFLAGS) -S $(_SRC) $(ARGS)

.PHONY: clean

clean:
	rm -f ./*.o *~ core ./*~ ./*.s
	rm -f $(OUTPUT1)
