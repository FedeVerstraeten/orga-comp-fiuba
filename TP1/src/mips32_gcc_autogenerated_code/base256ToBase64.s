	.file	1 "base256ToBase64.c"
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
	.globl	addPadding
	.ent	addPadding
addPadding:
	.frame	$fp,24,$ra		# vars= 8, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,24
	.cprestore 0
	sw	$fp,20($sp)
	sw	$gp,16($sp)
	move	$fp,$sp
	sw	$a0,24($fp)
	move	$v0,$a1
	sw	$a2,32($fp)
	sb	$v0,8($fp)
	sw	$zero,12($fp)
$L18:
	lw	$v1,24($fp)
	lw	$v0,12($fp)
	addu	$v0,$v1,$v0
	lb	$v0,0($v0)
	bne	$v0,$zero,$L20
	b	$L19
$L20:
	lw	$v0,12($fp)
	addu	$v0,$v0,1
	sw	$v0,12($fp)
	b	$L18
$L19:
	.set	noreorder
	nop
	.set	reorder
$L21:
	lw	$v0,32($fp)
	bgtz	$v0,$L23
	b	$L22
$L23:
	lw	$v1,24($fp)
	lw	$v0,12($fp)
	addu	$v1,$v1,$v0
	lbu	$v0,8($fp)
	sb	$v0,0($v1)
	lw	$v0,32($fp)
	addu	$v0,$v0,-1
	sw	$v0,32($fp)
	lw	$v0,12($fp)
	addu	$v0,$v0,1
	sw	$v0,12($fp)
	b	$L21
$L22:
	lw	$v1,24($fp)
	lw	$v0,12($fp)
	addu	$v0,$v1,$v0
	addu	$v0,$v0,1
	sb	$zero,0($v0)
	move	$sp,$fp
	lw	$fp,20($sp)
	addu	$sp,$sp,24
	j	$ra
	.end	addPadding
	.size	addPadding, .-addPadding
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
	bne	$v1,$v0,$L25
	lw	$v1,shiftRightBit.2
	li	$v0,6			# 0x6
	bne	$v1,$v0,$L26
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
	la	$a1,$LC0
	li	$a2,1			# 0x1
	la	$t9,strncat
	jal	$ra,$t9
	lbu	$v0,28($fp)
	addu	$v0,$v0,2
	andi	$v0,$v0,0x00ff
	sw	$v0,32($fp)
	b	$L24
$L26:
	lw	$v1,shiftRightBit.2
	li	$v0,4			# 0x4
	bne	$v1,$v0,$L28
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
	la	$a1,$LC0
	li	$a2,1			# 0x1
	la	$t9,strncat
	jal	$ra,$t9
	lw	$a0,56($fp)
	la	$a1,$LC0
	li	$a2,1			# 0x1
	la	$t9,strncat
	jal	$ra,$t9
	lbu	$v0,28($fp)
	addu	$v0,$v0,3
	andi	$v0,$v0,0x00ff
	sw	$v0,32($fp)
	b	$L24
$L28:
	lbu	$v0,28($fp)
	sw	$v0,32($fp)
	b	$L24
$L25:
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
	bne	$v0,$zero,$L30
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
$L30:
	lbu	$v0,28($fp)
	sw	$v0,32($fp)
$L24:
	lw	$v0,32($fp)
	move	$sp,$fp
	lw	$ra,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$ra
	.end	base256ToBase64
	.size	base256ToBase64, .-base256ToBase64
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
