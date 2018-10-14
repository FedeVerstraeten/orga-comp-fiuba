	.file	1 "base64_encode.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.rdata
	.align	2
	.type	translationTableB64, @object
	.size	translationTableB64, 64
translationTableB64:
	.ascii	"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123"
	.ascii	"456789+/"
	.text
	.align	2
	.globl	base64_encode
	.ent	base64_encode
base64_encode:
	.frame	$fp,1120,$ra		# vars= 1080, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,1120
	.cprestore 16
	sw	$ra,1112($sp)
	sw	$fp,1108($sp)
	sw	$gp,1104($sp)
	move	$fp,$sp
	sw	$a0,1120($fp)
	sw	$a1,1124($fp)
	sb	$zero,24($fp)
	sb	$zero,25($fp)
	sb	$zero,26($fp)
	sb	$zero,27($fp)
	sw	$zero,28($fp)
	sw	$zero,32($fp)
	sw	$zero,36($fp)
	sw	$zero,40($fp)
	sh	$zero,1088($fp)
	li	$v0,1			# 0x1
	sw	$v0,32($fp)
	li	$v0,2			# 0x2
	sw	$v0,36($fp)
	lw	$v0,1124($fp)
	sw	$v0,56($fp)
	sw	$zero,48($fp)
	li	$v0,1024			# 0x400
	sw	$v0,52($fp)
$L18:
	sw	zero,index1($fp)
$L21:
	lw	  t0,index1($fp)
	sltu	t0,t0,ENCODER_OUTPUT_CHARS
	bne	  t0,zero,L24
	b	    L22
L24:
	addu	t1,$fp,outBlock
	lw	  t0,index1($fp)
	addu	t0,t1,t0
	sb	  zero,0(t0)
	lw	  t0,index1($fp)
	addu	t0,t0,1
	sw	  t0,index1($fp)
	b	    L21
L22:
	lw	$a0,1120($fp)
	addu	$a1,$fp,24
	lw	$a2,32($fp)
	la	$t9,read
	jal	$ra,$t9
	sw	$v0,28($fp)
	la	$t9,__errno
	jal	$ra,$t9
	lw	$v0,0($v0)
	sw	$v0,44($fp)
	lw	$v0,44($fp)
	beq	$v0,$zero,$L25
	li	$v0,2			# 0x2
	sw	$v0,1096($fp)
	b	$L17
$L25:
	lw	$v0,28($fp)
	bne	$v0,$zero,$L26
	li	$v0,1			# 0x1
	sb	$v0,27($fp)
$L26:
	addu	$v0,$fp,1088
	lbu	$v1,24($fp)
	lb	$a2,27($fp)
	move	$a0,$v0
	move	$a1,$v1
	la	$t9,base256ToBase64
	jal	$ra,$t9
	sb	$v0,26($fp)
	lbu	$v1,25($fp)
	lbu	$v0,26($fp)
	addu	$v0,$v1,$v0
	slt	$v0,$v0,77
	beq	$v0,$zero,$L27
	lbu	$v0,25($fp)
	lbu	$v1,26($fp)
	addu	$v0,$v0,$v1
	sb	$v0,25($fp)
	b	$L28
$L27:
	addu	$v0,$fp,48
	move	$a0,$v0
	li	$a1,10			# 0xa
	la	$t9,printChar
	jal	$ra,$t9
	sw	$v0,44($fp)
	lw	$v0,44($fp)
	beq	$v0,$zero,$L29
	li	$v0,1			# 0x1
	sw	$v0,1096($fp)
	b	$L17
$L29:
	lbu	$v0,26($fp)
	sb	$v0,25($fp)
$L28:
	sw	$zero,40($fp)
$L30:
	addu	$v1,$fp,1088
	lw	$v0,40($fp)
	addu	$v0,$v1,$v0
	lb	$v0,0($v0)
	bne	$v0,$zero,$L32
	b	$L20
$L32:
	addu	$a0,$fp,48
	addu	$v1,$fp,1088
	lw	$v0,40($fp)
	addu	$v0,$v1,$v0
	lb	$v0,0($v0)
	move	$a1,$v0
	la	$t9,printChar
	jal	$ra,$t9
	sw	$v0,44($fp)
	lw	$v0,44($fp)
	beq	$v0,$zero,$L33
	li	$v0,1			# 0x1
	sw	$v0,1096($fp)
	b	$L17
$L33:
	lw	$v0,40($fp)
	addu	$v0,$v0,1
	sw	$v0,40($fp)
	b	$L30
$L20:
	lw	$v0,28($fp)
	bgtz	$v0,$L18
	addu	$v0,$fp,48
	move	$a0,$v0
	la	$t9,flushBuffer
	jal	$ra,$t9
	sw	$zero,1096($fp)
$L17:
	lw	$v0,1096($fp)
	move	$sp,$fp
	lw	$ra,1112($sp)
	lw	$fp,1108($sp)
	addu	$sp,$sp,1120
	j	$ra
	.end	base64_encode
	.size	base64_encode, .-base64_encode
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
