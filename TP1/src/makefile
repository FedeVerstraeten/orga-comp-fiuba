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
# @Last modified time: 15-Oct-2018 11:03:55 pm
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
_DEPS = base64.h b256To64.h b64To256.h
_SRC = main.c base64.c flushBuffer.S printChar.S base64_encode.S base64_decode.S b256To64.c b64To256.c
_OBJ = main.o base64.o flushBuffer.o printChar.o base64_encode.o base64_decode.o b256To64.o b64To256.o
# ------------------------------------------------------------
# Configuration.
CC = gcc
CFLAGS = -Wall -I. -O0 -DNETBSD3
OUTPUT1 = tp1
# ------------------------------------------------------------
all: $(OUTPUT1)

$(OUTPUT1): $(_SRC) $(_DEPS)
	$(CC) $(CFLAGS) -o $@ $(_SRC)

assembly:
	$(CC) $(CFLAGS) -S $(_SRC) -mrnames

.PHONY: clean assembly

clean:
	rm -f ./*.o ./*~ ./*.core ./*~
	rm -f $(OUTPUT1)
