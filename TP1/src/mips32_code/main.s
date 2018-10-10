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
	.align	2
$LC1:
	.ascii	"%s\000"
	.text
	.align	2
	.globl	main
	.ent	main
main:
	.frame	$fp,72,$ra		# vars= 32, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,72
	.cprestore 16
	sw	$ra,64($sp)
	sw	$fp,60($sp)
	sw	$gp,56($sp)
	move	$fp,$sp
	sw	$a0,72($fp)
	sw	$a1,76($fp)
	lw	$a0,72($fp)
	lw	$a1,76($fp)
	addu	$a2,$fp,24
	la	$t9,parseCmdline
	jal	$ra,$t9
	sw	$v0,40($fp)
	lw	$v1,40($fp)
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L18
	li	$a0,1			# 0x1
	la	$t9,exit
	jal	$ra,$t9
$L18:
	lw	$v0,28($fp)
	lh	$v0,14($v0)
	sw	$v0,48($fp)
	lw	$v0,32($fp)
	lh	$v0,14($v0)
	sw	$v0,52($fp)
	lw	$a0,24($fp)
	la	$a1,$LC0
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L19
	lw	$a0,48($fp)
	lw	$a1,52($fp)
	la	$t9,base64_encode
	jal	$ra,$t9
	sw	$v0,44($fp)
	b	$L20
$L19:
	lw	$a0,48($fp)
	lw	$a1,52($fp)
	la	$t9,base64_decode
	jal	$ra,$t9
	sw	$v0,44($fp)
$L20:
	lw	$v0,44($fp)
	beq	$v0,$zero,$L21
	lw	$v0,44($fp)
	sll	$v1,$v0,2
	la	$v0,errmsg
	addu	$v0,$v1,$v0
	la	$a0,__sF+176
	la	$a1,$LC1
	lw	$a2,0($v0)
	la	$t9,fprintf
	jal	$ra,$t9
	li	$a0,1			# 0x1
	la	$t9,exit
	jal	$ra,$t9
$L21:
	lw	$a0,28($fp)
	la	$t9,fclose
	jal	$ra,$t9
	lw	$a0,32($fp)
	la	$t9,fclose
	jal	$ra,$t9
	move	$v0,$zero
	move	$sp,$fp
	lw	$ra,64($sp)
	lw	$fp,60($sp)
	addu	$sp,$sp,72
	j	$ra
	.end	main
	.size	main, .-main
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
