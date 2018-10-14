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
	.ascii	"version\000"
	.align	2
$LC1:
	.ascii	"help\000"
	.align	2
$LC2:
	.ascii	"input\000"
	.align	2
$LC3:
	.ascii	"output\000"
	.align	2
$LC4:
	.ascii	"action\000"
	.globl	cmdOptions
	.data
	.align	2
	.type	cmdOptions, @object
	.size	cmdOptions, 96
cmdOptions:
	.word	$LC0
	.word	0
	.word	0
	.word	86
	.word	$LC1
	.word	0
	.word	0
	.word	104
	.word	$LC2
	.word	1
	.word	0
	.word	105
	.word	$LC3
	.word	1
	.word	0
	.word	111
	.word	$LC4
	.word	1
	.word	0
	.word	97
	.word	0
	.word	0
	.word	0
	.word	0
	.rdata
	.align	2
$LC5:
	.ascii	"%s\n\000"
	.align	2
$LC6:
	.ascii	"1.0.0\000"
	.text
	.align	2
	.globl	optVersion
	.ent	optVersion
optVersion:
	.frame	$fp,40,$ra		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$ra,32($sp)
	sw	$fp,28($sp)
	sw	$gp,24($sp)
	move	$fp,$sp
	la	$a0,__sF+176
	la	$a1,$LC5
	la	$a2,$LC6
	la	$t9,fprintf
	jal	$ra,$t9
	move	$a0,$zero
	la	$t9,exit
	jal	$ra,$t9
	.end	optVersion
	.size	optVersion, .-optVersion
	.rdata
	.align	2
$LC7:
	.ascii	"ERROR: Invalid action argument.\n\000"
	.align	2
$LC8:
	.ascii	"Usage:\n\000"
	.align	2
$LC9:
	.ascii	"  %s -h\n\000"
	.align	2
$LC10:
	.ascii	"  %s -V\n\000"
	.align	2
$LC11:
	.ascii	"  %s [options]\n\000"
	.align	2
$LC12:
	.ascii	"Options:\n\000"
	.align	2
$LC13:
	.ascii	"-V, --version\tPrint version and quit.\n\000"
	.align	2
$LC14:
	.ascii	"-h, --help\tPrint this information.\n\000"
	.align	2
$LC15:
	.ascii	"-i, --input\tLocation of the input file.\n\000"
	.align	2
$LC16:
	.ascii	"-o, --output\tLocation of the output file.\n\000"
	.align	2
$LC17:
	.ascii	"-a, --action\tProgram action: encode (default) or decode"
	.ascii	".\n\000"
	.align	2
$LC18:
	.ascii	"Examples:\n\000"
	.align	2
$LC19:
	.ascii	"  %s -a encode -i ~/input -o ~/output\n\000"
	.align	2
$LC20:
	.ascii	"  %s -a decode\n\000"
	.text
	.align	2
	.globl	optHelp
	.ent	optHelp
optHelp:
	.frame	$fp,40,$ra		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$ra,32($sp)
	sw	$fp,28($sp)
	sw	$gp,24($sp)
	move	$fp,$sp
	sw	$a0,40($fp)
	lw	$v0,40($fp)
	bne	$v0,$zero,$L19
	la	$a0,__sF+176
	la	$a1,$LC7
	la	$t9,fprintf
	jal	$ra,$t9
	li	$a0,1			# 0x1
	la	$t9,exit
	jal	$ra,$t9
$L19:
	la	$a0,__sF+176
	la	$a1,$LC8
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC9
	lw	$a2,40($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC10
	lw	$a2,40($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC11
	lw	$a2,40($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC12
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC13
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC14
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC15
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC16
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC17
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC18
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC19
	lw	$a2,40($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC20
	lw	$a2,40($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	move	$a0,$zero
	la	$t9,exit
	jal	$ra,$t9
	.end	optHelp
	.size	optHelp, .-optHelp
	.rdata
	.align	2
$LC21:
	.ascii	".\000"
	.align	2
$LC22:
	.ascii	"..\000"
	.align	2
$LC23:
	.ascii	"/\000"
	.align	2
$LC24:
	.ascii	"//\000"
	.text
	.align	2
	.globl	validateStreamName
	.ent	validateStreamName
validateStreamName:
	.frame	$fp,48,$ra		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,40($sp)
	sw	$fp,36($sp)
	sw	$gp,32($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	lw	$v0,48($fp)
	bne	$v0,$zero,$L21
	li	$v0,1			# 0x1
	sw	$v0,24($fp)
	b	$L20
$L21:
	lw	$a0,48($fp)
	la	$a1,$LC21
	la	$t9,strcmp
	jal	$ra,$t9
	beq	$v0,$zero,$L23
	lw	$a0,48($fp)
	la	$a1,$LC22
	la	$t9,strcmp
	jal	$ra,$t9
	beq	$v0,$zero,$L23
	lw	$a0,48($fp)
	la	$a1,$LC23
	la	$t9,strcmp
	jal	$ra,$t9
	beq	$v0,$zero,$L23
	lw	$a0,48($fp)
	la	$a1,$LC24
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L22
$L23:
	li	$v0,1			# 0x1
	sw	$v0,24($fp)
	b	$L20
$L22:
	sw	$zero,24($fp)
$L20:
	lw	$v0,24($fp)
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	validateStreamName
	.size	validateStreamName, .-validateStreamName
	.rdata
	.align	2
$LC25:
	.ascii	"ERROR: Invalid input stream.\n\000"
	.align	2
$LC26:
	.ascii	"-\000"
	.align	2
$LC27:
	.ascii	"rb\000"
	.align	2
$LC28:
	.ascii	"ERROR: Can't open input stream.\n\000"
	.text
	.align	2
	.globl	optInput
	.ent	optInput
optInput:
	.frame	$fp,48,$ra		# vars= 8, regs= 4/0, args= 16, extra= 8
	.mask	0xd0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,44($sp)
	sw	$fp,40($sp)
	sw	$gp,36($sp)
	sw	$s0,32($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	sw	$a1,52($fp)
	lw	$a0,48($fp)
	la	$t9,validateStreamName
	jal	$ra,$t9
	move	$v1,$v0
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L25
	la	$a0,__sF+176
	la	$a1,$LC25
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,24($fp)
	b	$L24
$L25:
	lw	$a0,48($fp)
	la	$a1,$LC26
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L26
	lw	$v1,52($fp)
	la	$v0,__sF
	sw	$v0,4($v1)
	b	$L27
$L26:
	lw	$s0,52($fp)
	lw	$a0,48($fp)
	la	$a1,$LC27
	la	$t9,fopen
	jal	$ra,$t9
	sw	$v0,4($s0)
$L27:
	lw	$v0,52($fp)
	lw	$v0,4($v0)
	bne	$v0,$zero,$L28
	la	$a0,__sF+176
	la	$a1,$LC28
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,24($fp)
	b	$L24
$L28:
	sw	$zero,24($fp)
$L24:
	lw	$v0,24($fp)
	move	$sp,$fp
	lw	$ra,44($sp)
	lw	$fp,40($sp)
	lw	$s0,32($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	optInput
	.size	optInput, .-optInput
	.rdata
	.align	2
$LC29:
	.ascii	"ERROR: Invalid output stream.\n\000"
	.align	2
$LC30:
	.ascii	"wb\000"
	.align	2
$LC31:
	.ascii	"ERROR: Can't open output stream.\n\000"
	.text
	.align	2
	.globl	optOutput
	.ent	optOutput
optOutput:
	.frame	$fp,48,$ra		# vars= 8, regs= 4/0, args= 16, extra= 8
	.mask	0xd0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,44($sp)
	sw	$fp,40($sp)
	sw	$gp,36($sp)
	sw	$s0,32($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	sw	$a1,52($fp)
	lw	$a0,48($fp)
	la	$t9,validateStreamName
	jal	$ra,$t9
	move	$v1,$v0
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L30
	la	$a0,__sF+176
	la	$a1,$LC29
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,24($fp)
	b	$L29
$L30:
	lw	$a0,48($fp)
	la	$a1,$LC26
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L31
	lw	$v1,52($fp)
	la	$v0,__sF+88
	sw	$v0,8($v1)
	b	$L32
$L31:
	lw	$s0,52($fp)
	lw	$a0,48($fp)
	la	$a1,$LC30
	la	$t9,fopen
	jal	$ra,$t9
	sw	$v0,8($s0)
$L32:
	lw	$v0,52($fp)
	lw	$v0,8($v0)
	bne	$v0,$zero,$L33
	la	$a0,__sF+176
	la	$a1,$LC31
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,24($fp)
	b	$L29
$L33:
	sw	$zero,24($fp)
$L29:
	lw	$v0,24($fp)
	move	$sp,$fp
	lw	$ra,44($sp)
	lw	$fp,40($sp)
	lw	$s0,32($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	optOutput
	.size	optOutput, .-optOutput
	.rdata
	.align	2
$LC32:
	.ascii	"encode\000"
	.align	2
$LC33:
	.ascii	"decode\000"
	.text
	.align	2
	.globl	optAction
	.ent	optAction
optAction:
	.frame	$fp,48,$ra		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,40($sp)
	sw	$fp,36($sp)
	sw	$gp,32($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	sw	$a1,52($fp)
	lw	$v0,48($fp)
	bne	$v0,$zero,$L35
	la	$a0,__sF+176
	la	$a1,$LC7
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,24($fp)
	b	$L34
$L35:
	lw	$a0,48($fp)
	la	$a1,$LC32
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L36
	lw	$v1,52($fp)
	la	$v0,$LC32
	sw	$v0,0($v1)
	b	$L37
$L36:
	lw	$a0,48($fp)
	la	$a1,$LC33
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L38
	lw	$v1,52($fp)
	la	$v0,$LC33
	sw	$v0,0($v1)
	b	$L37
$L38:
	la	$a0,__sF+176
	la	$a1,$LC7
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,24($fp)
	b	$L34
$L37:
	sw	$zero,24($fp)
$L34:
	lw	$v0,24($fp)
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	optAction
	.size	optAction, .-optAction
	.rdata
	.align	2
$LC34:
	.ascii	"Vhi:o:a:\000"
	.text
	.align	2
	.globl	parseCmdline
	.ent	parseCmdline
parseCmdline:
	.frame	$fp,80,$ra		# vars= 32, regs= 3/0, args= 24, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,80
	.cprestore 24
	sw	$ra,72($sp)
	sw	$fp,68($sp)
	sw	$gp,64($sp)
	move	$fp,$sp
	sw	$a0,80($fp)
	sw	$a1,84($fp)
	sw	$a2,88($fp)
	sw	$zero,32($fp)
	li	$v0,1			# 0x1
	sw	$v0,40($fp)
	lw	$v0,84($fp)
	lw	$v0,0($v0)
	sw	$v0,44($fp)
	lw	$v1,88($fp)
	la	$v0,$LC32
	sw	$v0,0($v1)
	lw	$v1,88($fp)
	la	$v0,__sF
	sw	$v0,4($v1)
	lw	$v1,88($fp)
	la	$v0,__sF+88
	sw	$v0,8($v1)
	la	$v0,$LC34
	sw	$v0,48($fp)
$L41:
	addu	$v0,$fp,32
	sw	$v0,16($sp)
	lw	$a0,80($fp)
	lw	$a1,84($fp)
	lw	$a2,48($fp)
	la	$a3,cmdOptions
	la	$t9,getopt_long
	jal	$ra,$t9
	sw	$v0,36($fp)
	lw	$v1,36($fp)
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L43
	b	$L42
$L43:
	lw	$v0,36($fp)
	addu	$v0,$v0,-63
	sw	$v0,56($fp)
	lw	$v1,56($fp)
	sltu	$v0,$v1,49
	beq	$v0,$zero,$L44
	lw	$v0,56($fp)
	sll	$v1,$v0,2
	la	$v0,$L51
	addu	$v0,$v1,$v0
	lw	$v0,0($v0)
	.cpadd	$v0
	j	$v0
	.rdata
	.align	2
$L51:
	.gpword	$L50
	.gpword	$L44
	.gpword	$L44
	.gpword	$L44
	.gpword	$L44
	.gpword	$L44
	.gpword	$L44
	.gpword	$L44
	.gpword	$L44
	.gpword	$L44
	.gpword	$L44
	.gpword	$L44
	.gpword	$L44
	.gpword	$L44
	.gpword	$L44
	.gpword	$L44
	.gpword	$L44
	.gpword	$L44
	.gpword	$L44
	.gpword	$L44
	.gpword	$L44
	.gpword	$L44
	.gpword	$L44
	.gpword	$L45
	.gpword	$L44
	.gpword	$L44
	.gpword	$L44
	.gpword	$L44
	.gpword	$L44
	.gpword	$L44
	.gpword	$L44
	.gpword	$L44
	.gpword	$L44
	.gpword	$L44
	.gpword	$L49
	.gpword	$L44
	.gpword	$L44
	.gpword	$L44
	.gpword	$L44
	.gpword	$L44
	.gpword	$L44
	.gpword	$L46
	.gpword	$L47
	.gpword	$L44
	.gpword	$L44
	.gpword	$L44
	.gpword	$L44
	.gpword	$L44
	.gpword	$L48
	.text
$L45:
	la	$t9,optVersion
	jal	$ra,$t9
	b	$L44
$L46:
	lw	$a0,44($fp)
	la	$t9,optHelp
	jal	$ra,$t9
	b	$L44
$L47:
	lw	$a0,optarg
	lw	$a1,88($fp)
	la	$t9,optInput
	jal	$ra,$t9
	sw	$v0,40($fp)
	b	$L44
$L48:
	lw	$a0,optarg
	lw	$a1,88($fp)
	la	$t9,optOutput
	jal	$ra,$t9
	sw	$v0,40($fp)
	b	$L44
$L49:
	lw	$a0,optarg
	lw	$a1,88($fp)
	la	$t9,optAction
	jal	$ra,$t9
	sw	$v0,40($fp)
	b	$L44
$L50:
	li	$v0,1			# 0x1
	sw	$v0,40($fp)
$L44:
	lw	$v1,40($fp)
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L41
	li	$v0,1			# 0x1
	sw	$v0,52($fp)
	b	$L40
$L42:
	sw	$zero,52($fp)
$L40:
	lw	$v0,52($fp)
	move	$sp,$fp
	lw	$ra,72($sp)
	lw	$fp,68($sp)
	addu	$sp,$sp,80
	j	$ra
	.end	parseCmdline
	.size	parseCmdline, .-parseCmdline
	.rdata
	.align	2
$LC35:
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
	bne	$v1,$v0,$L55
	li	$a0,1			# 0x1
	la	$t9,exit
	jal	$ra,$t9
$L55:
	lw	$v0,28($fp)
	lh	$v0,14($v0)
	sw	$v0,48($fp)
	lw	$v0,32($fp)
	lh	$v0,14($v0)
	sw	$v0,52($fp)
	lw	$a0,24($fp)
	la	$a1,$LC32
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L56
	lw	$a0,48($fp)
	lw	$a1,52($fp)
	la	$t9,base64_encode
	jal	$ra,$t9
	sw	$v0,44($fp)
	b	$L57
$L56:
	lw	$a0,48($fp)
	lw	$a1,52($fp)
	la	$t9,base64_decode
	jal	$ra,$t9
	sw	$v0,44($fp)
$L57:
	lw	$v0,44($fp)
	beq	$v0,$zero,$L58
	lw	$v0,44($fp)
	sll	$v1,$v0,2
	la	$v0,errmsg
	addu	$v0,$v1,$v0
	la	$a0,__sF+176
	la	$a1,$LC35
	lw	$a2,0($v0)
	la	$t9,fprintf
	jal	$ra,$t9
	li	$a0,1			# 0x1
	la	$t9,exit
	jal	$ra,$t9
$L58:
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
