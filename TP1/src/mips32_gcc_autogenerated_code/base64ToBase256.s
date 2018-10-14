	.file	1 "base64ToBase256.c"
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
$L18:
	lbu	$v0,12($fp)
	sltu	$v0,$v0,4
	bne	$v0,$zero,$L21
	b	$L19
$L21:
	lbu	$v1,12($fp)
	lw	$v0,52($fp)
	addu	$v0,$v1,$v0
	lbu	$v1,0($v0)
	li	$v0,61			# 0x3d
	bne	$v1,$v0,$L22
	lbu	$v0,12($fp)
	addu	$v1,$fp,16
	addu	$v0,$v1,$v0
	sb	$zero,0($v0)
	b	$L20
$L22:
	sb	$zero,13($fp)
$L23:
	lbu	$v0,13($fp)
	sltu	$v0,$v0,64
	bne	$v0,$zero,$L26
	b	$L24
$L26:
	lbu	$v1,12($fp)
	lw	$v0,52($fp)
	addu	$v0,$v1,$v0
	lbu	$v1,0($v0)
	lbu	$v0,13($fp)
	lb	$v0,translationTableB64($v0)
	bne	$v1,$v0,$L25
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
	b	$L24
$L25:
	lbu	$v0,13($fp)
	addu	$v0,$v0,1
	sb	$v0,13($fp)
	b	$L23
$L24:
	lbu	$v0,13($fp)
	sltu	$v0,$v0,64
	bne	$v0,$zero,$L20
	li	$v0,3			# 0x3
	sw	$v0,36($fp)
	b	$L17
$L20:
	lbu	$v0,12($fp)
	addu	$v0,$v0,1
	sb	$v0,12($fp)
	b	$L18
$L19:
	sb	$zero,12($fp)
$L29:
	lbu	$v0,12($fp)
	sltu	$v0,$v0,4
	bne	$v0,$zero,$L32
	b	$L30
$L32:
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
	b	$L29
$L30:
	sb	$zero,12($fp)
$L33:
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
	bne	$v0,$zero,$L33
	sw	$zero,36($fp)
$L17:
	lw	$v0,36($fp)
	move	$sp,$fp
	lw	$fp,44($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	base64ToBase256
	.size	base64ToBase256, .-base64ToBase256
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
