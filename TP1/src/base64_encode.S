#include <mips/regdef.h>
#include <sys/syscall.h>
#include <sys/errno.h>

#define ENCODER_OUTPUT_CHARS 2
#define MAX_LINE_LENGHT 76
#define BUFFER_SIZE 1024

# Argument-building area (ABA).
#define ARG0 0
#define ARG1 4
#define ARG2 8
#define ARG3 12

# Local and Temporary Area (LTA).
#define inChar 16
#define totalEncodedCharsCount 20
#define encodedCharsCount 24
#define inputEnded 28
#define bytesRead 32
#define nbytes 36
#define nOutputBlock 40
#define index1 44
#define errsv 48
#define outputBuffer 52
#define outBlock 56

# Saved-registers area (SRA).
#define GP outBlock + 4*ENCODER_OUTPUT_CHARS
#define FP GP + 4
#define RA FP + 4
#define outfd RA + 4
#define infd outfd + 4

#define SIZE infd + 4

# Offsets in the 'buffer_t' structure.
#define BUFFER_IDX_OFFSET 0
#define BUFFER_SIZE_OFFSET 4
#define BUFFER_FILE_DESCRIPTOR_OFFSET 8
#define BUFFER_ARRAY_OFFSET 12

#define SIZEOF_outBlock 1*ENCODER_OUTPUT_CHARS

.text
.abicalls
.align	2
.globl	base64_encode
.ent	base64_encode

base64_encode:
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
sw a0, infd($fp)
sw a1, outfd($fp)

##############################
# body: base64_encode        #
##############################
sw    zero, inChar($fp)
sw    zero, totalEncodedCharsCount($fp)
sw    zero, encodedCharsCount($fp)
sw    zero, inputEnded($fp)
sw    zero, bytesRead($fp)
sw    zero, nbytes($fp)
sw    zero, nOutputBlock($fp)
sw    zero, index1($fp)

li    t0, 1
sw    t0, nbytes($fp)
li    t0, SIZEOF_outBlock
sw    t0, nOutputBlock($fp)










# Set variable 'bytesToWrite'.
lw t0, buffer($fp)
lw t0, BUFFER_IDX_OFFSET(t0)
sw t0, bytesToWrite($fp)

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

.end base64_encode
