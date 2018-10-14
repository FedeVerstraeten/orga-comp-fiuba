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
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
