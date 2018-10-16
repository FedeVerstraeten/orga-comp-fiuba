#include "base64_s.h"

# Argument-building area (ABA).
#define ARG0 0
#define ARG1 4
#define ARG2 8
#define ARG3 12

# Local and Temporary Area (LTA).
#define readChar 16
#define inBlock readChar + B64_CHARS_PER_BLOCK
#define outBlock inBlock + OUTPUT_BLOCK_SIZE + 1
#define index1 outBlock + 4
#define index2 index1 + 1
#define decodedCharsCount index2 + 1
#define decodingState decodedCharsCount + 2
#define bytesRead decodingState + 4
#define nbytes bytesRead + 4
#define errsv nbytes + 4
#define outputBuffer errsv + 4

# Saved-registers area (SRA).
#define GP outputBuffer + BUFFER_SIZE + BUFFER_ARRAY_OFFSET
#define FP GP + 4
#define RA FP + 4
#define infd RA + 4
#define outfd infd + 4

#define SIZE outfd + 4

.text
.abicalls
.align	2
.globl	base64_decode
.ent	base64_decode
base64_decode:
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
  sw	ra,RA(sp)
  sw	$fp,FP(sp)
  sw	gp,GP(sp)

# We adopt the convention of using the frame pointer
# as our index in the stack.
  move	$fp,sp

# Now we save the arguments that were loaded by the caller
# in the area reserved by the callee.
  sw	a0,infd($fp)
  sw	a1,outfd($fp)

##############################
# body: base64_decode        #
##############################
# Initialize locals.
	sb	zero,readChar($fp)
	sw	zero,inBlock($fp)
	sh	zero,outBlock($fp)
	sb	zero,index2($fp)
	sb	zero,decodedCharsCount($fp)
	li	v0,4
	sw	v0,decodingState($fp)
	sw	zero,bytesRead($fp)
	sw	zero,nbytes($fp)

  # Set bytes counters.
	li	v0,SIZEOF_UCHAR
	sw	v0,nbytes($fp)

  # Set 'outputBuffer' fields.
	lw	v0,outfd($fp)
	sw	v0,(outputBuffer+BUFFER_FILE_DESCRIPTOR_OFFSET)($fp)
	sw	zero,(outputBuffer+BUFFER_IDX_OFFSET)($fp)
	li	v0,BUFFER_SIZE
	sw	v0,(outputBuffer+BUFFER_SIZE_OFFSET)($fp)

infinite_while_loop:
#Clear 'decodedCharsCount'.
	sb	zero,decodedCharsCount($fp)
	sb	zero,index1($fp)
for1_loop:
# Check loop condition.
  lbu	  t1,index1($fp)
  li    t2,B64_CHARS_PER_BLOCK
  bge   t1,t2,decode_buffer

# Read from the input stream.
  lw	  a0,infd($fp)
  addu	a1,$fp,readChar
  lw	  a2,nbytes($fp)
  li    v0, SYS_read
  syscall
  # Store the syscall return value.
  sw	  v0,bytesRead($fp)

  # Check if there were write errors.
  lw  t0,errno
  sw	t0,errsv($fp)
	beq	t0,zero,no_read_errors
	li	v0,ERROR_NUMBER_INPUT_STREAM_READING_MSG
	b	  exit_function

no_read_errors:
# Discard detected whitespaces.
# We load the decimal ASCII code of 'LF'.
  lbu   t0,readChar($fp)
  li	  t1,ASCII_LF
  beq   t0,t1,whitespace_read
# We load the decimal ASCII code of 'Tab'.
  li	  t1,ASCII_TAB
  beq   t0,t1,whitespace_read
# We load the decimal ASCII code of 'Space'.
  li	  t1,ASCII_SPACE
  beq   t0,t1,whitespace_read

whitespace_else:
# Store 'readChar'.
  lbu   t0,readChar($fp)
  lbu	  t1,index1($fp)
  addu	t2,$fp,inBlock
  addu	t2,t1,t2
  sb    t0, 0(t2)
  b	check_input_ended

whitespace_read:
  lbu   t0,index1($fp)
  li    t1,1
  subu  t0,t0,t1
  sb    t0,index1($fp)
	b	    next_for1_loop_iteration

check_input_ended:
# Check if input ended.
  lw	t0,bytesRead($fp)
  bne	t0,zero,next_for1_loop_iteration

# Flush the buffer.
	lbu	v0,index1($fp)
	beq	v0,zero,flush_buffer
  lbu   a0,outBlock($fp)
  lbu   a1,inBlock($fp)
  lbu   a2,decodedCharsCount($fp)
	la	t9,b64To256
	jal	ra,t9
# Save decoder output.
	sw	v0,decodingState($fp)
# Check if there were decoding errors.
	beq	v0,zero,no_decoding_errors1
	b	exit_function

# Print chars.
no_decoding_errors1:
  sb	zero,index2($fp)
# Check loop condition.
  lbu	  t0,index2($fp)
  lbu   t1,decodedCharsCount($fp)
  li    t2,1
  subu  t1,t1,t2
  bge   t0,t1,flush_buffer

# Call 'printChar()'.
  lw	  a0,outputBuffer($fp)
  # Load 'outBlock[index2]'.
  lbu	  t0,index2($fp)
  lw	  t1,outBlock($fp)
  addu	a1,t1,t0
  la	  t9,printChar
  jal	  ra,t9
  # Save output.
  sw	  v0,errsv($fp)

  # Check if there were printing errors.
  beq	  v0,zero,next_for2_loop_iteration
  li	  v0,ERROR_NUMBER_OUTPUT_STREAM_WRITING_MSG
  b	    exit_function

next_for2_loop_iteration:
	lbu	  t0,index2($fp)
  li    t1,1
  addu  t0,t0,t1
	sb	  t0,index2($fp)
	b	    no_decoding_errors1

flush_buffer:
  addu	t0,$fp,outputBuffer
  move	a0,t0
  la    t9,flushBuffer
  jal   ra,t9
  li    v0,0
  b     exit_function

next_for1_loop_iteration:
	lbu	  t0,index1($fp)
  li    t1,1
  addu  t0,t0,t1
	sb	  t0,index1($fp)
	b	for1_loop

decode_buffer:
# Translate inBlock into base256.
# Note: lbu   a0,outBlock($fp) doesn't work.
	addu	t0,$fp,outBlock
  move	a0,t0
	addu	t1,$fp,inBlock
  move	a1,t1
	addu	a2,$fp,decodedCharsCount
	la	  t9,b64To256
	jal	  ra,t9
  # Save decoder output.
	sw	  v0,decodingState($fp)
  # Check if there were decoding errors.
	beq	  v0,zero,for3_loop
	b	    exit_function

# Print chars.
for3_loop:
	sb	  zero,index2($fp)
no_decoding_errors2:
  lbu	  t0,index2($fp)
  lbu   t1,decodedCharsCount($fp)
  li    t2,1
  subu  t1,t1,t2
  bge   t0,t1,infinite_while_loop

# Call 'printChar()'.
# Note: lw	a0,outputBuffer($fp) doesn't work.
	addu	a0,$fp,outputBuffer
  # Load 'outBlock[index2]'.
	lbu	  t0,index2($fp)
	addu	t1,$fp,outBlock
	addu	t0,t1,t0
  # We are loading a byte only, not the entire word.
	lbu	  t0,0(t0)
	move	a1,t0

	la	  t9,printChar
	jal	  ra,t9
# Save output.
	sw	  v0,errsv($fp)

# Check if there were printing errors.
	beq	  v0,zero,next_for3_loop_iteration
	li	  v0,ERROR_NUMBER_OUTPUT_STREAM_WRITING_MSG
	b	    exit_function

next_for3_loop_iteration:
  lbu   t0,index2($fp)
  li    t1,1
  addu  t0,t0,t1
  sb    t0,index2($fp)
  b     no_decoding_errors2

# If we got up to this point, then there were errors.
# We must flush the output buffer and exit.
flush_buffer2:
  addu	t0,$fp,outputBuffer
  move	a0,t0
  la    t9,flushBuffer
  jal   ra,t9
  li    v0,ERROR_NUMBER_OUTPUT_STREAM_WRITING_MSG

exit_function:
# Stack frame unwinding.
	lw	ra,RA(sp)
	lw	$fp,FP(sp)
	addu	sp,sp,SIZE
	j	ra
.end	base64_decode
