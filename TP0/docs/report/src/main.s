	.file	1 "main.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.rdata
	.align	2
cmdOptions:
	.word	$LC0
	.word	1
	.word	0
	.word	114
	.word	$LC1
	.word	1
	.word	0
	.word	99
	.word	$LC2
	.word	1
	.word	0
	.word	119
	.word	$LC3
	.word	1
	.word	0
	.word	72
	.word	$LC4
	.word	1
	.word	0
	.word	115
	.word	$LC5
	.word	1
	.word	0
	.word	111
	.word	0
	.word	0
	.word	0
	.word	0
	.rdata
	.align	2
$L48:
	li	$v0,1			# 0x1
	sw	$v0,40($fp)
$L41:
	lw	$v1,40($fp)
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L38
	li	$v0,1			# 0x1
	sw	$v0,44($fp)
	b	$L37
$L39:
	sw	$zero,44($fp)
$L37:
	lw	$v0,44($fp)
	move	$sp,$fp
	lw	$ra,64($sp)
	lw	$fp,60($sp)
	addu	$sp,$sp,72
	j	$ra
	.end	parseCmdline
	.size	parseCmdline, .-parseCmdline
	.rdata
	.align	2
$LC19:
	.word	1073741824
	.align	3
$L96:
	lw	$a0,56($fp)
	la	$t9,fclose
	jal	$ra,$t9
	lw	$a0,68($fp)
	la	$t9,free
	jal	$ra,$t9
	move	$v0,$zero
	move	$sp,$fp
	lw	$ra,96($sp)
	lw	$fp,92($sp)
	addu	$sp,$sp,104
	j	$ra
	.end	main
	.size	main, .-main
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
