	.file	1 "decoder.c"
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
	.ascii	"ERROR: Character is not in Base64 Table.\n\000"
	.text
	.align	2
	.globl	base64ToBase256
	.ent	base64ToBase256
base64ToBase256:
	.frame	$fp,72,$31		# vars= 32, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,72
	.cprestore 16
	sw	$31,64($sp)
	sw	$fp,60($sp)
	sw	$28,56($sp)
	move	$fp,$sp
	sw	$4,72($fp)
	sw	$5,76($fp)
	sw	$6,80($fp)
	li	$2,-16777216			# 0xffffffffff000000
	sw	$2,24($fp)
	sb	$0,28($fp)
	sb	$0,29($fp)
	sw	$0,32($fp)
	sw	$0,40($fp)
	sw	$0,44($fp)
	sb	$0,48($fp)
	sb	$0,28($fp)
$L6:
	lbu	$2,28($fp)
	sltu	$2,$2,4
	bne	$2,$0,$L9
	b	$L7
$L9:
	lbu	$3,28($fp)
	lw	$2,76($fp)
	addu	$2,$3,$2
	lbu	$3,0($2)
	li	$2,61			# 0x3d
	bne	$3,$2,$L10
	lbu	$2,28($fp)
	addu	$3,$fp,32
	addu	$2,$3,$2
	sb	$0,0($2)
	b	$L8
$L10:
	sb	$0,29($fp)
$L11:
	lbu	$2,29($fp)
	sltu	$2,$2,64
	bne	$2,$0,$L14
	b	$L12
$L14:
	lbu	$3,28($fp)
	lw	$2,76($fp)
	addu	$2,$3,$2
	lbu	$3,0($2)
	lbu	$2,29($fp)
	lb	$2,translationTableB64($2)
	bne	$3,$2,$L13
	lbu	$3,28($fp)
	addu	$2,$fp,32
	addu	$3,$2,$3
	lbu	$2,29($fp)
	sb	$2,0($3)
	lw	$3,80($fp)
	lw	$2,80($fp)
	lbu	$2,0($2)
	addu	$2,$2,1
	sb	$2,0($3)
	b	$L12
$L13:
	lbu	$2,29($fp)
	addu	$2,$2,1
	sb	$2,29($fp)
	b	$L11
$L12:
	lbu	$2,29($fp)
	sltu	$2,$2,64
	bne	$2,$0,$L8
	la	$4,__sF+176
	la	$5,$LC0
	la	$25,fprintf
	jal	$31,$25
	li	$2,1			# 0x1
	sw	$2,52($fp)
	b	$L5
$L8:
	lbu	$2,28($fp)
	addu	$2,$2,1
	sb	$2,28($fp)
	b	$L6
$L7:
	sb	$0,28($fp)
$L17:
	lbu	$2,28($fp)
	sltu	$2,$2,4
	bne	$2,$0,$L20
	b	$L18
$L20:
	lbu	$2,48($fp)
	addu	$2,$2,2
	sb	$2,48($fp)
	lbu	$3,28($fp)
	addu	$2,$fp,32
	addu	$2,$2,$3
	lbu	$2,0($2)
	sw	$2,40($fp)
	lbu	$3,28($fp)
	li	$2,3			# 0x3
	subu	$2,$2,$3
	sll	$3,$2,3
	lw	$2,40($fp)
	sll	$2,$2,$3
	sw	$2,40($fp)
	lbu	$3,48($fp)
	lw	$2,40($fp)
	sll	$2,$2,$3
	sw	$2,40($fp)
	lw	$3,44($fp)
	lw	$2,40($fp)
	or	$2,$3,$2
	sw	$2,44($fp)
	lbu	$2,28($fp)
	addu	$2,$2,1
	sb	$2,28($fp)
	b	$L17
$L18:
	sb	$0,28($fp)
$L21:
	lw	$3,44($fp)
	lw	$2,24($fp)
	and	$2,$3,$2
	sw	$2,40($fp)
	lbu	$3,28($fp)
	li	$2,3			# 0x3
	subu	$2,$2,$3
	sll	$3,$2,3
	lw	$2,40($fp)
	srl	$2,$2,$3
	sw	$2,40($fp)
	lbu	$3,28($fp)
	lw	$2,72($fp)
	addu	$3,$3,$2
	lbu	$2,40($fp)
	sb	$2,0($3)
	lw	$2,24($fp)
	srl	$2,$2,8
	sw	$2,24($fp)
	lbu	$2,28($fp)
	addu	$2,$2,1
	sb	$2,28($fp)
	lbu	$2,28($fp)
	sltu	$2,$2,3
	bne	$2,$0,$L21
	sw	$0,52($fp)
$L5:
	lw	$2,52($fp)
	move	$sp,$fp
	lw	$31,64($sp)
	lw	$fp,60($sp)
	addu	$sp,$sp,72
	j	$31
	.end	base64ToBase256
	.size	base64ToBase256, .-base64ToBase256
	.rdata
	.align	2
$LC1:
	.ascii	"Input error when reading stream.\n\000"
	.align	2
$LC2:
	.ascii	"Output error when writing stream.\n\000"
	.text
	.align	2
	.globl	decode
	.ent	decode
decode:
	.frame	$fp,80,$31		# vars= 40, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,80
	.cprestore 16
	sw	$31,72($sp)
	sw	$fp,68($sp)
	sw	$28,64($sp)
	move	$fp,$sp
	sw	$4,80($fp)
	sw	$0,32($fp)
	sh	$0,40($fp)
	sb	$0,42($fp)
	sb	$0,49($fp)
	sb	$0,50($fp)
$L26:
	sb	$0,50($fp)
	sb	$0,48($fp)
$L29:
	lbu	$2,48($fp)
	sltu	$2,$2,4
	bne	$2,$0,$L32
	b	$L30
$L32:
	lw	$2,80($fp)
	lw	$3,4($2)
	lw	$2,80($fp)
	lw	$2,4($2)
	lw	$2,4($2)
	addu	$2,$2,-1
	sw	$2,4($3)
	bgez	$2,$L33
	lw	$2,80($fp)
	lw	$4,4($2)
	la	$25,__srget
	jal	$31,$25
	sb	$2,56($fp)
	b	$L34
$L33:
	lw	$2,80($fp)
	lw	$4,4($2)
	lw	$2,0($4)
	move	$3,$2
	lbu	$3,0($3)
	sb	$3,56($fp)
	addu	$2,$2,1
	sw	$2,0($4)
$L34:
	lbu	$2,56($fp)
	sb	$2,24($fp)
	lw	$2,80($fp)
	lw	$2,4($2)
	lhu	$2,12($2)
	srl	$2,$2,6
	andi	$2,$2,0x1
	beq	$2,$0,$L35
	la	$4,__sF+176
	la	$5,$LC1
	la	$25,fprintf
	jal	$31,$25
	li	$2,1			# 0x1
	sw	$2,52($fp)
	b	$L25
$L35:
	lbu	$3,24($fp)
	li	$2,10			# 0xa
	beq	$3,$2,$L37
	lbu	$3,24($fp)
	li	$2,9			# 0x9
	beq	$3,$2,$L37
	lbu	$3,24($fp)
	li	$2,32			# 0x20
	beq	$3,$2,$L37
	b	$L36
$L37:
	lbu	$2,48($fp)
	addu	$2,$2,-1
	sb	$2,48($fp)
	b	$L31
$L36:
	lbu	$3,48($fp)
	addu	$2,$fp,32
	addu	$3,$2,$3
	lbu	$2,24($fp)
	sb	$2,0($3)
	lw	$2,80($fp)
	lw	$2,4($2)
	lhu	$2,12($2)
	srl	$2,$2,5
	andi	$2,$2,0x1
	beq	$2,$0,$L31
	lbu	$2,48($fp)
	beq	$2,$0,$L40
	addu	$2,$fp,40
	addu	$3,$fp,32
	addu	$6,$fp,50
	move	$4,$2
	move	$5,$3
	la	$25,base64ToBase256
	jal	$31,$25
	move	$3,$2
	li	$2,1			# 0x1
	bne	$3,$2,$L41
	li	$2,1			# 0x1
	sw	$2,52($fp)
	b	$L25
$L41:
	sb	$0,49($fp)
$L42:
	lbu	$3,49($fp)
	lbu	$2,50($fp)
	addu	$2,$2,-1
	slt	$2,$3,$2
	bne	$2,$0,$L45
	b	$L43
$L45:
	lbu	$3,49($fp)
	addu	$2,$fp,40
	addu	$2,$2,$3
	lbu	$2,0($2)
	lw	$3,80($fp)
	move	$4,$2
	lw	$5,8($3)
	la	$25,fputc
	jal	$31,$25
	lbu	$2,49($fp)
	addu	$2,$2,1
	sb	$2,49($fp)
	b	$L42
$L43:
	lw	$2,80($fp)
	lw	$2,8($2)
	lhu	$2,12($2)
	srl	$2,$2,6
	andi	$2,$2,0x1
	beq	$2,$0,$L40
	la	$4,__sF+176
	la	$5,$LC2
	la	$25,fprintf
	jal	$31,$25
	li	$2,1			# 0x1
	sw	$2,52($fp)
	b	$L25
$L40:
	sw	$0,52($fp)
	b	$L25
$L31:
	lbu	$2,48($fp)
	addu	$2,$2,1
	sb	$2,48($fp)
	b	$L29
$L30:
	addu	$2,$fp,40
	addu	$3,$fp,32
	addu	$6,$fp,50
	move	$4,$2
	move	$5,$3
	la	$25,base64ToBase256
	jal	$31,$25
	move	$3,$2
	li	$2,1			# 0x1
	bne	$3,$2,$L47
	li	$2,1			# 0x1
	sw	$2,52($fp)
	b	$L25
$L47:
	sb	$0,49($fp)
$L48:
	lbu	$3,49($fp)
	lbu	$2,50($fp)
	addu	$2,$2,-1
	slt	$2,$3,$2
	bne	$2,$0,$L51
	b	$L49
$L51:
	lbu	$3,49($fp)
	addu	$2,$fp,40
	addu	$2,$2,$3
	lbu	$2,0($2)
	lw	$3,80($fp)
	move	$4,$2
	lw	$5,8($3)
	la	$25,fputc
	jal	$31,$25
	lbu	$2,49($fp)
	addu	$2,$2,1
	sb	$2,49($fp)
	b	$L48
$L49:
	lw	$2,80($fp)
	lw	$2,8($2)
	lhu	$2,12($2)
	srl	$2,$2,6
	andi	$2,$2,0x1
	beq	$2,$0,$L26
	la	$4,__sF+176
	la	$5,$LC2
	la	$25,fprintf
	jal	$31,$25
	li	$2,1			# 0x1
	sw	$2,52($fp)
$L25:
	lw	$2,52($fp)
	move	$sp,$fp
	lw	$31,72($sp)
	lw	$fp,68($sp)
	addu	$sp,$sp,80
	j	$31
	.end	decode
	.size	decode, .-decode
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
