	.file	1 "base64_decode.c"
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
	.globl	base64_decode
	.ent	base64_decode
base64_decode:
	.frame	$fp,1136,$ra		# vars= 1096, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,1136
	.cprestore 16
	sw	$ra,1128($sp)
	sw	$fp,1124($sp)
	sw	$gp,1120($sp)
	move	$fp,$sp
	sw	$a0,1136($fp)
	sw	$a1,1140($fp)
	sb	$zero,24($fp)
	sw	$zero,32($fp)
	sh	$zero,40($fp)
	sb	$zero,42($fp)
	sb	$zero,49($fp)
	sb	$zero,50($fp)
	li	$v0,4			# 0x4
	sw	$v0,52($fp)
	sw	$zero,56($fp)
	sw	$zero,60($fp)
	li	$v0,1			# 0x1
	sw	$v0,60($fp)
	lw	$v0,1140($fp)
	sw	$v0,80($fp)
	sw	$zero,72($fp)
	li	$v0,1024			# 0x400
	sw	$v0,76($fp)
$L18:
	sb	$zero,50($fp)
	sb	$zero,48($fp)
$L21:
	lbu	$v0,48($fp)
	sltu	$v0,$v0,4
	bne	$v0,$zero,$L24
	b	$L22
$L24:
	lw	$a0,1136($fp)
	addu	$a1,$fp,24
	lw	$a2,60($fp)
	la	$t9,read
	jal	$ra,$t9
	sw	$v0,56($fp)
	la	$t9,__errno
	jal	$ra,$t9
	lw	$v0,0($v0)
	sw	$v0,64($fp)
	lw	$v0,64($fp)
	beq	$v0,$zero,$L25
	li	$v0,2			# 0x2
	sw	$v0,1112($fp)
	b	$L17
$L25:
	lbu	$v1,24($fp)
	li	$v0,10			# 0xa
	beq	$v1,$v0,$L27
	lbu	$v1,24($fp)
	li	$v0,9			# 0x9
	beq	$v1,$v0,$L27
	lbu	$v1,24($fp)
	li	$v0,32			# 0x20
	beq	$v1,$v0,$L27
	b	$L26
$L27:
	lbu	$v0,48($fp)
	addu	$v0,$v0,-1
	sb	$v0,48($fp)
	b	$L23
$L26:
	lbu	$v1,48($fp)
	addu	$v0,$fp,32
	addu	$v1,$v0,$v1
	lbu	$v0,24($fp)
	sb	$v0,0($v1)
	lw	$v0,56($fp)
	bne	$v0,$zero,$L23
	lbu	$v0,48($fp)
	beq	$v0,$zero,$L30
	addu	$v0,$fp,40
	addu	$v1,$fp,32
	addu	$a2,$fp,50
	move	$a0,$v0
	move	$a1,$v1
	la	$t9,base64ToBase256
	jal	$ra,$t9
	sw	$v0,52($fp)
	lw	$v0,52($fp)
	beq	$v0,$zero,$L31
	lw	$v0,52($fp)
	sw	$v0,1112($fp)
	b	$L17
$L31:
	sb	$zero,49($fp)
$L32:
	lbu	$v1,49($fp)
	lbu	$v0,50($fp)
	addu	$v0,$v0,-1
	slt	$v0,$v1,$v0
	bne	$v0,$zero,$L35
	b	$L30
$L35:
	addu	$a0,$fp,72
	lbu	$v1,49($fp)
	addu	$v0,$fp,40
	addu	$v0,$v0,$v1
	lbu	$v0,0($v0)
	move	$a1,$v0
	la	$t9,printChar
	jal	$ra,$t9
	sw	$v0,64($fp)
	lw	$v0,64($fp)
	beq	$v0,$zero,$L34
	li	$v0,1			# 0x1
	sw	$v0,1112($fp)
	b	$L17
$L34:
	lbu	$v0,49($fp)
	addu	$v0,$v0,1
	sb	$v0,49($fp)
	b	$L32
$L30:
	addu	$v0,$fp,72
	move	$a0,$v0
	la	$t9,flushBuffer
	jal	$ra,$t9
	sw	$zero,1112($fp)
	b	$L17
$L23:
	lbu	$v0,48($fp)
	addu	$v0,$v0,1
	sb	$v0,48($fp)
	b	$L21
$L22:
	addu	$v0,$fp,40
	addu	$v1,$fp,32
	addu	$a2,$fp,50
	move	$a0,$v0
	move	$a1,$v1
	la	$t9,base64ToBase256
	jal	$ra,$t9
	sw	$v0,52($fp)
	lw	$v0,52($fp)
	beq	$v0,$zero,$L37
	lw	$v0,52($fp)
	sw	$v0,1112($fp)
	b	$L17
$L37:
	sb	$zero,49($fp)
$L38:
	lbu	$v1,49($fp)
	lbu	$v0,50($fp)
	addu	$v0,$v0,-1
	slt	$v0,$v1,$v0
	bne	$v0,$zero,$L41
	b	$L18
$L41:
	addu	$a0,$fp,72
	lbu	$v1,49($fp)
	addu	$v0,$fp,40
	addu	$v0,$v0,$v1
	lbu	$v0,0($v0)
	move	$a1,$v0
	la	$t9,printChar
	jal	$ra,$t9
	sw	$v0,64($fp)
	lw	$v0,64($fp)
	beq	$v0,$zero,$L40
	li	$v0,1			# 0x1
	sw	$v0,1112($fp)
	b	$L17
$L40:
	lbu	$v0,49($fp)
	addu	$v0,$v0,1
	sb	$v0,49($fp)
	b	$L38
$L17:
	lw	$v0,1112($fp)
	move	$sp,$fp
	lw	$ra,1128($sp)
	lw	$fp,1124($sp)
	addu	$sp,$sp,1136
	j	$ra
	.end	base64_decode
	.size	base64_decode, .-base64_decode
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
