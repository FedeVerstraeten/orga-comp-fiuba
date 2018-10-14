  #include <mips/regdef.h>
  #include <sys/syscall.h>
  #include <sys/errno.h>

  #define ENCODER_OUTPUT_CHARS 2
  #define MAX_LINE_LENGHT 76
  #define BUFFER_SIZE 1024

  # Offsets in the 'buffer_t' structure.
  #define BUFFER_IDX_OFFSET 0
  #define BUFFER_SIZE_OFFSET 4
  #define BUFFER_FILE_DESCRIPTOR_OFFSET 8
  #define BUFFER_ARRAY_OFFSET 12

  #define SIZEOF_outBlock 1*ENCODER_OUTPUT_CHARS
  #define SIZEOF_inChar 1

  #define ERROR_NUMBER_OUTPUT_STREAM_WRITING_MSG 1
  #define ERROR_NUMBER_INPUT_STREAM_READING_MSG 2

  # Argument-building area (ABA).
  #define ARG0 0
  #define ARG1 4
  #define ARG2 8
  #define ARG3 12

  # Local and Temporary Area (LTA).
  #define inChar 16
  #define totalEncodedCharsCount 17
  #define encodedCharsCount 18
  #define inputEnded 19
  #define bytesRead 20
  #define nbytes 24
  #define nOutputBlock 28
  #define index1 32
  #define errsv 36
  #define outputBuffer 40
  #define outBlock 44 + BUFFER_SIZE + BUFFER_ARRAY_OFFSET
  #define PADDING_1 outBlock + 4

  # Saved-registers area (SRA).
  #define GP PADDING_1 + 4
  #define FP GP + 4
  #define RA FP + 4
  #define infd RA + 4
  #define outfd infd + 4
  #define PADDING_2 outfd + 4

  #define SIZE PADDING_2 + 4

	.text
  .abicalls
	.align	2
	.globl	base64_encode
	.ent	base64_encode
base64_encode:
  # Debugger metadata.
	.frame	$fp,SIZE,ra		# vars= 1080, regs= 3/0, args= 16, extra= 8

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
  # body: base64_encode        #
  ##############################
  # Initialize locals.
	sb	zero,inChar($fp)
	sb	zero,totalEncodedCharsCount($fp)
	sb	zero,encodedCharsCount($fp)
	sb	zero,inputEnded($fp)
	sw	zero,bytesRead($fp)
	sw	zero,nbytes($fp)
	sw	zero,nOutputBlock($fp)
	sw	zero,index1($fp)

  # Set bytes counters.
	li	t0,SIZEOF_inChar
	sw	t0,nbytes($fp)
	li	t0,SIZEOF_outBlock
	sw	t0,nOutputBlock($fp)

  # Set 'outputBuffer' fields.
	lw	t0,outfd($fp)
	sw	t0,(outputBuffer+BUFFER_FILE_DESCRIPTOR_OFFSET)($fp)
	sw	zero,(outputBuffer+BUFFER_IDX_OFFSET)($fp)
	li	t0,BUFFER_SIZE
	sw	t0,(outputBuffer+BUFFER_SIZE_OFFSET)($fp)

do_loop:
  #Clear outBlock.
  sw	  zero,index1($fp)
for_loop:
  # Check loop condition.
  lw	  t1,index1($fp)
  li    t2,ENCODER_OUTPUT_CHARS
  bge   t1,t2,end_clear_outblock
  # Load 'outBlock[index1]'.
	addu	t0,$fp,outBlock
	addu	t0,t1,t0
  sb    zero,0(t0)
  lw	  t0,index1($fp)
  addu	t0,t0,1
  sw	  t0,index1($fp)
  b     for_loop

end_clear_outblock:
  # Read from the input stream.
	lw	  a0,infd($fp)
	addu	a1,$fp,inChar
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
  b   exit_function

no_read_errors:
  # Check if input ended.
	lw	t0,bytesRead($fp)
	bne	t0,zero,encode
	li	t0,1
	sb	t0,inputEnded($fp)

encode:
  # Call 'base256ToBase64()' to encode input.
	addu	v0,$fp,outBlock
	lbu	  v1,inChar($fp)
	lb	  a2,inputEnded($fp)
	move	a0,v0
	move	a1,v1
	la	  t9,base256ToBase64
	jal	  ra,t9
  # Save encoder output.
	sb	  v0,encodedCharsCount($fp)

  # Check if we should insert a newline.
	lbu	  t0,totalEncodedCharsCount($fp)
	lbu	  t1,encodedCharsCount($fp)
	addu	t0,t1,t0

  li    t1,MAX_LINE_LENGHT
  bgt   t0,t1,else1
	lbu	  t0,totalEncodedCharsCount($fp)
	lbu	  t1,encodedCharsCount($fp)
	addu	t0,t0,t1
	sb	  t0,totalEncodedCharsCount($fp)
	b	    print_output_stream

else1:
  # Call 'printChar()'.
	addu	t0,$fp,outputBuffer
	move	a0,t0
  # We load the decimal ASCII code of '\n'.
	li	  a1,10
	la	  t9,printChar
	jal	  ra,t9
  # Save output.
	sw	  v0,errsv($fp)

  # Check if there were printing errors.
	beq	  v0,zero,no_print_errors1
	li	  v0,ERROR_NUMBER_OUTPUT_STREAM_WRITING_MSG
	b	    return_0

no_print_errors1:
	lbu	  t0,encodedCharsCount($fp)
	sb	  t0,totalEncodedCharsCount($fp)

print_output_stream:

  # If no newlines were needed, then we output
  # the encoded chars.
	sw	  zero,index1($fp)
print_output_stream_loop:
  # Load 'outBlock[index1]'.
	addu	t0,$fp,outBlock
	lw	  t1,index1($fp)
	addu	t0,t1,t0

  # Check the 'while' condition.
	lb	  t0,0(t0) # TODO: xq tengo que dejar esto?
	beq   t0,zero,end_print_output_stream

  # Call 'printChar()'.
	addu	a0,$fp,outputBuffer
	addu	t0,$fp,outBlock
	lw	  t1,index1($fp)
	addu	t0,t0,t1
	lbu	  t0,0(t0) # TODO: xq tengo que dejar esto?
	move	a1,t0
	la	  t9,printChar
	jal	  ra,t9

  # Save output.
	sw	  v0,errsv($fp)
  # Check if there were printing errors.
	beq	  v0,zero,no_print_errors2
	li	  v0,ERROR_NUMBER_OUTPUT_STREAM_WRITING_MSG
	b	    return_0

no_print_errors2:
  # Increment loop index.
	lw	  t0,index1($fp)
	addu	t0,t0,1
	sw	  t0,index1($fp)
	b	    print_output_stream_loop

end_print_output_stream:
	lw	  t0,bytesRead($fp)
	bgtz	t0,do_loop

  # Prepare 'flushBuffer' calling.
	addu	t0,$fp,outputBuffer
	move	a0,t0
	la	  t9,flushBuffer
	jal	  ra,t9

return_0:
  li v0, 0

exit_function:
  # Stack frame unwinding.
	lw	  ra,RA(sp)
	lw	  $fp,FP(sp)
	addu	sp,sp,SIZE
	j	ra
	.end	base64_encode
