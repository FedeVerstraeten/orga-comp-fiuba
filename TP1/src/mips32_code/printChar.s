  #define SIZE 64

  #define RA 56
  #define FP 52
  #define GP 48

  #define relativeIndex 40
  #define bytesWriten 36
  #define bytesToWrite 32
  #define errsv 28

  .file	1 "printChar.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.text
	.align	2
	.globl	printChar
	.ent	printChar
printChar:
	.frame	$fp,SIZE,$ra		# vars= 24, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder

  # Allocate memory for the stack.
	subu	$sp,$sp,SIZE
	.cprestore 16

  # Save the callee-saved registers used by the caller in the SRA.
	sw	$ra,RA($sp)
	sw	$fp,FP($sp)
	sw	$gp,GP($sp)

  # We must set the $fp to the beginning of the stack.
	move	$fp,$sp
  # Now we save the arguments that were loaded by the caller
  # in the area reserved by the caller.
	sw	$a0,SIZE($fp)
	move	$v0,$a1
	sb	$v0,24($fp)
	lw	$v1,SIZE($fp)
	lw	$v0,SIZE($fp)
	lw	$v0,0($v0)
	addu	$v0,$v1,$v0
	addu	$v1,$v0,8
	lbu	$v0,24($fp)
	sb	$v0,4($v1)
	lw	$v1,SIZE($fp)
	lw	$v0,SIZE($fp)
	lw	$v0,0($v0)
	addu	$v0,$v0,1
	sw	$v0,0($v1)
	lw	$v0,SIZE($fp)
	lw	$v0,0($v0)
	sw	$v0,bytesToWrite($fp)
	lw	$v0,SIZE($fp)
	lw	$v1,SIZE($fp)
	lw	$a0,0($v0)
	lw	$v0,4($v1)
	bne	$a0,$v0,$L18
	sw	$zero,bytesWriten($fp)
	lw	$v0,SIZE($fp)
	addu	$v0,$v0,12
	sw	$v0,relativeIndex($fp)
$L19:
	lw	$v0,bytesWriten($fp)
	lw	$v1,bytesToWrite($fp)
	sltu	$v0,$v0,$v1
	bne	$v0,$zero,$L21
	b	$L20
$L21:
	lw	$v1,bytesToWrite($fp)
	lw	$v0,bytesWriten($fp)
	subu	$v0,$v1,$v0
	sw	$v0,bytesToWrite($fp)
	lw	$v1,relativeIndex($fp)
	lw	$v0,bytesWriten($fp)
	addu	$v0,$v1,$v0
	sw	$v0,relativeIndex($fp)
	lw	$v0,SIZE($fp)

  # Begin preparation for syscall.
	lw	$a0,8($v0)
	lw	$a1,relativeIndex($fp)
	lw	$a2,bytesToWrite($fp)
	la	$t9,write
	jal	$ra,$t9

  # Save the syscall result.
  sw	$v0,bytesWriten($fp)


	la	$t9,__errno
	jal	$ra,$t9
	lw	$v0,0($v0)
	sw	$v0,errsv($fp)
	lw	$v0,errsv($fp)

  # if (errsv)
	beq	$v0,$zero,$L19
	lw	$v0,errsv($fp)
	sw	$v0,44($fp)
	b	$L17
$L20:
	lw	$v0,SIZE($fp)
	sw	$zero,0($v0)
$L18:
	sw	$zero,44($fp)
$L17:
	lw	$v0,44($fp)
	move	$sp,$fp
	lw	$ra,RA($sp)
	lw	$fp,FP($sp)
	addu	$sp,$sp,SIZE
	j	$ra
	.end	printChar
	.size	printChar, .-printChar
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
