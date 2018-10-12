  #include <mips/regdef.h>
  #include <sys/syscall.h>

  #define SIZE 64

  # Saved-registers area (SRA).
  #define PADDING_1 1
  #define buffer 64
  #define c 1
  #define RA 56
  #define FP 52
  #define GP 48

  # Local and Temporary Area (LTA).
  #define relativeIndex 40
  #define bytesWriten 36
  #define bytesToWrite 32
  #define errsv 28

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
	.frame	$fp,SIZE,ra		# vars= 24, regs= 3/0, args= 16, extra= 8
	.set	noreorder
	.cpload	t9
	.set	reorder

  # Allocate memory for the stack.
	subu	sp,sp,SIZE
  # SRA beginning area.
	.cprestore 16

  # Save the callee-saved registers used by the caller in the SRA.
	sw	ra,RA(sp)
	sw	$fp,FP(sp)
	sw	gp,GP(sp)
  # We adopt the convention of using the frame pointer
  # as our index in the stack.
	move	$fp,sp

  # Now we save the arguments that were loaded by the caller
  # in the area reserved by the callee.
	sw	a0,buffer($fp)
	move	v0,a1

  ##############################
  # body: printChar            #
  ##############################
  # Store 'c' in buffer.
	sb	v0,24($fp)
	lw	v1,64($fp)
	lw	v0,64($fp)
	lw	v0,0(v0)
	addu	v0,v1,v0
	addu	v1,v0,8
	lbu	v0,24($fp)
	sb	v0,4(v1)
	lw	v1,64($fp)
	lw	v0,64($fp)
	lw	v0,0(v0)
	addu	v0,v0,1
	sw	v0,0(v1)
	lw	v0,64($fp)
	lw	v0,0(v0)
	sw	v0,32($fp)
	lw	v0,buffer($fp) # Get buffer beginning.
	lw	v1,buffer($fp) # Get buffer beginning.
	lw	a0,BUFFER_IDX_OFFSET(v0)
	lw	v0,BUFFER_SIZE_OFFSET(v1) # buffer->size
	bne	a0,v0,L18
	sw	zero,bytesWriten($fp)
	lw	v0,buffer($fp)
	addu	v0,v0,BUFFER_ARRAY_OFFSET # buffer->buffer
	sw	v0,relativeIndex($fp)
L19:
	lw	v0,bytesWriten($fp) # Prepare for bytesWriten < bytesToWrite condition.
	lw	v1,bytesToWrite($fp)
	sltu	v0,v0,v1
	bne	v0,zero,L21
	b	L20
L21:
	lw	v1,32($fp)
	lw	v0,bytesWriten($fp)
	subu	v0,v1,v0
	sw	v0,32($fp)
	lw	v1,40($fp)
	lw	v0,bytesWriten($fp)
	addu	v0,v1,v0
	sw	v0,40($fp)
	lw	v0,64($fp)
	lw	a0,8(v0)
	lw	a1,40($fp)
	lw	a2,32($fp)
	la	t9,write
	jal	ra,t9
	sw	v0,bytesWriten($fp)
	la	t9,__errno
	jal	ra,t9
	lw	v0,0(v0) # TODO: WTF
	sw	v0,errsv($fp)

	beq	v0,zero,L19

	sw	v0,44($fp)
	b	L17
L20:
	lw	v0,64($fp)
	sw	zero,0(v0)
  # Stack frame unwinding.
L18:
	sw	zero,44($fp)
L17:
	lw	v0,44($fp)
	move	sp,$fp
	lw	ra,RA(sp)
	lw	$fp,FP(sp)
	addu	sp,sp,SIZE
	j	ra

	.end	printChar
