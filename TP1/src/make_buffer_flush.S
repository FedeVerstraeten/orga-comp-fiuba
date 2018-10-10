#include <mips/regdef.h>
#include <sys/syscall.h>

#define SIZE 48

#define PADDING_1 52
#define PARAMS_POINTER 48

#define PADDING_0 44
#define RA 40
#define FP 36
#define GP 32

#define AUX_INDEX 28
#define BYTES_WRITEN 24
#define BYTES_TO_WRITE 20
#define BUFFER 16

#define ARG3 12
#define ARG2 8
#define ARG1 4
#define ARG0 0

# Offsets in the 'param_t' structure.
#define BU_OFFSET 48

# Offsets in the 'output_buffer_t' structure.
#define BUFFER_ARRAY_OFFSET 0
#define BUFFER_IDX_OFFSET 4
#define BUFFER_SIZE_OFFSET 8
#define BUFFER_FILE_DESCRIPTOR_OFFSET 12

.text
.abicalls
.align	2
.globl	make_buffer_flush
.ent	make_buffer_flush

make_buffer_flush:
# Debugger metadata.
.frame	$fp,SIZE,ra
# Pipeline magic.
.set	noreorder
.cpload	t9
.set	reorder

# Allocate memory for the stack.
subu	sp,sp,SIZE
# SRA beginning area.
.cprestore GP

# Save the callee-saved registers used by the caller in the SRA.
sw  ra, RA(sp)
sw	$fp,FP(sp)
sw  gp, GP(sp)
# We must set the $fp to the beginning of the stack.
move $fp,sp

# Now we save the arguments that were loaded by the caller
# in the area reserved by the caller.
sw a0, PARAMS_POINTER($fp)

#############################
# body: make_buffer_flush   #
#############################
# seteo de variable buffer
lw t0, PARAMS_POINTER($fp)
lw t0, BU_OFFSET(t0)
sw t0, BUFFER($fp)

# seteo de variable bytes_to_write
lw t0, BUFFER($fp)
lw t0, BUFFER_IDX_OFFSET(t0)
sw t0, BYTES_TO_WRITE($fp)

# seteo de variable BYTES_WRITEN a cero
li t0, 0
sw t0, BYTES_WRITEN($fp)

# seteo de variable aux_index
lw t0, BUFFER($fp)
lw t0, BUFFER_ARRAY_OFFSET(t0)
sw t0, AUX_INDEX($fp)

# ciclo de control de escritura
loop:
	# verificacion de control de loop
	lw t0, BYTES_WRITEN($fp)
	lw t1, BYTES_TO_WRITE($fp)

	bge t0, t1, exitLoop

	# decremento de bytes_to_write
	lw t0, BYTES_TO_WRITE($fp)
	lw t1, BYTES_WRITEN($fp)
	sub t0, t0, t1
	sw t0, BYTES_TO_WRITE($fp)

	# actualizacion de aux_index
	lw t0, AUX_INDEX($fp)
	lw t1, BYTES_WRITEN($fp)
	addu t0, t0, t1
	sw t0, AUX_INDEX($fp)

	lw          a0, BUFFER($fp)
	lw          a0, BUFFER_FILE_DESCRIPTOR_OFFSET(a0)
	lw          a1, AUX_INDEX($fp)
	lw          a2, BYTES_TO_WRITE($fp)
	li          v0, SYS_write
	syscall

	sw          v0, BYTES_WRITEN($fp)

	b loop

exitLoop:
	#set a cero de buffer_idx
	li t0, 0
	lw t1, BUFFER($fp)
	sw t0, BUFFER_IDX_OFFSET(t1)

exit:
# We must restore all the saved registers.
move sp,$fp
lw ra, RA(sp)
lw $fp, FP(sp)
sw  gp, GP(sp)
# We pop the stack and return to the caller.
addu sp, sp, SIZE
j ra

.end make_buffer_flush
