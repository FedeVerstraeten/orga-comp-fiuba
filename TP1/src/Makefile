# Do not edit -- this file documents how this program was built for your machine.
SYSTYPE	= NETBSD3
SYSLIBS	= -lm
CC	= gcc $(WARN)
OPT	= -O
DEBUG	= -g
EXPORT	= AUXLIBS='' CCARGS='' OPT='-O' DEBUG='-g'
WARN	= -Wall
SHELL	= /bin/sh
DEFS  = -I. -D$(SYSTYPE)
CFLAGS= $(DEBUG) $(OPT) $(DEFS) -O0
OPTS	= 'CC=$(CC)'
HDRS1 = messages.h common.h parser.h base64.h printChar.h flushBuffer.h
SRCS1	= main.c parser.c base64.c flushBuffer.c printChar_gcc.S
PROG	= tp1

$(PROG): $(SRCS1) $(HDRS1)
	$(CC) $(CFLAGS) -o $@ $(SRCS1) $(SYSLIBS)

clean:
	rm -f bin/[!CRS]* lib/[!CRS]* include/[!CRS]* libexec/[!CRS]*     \
	      junk *core .nfs* .pure *.out *.out.* *.tmp *.a *~ *- *.orig \
	      *.t *.o *.bak make.err *.gmon $(PROG)
