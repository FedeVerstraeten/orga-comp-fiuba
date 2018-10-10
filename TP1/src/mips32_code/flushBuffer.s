	.file	1 "flushBuffer.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.text
	.align	2
	.globl	flushBuffer
	.ent	flushBuffer
flushBuffer:
	.frame	$fp,64,$ra		# vars= 24, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,64
	.cprestore 16
	sw	$ra,56($sp)
	sw	$fp,52($sp)
	sw	$gp,48($sp)
	move	$fp,$sp
	sw	$a0,64($fp)
	lw	$v0,64($fp)
	lw	$v0,0($v0)
	sw	$v0,28($fp)
	sw	$zero,32($fp)
	lw	$v0,64($fp)
	addu	$v0,$v0,12
	sw	$v0,36($fp)
$L18:
	lw	$v0,32($fp)
	lw	$v1,28($fp)
	sltu	$v0,$v0,$v1
	bne	$v0,$zero,$L20
	b	$L19
$L20:
	lw	$v1,28($fp)
	lw	$v0,32($fp)
	subu	$v0,$v1,$v0
	sw	$v0,28($fp)
	lw	$v1,36($fp)
	lw	$v0,32($fp)
	addu	$v0,$v1,$v0
	sw	$v0,36($fp)
	lw	$v0,64($fp)
	lw	$a0,8($v0)
	lw	$a1,36($fp)
	lw	$a2,28($fp)
	la	$t9,write
	jal	$ra,$t9
	sw	$v0,32($fp)
	la	$t9,__errno
	jal	$ra,$t9
	lw	$v0,0($v0)
	sw	$v0,24($fp)
	lw	$v0,24($fp)
	beq	$v0,$zero,$L18
	lw	$v0,24($fp)
	sw	$v0,40($fp)
	b	$L17
$L19:
	lw	$v0,64($fp)
	sw	$zero,0($v0)
	sw	$zero,40($fp)
$L17:
	lw	$v0,40($fp)
	move	$sp,$fp
	lw	$ra,56($sp)
	lw	$fp,52($sp)
	addu	$sp,$sp,64
	j	$ra
	.end	flushBuffer
	.size	flushBuffer, .-flushBuffer
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
