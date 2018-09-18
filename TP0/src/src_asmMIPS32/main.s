	.file	1 "main.c"
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
	.ascii	"encode\000"
	.text
	.align	2
	.globl	main
	.ent	main
main:
	.frame	$fp,64,$31		# vars= 24, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,64
	.cprestore 16
	sw	$31,56($sp)
	sw	$fp,52($sp)
	sw	$28,48($sp)
	move	$fp,$sp
	sw	$4,64($fp)
	sw	$5,68($fp)
	addu	$4,$fp,24
	move	$5,$0
	li	$6,12			# 0xc
	la	$25,memset
	jal	$31,$25
	lw	$4,64($fp)
	lw	$5,68($fp)
	addu	$6,$fp,24
	la	$25,parseCmdline
	jal	$31,$25
	sw	$2,40($fp)
	lw	$3,40($fp)
	li	$2,1			# 0x1
	bne	$3,$2,$L18
	li	$4,1			# 0x1
	la	$25,exit
	jal	$31,$25
$L18:
	lw	$4,24($fp)
	la	$5,$LC0
	la	$25,strcmp
	jal	$31,$25
	bne	$2,$0,$L19
	addu	$4,$fp,24
	la	$25,encode
	jal	$31,$25
	sw	$2,44($fp)
	b	$L20
$L19:
	addu	$4,$fp,24
	la	$25,decode
	jal	$31,$25
	sw	$2,44($fp)
$L20:
	lw	$3,44($fp)
	li	$2,1			# 0x1
	bne	$3,$2,$L21
	li	$4,1			# 0x1
	la	$25,exit
	jal	$31,$25
$L21:
	lw	$4,28($fp)
	la	$25,fclose
	jal	$31,$25
	lw	$4,32($fp)
	la	$25,fclose
	jal	$31,$25
	move	$2,$0
	move	$sp,$fp
	lw	$31,56($sp)
	lw	$fp,52($sp)
	addu	$sp,$sp,64
	j	$31
	.end	main
	.size	main, .-main
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
