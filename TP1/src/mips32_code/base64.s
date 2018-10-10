	.file	1 "base64.c"
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
	.align	2
$LC0:
	.ascii	"ERROR: Output error when writing stream.\n\000"
	.align	2
$LC1:
	.ascii	"ERROR: Input error when reading stream.\n\000"
	.align	2
$LC2:
	.ascii	"ERROR: Character is not in Base64 Table.\n\000"
	.globl	errmsg
	.data
	.align	2
	.type	errmsg, @object
	.size	errmsg, 16
errmsg:
	.word	0
	.word	$LC0
	.word	$LC1
	.word	$LC2
	.local	tailByte.0
	.comm	tailByte.0,1,1
	.type	bitMask.1, @object
	.size	bitMask.1, 1
bitMask.1:
	.byte	-4
	.align	2
	.type	shiftRightBit.2, @object
	.size	shiftRightBit.2, 4
shiftRightBit.2:
	.word	2
	.rdata
	.align	2
$LC3:
	.ascii	"=\000"
	.text
	.align	2
	.globl	base256ToBase64
	.ent	base256ToBase64
base256ToBase64:
	.frame	$fp,56,$ra		# vars= 16, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,56
	.cprestore 16
	sw	$ra,48($sp)
	sw	$fp,44($sp)
	sw	$gp,40($sp)
	move	$fp,$sp
	sw	$a0,56($fp)
	move	$v0,$a1
	move	$v1,$a2
	sb	$v0,24($fp)
	sb	$v1,25($fp)
	sb	$zero,26($fp)
	sb	$zero,27($fp)
	sb	$zero,28($fp)
	lbu	$v0,tailByte.0
	sb	$v0,27($fp)
	lb	$v1,25($fp)
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L18
	lw	$v1,shiftRightBit.2
	li	$v0,6			# 0x6
	bne	$v1,$v0,$L19
	lbu	$v0,27($fp)
	sb	$v0,26($fp)
	lbu	$v1,26($fp)
	la	$v0,translationTableB64
	addu	$v0,$v1,$v0
	lw	$a0,56($fp)
	move	$a1,$v0
	li	$a2,1			# 0x1
	la	$t9,strncpy
	jal	$ra,$t9
	lw	$a0,56($fp)
	la	$a1,$LC3
	li	$a2,1			# 0x1
	la	$t9,strncat
	jal	$ra,$t9
	lbu	$v0,28($fp)
	addu	$v0,$v0,2
	andi	$v0,$v0,0x00ff
	sw	$v0,32($fp)
	b	$L17
$L19:
	lw	$v1,shiftRightBit.2
	li	$v0,4			# 0x4
	bne	$v1,$v0,$L21
	lbu	$v0,27($fp)
	sb	$v0,26($fp)
	lbu	$v1,26($fp)
	la	$v0,translationTableB64
	addu	$v0,$v1,$v0
	lw	$a0,56($fp)
	move	$a1,$v0
	li	$a2,1			# 0x1
	la	$t9,strncpy
	jal	$ra,$t9
	lw	$a0,56($fp)
	la	$a1,$LC3
	li	$a2,1			# 0x1
	la	$t9,strncat
	jal	$ra,$t9
	lw	$a0,56($fp)
	la	$a1,$LC3
	li	$a2,1			# 0x1
	la	$t9,strncat
	jal	$ra,$t9
	lbu	$v0,28($fp)
	addu	$v0,$v0,3
	andi	$v0,$v0,0x00ff
	sw	$v0,32($fp)
	b	$L17
$L21:
	lbu	$v0,28($fp)
	sw	$v0,32($fp)
	b	$L17
$L18:
	lbu	$v1,24($fp)
	lbu	$v0,bitMask.1
	and	$v0,$v1,$v0
	sb	$v0,26($fp)
	lbu	$v1,26($fp)
	lw	$v0,shiftRightBit.2
	sra	$v0,$v1,$v0
	sb	$v0,26($fp)
	lbu	$v0,bitMask.1
	nor	$v0,$zero,$v0
	lbu	$v1,24($fp)
	and	$v0,$v1,$v0
	sb	$v0,tailByte.0
	lbu	$a0,tailByte.0
	li	$v1,6			# 0x6
	lw	$v0,shiftRightBit.2
	subu	$v0,$v1,$v0
	sll	$v0,$a0,$v0
	sb	$v0,tailByte.0
	lbu	$v1,26($fp)
	lbu	$v0,27($fp)
	or	$v0,$v1,$v0
	sb	$v0,26($fp)
	lbu	$v1,26($fp)
	la	$v0,translationTableB64
	addu	$v0,$v1,$v0
	lw	$a0,56($fp)
	move	$a1,$v0
	li	$a2,1			# 0x1
	la	$t9,strncpy
	jal	$ra,$t9
	lbu	$v0,28($fp)
	addu	$v0,$v0,1
	sb	$v0,28($fp)
	lw	$v0,shiftRightBit.2
	addu	$v0,$v0,2
	sw	$v0,shiftRightBit.2
	lbu	$v0,bitMask.1
	sll	$v0,$v0,2
	sb	$v0,bitMask.1
	andi	$v0,$v0,0x00ff
	bne	$v0,$zero,$L23
	li	$v0,-4			# 0xfffffffffffffffc
	sb	$v0,bitMask.1
	li	$v0,2			# 0x2
	sw	$v0,shiftRightBit.2
	lbu	$v1,tailByte.0
	la	$v0,translationTableB64
	addu	$v0,$v1,$v0
	lw	$a0,56($fp)
	move	$a1,$v0
	li	$a2,1			# 0x1
	la	$t9,strncat
	jal	$ra,$t9
	lbu	$v0,28($fp)
	addu	$v0,$v0,1
	sb	$v0,28($fp)
	sb	$zero,tailByte.0
$L23:
	lbu	$v0,28($fp)
	sw	$v0,32($fp)
$L17:
	lw	$v0,32($fp)
	move	$sp,$fp
	lw	$ra,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$ra
	.end	base256ToBase64
	.size	base256ToBase64, .-base256ToBase64
	.align	2
	.globl	base64_encode
	.ent	base64_encode
base64_encode:
	.frame	$fp,1128,$ra		# vars= 1088, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,1128
	.cprestore 16
	sw	$ra,1120($sp)
	sw	$fp,1116($sp)
	sw	$gp,1112($sp)
	move	$fp,$sp
	sw	$a0,1128($fp)
	sw	$a1,1132($fp)
	sb	$zero,24($fp)
	sb	$zero,25($fp)
	sh	$zero,32($fp)
	sb	$zero,40($fp)
	sb	$zero,41($fp)
	sw	$zero,44($fp)
	sw	$zero,48($fp)
	sw	$zero,52($fp)
	sw	$zero,56($fp)
	li	$v0,1			# 0x1
	sw	$v0,48($fp)
	li	$v0,2			# 0x2
	sw	$v0,52($fp)
	lw	$v0,1132($fp)
	sw	$v0,72($fp)
	sw	$zero,64($fp)
	li	$v0,1024			# 0x400
	sw	$v0,68($fp)
$L25:
	addu	$v0,$fp,32
	move	$a0,$v0
	move	$a1,$zero
	lw	$a2,52($fp)
	la	$t9,memset
	jal	$ra,$t9
	lw	$a0,1128($fp)
	addu	$a1,$fp,24
	lw	$a2,48($fp)
	la	$t9,read
	jal	$ra,$t9
	sw	$v0,44($fp)
	la	$t9,__errno
	jal	$ra,$t9
	lw	$v0,0($v0)
	sw	$v0,60($fp)
	lw	$v0,60($fp)
	beq	$v0,$zero,$L28
	li	$v0,2			# 0x2
	sw	$v0,1104($fp)
	b	$L24
$L28:
	lw	$v0,44($fp)
	bne	$v0,$zero,$L29
	li	$v0,1			# 0x1
	sb	$v0,25($fp)
$L29:
	addu	$v0,$fp,32
	lbu	$v1,24($fp)
	lb	$a2,25($fp)
	move	$a0,$v0
	move	$a1,$v1
	la	$t9,base256ToBase64
	jal	$ra,$t9
	sb	$v0,41($fp)
	lbu	$v1,40($fp)
	lbu	$v0,41($fp)
	addu	$v0,$v1,$v0
	slt	$v0,$v0,77
	beq	$v0,$zero,$L30
	lbu	$v0,40($fp)
	lbu	$v1,41($fp)
	addu	$v0,$v0,$v1
	sb	$v0,40($fp)
	b	$L31
$L30:
	addu	$v0,$fp,64
	move	$a0,$v0
	li	$a1,10			# 0xa
	la	$t9,printChar
	jal	$ra,$t9
	sw	$v0,60($fp)
	lw	$v0,60($fp)
	beq	$v0,$zero,$L32
	li	$v0,1			# 0x1
	sw	$v0,1104($fp)
	b	$L24
$L32:
	lbu	$v0,41($fp)
	sb	$v0,40($fp)
$L31:
	sw	$zero,56($fp)
$L33:
	addu	$v1,$fp,32
	lw	$v0,56($fp)
	addu	$v0,$v1,$v0
	lb	$v0,0($v0)
	bne	$v0,$zero,$L35
	b	$L27
$L35:
	addu	$a0,$fp,64
	addu	$v1,$fp,32
	lw	$v0,56($fp)
	addu	$v0,$v1,$v0
	lbu	$v0,0($v0)
	move	$a1,$v0
	la	$t9,printChar
	jal	$ra,$t9
	sw	$v0,60($fp)
	lw	$v0,60($fp)
	beq	$v0,$zero,$L36
	li	$v0,1			# 0x1
	sw	$v0,1104($fp)
	b	$L24
$L36:
	lw	$v0,56($fp)
	addu	$v0,$v0,1
	sw	$v0,56($fp)
	b	$L33
$L27:
	lw	$v0,44($fp)
	bgtz	$v0,$L25
	addu	$v0,$fp,64
	move	$a0,$v0
	la	$t9,flushBuffer
	jal	$ra,$t9
	sw	$zero,1104($fp)
$L24:
	lw	$v0,1104($fp)
	move	$sp,$fp
	lw	$ra,1120($sp)
	lw	$fp,1116($sp)
	addu	$sp,$sp,1128
	j	$ra
	.end	base64_encode
	.size	base64_encode, .-base64_encode
	.align	2
	.globl	base64ToBase256
	.ent	base64ToBase256
base64ToBase256:
	.frame	$fp,48,$ra		# vars= 32, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 0
	sw	$fp,44($sp)
	sw	$gp,40($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	sw	$a1,52($fp)
	sw	$a2,56($fp)
	li	$v0,-16777216			# 0xffffffffff000000
	sw	$v0,8($fp)
	sb	$zero,12($fp)
	sb	$zero,13($fp)
	sw	$zero,16($fp)
	sw	$zero,24($fp)
	sw	$zero,28($fp)
	sb	$zero,32($fp)
	sb	$zero,12($fp)
$L39:
	lbu	$v0,12($fp)
	sltu	$v0,$v0,4
	bne	$v0,$zero,$L42
	b	$L40
$L42:
	lbu	$v1,12($fp)
	lw	$v0,52($fp)
	addu	$v0,$v1,$v0
	lbu	$v1,0($v0)
	li	$v0,61			# 0x3d
	bne	$v1,$v0,$L43
	lbu	$v0,12($fp)
	addu	$v1,$fp,16
	addu	$v0,$v1,$v0
	sb	$zero,0($v0)
	b	$L41
$L43:
	sb	$zero,13($fp)
$L44:
	lbu	$v0,13($fp)
	sltu	$v0,$v0,64
	bne	$v0,$zero,$L47
	b	$L45
$L47:
	lbu	$v1,12($fp)
	lw	$v0,52($fp)
	addu	$v0,$v1,$v0
	lbu	$v1,0($v0)
	lbu	$v0,13($fp)
	lb	$v0,translationTableB64($v0)
	bne	$v1,$v0,$L46
	lbu	$v1,12($fp)
	addu	$v0,$fp,16
	addu	$v1,$v0,$v1
	lbu	$v0,13($fp)
	sb	$v0,0($v1)
	lw	$v1,56($fp)
	lw	$v0,56($fp)
	lbu	$v0,0($v0)
	addu	$v0,$v0,1
	sb	$v0,0($v1)
	b	$L45
$L46:
	lbu	$v0,13($fp)
	addu	$v0,$v0,1
	sb	$v0,13($fp)
	b	$L44
$L45:
	lbu	$v0,13($fp)
	sltu	$v0,$v0,64
	bne	$v0,$zero,$L41
	li	$v0,3			# 0x3
	sw	$v0,36($fp)
	b	$L38
$L41:
	lbu	$v0,12($fp)
	addu	$v0,$v0,1
	sb	$v0,12($fp)
	b	$L39
$L40:
	sb	$zero,12($fp)
$L50:
	lbu	$v0,12($fp)
	sltu	$v0,$v0,4
	bne	$v0,$zero,$L53
	b	$L51
$L53:
	lbu	$v0,32($fp)
	addu	$v0,$v0,2
	sb	$v0,32($fp)
	lbu	$v1,12($fp)
	addu	$v0,$fp,16
	addu	$v0,$v0,$v1
	lbu	$v0,0($v0)
	sw	$v0,24($fp)
	lbu	$v1,12($fp)
	li	$v0,3			# 0x3
	subu	$v0,$v0,$v1
	sll	$v1,$v0,3
	lw	$v0,24($fp)
	sll	$v0,$v0,$v1
	sw	$v0,24($fp)
	lbu	$v1,32($fp)
	lw	$v0,24($fp)
	sll	$v0,$v0,$v1
	sw	$v0,24($fp)
	lw	$v1,28($fp)
	lw	$v0,24($fp)
	or	$v0,$v1,$v0
	sw	$v0,28($fp)
	lbu	$v0,12($fp)
	addu	$v0,$v0,1
	sb	$v0,12($fp)
	b	$L50
$L51:
	sb	$zero,12($fp)
$L54:
	lw	$v1,28($fp)
	lw	$v0,8($fp)
	and	$v0,$v1,$v0
	sw	$v0,24($fp)
	lbu	$v1,12($fp)
	li	$v0,3			# 0x3
	subu	$v0,$v0,$v1
	sll	$v1,$v0,3
	lw	$v0,24($fp)
	srl	$v0,$v0,$v1
	sw	$v0,24($fp)
	lbu	$v1,12($fp)
	lw	$v0,48($fp)
	addu	$v1,$v1,$v0
	lbu	$v0,24($fp)
	sb	$v0,0($v1)
	lw	$v0,8($fp)
	srl	$v0,$v0,8
	sw	$v0,8($fp)
	lbu	$v0,12($fp)
	addu	$v0,$v0,1
	sb	$v0,12($fp)
	lbu	$v0,12($fp)
	sltu	$v0,$v0,3
	bne	$v0,$zero,$L54
	sw	$zero,36($fp)
$L38:
	lw	$v0,36($fp)
	move	$sp,$fp
	lw	$fp,44($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	base64ToBase256
	.size	base64ToBase256, .-base64ToBase256
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
$L59:
	sb	$zero,50($fp)
	sb	$zero,48($fp)
$L62:
	lbu	$v0,48($fp)
	sltu	$v0,$v0,4
	bne	$v0,$zero,$L65
	b	$L63
$L65:
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
	beq	$v0,$zero,$L66
	li	$v0,2			# 0x2
	sw	$v0,1112($fp)
	b	$L58
$L66:
	lbu	$v1,24($fp)
	li	$v0,10			# 0xa
	beq	$v1,$v0,$L68
	lbu	$v1,24($fp)
	li	$v0,9			# 0x9
	beq	$v1,$v0,$L68
	lbu	$v1,24($fp)
	li	$v0,32			# 0x20
	beq	$v1,$v0,$L68
	b	$L67
$L68:
	lbu	$v0,48($fp)
	addu	$v0,$v0,-1
	sb	$v0,48($fp)
	b	$L64
$L67:
	lbu	$v1,48($fp)
	addu	$v0,$fp,32
	addu	$v1,$v0,$v1
	lbu	$v0,24($fp)
	sb	$v0,0($v1)
	lw	$v0,56($fp)
	bne	$v0,$zero,$L64
	lbu	$v0,48($fp)
	beq	$v0,$zero,$L71
	addu	$v0,$fp,40
	addu	$v1,$fp,32
	addu	$a2,$fp,50
	move	$a0,$v0
	move	$a1,$v1
	la	$t9,base64ToBase256
	jal	$ra,$t9
	sw	$v0,52($fp)
	lw	$v0,52($fp)
	beq	$v0,$zero,$L72
	lw	$v0,52($fp)
	sw	$v0,1112($fp)
	b	$L58
$L72:
	sb	$zero,49($fp)
$L73:
	lbu	$v1,49($fp)
	lbu	$v0,50($fp)
	addu	$v0,$v0,-1
	slt	$v0,$v1,$v0
	bne	$v0,$zero,$L76
	b	$L71
$L76:
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
	beq	$v0,$zero,$L75
	li	$v0,1			# 0x1
	sw	$v0,1112($fp)
	b	$L58
$L75:
	lbu	$v0,49($fp)
	addu	$v0,$v0,1
	sb	$v0,49($fp)
	b	$L73
$L71:
	addu	$v0,$fp,72
	move	$a0,$v0
	la	$t9,flushBuffer
	jal	$ra,$t9
	sw	$zero,1112($fp)
	b	$L58
$L64:
	lbu	$v0,48($fp)
	addu	$v0,$v0,1
	sb	$v0,48($fp)
	b	$L62
$L63:
	addu	$v0,$fp,40
	addu	$v1,$fp,32
	addu	$a2,$fp,50
	move	$a0,$v0
	move	$a1,$v1
	la	$t9,base64ToBase256
	jal	$ra,$t9
	sw	$v0,52($fp)
	lw	$v0,52($fp)
	beq	$v0,$zero,$L78
	lw	$v0,52($fp)
	sw	$v0,1112($fp)
	b	$L58
$L78:
	sb	$zero,49($fp)
$L79:
	lbu	$v1,49($fp)
	lbu	$v0,50($fp)
	addu	$v0,$v0,-1
	slt	$v0,$v1,$v0
	bne	$v0,$zero,$L82
	b	$L59
$L82:
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
	beq	$v0,$zero,$L81
	li	$v0,1			# 0x1
	sw	$v0,1112($fp)
	b	$L58
$L81:
	lbu	$v0,49($fp)
	addu	$v0,$v0,1
	sb	$v0,49($fp)
	b	$L79
$L58:
	lw	$v0,1112($fp)
	move	$sp,$fp
	lw	$ra,1128($sp)
	lw	$fp,1124($sp)
	addu	$sp,$sp,1136
	j	$ra
	.end	base64_decode
	.size	base64_decode, .-base64_decode
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
