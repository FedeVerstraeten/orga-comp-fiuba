	.file	1 "parser.c"
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
	.frame	$fp,40,$31		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$31,32($sp)
	sw	$fp,28($sp)
	sw	$28,24($sp)
	move	$fp,$sp
	la	$4,__sF+176
	la	$5,$LC5
	la	$6,$LC6
	la	$25,fprintf
	jal	$31,$25
	move	$4,$0
	la	$25,exit
	jal	$31,$25
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
	.frame	$fp,40,$31		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$31,32($sp)
	sw	$fp,28($sp)
	sw	$28,24($sp)
	move	$fp,$sp
	sw	$4,40($fp)
	lw	$2,40($fp)
	bne	$2,$0,$L19
	la	$4,__sF+176
	la	$5,$LC7
	la	$25,fprintf
	jal	$31,$25
	li	$4,1			# 0x1
	la	$25,exit
	jal	$31,$25
$L19:
	la	$4,__sF+176
	la	$5,$LC8
	la	$25,fprintf
	jal	$31,$25
	la	$4,__sF+176
	la	$5,$LC9
	lw	$6,40($fp)
	la	$25,fprintf
	jal	$31,$25
	la	$4,__sF+176
	la	$5,$LC10
	lw	$6,40($fp)
	la	$25,fprintf
	jal	$31,$25
	la	$4,__sF+176
	la	$5,$LC11
	lw	$6,40($fp)
	la	$25,fprintf
	jal	$31,$25
	la	$4,__sF+176
	la	$5,$LC12
	la	$25,fprintf
	jal	$31,$25
	la	$4,__sF+176
	la	$5,$LC13
	la	$25,fprintf
	jal	$31,$25
	la	$4,__sF+176
	la	$5,$LC14
	la	$25,fprintf
	jal	$31,$25
	la	$4,__sF+176
	la	$5,$LC15
	la	$25,fprintf
	jal	$31,$25
	la	$4,__sF+176
	la	$5,$LC16
	la	$25,fprintf
	jal	$31,$25
	la	$4,__sF+176
	la	$5,$LC17
	la	$25,fprintf
	jal	$31,$25
	la	$4,__sF+176
	la	$5,$LC18
	la	$25,fprintf
	jal	$31,$25
	la	$4,__sF+176
	la	$5,$LC19
	lw	$6,40($fp)
	la	$25,fprintf
	jal	$31,$25
	la	$4,__sF+176
	la	$5,$LC20
	lw	$6,40($fp)
	la	$25,fprintf
	jal	$31,$25
	move	$4,$0
	la	$25,exit
	jal	$31,$25
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
	lw	$2,48($fp)
	bne	$2,$0,$L21
	li	$2,1			# 0x1
	sw	$2,24($fp)
	b	$L20
$L21:
	lw	$4,48($fp)
	la	$5,$LC21
	la	$25,strcmp
	jal	$31,$25
	beq	$2,$0,$L23
	lw	$4,48($fp)
	la	$5,$LC22
	la	$25,strcmp
	jal	$31,$25
	beq	$2,$0,$L23
	lw	$4,48($fp)
	la	$5,$LC23
	la	$25,strcmp
	jal	$31,$25
	beq	$2,$0,$L23
	lw	$4,48($fp)
	la	$5,$LC24
	la	$25,strcmp
	jal	$31,$25
	bne	$2,$0,$L22
$L23:
	li	$2,1			# 0x1
	sw	$2,24($fp)
	b	$L20
$L22:
	sw	$0,24($fp)
$L20:
	lw	$2,24($fp)
	move	$sp,$fp
	lw	$31,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$31
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
	.frame	$fp,48,$31		# vars= 8, regs= 4/0, args= 16, extra= 8
	.mask	0xd0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$31,44($sp)
	sw	$fp,40($sp)
	sw	$28,36($sp)
	sw	$16,32($sp)
	move	$fp,$sp
	sw	$4,48($fp)
	sw	$5,52($fp)
	lw	$4,48($fp)
	la	$25,validateStreamName
	jal	$31,$25
	move	$3,$2
	li	$2,1			# 0x1
	bne	$3,$2,$L25
	la	$4,__sF+176
	la	$5,$LC25
	la	$25,fprintf
	jal	$31,$25
	li	$2,1			# 0x1
	sw	$2,24($fp)
	b	$L24
$L25:
	lw	$4,48($fp)
	la	$5,$LC26
	la	$25,strcmp
	jal	$31,$25
	bne	$2,$0,$L26
	lw	$3,52($fp)
	la	$2,__sF
	sw	$2,4($3)
	b	$L27
$L26:
	lw	$16,52($fp)
	lw	$4,48($fp)
	la	$5,$LC27
	la	$25,fopen
	jal	$31,$25
	sw	$2,4($16)
$L27:
	lw	$2,52($fp)
	lw	$2,4($2)
	bne	$2,$0,$L28
	la	$4,__sF+176
	la	$5,$LC28
	la	$25,fprintf
	jal	$31,$25
	li	$2,1			# 0x1
	sw	$2,24($fp)
	b	$L24
$L28:
	sw	$0,24($fp)
$L24:
	lw	$2,24($fp)
	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	lw	$16,32($sp)
	addu	$sp,$sp,48
	j	$31
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
	.frame	$fp,48,$31		# vars= 8, regs= 4/0, args= 16, extra= 8
	.mask	0xd0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$31,44($sp)
	sw	$fp,40($sp)
	sw	$28,36($sp)
	sw	$16,32($sp)
	move	$fp,$sp
	sw	$4,48($fp)
	sw	$5,52($fp)
	lw	$4,48($fp)
	la	$25,validateStreamName
	jal	$31,$25
	move	$3,$2
	li	$2,1			# 0x1
	bne	$3,$2,$L30
	la	$4,__sF+176
	la	$5,$LC29
	la	$25,fprintf
	jal	$31,$25
	li	$2,1			# 0x1
	sw	$2,24($fp)
	b	$L29
$L30:
	lw	$4,48($fp)
	la	$5,$LC26
	la	$25,strcmp
	jal	$31,$25
	bne	$2,$0,$L31
	lw	$3,52($fp)
	la	$2,__sF+88
	sw	$2,8($3)
	b	$L32
$L31:
	lw	$16,52($fp)
	lw	$4,48($fp)
	la	$5,$LC30
	la	$25,fopen
	jal	$31,$25
	sw	$2,8($16)
$L32:
	lw	$2,52($fp)
	lw	$2,8($2)
	bne	$2,$0,$L33
	la	$4,__sF+176
	la	$5,$LC31
	la	$25,fprintf
	jal	$31,$25
	li	$2,1			# 0x1
	sw	$2,24($fp)
	b	$L29
$L33:
	sw	$0,24($fp)
$L29:
	lw	$2,24($fp)
	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	lw	$16,32($sp)
	addu	$sp,$sp,48
	j	$31
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
	sw	$5,52($fp)
	lw	$2,48($fp)
	bne	$2,$0,$L35
	la	$4,__sF+176
	la	$5,$LC7
	la	$25,fprintf
	jal	$31,$25
	li	$2,1			# 0x1
	sw	$2,24($fp)
	b	$L34
$L35:
	lw	$4,48($fp)
	la	$5,$LC32
	la	$25,strcmp
	jal	$31,$25
	bne	$2,$0,$L36
	lw	$3,52($fp)
	la	$2,$LC32
	sw	$2,0($3)
	b	$L37
$L36:
	lw	$4,48($fp)
	la	$5,$LC33
	la	$25,strcmp
	jal	$31,$25
	bne	$2,$0,$L38
	lw	$3,52($fp)
	la	$2,$LC33
	sw	$2,0($3)
	b	$L37
$L38:
	la	$4,__sF+176
	la	$5,$LC7
	la	$25,fprintf
	jal	$31,$25
	li	$2,1			# 0x1
	sw	$2,24($fp)
	b	$L34
$L37:
	sw	$0,24($fp)
$L34:
	lw	$2,24($fp)
	move	$sp,$fp
	lw	$31,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$31
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
	.frame	$fp,80,$31		# vars= 32, regs= 3/0, args= 24, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,80
	.cprestore 24
	sw	$31,72($sp)
	sw	$fp,68($sp)
	sw	$28,64($sp)
	move	$fp,$sp
	sw	$4,80($fp)
	sw	$5,84($fp)
	sw	$6,88($fp)
	sw	$0,32($fp)
	li	$2,1			# 0x1
	sw	$2,40($fp)
	lw	$2,84($fp)
	lw	$2,0($2)
	sw	$2,44($fp)
	lw	$3,88($fp)
	la	$2,$LC32
	sw	$2,0($3)
	lw	$3,88($fp)
	la	$2,__sF
	sw	$2,4($3)
	lw	$3,88($fp)
	la	$2,__sF+88
	sw	$2,8($3)
	la	$2,$LC34
	sw	$2,48($fp)
$L41:
	addu	$2,$fp,32
	sw	$2,16($sp)
	lw	$4,80($fp)
	lw	$5,84($fp)
	lw	$6,48($fp)
	la	$7,cmdOptions
	la	$25,getopt_long
	jal	$31,$25
	sw	$2,36($fp)
	lw	$3,36($fp)
	li	$2,-1			# 0xffffffffffffffff
	bne	$3,$2,$L43
	b	$L42
$L43:
	lw	$2,36($fp)
	addu	$2,$2,-63
	sw	$2,56($fp)
	lw	$3,56($fp)
	sltu	$2,$3,49
	beq	$2,$0,$L44
	lw	$2,56($fp)
	sll	$3,$2,2
	la	$2,$L51
	addu	$2,$3,$2
	lw	$2,0($2)
	.cpadd	$2
	j	$2
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
	la	$25,optVersion
	jal	$31,$25
	b	$L44
$L46:
	lw	$4,44($fp)
	la	$25,optHelp
	jal	$31,$25
	b	$L44
$L47:
	lw	$4,optarg
	lw	$5,88($fp)
	la	$25,optInput
	jal	$31,$25
	sw	$2,40($fp)
	b	$L44
$L48:
	lw	$4,optarg
	lw	$5,88($fp)
	la	$25,optOutput
	jal	$31,$25
	sw	$2,40($fp)
	b	$L44
$L49:
	lw	$4,optarg
	lw	$5,88($fp)
	la	$25,optAction
	jal	$31,$25
	sw	$2,40($fp)
	b	$L44
$L50:
	li	$2,1			# 0x1
	sw	$2,40($fp)
$L44:
	lw	$3,40($fp)
	li	$2,1			# 0x1
	bne	$3,$2,$L41
	li	$2,1			# 0x1
	sw	$2,52($fp)
	b	$L40
$L42:
	sw	$0,52($fp)
$L40:
	lw	$2,52($fp)
	move	$sp,$fp
	lw	$31,72($sp)
	lw	$fp,68($sp)
	addu	$sp,$sp,80
	j	$31
	.end	parseCmdline
	.size	parseCmdline, .-parseCmdline
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
