#include "base64_s.h"

# Argument-building area (ABA).
#define ARG0 0
#define ARG1 4
#define ARG2 8
#define ARG3 12

# Local and Temporary Area (LTA).
#define errsv 16
#define bytesToWrite 20
#define bytesWriten 24
#define relativeIndex 28

# Saved-registers area (SRA).
#define GP 32
#define FP 36
#define RA 40
#define buffer 44

#define SIZE buffer + 4

.text
.abicalls
.align	2
.globl	flushBuffer
.ent	flushBuffer

flushBuffer:
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

##############################
# body: printChar            #
##############################
# Set variable 'bytesToWrite'.
  lw t0, buffer($fp)
  lw t0, BUFFER_IDX_OFFSET(t0)
  sw t0, bytesToWrite($fp)

# Set variable 'bytesWriten'.
  li t0, 0
  sw t0, bytesWriten($fp)

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
  li t0, 0
	lw t1, buffer($fp)
	sw t0, BUFFER_IDX_OFFSET(t1)

return_0:
  li v0, 0

exit_function:
# Stack frame unwinding.
	lw ra, RA(sp)
	lw $fp, FP(sp)
	lw  gp, GP(sp)
	addu sp, sp, SIZE
	j ra

.end flushBuffer
