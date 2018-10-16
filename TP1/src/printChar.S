#include <mips/regdef.h>
#include <sys/syscall.h>
#include <sys/errno.h>

#define SIZE 56

# Saved-registers area (SRA).
#define PADDING_1 52
#define buffer 48

# Bear in mind that 'c' is an 'unsigned char'
# whose size is 1 byte.
#define c 44

#define RA 40
#define FP 36
#define GP 32

# Local and Temporary Area (LTA).
#define relativeIndex 28
#define bytesWriten 24
#define bytesToWrite 20
#define errsv 16

# Argument-building area (ABA).
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
# We adopt the convention of using the frame pointer
# as our index in the stack.
  move $fp,sp

# Now we save the arguments that were loaded by the caller
# in the area reserved by the callee.
  sw a0, buffer($fp)
  sb a1, c($fp)

##############################
# body: printChar            #
##############################
# Store 'c' in buffer.
  lw t0, buffer($fp)
  lw t0, BUFFER_IDX_OFFSET(t0)
  lw t1, buffer($fp)
  addu t1, t0, t1
# As 'c' is 'unsigned char', we use 'lbu' to eliminate
# sign extension.
  lbu t2, c($fp)
  sb t2, BUFFER_ARRAY_OFFSET(t1)

# Increase index.
  lw t0, buffer($fp)
  lw t1, BUFFER_IDX_OFFSET(t0)
  addu t1, t1, 1
  sw t1, BUFFER_IDX_OFFSET(t0)

# Set variable 'bytesToWrite'.
  lw t0, buffer($fp)
  lw t0, BUFFER_IDX_OFFSET(t0)
  sw t0, bytesToWrite($fp)

# Check if buffer is full.
  lw t0, buffer($fp)
  lw t1, BUFFER_IDX_OFFSET(t0)
  lw t2, BUFFER_SIZE_OFFSET(t0)
  bne t1, t2, return_0

# Set variable 'bytesWriten'.
  sw zero, bytesWriten($fp)

# Set variable 'relativeIndex'.
  lw t0, buffer($fp)
  addu t0,t0,BUFFER_ARRAY_OFFSET
  sw t0, relativeIndex($fp)

# Write cycle.
while_loop:
# Check loop condition.
	lw t0, bytesWriten($fp)
	lw t1, bytesToWrite($fp)

	bge t0, t1, exitLoop

# Decrement 'bytesToWrite'.
	lw t0, bytesToWrite($fp)
	lw t1, bytesWriten($fp)
	subu t0, t0, t1
	sw t0, bytesToWrite($fp)

# Update 'relativeIndex'.
	lw t0, relativeIndex($fp)
	lw t1, bytesWriten($fp)
	addu t0, t0, t1
	sw t0, relativeIndex($fp)

	lw a0, buffer($fp)
	lw a0, BUFFER_FILE_DESCRIPTOR_OFFSET(a0)
	lw a1, relativeIndex($fp)
	lw a2, bytesToWrite($fp)
	li v0, SYS_write
	syscall

	sw v0, bytesWriten($fp)

# Check if there were write errors.
  lw  v0,errno
  sw	v0,errsv($fp)
  beq	v0,zero,while_loop
  b exit_function

exitLoop:
# Set to zero the buffer index.
	lw t1, buffer($fp)
	sw zero, BUFFER_IDX_OFFSET(t1)

return_0:
  li v0, 0

exit_function:
# Stack frame unwinding.
	lw ra, RA(sp)
	lw $fp, FP(sp)
	lw  gp, GP(sp)
	addu sp, sp, SIZE
	j ra

.end printChar
