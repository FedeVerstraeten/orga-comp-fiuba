	.file	1 "encoder.c"
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
	.local	tailByte.0
	.comm	tailByte.0,1,1
	.data
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
$LC0:
	.ascii	"=\000"
	.text
	.align	2
	.globl	base256ToBase64
	.ent	base256ToBase64
base256ToBase64:
	.frame	$fp,48,$31		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$31,40($sp)
	sw	$fp,36($sp)
	sw	$28,32($sp)
	move	$fp,$sp
	sw	$4,48($fp)
	move	$2,$5
	sb	$2,24($fp)
	sb	$0,25($fp)
	sb	$0,26($fp)
	sb	$0,27($fp)
	lbu	$2,tailByte.0
	sb	$2,26($fp)
	lb	$3,24($fp)
	li	$2,-1			# 0xffffffffffffffff
	bne	$3,$2,$L6
	lw	$3,shiftRightBit.2
	li	$2,6			# 0x6
	bne	$3,$2,$L7
	lbu	$2,26($fp)
	sb	$2,25($fp)
	lbu	$3,25($fp)
	la	$2,translationTableB64
	addu	$2,$3,$2
	lw	$4,48($fp)
	move	$5,$2
	li	$6,1			# 0x1
	la	$25,strncpy
	jal	$31,$25
	lw	$4,48($fp)
	la	$5,$LC0
	li	$6,1			# 0x1
	la	$25,strncat
	jal	$31,$25
	lbu	$2,27($fp)
	addu	$2,$2,2
	andi	$2,$2,0x00ff
	sw	$2,28($fp)
	b	$L5
$L7:
	lw	$3,shiftRightBit.2
	li	$2,4			# 0x4
	bne	$3,$2,$L9
	lbu	$2,26($fp)
	sb	$2,25($fp)
	lbu	$3,25($fp)
	la	$2,translationTableB64
	addu	$2,$3,$2
	lw	$4,48($fp)
	move	$5,$2
	li	$6,1			# 0x1
	la	$25,strncpy
	jal	$31,$25
	lw	$4,48($fp)
	la	$5,$LC0
	li	$6,1			# 0x1
	la	$25,strncat
	jal	$31,$25
	lw	$4,48($fp)
	la	$5,$LC0
	li	$6,1			# 0x1
	la	$25,strncat
	jal	$31,$25
	lbu	$2,27($fp)
	addu	$2,$2,3
	andi	$2,$2,0x00ff
	sw	$2,28($fp)
	b	$L5
$L9:
	lbu	$2,27($fp)
	sw	$2,28($fp)
	b	$L5
$L6:
	lbu	$3,24($fp)
	lbu	$2,bitMask.1
	and	$2,$3,$2
	sb	$2,25($fp)
	lbu	$3,25($fp)
	lw	$2,shiftRightBit.2
	sra	$2,$3,$2
	sb	$2,25($fp)
	lbu	$2,bitMask.1
	nor	$2,$0,$2
	lbu	$3,24($fp)
	and	$2,$3,$2
	sb	$2,tailByte.0
	lbu	$4,tailByte.0
	li	$3,6			# 0x6
	lw	$2,shiftRightBit.2
	subu	$2,$3,$2
	sll	$2,$4,$2
	sb	$2,tailByte.0
	lbu	$3,25($fp)
	lbu	$2,26($fp)
	or	$2,$3,$2
	sb	$2,25($fp)
	lbu	$3,25($fp)
	la	$2,translationTableB64
	addu	$2,$3,$2
	lw	$4,48($fp)
	move	$5,$2
	li	$6,1			# 0x1
	la	$25,strncpy
	jal	$31,$25
	lbu	$2,27($fp)
	addu	$2,$2,1
	sb	$2,27($fp)
	lw	$2,shiftRightBit.2
	addu	$2,$2,2
	sw	$2,shiftRightBit.2
	lbu	$2,bitMask.1
	sll	$2,$2,2
	sb	$2,bitMask.1
	andi	$2,$2,0x00ff
	bne	$2,$0,$L11
	li	$2,-4			# 0xfffffffffffffffc
	sb	$2,bitMask.1
	li	$2,2			# 0x2
	sw	$2,shiftRightBit.2
	lbu	$3,tailByte.0
	la	$2,translationTableB64
	addu	$2,$3,$2
	lw	$4,48($fp)
	move	$5,$2
	li	$6,1			# 0x1
	la	$25,strncat
	jal	$31,$25
	lbu	$2,27($fp)
	addu	$2,$2,1
	sb	$2,27($fp)
	sb	$0,tailByte.0
$L11:
	lbu	$2,27($fp)
	sw	$2,28($fp)
$L5:
	lw	$2,28($fp)
	move	$sp,$fp
	lw	$31,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$31
	.end	base256ToBase64
	.size	base256ToBase64, .-base256ToBase64
	.rdata
	.align	2
$LC1:
	.ascii	"Input error when reading stream.\n\000"
	.align	2
$LC2:
	.ascii	"\n\000"
	.align	2
$LC3:
	.ascii	"Output error when writing stream.\n\000"
	.text
	.align	2
	.globl	encode
	.ent	encode
encode:
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
	sw	$0,32($fp)
	sb	$0,36($fp)
	sb	$0,40($fp)
	sb	$0,41($fp)
$L13:
	addu	$2,$fp,32
	move	$4,$2
	move	$5,$0
	li	$6,5			# 0x5
	la	$25,memset
	jal	$31,$25
	lw	$2,72($fp)
	lw	$3,4($2)
	lw	$2,72($fp)
	lw	$2,4($2)
	lw	$2,4($2)
	addu	$2,$2,-1
	sw	$2,4($3)
	bgez	$2,$L16
	lw	$2,72($fp)
	lw	$4,4($2)
	la	$25,__srget
	jal	$31,$25
	sb	$2,48($fp)
	b	$L17
$L16:
	lw	$2,72($fp)
	lw	$4,4($2)
	lw	$2,0($4)
	move	$3,$2
	lbu	$3,0($3)
	sb	$3,48($fp)
	addu	$2,$2,1
	sw	$2,0($4)
$L17:
	lbu	$2,48($fp)
	sb	$2,24($fp)
	lw	$2,72($fp)
	lw	$2,4($2)
	lhu	$2,12($2)
	srl	$2,$2,6
	andi	$2,$2,0x1
	beq	$2,$0,$L18
	la	$4,__sF+176
	la	$5,$LC1
	la	$25,fprintf
	jal	$31,$25
	li	$2,1			# 0x1
	sw	$2,44($fp)
	b	$L12
$L18:
	addu	$2,$fp,32
	lb	$3,24($fp)
	move	$4,$2
	move	$5,$3
	la	$25,base256ToBase64
	jal	$31,$25
	sb	$2,41($fp)
	lbu	$3,40($fp)
	lbu	$2,41($fp)
	addu	$2,$3,$2
	slt	$2,$2,77
	beq	$2,$0,$L19
	lbu	$2,40($fp)
	lbu	$3,41($fp)
	addu	$2,$2,$3
	sb	$2,40($fp)
	b	$L20
$L19:
	lw	$2,72($fp)
	la	$4,$LC2
	lw	$5,8($2)
	la	$25,fputs
	jal	$31,$25
	lw	$2,72($fp)
	lw	$2,8($2)
	lhu	$2,12($2)
	srl	$2,$2,6
	andi	$2,$2,0x1
	beq	$2,$0,$L21
	la	$4,__sF+176
	la	$5,$LC3
	la	$25,fprintf
	jal	$31,$25
	li	$2,1			# 0x1
	sw	$2,44($fp)
	b	$L12
$L21:
	lbu	$2,41($fp)
	sb	$2,40($fp)
$L20:
	addu	$2,$fp,32
	lw	$3,72($fp)
	move	$4,$2
	lw	$5,8($3)
	la	$25,fputs
	jal	$31,$25
	lw	$2,72($fp)
	lw	$2,8($2)
	lhu	$2,12($2)
	srl	$2,$2,6
	andi	$2,$2,0x1
	beq	$2,$0,$L15
	la	$4,__sF+176
	la	$5,$LC3
	la	$25,fprintf
	jal	$31,$25
	li	$2,1			# 0x1
	sw	$2,44($fp)
	b	$L12
$L15:
	lb	$3,24($fp)
	li	$2,-1			# 0xffffffffffffffff
	bne	$3,$2,$L13
	sw	$0,44($fp)
$L12:
	lw	$2,44($fp)
	move	$sp,$fp
	lw	$31,64($sp)
	lw	$fp,60($sp)
	addu	$sp,$sp,72
	j	$31
	.end	encode
	.size	encode, .-encode
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
