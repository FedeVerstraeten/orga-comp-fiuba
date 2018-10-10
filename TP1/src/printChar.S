#include <mips/regdef.h>
#include <sys/syscall.h>

#define SIZE 48

#define buffer 52
#define c 48

#define PADDING_1 44
#define RA 40
#define FP 36
#define GP 32

#define relativeIndex 28
#define bytesWriten 24
#define bytesToWrite 20
#define errsv 16

#define ARG3 12
#define ARG2 8
#define ARG1 4
#define ARG0 0

# Offsets in the 'buffer_t' structure.
#define BUFFER_IDX_OFFSET 0
#define BUFFER_SIZE_OFFSET 4
#define BUFFER_FILE_DESCRIPTOR_OFFSET 8
#define BUFFER_ARRAY_OFFSET 12

.text
.abicalls
.align	2
.globl	printChar
.ent	printChar

printChar:
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
sw a0, buffer($fp)
sw a1, c($fp)

##############################
# body: printChar            #
##############################

# Store 'c' in buffer.
lw t0, buffer($fp)
lw t0, BUFFER_IDX_OFFSET(t0)
sll t0,t0,2

lw t1, buffer($fp)
lw t1, BUFFER_ARRAY_OFFSET(t1)

addu t0, t0, t1

# As 'c' is and unsigned char, we use 'lb'.
lw t1, c($fp)
sw t1, 0(t0) # TODO: SIGSEV aca.

# Increase index.
lw t0, buffer($fp)
lw t1, BUFFER_IDX_OFFSET(t0)
addi t1, t1, 1
sw t1, BUFFER_IDX_OFFSET(t0)

# Set variable 'bytesToWrite'.
lw t0, buffer($fp)
lw t0, BUFFER_IDX_OFFSET(t0)
sw t0, bytesToWrite($fp)

# Check if buffer is full.
lw t0, buffer($fp)
lw t1, BUFFER_IDX_OFFSET(t0)
lw t2, BUFFER_SIZE_OFFSET(t0)
bne t1, t2, exit

# Set variable 'bytesWriten'.
li t0, 0
sw t0, bytesWriten($fp)

# Set variable 'relativeIndex'.
lw t0, buffer($fp)
lw t0, 0(t0)
sw t0, relativeIndex($fp)

# Write cycle.
loop:
	# Check loop condition.
	lw t0, bytesWriten($fp)
	lw t1, bytesToWrite($fp)

	bge t0, t1, exitLoop

	# Decrement 'bytesToWrite'.
	lw t0, bytesToWrite($fp)
	lw t1, bytesWriten($fp)
	sub t0, t0, t1
	sw t0, bytesToWrite($fp)

	# Update 'relativeIndex'.
	lw t0, relativeIndex($fp)
	lw t1, bytesWriten($fp)
	addu t0, t0, t1
	sw t0, relativeIndex($fp)

	lw          a0, buffer($fp)
	lw          a0, BUFFER_FILE_DESCRIPTOR_OFFSET(a0)
	lw          a1, relativeIndex($fp)
	lw          a2, bytesToWrite($fp)
	li          v0, SYS_write
	syscall

	sw          v0, bytesWriten($fp)

  # Check if there were write errors.
  # TODO.

	b loop

exitLoop:
	# Set to zero the buffer index.
	li t0, 0
	lw t1, buffer($fp)
	sw t0, BUFFER_IDX_OFFSET(t1)

exit:
  li v0, 0
	move sp,$fp
	lw ra, RA(sp)
	lw $fp, FP(sp)
	sw  gp, GP(sp)

	addu sp, sp, SIZE
	j ra

.end printChar
