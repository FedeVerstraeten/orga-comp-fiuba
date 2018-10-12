	.section .mdebug.abi32
	.previous
	.abicalls
	.file 1 "parser.c"
	.section	.debug_abbrev,"",@progbits
$Ldebug_abbrev0:
	.section	.debug_info,"",@progbits
$Ldebug_info0:
	.section	.debug_line,"",@progbits
$Ldebug_line0:
	.text
$Ltext0:
	.file 2 "/usr/include/mips/int_types.h"
	.file 3 "/usr/include/mips/ansi.h"
	.file 4 "/usr/include/mips/types.h"
	.file 5 "/usr/include/sys/ansi.h"
	.file 6 "/usr/include/sys/types.h"
	.file 7 "/usr/include/sys/endian.h"
	.file 8 "/usr/include/pthread_types.h"
	.file 9 "/usr/include/unistd.h"
	.file 10 "/usr/include/getopt.h"
	.file 11 "/usr/include/stdio.h"
	.file 12 "/usr/include/stdlib.h"
	.file 13 "common.h"
	.rdata
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
$LFB29:
	.loc 1 41 0
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
$LCFI0:
	sw	$ra,32($sp)
$LCFI1:
	sw	$fp,28($sp)
$LCFI2:
	sw	$gp,24($sp)
$LCFI3:
	move	$fp,$sp
$LCFI4:
	.loc 1 42 0
	la	$a0,__sF+176
	la	$a1,$LC5
	la	$a2,$LC6
	la	$t9,fprintf
	jal	$ra,$t9
	.loc 1 44 0
	move	$a0,$zero
	la	$t9,exit
	jal	$ra,$t9
	.loc 1 45 0
	.end	optVersion
$LFE29:
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
$LFB31:
	.loc 1 48 0
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
$LCFI5:
	sw	$ra,32($sp)
$LCFI6:
	sw	$fp,28($sp)
$LCFI7:
	sw	$gp,24($sp)
$LCFI8:
	move	$fp,$sp
$LCFI9:
	sw	$a0,40($fp)
	.loc 1 49 0
	lw	$v0,40($fp)
	bne	$v0,$zero,$L19
	.loc 1 51 0
	la	$a0,__sF+176
	la	$a1,$LC7
	la	$t9,fprintf
	jal	$ra,$t9
	.loc 1 52 0
	li	$a0,1			# 0x1
	la	$t9,exit
	jal	$ra,$t9
$L19:
	.loc 1 54 0
	la	$a0,__sF+176
	la	$a1,$LC8
	la	$t9,fprintf
	jal	$ra,$t9
	.loc 1 55 0
	la	$a0,__sF+176
	la	$a1,$LC9
	lw	$a2,40($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	.loc 1 56 0
	la	$a0,__sF+176
	la	$a1,$LC10
	lw	$a2,40($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	.loc 1 57 0
	la	$a0,__sF+176
	la	$a1,$LC11
	lw	$a2,40($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	.loc 1 58 0
	la	$a0,__sF+176
	la	$a1,$LC12
	la	$t9,fprintf
	jal	$ra,$t9
	.loc 1 59 0
	la	$a0,__sF+176
	la	$a1,$LC13
	la	$t9,fprintf
	jal	$ra,$t9
	.loc 1 60 0
	la	$a0,__sF+176
	la	$a1,$LC14
	la	$t9,fprintf
	jal	$ra,$t9
	.loc 1 61 0
	la	$a0,__sF+176
	la	$a1,$LC15
	la	$t9,fprintf
	jal	$ra,$t9
	.loc 1 62 0
	la	$a0,__sF+176
	la	$a1,$LC16
	la	$t9,fprintf
	jal	$ra,$t9
	.loc 1 63 0
	la	$a0,__sF+176
	la	$a1,$LC17
	la	$t9,fprintf
	jal	$ra,$t9
	.loc 1 65 0
	la	$a0,__sF+176
	la	$a1,$LC18
	la	$t9,fprintf
	jal	$ra,$t9
	.loc 1 66 0
	la	$a0,__sF+176
	la	$a1,$LC19
	lw	$a2,40($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	.loc 1 67 0
	la	$a0,__sF+176
	la	$a1,$LC20
	lw	$a2,40($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	.loc 1 69 0
	move	$a0,$zero
	la	$t9,exit
	jal	$ra,$t9
	.loc 1 70 0
	.end	optHelp
$LFE31:
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
$LFB33:
	.loc 1 73 0
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
$LCFI10:
	sw	$ra,40($sp)
$LCFI11:
	sw	$fp,36($sp)
$LCFI12:
	sw	$gp,32($sp)
$LCFI13:
	move	$fp,$sp
$LCFI14:
	sw	$a0,48($fp)
	.loc 1 74 0
	lw	$v0,48($fp)
	bne	$v0,$zero,$L21
	.loc 1 76 0
	li	$v0,1			# 0x1
	sw	$v0,24($fp)
	b	$L20
$L21:
	.loc 1 79 0
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
	.loc 1 82 0
	li	$v0,1			# 0x1
	sw	$v0,24($fp)
	b	$L20
$L22:
	.loc 1 85 0
	sw	$zero,24($fp)
	.loc 1 86 0
$L20:
	lw	$v0,24($fp)
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	validateStreamName
$LFE33:
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
$LFB35:
	.loc 1 89 0
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
$LCFI15:
	sw	$ra,44($sp)
$LCFI16:
	sw	$fp,40($sp)
$LCFI17:
	sw	$gp,36($sp)
$LCFI18:
	sw	$s0,32($sp)
$LCFI19:
	move	$fp,$sp
$LCFI20:
	sw	$a0,48($fp)
	sw	$a1,52($fp)
	.loc 1 90 0
	lw	$a0,48($fp)
	la	$t9,validateStreamName
	jal	$ra,$t9
	move	$v1,$v0
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L25
	.loc 1 92 0
	la	$a0,__sF+176
	la	$a1,$LC25
	la	$t9,fprintf
	jal	$ra,$t9
	.loc 1 93 0
	li	$v0,1			# 0x1
	sw	$v0,24($fp)
	b	$L24
$L25:
	.loc 1 96 0
	lw	$a0,48($fp)
	la	$a1,$LC26
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L26
	.loc 1 98 0
	lw	$v1,52($fp)
	la	$v0,__sF
	sw	$v0,4($v1)
	b	$L27
$L26:
	.loc 1 102 0
	lw	$s0,52($fp)
	lw	$a0,48($fp)
	la	$a1,$LC27
	la	$t9,fopen
	jal	$ra,$t9
	sw	$v0,4($s0)
$L27:
	.loc 1 105 0
	lw	$v0,52($fp)
	lw	$v0,4($v0)
	bne	$v0,$zero,$L28
	.loc 1 107 0
	la	$a0,__sF+176
	la	$a1,$LC28
	la	$t9,fprintf
	jal	$ra,$t9
	.loc 1 108 0
	li	$v0,1			# 0x1
	sw	$v0,24($fp)
	b	$L24
$L28:
	.loc 1 111 0
	sw	$zero,24($fp)
	.loc 1 112 0
$L24:
	lw	$v0,24($fp)
	move	$sp,$fp
	lw	$ra,44($sp)
	lw	$fp,40($sp)
	lw	$s0,32($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	optInput
$LFE35:
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
$LFB37:
	.loc 1 115 0
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
$LCFI21:
	sw	$ra,44($sp)
$LCFI22:
	sw	$fp,40($sp)
$LCFI23:
	sw	$gp,36($sp)
$LCFI24:
	sw	$s0,32($sp)
$LCFI25:
	move	$fp,$sp
$LCFI26:
	sw	$a0,48($fp)
	sw	$a1,52($fp)
	.loc 1 116 0
	lw	$a0,48($fp)
	la	$t9,validateStreamName
	jal	$ra,$t9
	move	$v1,$v0
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L30
	.loc 1 118 0
	la	$a0,__sF+176
	la	$a1,$LC29
	la	$t9,fprintf
	jal	$ra,$t9
	.loc 1 119 0
	li	$v0,1			# 0x1
	sw	$v0,24($fp)
	b	$L29
$L30:
	.loc 1 122 0
	lw	$a0,48($fp)
	la	$a1,$LC26
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L31
	.loc 1 124 0
	lw	$v1,52($fp)
	la	$v0,__sF+88
	sw	$v0,8($v1)
	b	$L32
$L31:
	.loc 1 128 0
	lw	$s0,52($fp)
	lw	$a0,48($fp)
	la	$a1,$LC30
	la	$t9,fopen
	jal	$ra,$t9
	sw	$v0,8($s0)
$L32:
	.loc 1 131 0
	lw	$v0,52($fp)
	lw	$v0,8($v0)
	bne	$v0,$zero,$L33
	.loc 1 133 0
	la	$a0,__sF+176
	la	$a1,$LC31
	la	$t9,fprintf
	jal	$ra,$t9
	.loc 1 134 0
	li	$v0,1			# 0x1
	sw	$v0,24($fp)
	b	$L29
$L33:
	.loc 1 137 0
	sw	$zero,24($fp)
	.loc 1 138 0
$L29:
	lw	$v0,24($fp)
	move	$sp,$fp
	lw	$ra,44($sp)
	lw	$fp,40($sp)
	lw	$s0,32($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	optOutput
$LFE37:
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
$LFB39:
	.loc 1 141 0
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
$LCFI27:
	sw	$ra,40($sp)
$LCFI28:
	sw	$fp,36($sp)
$LCFI29:
	sw	$gp,32($sp)
$LCFI30:
	move	$fp,$sp
$LCFI31:
	sw	$a0,48($fp)
	sw	$a1,52($fp)
	.loc 1 142 0
	lw	$v0,48($fp)
	bne	$v0,$zero,$L35
	.loc 1 144 0
	la	$a0,__sF+176
	la	$a1,$LC7
	la	$t9,fprintf
	jal	$ra,$t9
	.loc 1 145 0
	li	$v0,1			# 0x1
	sw	$v0,24($fp)
	b	$L34
$L35:
	.loc 1 148 0
	lw	$a0,48($fp)
	la	$a1,$LC32
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L36
	.loc 1 150 0
	lw	$v1,52($fp)
	la	$v0,$LC32
	sw	$v0,0($v1)
	b	$L37
$L36:
	.loc 1 152 0
	lw	$a0,48($fp)
	la	$a1,$LC33
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L38
	.loc 1 154 0
	lw	$v1,52($fp)
	la	$v0,$LC33
	sw	$v0,0($v1)
	b	$L37
$L38:
	.loc 1 158 0
	la	$a0,__sF+176
	la	$a1,$LC7
	la	$t9,fprintf
	jal	$ra,$t9
	.loc 1 159 0
	li	$v0,1			# 0x1
	sw	$v0,24($fp)
	b	$L34
$L37:
	.loc 1 162 0
	sw	$zero,24($fp)
	.loc 1 163 0
$L34:
	lw	$v0,24($fp)
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	optAction
$LFE39:
	.size	optAction, .-optAction
	.rdata
	.align	2
$LC34:
	.ascii	"Vhi:o:a:\000"
	.text
	.align	2
	.globl	parseCmdline
$LFB41:
	.loc 1 166 0
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
$LCFI32:
	sw	$ra,72($sp)
$LCFI33:
	sw	$fp,68($sp)
$LCFI34:
	sw	$gp,64($sp)
$LCFI35:
	move	$fp,$sp
$LCFI36:
	sw	$a0,80($fp)
	sw	$a1,84($fp)
	sw	$a2,88($fp)
	.loc 1 167 0
$LBB2:
	sw	$zero,32($fp)
	.loc 1 170 0
	li	$v0,1			# 0x1
	sw	$v0,40($fp)
	.loc 1 171 0
	lw	$v0,84($fp)
	lw	$v0,0($v0)
	sw	$v0,44($fp)
	.loc 1 174 0
	lw	$v1,88($fp)
	la	$v0,$LC32
	sw	$v0,0($v1)
	.loc 1 175 0
	lw	$v1,88($fp)
	la	$v0,__sF
	sw	$v0,4($v1)
	.loc 1 176 0
	lw	$v1,88($fp)
	la	$v0,__sF+88
	sw	$v0,8($v1)
	.loc 1 180 0
	la	$v0,$LC34
	sw	$v0,48($fp)
	.loc 1 182 0
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
	.loc 1 185 0
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
	.loc 1 188 0
	la	$t9,optVersion
	jal	$ra,$t9
	.loc 1 189 0
	b	$L44
$L46:
	.loc 1 191 0
	lw	$a0,44($fp)
	la	$t9,optHelp
	jal	$ra,$t9
	.loc 1 192 0
	b	$L44
$L47:
	.loc 1 194 0
	lw	$a0,optarg
	lw	$a1,88($fp)
	la	$t9,optInput
	jal	$ra,$t9
	sw	$v0,40($fp)
	.loc 1 195 0
	b	$L44
$L48:
	.loc 1 197 0
	lw	$a0,optarg
	lw	$a1,88($fp)
	la	$t9,optOutput
	jal	$ra,$t9
	sw	$v0,40($fp)
	.loc 1 198 0
	b	$L44
$L49:
	.loc 1 200 0
	lw	$a0,optarg
	lw	$a1,88($fp)
	la	$t9,optAction
	jal	$ra,$t9
	sw	$v0,40($fp)
	.loc 1 201 0
	b	$L44
$L50:
	.loc 1 204 0
	li	$v0,1			# 0x1
	sw	$v0,40($fp)
$L44:
	.loc 1 207 0
	lw	$v1,40($fp)
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L41
	.loc 1 209 0
	li	$v0,1			# 0x1
	sw	$v0,52($fp)
	b	$L40
$L42:
	.loc 1 213 0
	sw	$zero,52($fp)
	.loc 1 214 0
$L40:
$LBE2:
	lw	$v0,52($fp)
	move	$sp,$fp
	lw	$ra,72($sp)
	lw	$fp,68($sp)
	addu	$sp,$sp,80
	j	$ra
	.end	parseCmdline
$LFE41:
	.size	parseCmdline, .-parseCmdline
	.section	.debug_frame,"",@progbits
$Lframe0:
	.4byte	$LECIE0-$LSCIE0
$LSCIE0:
	.4byte	0xffffffff
	.byte	0x1
	.ascii	"\000"
	.uleb128 0x1
	.sleb128 4
	.byte	0x40
	.byte	0xc
	.uleb128 0x1d
	.uleb128 0x0
	.align	2
$LECIE0:
$LSFDE0:
	.4byte	$LEFDE0-$LASFDE0
$LASFDE0:
	.4byte	$Lframe0
	.4byte	$LFB29
	.4byte	$LFE29-$LFB29
	.byte	0x4
	.4byte	$LCFI0-$LFB29
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	$LCFI3-$LCFI0
	.byte	0x11
	.uleb128 0x1c
	.sleb128 -4
	.byte	0x11
	.uleb128 0x1e
	.sleb128 -3
	.byte	0x11
	.uleb128 0x40
	.sleb128 -2
	.byte	0x4
	.4byte	$LCFI4-$LCFI3
	.byte	0xc
	.uleb128 0x1e
	.uleb128 0x28
	.align	2
$LEFDE0:
$LSFDE2:
	.4byte	$LEFDE2-$LASFDE2
$LASFDE2:
	.4byte	$Lframe0
	.4byte	$LFB31
	.4byte	$LFE31-$LFB31
	.byte	0x4
	.4byte	$LCFI5-$LFB31
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	$LCFI8-$LCFI5
	.byte	0x11
	.uleb128 0x1c
	.sleb128 -4
	.byte	0x11
	.uleb128 0x1e
	.sleb128 -3
	.byte	0x11
	.uleb128 0x40
	.sleb128 -2
	.byte	0x4
	.4byte	$LCFI9-$LCFI8
	.byte	0xc
	.uleb128 0x1e
	.uleb128 0x28
	.align	2
$LEFDE2:
$LSFDE4:
	.4byte	$LEFDE4-$LASFDE4
$LASFDE4:
	.4byte	$Lframe0
	.4byte	$LFB33
	.4byte	$LFE33-$LFB33
	.byte	0x4
	.4byte	$LCFI10-$LFB33
	.byte	0xe
	.uleb128 0x30
	.byte	0x4
	.4byte	$LCFI13-$LCFI10
	.byte	0x11
	.uleb128 0x1c
	.sleb128 -4
	.byte	0x11
	.uleb128 0x1e
	.sleb128 -3
	.byte	0x11
	.uleb128 0x40
	.sleb128 -2
	.byte	0x4
	.4byte	$LCFI14-$LCFI13
	.byte	0xc
	.uleb128 0x1e
	.uleb128 0x30
	.align	2
$LEFDE4:
$LSFDE6:
	.4byte	$LEFDE6-$LASFDE6
$LASFDE6:
	.4byte	$Lframe0
	.4byte	$LFB35
	.4byte	$LFE35-$LFB35
	.byte	0x4
	.4byte	$LCFI15-$LFB35
	.byte	0xe
	.uleb128 0x30
	.byte	0x4
	.4byte	$LCFI19-$LCFI15
	.byte	0x11
	.uleb128 0x10
	.sleb128 -4
	.byte	0x11
	.uleb128 0x1c
	.sleb128 -3
	.byte	0x11
	.uleb128 0x1e
	.sleb128 -2
	.byte	0x11
	.uleb128 0x40
	.sleb128 -1
	.byte	0x4
	.4byte	$LCFI20-$LCFI19
	.byte	0xc
	.uleb128 0x1e
	.uleb128 0x30
	.align	2
$LEFDE6:
$LSFDE8:
	.4byte	$LEFDE8-$LASFDE8
$LASFDE8:
	.4byte	$Lframe0
	.4byte	$LFB37
	.4byte	$LFE37-$LFB37
	.byte	0x4
	.4byte	$LCFI21-$LFB37
	.byte	0xe
	.uleb128 0x30
	.byte	0x4
	.4byte	$LCFI25-$LCFI21
	.byte	0x11
	.uleb128 0x10
	.sleb128 -4
	.byte	0x11
	.uleb128 0x1c
	.sleb128 -3
	.byte	0x11
	.uleb128 0x1e
	.sleb128 -2
	.byte	0x11
	.uleb128 0x40
	.sleb128 -1
	.byte	0x4
	.4byte	$LCFI26-$LCFI25
	.byte	0xc
	.uleb128 0x1e
	.uleb128 0x30
	.align	2
$LEFDE8:
$LSFDE10:
	.4byte	$LEFDE10-$LASFDE10
$LASFDE10:
	.4byte	$Lframe0
	.4byte	$LFB39
	.4byte	$LFE39-$LFB39
	.byte	0x4
	.4byte	$LCFI27-$LFB39
	.byte	0xe
	.uleb128 0x30
	.byte	0x4
	.4byte	$LCFI30-$LCFI27
	.byte	0x11
	.uleb128 0x1c
	.sleb128 -4
	.byte	0x11
	.uleb128 0x1e
	.sleb128 -3
	.byte	0x11
	.uleb128 0x40
	.sleb128 -2
	.byte	0x4
	.4byte	$LCFI31-$LCFI30
	.byte	0xc
	.uleb128 0x1e
	.uleb128 0x30
	.align	2
$LEFDE10:
$LSFDE12:
	.4byte	$LEFDE12-$LASFDE12
$LASFDE12:
	.4byte	$Lframe0
	.4byte	$LFB41
	.4byte	$LFE41-$LFB41
	.byte	0x4
	.4byte	$LCFI32-$LFB41
	.byte	0xe
	.uleb128 0x50
	.byte	0x4
	.4byte	$LCFI35-$LCFI32
	.byte	0x11
	.uleb128 0x1c
	.sleb128 -4
	.byte	0x11
	.uleb128 0x1e
	.sleb128 -3
	.byte	0x11
	.uleb128 0x40
	.sleb128 -2
	.byte	0x4
	.4byte	$LCFI36-$LCFI35
	.byte	0xc
	.uleb128 0x1e
	.uleb128 0x50
	.align	2
$LEFDE12:
	.align	0
	.text
$Letext0:
	.section	.debug_info
	.4byte	0xe2f
	.2byte	0x2
	.4byte	$Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	$Ldebug_line0
	.4byte	$Letext0
	.4byte	$Ltext0
	.4byte	$LC267
	.4byte	$LC268
	.4byte	$LC269
	.byte	0x1
	.uleb128 0x2
	.4byte	$LC35
	.byte	0x2
	.byte	0x30
	.4byte	0x30
	.uleb128 0x3
	.4byte	$LC37
	.byte	0x1
	.byte	0x6
	.uleb128 0x2
	.4byte	$LC36
	.byte	0x2
	.byte	0x31
	.4byte	0x42
	.uleb128 0x3
	.4byte	$LC38
	.byte	0x1
	.byte	0x8
	.uleb128 0x2
	.4byte	$LC39
	.byte	0x2
	.byte	0x32
	.4byte	0x54
	.uleb128 0x3
	.4byte	$LC40
	.byte	0x2
	.byte	0x5
	.uleb128 0x2
	.4byte	$LC41
	.byte	0x2
	.byte	0x33
	.4byte	0x66
	.uleb128 0x3
	.4byte	$LC42
	.byte	0x2
	.byte	0x7
	.uleb128 0x2
	.4byte	$LC43
	.byte	0x2
	.byte	0x34
	.4byte	0x78
	.uleb128 0x4
	.ascii	"int\000"
	.byte	0x4
	.byte	0x5
	.uleb128 0x2
	.4byte	$LC44
	.byte	0x2
	.byte	0x35
	.4byte	0x8a
	.uleb128 0x3
	.4byte	$LC45
	.byte	0x4
	.byte	0x7
	.uleb128 0x2
	.4byte	$LC46
	.byte	0x2
	.byte	0x3e
	.4byte	0x9c
	.uleb128 0x3
	.4byte	$LC47
	.byte	0x8
	.byte	0x5
	.uleb128 0x2
	.4byte	$LC48
	.byte	0x2
	.byte	0x40
	.4byte	0xae
	.uleb128 0x3
	.4byte	$LC49
	.byte	0x8
	.byte	0x7
	.uleb128 0x2
	.4byte	$LC50
	.byte	0x2
	.byte	0x4b
	.4byte	0x78
	.uleb128 0x2
	.4byte	$LC51
	.byte	0x2
	.byte	0x4c
	.4byte	0x8a
	.uleb128 0x5
	.4byte	0xea
	.byte	0x80
	.byte	0x3
	.byte	0x65
	.uleb128 0x6
	.4byte	$LC52
	.byte	0x3
	.byte	0x63
	.4byte	0xea
	.uleb128 0x6
	.4byte	$LC53
	.byte	0x3
	.byte	0x64
	.4byte	0x91
	.byte	0x0
	.uleb128 0x7
	.4byte	0xfa
	.4byte	0x101
	.uleb128 0x8
	.4byte	0xfa
	.byte	0x7f
	.byte	0x0
	.uleb128 0x3
	.4byte	$LC45
	.byte	0x4
	.byte	0x7
	.uleb128 0x3
	.4byte	$LC54
	.byte	0x1
	.byte	0x6
	.uleb128 0x2
	.4byte	$LC55
	.byte	0x3
	.byte	0x65
	.4byte	0xcb
	.uleb128 0x2
	.4byte	$LC56
	.byte	0x4
	.byte	0x3b
	.4byte	0x11e
	.uleb128 0x3
	.4byte	$LC57
	.byte	0x4
	.byte	0x5
	.uleb128 0x2
	.4byte	$LC58
	.byte	0x4
	.byte	0x3c
	.4byte	0x130
	.uleb128 0x3
	.4byte	$LC59
	.byte	0x4
	.byte	0x7
	.uleb128 0x2
	.4byte	$LC60
	.byte	0x4
	.byte	0x3d
	.4byte	0x11e
	.uleb128 0x2
	.4byte	$LC61
	.byte	0x4
	.byte	0x46
	.4byte	0x130
	.uleb128 0x2
	.4byte	$LC62
	.byte	0x4
	.byte	0x47
	.4byte	0x130
	.uleb128 0x2
	.4byte	$LC63
	.byte	0x4
	.byte	0x49
	.4byte	0x130
	.uleb128 0x2
	.4byte	$LC64
	.byte	0x4
	.byte	0x4a
	.4byte	0x130
	.uleb128 0x2
	.4byte	$LC65
	.byte	0x4
	.byte	0x51
	.4byte	0x11e
	.uleb128 0x2
	.4byte	$LC66
	.byte	0x4
	.byte	0x5a
	.4byte	0x184
	.uleb128 0x9
	.4byte	0x78
	.uleb128 0x2
	.4byte	$LC67
	.byte	0x5
	.byte	0x2c
	.4byte	0x194
	.uleb128 0xa
	.byte	0x4
	.4byte	0x101
	.uleb128 0x2
	.4byte	$LC68
	.byte	0x5
	.byte	0x2d
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC69
	.byte	0x5
	.byte	0x2e
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC70
	.byte	0x5
	.byte	0x2f
	.4byte	0x5b
	.uleb128 0x2
	.4byte	$LC71
	.byte	0x5
	.byte	0x30
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC72
	.byte	0x5
	.byte	0x31
	.4byte	0x91
	.uleb128 0x2
	.4byte	$LC73
	.byte	0x5
	.byte	0x32
	.4byte	0x6d
	.uleb128 0x2
	.4byte	$LC74
	.byte	0x5
	.byte	0x33
	.4byte	0x37
	.uleb128 0x2
	.4byte	$LC75
	.byte	0x5
	.byte	0x34
	.4byte	0x8a
	.uleb128 0x2
	.4byte	$LC76
	.byte	0x5
	.byte	0x35
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC77
	.byte	0x5
	.byte	0x36
	.4byte	0xa3
	.uleb128 0x2
	.4byte	$LC78
	.byte	0x5
	.byte	0x37
	.4byte	0xa3
	.uleb128 0x2
	.4byte	$LC79
	.byte	0x6
	.byte	0x36
	.4byte	0x25
	.uleb128 0x2
	.4byte	$LC80
	.byte	0x6
	.byte	0x3b
	.4byte	0x37
	.uleb128 0x2
	.4byte	$LC81
	.byte	0x6
	.byte	0x40
	.4byte	0x49
	.uleb128 0x2
	.4byte	$LC82
	.byte	0x6
	.byte	0x45
	.4byte	0x5b
	.uleb128 0x2
	.4byte	$LC83
	.byte	0x6
	.byte	0x4a
	.4byte	0x6d
	.uleb128 0x2
	.4byte	$LC84
	.byte	0x6
	.byte	0x4f
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC85
	.byte	0x6
	.byte	0x54
	.4byte	0x91
	.uleb128 0x2
	.4byte	$LC86
	.byte	0x6
	.byte	0x59
	.4byte	0xa3
	.uleb128 0x2
	.4byte	$LC87
	.byte	0x6
	.byte	0x5d
	.4byte	0x37
	.uleb128 0x2
	.4byte	$LC88
	.byte	0x6
	.byte	0x5e
	.4byte	0x5b
	.uleb128 0x2
	.4byte	$LC89
	.byte	0x6
	.byte	0x5f
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC90
	.byte	0x6
	.byte	0x60
	.4byte	0xa3
	.uleb128 0x2
	.4byte	$LC91
	.byte	0x7
	.byte	0x3a
	.4byte	0x1a5
	.uleb128 0x2
	.4byte	$LC92
	.byte	0x7
	.byte	0x3f
	.4byte	0x1b0
	.uleb128 0x2
	.4byte	$LC93
	.byte	0x6
	.byte	0x65
	.4byte	0x42
	.uleb128 0x2
	.4byte	$LC94
	.byte	0x6
	.byte	0x66
	.4byte	0x66
	.uleb128 0x2
	.4byte	$LC95
	.byte	0x6
	.byte	0x67
	.4byte	0x8a
	.uleb128 0x2
	.4byte	$LC96
	.byte	0x6
	.byte	0x68
	.4byte	0x130
	.uleb128 0x2
	.4byte	$LC97
	.byte	0x6
	.byte	0x6a
	.4byte	0x42
	.uleb128 0x2
	.4byte	$LC98
	.byte	0x6
	.byte	0x6b
	.4byte	0x66
	.uleb128 0x2
	.4byte	$LC99
	.byte	0x6
	.byte	0x6c
	.4byte	0x8a
	.uleb128 0x2
	.4byte	$LC100
	.byte	0x6
	.byte	0x6d
	.4byte	0x130
	.uleb128 0x2
	.4byte	$LC101
	.byte	0x6
	.byte	0x6f
	.4byte	0x2ce
	.uleb128 0x2
	.4byte	$LC102
	.byte	0x6
	.byte	0x72
	.4byte	0xa3
	.uleb128 0x2
	.4byte	$LC103
	.byte	0x6
	.byte	0x73
	.4byte	0x91
	.uleb128 0x2
	.4byte	$LC104
	.byte	0x6
	.byte	0x74
	.4byte	0x331
	.uleb128 0xa
	.byte	0x4
	.4byte	0x31b
	.uleb128 0x2
	.4byte	$LC105
	.byte	0x6
	.byte	0x80
	.4byte	0x91
	.uleb128 0x2
	.4byte	$LC106
	.byte	0x6
	.byte	0x81
	.4byte	0xa3
	.uleb128 0x2
	.4byte	$LC107
	.byte	0x6
	.byte	0x83
	.4byte	0x91
	.uleb128 0x2
	.4byte	$LC108
	.byte	0x6
	.byte	0x84
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC109
	.byte	0x6
	.byte	0x87
	.4byte	0x1fd
	.uleb128 0x2
	.4byte	$LC110
	.byte	0x6
	.byte	0x8c
	.4byte	0x208
	.uleb128 0x2
	.4byte	$LC111
	.byte	0x6
	.byte	0x91
	.4byte	0x189
	.uleb128 0x2
	.4byte	$LC112
	.byte	0x6
	.byte	0x99
	.4byte	0x91
	.uleb128 0x2
	.4byte	$LC113
	.byte	0x6
	.byte	0x9c
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC114
	.byte	0x6
	.byte	0x9d
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC115
	.byte	0x6
	.byte	0xa0
	.4byte	0x19a
	.uleb128 0x2
	.4byte	$LC116
	.byte	0x6
	.byte	0xa4
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC117
	.byte	0x6
	.byte	0xa5
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC118
	.byte	0x6
	.byte	0xa6
	.4byte	0x11e
	.uleb128 0x2
	.4byte	$LC119
	.byte	0x6
	.byte	0xa9
	.4byte	0x1bb
	.uleb128 0x2
	.4byte	$LC120
	.byte	0x6
	.byte	0xad
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC121
	.byte	0x6
	.byte	0xb0
	.4byte	0x1c6
	.uleb128 0x2
	.4byte	$LC122
	.byte	0x6
	.byte	0xb5
	.4byte	0x1d1
	.uleb128 0x2
	.4byte	$LC123
	.byte	0x6
	.byte	0xb8
	.4byte	0x6d
	.uleb128 0x2
	.4byte	$LC124
	.byte	0x6
	.byte	0xb9
	.4byte	0x31b
	.uleb128 0x2
	.4byte	$LC125
	.byte	0x6
	.byte	0xba
	.4byte	0x6d
	.uleb128 0x2
	.4byte	$LC126
	.byte	0x6
	.byte	0xbb
	.4byte	0x6d
	.uleb128 0x2
	.4byte	$LC127
	.byte	0x6
	.byte	0xbe
	.4byte	0x1f2
	.uleb128 0x2
	.4byte	$LC128
	.byte	0x6
	.byte	0xc2
	.4byte	0x6d
	.uleb128 0x2
	.4byte	$LC129
	.byte	0x6
	.byte	0xfc
	.4byte	0x130
	.uleb128 0xb
	.4byte	$LC130
	.byte	0x6
	.2byte	0x101
	.4byte	0x8a
	.uleb128 0xb
	.4byte	$LC131
	.byte	0x6
	.2byte	0x107
	.4byte	0x78
	.uleb128 0xb
	.4byte	$LC132
	.byte	0x6
	.2byte	0x10c
	.4byte	0x11e
	.uleb128 0xb
	.4byte	$LC133
	.byte	0x6
	.2byte	0x111
	.4byte	0x78
	.uleb128 0xb
	.4byte	$LC134
	.byte	0x6
	.2byte	0x116
	.4byte	0x78
	.uleb128 0xb
	.4byte	$LC135
	.byte	0x6
	.2byte	0x11b
	.4byte	0x78
	.uleb128 0xb
	.4byte	$LC136
	.byte	0x6
	.2byte	0x120
	.4byte	0x8a
	.uleb128 0xb
	.4byte	$LC137
	.byte	0x6
	.2byte	0x12d
	.4byte	0x6d
	.uleb128 0xc
	.4byte	0x4c7
	.4byte	$LC139
	.byte	0x20
	.byte	0x6
	.2byte	0x142
	.uleb128 0xd
	.4byte	$LC138
	.byte	0x6
	.2byte	0x143
	.4byte	0x4c7
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x7
	.4byte	0x4d7
	.4byte	0x49e
	.uleb128 0x8
	.4byte	0xfa
	.byte	0x7
	.byte	0x0
	.uleb128 0xb
	.4byte	$LC139
	.byte	0x6
	.2byte	0x144
	.4byte	0x4aa
	.uleb128 0x2
	.4byte	$LC140
	.byte	0x8
	.byte	0x2e
	.4byte	0x184
	.uleb128 0xe
	.4byte	0x517
	.4byte	$LC141
	.byte	0x8
	.byte	0x8
	.byte	0x39
	.uleb128 0xf
	.4byte	$LC142
	.byte	0x8
	.byte	0x39
	.4byte	0x51d
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC143
	.byte	0x8
	.byte	0x39
	.4byte	0x523
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x10
	.4byte	$LC261
	.byte	0x1
	.uleb128 0xa
	.byte	0x4
	.4byte	0x517
	.uleb128 0xa
	.byte	0x4
	.4byte	0x51d
	.uleb128 0x2
	.4byte	$LC144
	.byte	0x8
	.byte	0x47
	.4byte	0x51d
	.uleb128 0x2
	.4byte	$LC145
	.byte	0x8
	.byte	0x48
	.4byte	0x53f
	.uleb128 0xe
	.4byte	0x576
	.4byte	$LC146
	.byte	0xc
	.byte	0x8
	.byte	0x3c
	.uleb128 0xf
	.4byte	$LC147
	.byte	0x8
	.byte	0x56
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC148
	.byte	0x8
	.byte	0x58
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.uleb128 0xf
	.4byte	$LC149
	.byte	0x8
	.byte	0x59
	.4byte	0x885
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC150
	.byte	0x8
	.byte	0x49
	.4byte	0x581
	.uleb128 0xe
	.4byte	0x5e2
	.4byte	$LC151
	.byte	0x1c
	.byte	0x8
	.byte	0x3d
	.uleb128 0xf
	.4byte	$LC152
	.byte	0x8
	.byte	0x5d
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC153
	.byte	0x8
	.byte	0x66
	.4byte	0x184
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.uleb128 0xf
	.4byte	$LC154
	.byte	0x8
	.byte	0x69
	.4byte	0x184
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.uleb128 0xf
	.4byte	$LC155
	.byte	0x8
	.byte	0x6a
	.4byte	0x529
	.byte	0x2
	.byte	0x10
	.uleb128 0xc
	.uleb128 0xf
	.4byte	$LC156
	.byte	0x8
	.byte	0x6b
	.4byte	0x4ee
	.byte	0x2
	.byte	0x10
	.uleb128 0x10
	.uleb128 0xf
	.4byte	$LC157
	.byte	0x8
	.byte	0x6c
	.4byte	0x885
	.byte	0x2
	.byte	0x10
	.uleb128 0x18
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC158
	.byte	0x8
	.byte	0x4a
	.4byte	0x5ed
	.uleb128 0xe
	.4byte	0x616
	.4byte	$LC159
	.byte	0x8
	.byte	0x8
	.byte	0x3e
	.uleb128 0xf
	.4byte	$LC160
	.byte	0x8
	.byte	0x7c
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC161
	.byte	0x8
	.byte	0x7d
	.4byte	0x885
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC162
	.byte	0x8
	.byte	0x4b
	.4byte	0x621
	.uleb128 0xe
	.4byte	0x674
	.4byte	$LC163
	.byte	0x18
	.byte	0x8
	.byte	0x3f
	.uleb128 0xf
	.4byte	$LC164
	.byte	0x8
	.byte	0x85
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC165
	.byte	0x8
	.byte	0x88
	.4byte	0x184
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.uleb128 0xf
	.4byte	$LC166
	.byte	0x8
	.byte	0x89
	.4byte	0x4ee
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.uleb128 0xf
	.4byte	$LC167
	.byte	0x8
	.byte	0x8b
	.4byte	0x887
	.byte	0x2
	.byte	0x10
	.uleb128 0x10
	.uleb128 0xf
	.4byte	$LC168
	.byte	0x8
	.byte	0x8c
	.4byte	0x885
	.byte	0x2
	.byte	0x10
	.uleb128 0x14
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC169
	.byte	0x8
	.byte	0x4c
	.4byte	0x67f
	.uleb128 0xe
	.4byte	0x6a8
	.4byte	$LC170
	.byte	0x8
	.byte	0x8
	.byte	0x40
	.uleb128 0xf
	.4byte	$LC171
	.byte	0x8
	.byte	0x9a
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC172
	.byte	0x8
	.byte	0x9b
	.4byte	0x885
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC173
	.byte	0x8
	.byte	0x4d
	.4byte	0x6b3
	.uleb128 0xe
	.4byte	0x6dc
	.4byte	$LC174
	.byte	0x20
	.byte	0x8
	.byte	0x4d
	.uleb128 0xf
	.4byte	$LC175
	.byte	0x8
	.byte	0xa2
	.4byte	0x576
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC176
	.byte	0x8
	.byte	0xa3
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC177
	.byte	0x8
	.byte	0x4e
	.4byte	0x6e7
	.uleb128 0xe
	.4byte	0x71e
	.4byte	$LC178
	.byte	0xc
	.byte	0x8
	.byte	0x4e
	.uleb128 0xf
	.4byte	$LC179
	.byte	0x8
	.byte	0xa9
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC180
	.byte	0x8
	.byte	0xaa
	.4byte	0x184
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.uleb128 0xf
	.4byte	$LC181
	.byte	0x8
	.byte	0xab
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC182
	.byte	0x8
	.byte	0x4f
	.4byte	0x729
	.uleb128 0xe
	.4byte	0x798
	.4byte	$LC183
	.byte	0x24
	.byte	0x8
	.byte	0x42
	.uleb128 0xf
	.4byte	$LC184
	.byte	0x8
	.byte	0xb9
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC185
	.byte	0x8
	.byte	0xbc
	.4byte	0x184
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.uleb128 0xf
	.4byte	$LC186
	.byte	0x8
	.byte	0xbe
	.4byte	0x4ee
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.uleb128 0xf
	.4byte	$LC187
	.byte	0x8
	.byte	0xbf
	.4byte	0x4ee
	.byte	0x2
	.byte	0x10
	.uleb128 0x10
	.uleb128 0xf
	.4byte	$LC188
	.byte	0x8
	.byte	0xc0
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x18
	.uleb128 0xf
	.4byte	$LC189
	.byte	0x8
	.byte	0xc1
	.4byte	0x529
	.byte	0x2
	.byte	0x10
	.uleb128 0x1c
	.uleb128 0xf
	.4byte	$LC190
	.byte	0x8
	.byte	0xc2
	.4byte	0x885
	.byte	0x2
	.byte	0x10
	.uleb128 0x20
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC191
	.byte	0x8
	.byte	0x50
	.4byte	0x7a3
	.uleb128 0xe
	.4byte	0x7cc
	.4byte	$LC192
	.byte	0x8
	.byte	0x8
	.byte	0x43
	.uleb128 0xf
	.4byte	$LC193
	.byte	0x8
	.byte	0xd2
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC194
	.byte	0x8
	.byte	0xd3
	.4byte	0x885
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC195
	.byte	0x8
	.byte	0x51
	.4byte	0x7d7
	.uleb128 0xe
	.4byte	0x846
	.4byte	$LC196
	.byte	0x20
	.byte	0x8
	.byte	0x44
	.uleb128 0xf
	.4byte	$LC197
	.byte	0x8
	.byte	0xda
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC198
	.byte	0x8
	.byte	0xdd
	.4byte	0x184
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.uleb128 0xf
	.4byte	$LC199
	.byte	0x8
	.byte	0xdf
	.4byte	0x4ee
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.uleb128 0xf
	.4byte	$LC200
	.byte	0x8
	.byte	0xe0
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x10
	.uleb128 0xf
	.4byte	$LC201
	.byte	0x8
	.byte	0xe1
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x14
	.uleb128 0xf
	.4byte	$LC202
	.byte	0x8
	.byte	0xe2
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x18
	.uleb128 0xf
	.4byte	$LC203
	.byte	0x8
	.byte	0xe4
	.4byte	0x885
	.byte	0x2
	.byte	0x10
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC204
	.byte	0x8
	.byte	0x52
	.4byte	0x851
	.uleb128 0xe
	.4byte	0x87a
	.4byte	$LC205
	.byte	0x8
	.byte	0x8
	.byte	0x45
	.uleb128 0xf
	.4byte	$LC206
	.byte	0x8
	.byte	0xeb
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC207
	.byte	0x8
	.byte	0xec
	.4byte	0x885
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC208
	.byte	0x8
	.byte	0x53
	.4byte	0x78
	.uleb128 0x11
	.byte	0x4
	.uleb128 0xa
	.byte	0x4
	.4byte	0x576
	.uleb128 0x2
	.4byte	$LC209
	.byte	0x9
	.byte	0xe9
	.4byte	0xb5
	.uleb128 0xe
	.4byte	0x8dd
	.4byte	$LC210
	.byte	0x10
	.byte	0xa
	.byte	0x36
	.uleb128 0xf
	.4byte	$LC211
	.byte	0xa
	.byte	0x38
	.4byte	0x8dd
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC212
	.byte	0xa
	.byte	0x3d
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.uleb128 0xf
	.4byte	$LC213
	.byte	0xa
	.byte	0x3f
	.4byte	0x8e8
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.uleb128 0x12
	.ascii	"val\000"
	.byte	0xa
	.byte	0x41
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0xc
	.byte	0x0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x8e3
	.uleb128 0x13
	.4byte	0x101
	.uleb128 0xa
	.byte	0x4
	.4byte	0x78
	.uleb128 0x2
	.4byte	$LC214
	.byte	0xb
	.byte	0x3a
	.4byte	0x1c6
	.uleb128 0xe
	.4byte	0x922
	.4byte	$LC215
	.byte	0x8
	.byte	0xb
	.byte	0x4a
	.uleb128 0xf
	.4byte	$LC216
	.byte	0xb
	.byte	0x4b
	.4byte	0x922
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC217
	.byte	0xb
	.byte	0x4c
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x42
	.uleb128 0xe
	.4byte	0xa4a
	.4byte	$LC218
	.byte	0x58
	.byte	0xb
	.byte	0x69
	.uleb128 0x12
	.ascii	"_p\000"
	.byte	0xb
	.byte	0x6a
	.4byte	0x922
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0x12
	.ascii	"_r\000"
	.byte	0xb
	.byte	0x6b
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.uleb128 0x12
	.ascii	"_w\000"
	.byte	0xb
	.byte	0x6c
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.uleb128 0xf
	.4byte	$LC219
	.byte	0xb
	.byte	0x6d
	.4byte	0x54
	.byte	0x2
	.byte	0x10
	.uleb128 0xc
	.uleb128 0xf
	.4byte	$LC220
	.byte	0xb
	.byte	0x6e
	.4byte	0x54
	.byte	0x2
	.byte	0x10
	.uleb128 0xe
	.uleb128 0x12
	.ascii	"_bf\000"
	.byte	0xb
	.byte	0x6f
	.4byte	0x8f9
	.byte	0x2
	.byte	0x10
	.uleb128 0x10
	.uleb128 0xf
	.4byte	$LC221
	.byte	0xb
	.byte	0x70
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x18
	.uleb128 0xf
	.4byte	$LC222
	.byte	0xb
	.byte	0x73
	.4byte	0x885
	.byte	0x2
	.byte	0x10
	.uleb128 0x1c
	.uleb128 0xf
	.4byte	$LC223
	.byte	0xb
	.byte	0x74
	.4byte	0xa5a
	.byte	0x2
	.byte	0x10
	.uleb128 0x20
	.uleb128 0xf
	.4byte	$LC224
	.byte	0xb
	.byte	0x75
	.4byte	0xa7a
	.byte	0x2
	.byte	0x10
	.uleb128 0x24
	.uleb128 0xf
	.4byte	$LC225
	.byte	0xb
	.byte	0x76
	.4byte	0xa9a
	.byte	0x2
	.byte	0x10
	.uleb128 0x28
	.uleb128 0xf
	.4byte	$LC226
	.byte	0xb
	.byte	0x77
	.4byte	0xaba
	.byte	0x2
	.byte	0x10
	.uleb128 0x2c
	.uleb128 0xf
	.4byte	$LC227
	.byte	0xb
	.byte	0x7a
	.4byte	0x8f9
	.byte	0x2
	.byte	0x10
	.uleb128 0x30
	.uleb128 0x12
	.ascii	"_up\000"
	.byte	0xb
	.byte	0x7d
	.4byte	0x922
	.byte	0x2
	.byte	0x10
	.uleb128 0x38
	.uleb128 0x12
	.ascii	"_ur\000"
	.byte	0xb
	.byte	0x7e
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x3c
	.uleb128 0xf
	.4byte	$LC228
	.byte	0xb
	.byte	0x81
	.4byte	0xac0
	.byte	0x2
	.byte	0x10
	.uleb128 0x40
	.uleb128 0xf
	.4byte	$LC229
	.byte	0xb
	.byte	0x82
	.4byte	0xad0
	.byte	0x2
	.byte	0x10
	.uleb128 0x43
	.uleb128 0x12
	.ascii	"_lb\000"
	.byte	0xb
	.byte	0x85
	.4byte	0x8f9
	.byte	0x2
	.byte	0x10
	.uleb128 0x44
	.uleb128 0xf
	.4byte	$LC230
	.byte	0xb
	.byte	0x88
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x4c
	.uleb128 0xf
	.4byte	$LC231
	.byte	0xb
	.byte	0x89
	.4byte	0x8ee
	.byte	0x2
	.byte	0x10
	.uleb128 0x50
	.byte	0x0
	.uleb128 0x14
	.4byte	0xa5a
	.byte	0x1
	.4byte	0x78
	.uleb128 0x15
	.4byte	0x885
	.byte	0x0
	.uleb128 0xa
	.byte	0x4
	.4byte	0xa4a
	.uleb128 0x14
	.4byte	0xa7a
	.byte	0x1
	.4byte	0x78
	.uleb128 0x15
	.4byte	0x885
	.uleb128 0x15
	.4byte	0x194
	.uleb128 0x15
	.4byte	0x78
	.byte	0x0
	.uleb128 0xa
	.byte	0x4
	.4byte	0xa60
	.uleb128 0x14
	.4byte	0xa9a
	.byte	0x1
	.4byte	0x8ee
	.uleb128 0x15
	.4byte	0x885
	.uleb128 0x15
	.4byte	0x8ee
	.uleb128 0x15
	.4byte	0x78
	.byte	0x0
	.uleb128 0xa
	.byte	0x4
	.4byte	0xa80
	.uleb128 0x14
	.4byte	0xaba
	.byte	0x1
	.4byte	0x78
	.uleb128 0x15
	.4byte	0x885
	.uleb128 0x15
	.4byte	0x8dd
	.uleb128 0x15
	.4byte	0x78
	.byte	0x0
	.uleb128 0xa
	.byte	0x4
	.4byte	0xaa0
	.uleb128 0x7
	.4byte	0xad0
	.4byte	0x42
	.uleb128 0x8
	.4byte	0xfa
	.byte	0x2
	.byte	0x0
	.uleb128 0x7
	.4byte	0xae0
	.4byte	0x42
	.uleb128 0x8
	.4byte	0xfa
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC232
	.byte	0xb
	.byte	0x8a
	.4byte	0x928
	.uleb128 0x2
	.4byte	$LC233
	.byte	0xc
	.byte	0x34
	.4byte	0x78
	.uleb128 0x16
	.4byte	0xb1b
	.byte	0x8
	.byte	0xc
	.byte	0x3b
	.uleb128 0xf
	.4byte	$LC234
	.byte	0xc
	.byte	0x39
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0x12
	.ascii	"rem\000"
	.byte	0xc
	.byte	0x3a
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC235
	.byte	0xc
	.byte	0x3b
	.4byte	0xaf6
	.uleb128 0x16
	.4byte	0xb4b
	.byte	0x8
	.byte	0xc
	.byte	0x40
	.uleb128 0xf
	.4byte	$LC234
	.byte	0xc
	.byte	0x3e
	.4byte	0x11e
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0x12
	.ascii	"rem\000"
	.byte	0xc
	.byte	0x3f
	.4byte	0x11e
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC236
	.byte	0xc
	.byte	0x40
	.4byte	0xb26
	.uleb128 0x16
	.4byte	0xb7b
	.byte	0x10
	.byte	0xc
	.byte	0x4a
	.uleb128 0xf
	.4byte	$LC234
	.byte	0xc
	.byte	0x47
	.4byte	0x9c
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0x12
	.ascii	"rem\000"
	.byte	0xc
	.byte	0x49
	.4byte	0x9c
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC237
	.byte	0xc
	.byte	0x4a
	.4byte	0xb56
	.uleb128 0x16
	.4byte	0xbab
	.byte	0x10
	.byte	0xc
	.byte	0x51
	.uleb128 0xf
	.4byte	$LC234
	.byte	0xc
	.byte	0x4f
	.4byte	0x31b
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0x12
	.ascii	"rem\000"
	.byte	0xc
	.byte	0x50
	.4byte	0x31b
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC238
	.byte	0xc
	.byte	0x51
	.4byte	0xb86
	.uleb128 0xe
	.4byte	0xbed
	.4byte	$LC239
	.byte	0xc
	.byte	0xd
	.byte	0x25
	.uleb128 0xf
	.4byte	$LC240
	.byte	0xd
	.byte	0x26
	.4byte	0x194
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC241
	.byte	0xd
	.byte	0x27
	.4byte	0xbed
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.uleb128 0xf
	.4byte	$LC242
	.byte	0xd
	.byte	0x28
	.4byte	0xbed
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.byte	0x0
	.uleb128 0xa
	.byte	0x4
	.4byte	0xae0
	.uleb128 0x2
	.4byte	$LC239
	.byte	0xd
	.byte	0x29
	.4byte	0xbb6
	.uleb128 0x17
	.4byte	0xc17
	.4byte	$LC270
	.byte	0x4
	.byte	0xd
	.byte	0x2b
	.uleb128 0x18
	.4byte	$LC243
	.byte	0x0
	.uleb128 0x18
	.4byte	$LC244
	.byte	0x1
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC245
	.byte	0xd
	.byte	0x2b
	.4byte	0xbfe
	.uleb128 0x19
	.byte	0x1
	.4byte	$LC271
	.byte	0x1
	.byte	0x29
	.byte	0x1
	.4byte	$LFB29
	.4byte	$LFE29
	.4byte	$LSFDE0
	.byte	0x1
	.byte	0x6e
	.uleb128 0x1a
	.4byte	0xc63
	.byte	0x1
	.4byte	$LC246
	.byte	0x1
	.byte	0x30
	.byte	0x1
	.4byte	$LFB31
	.4byte	$LFE31
	.4byte	$LSFDE2
	.byte	0x1
	.byte	0x6e
	.uleb128 0x1b
	.ascii	"arg\000"
	.byte	0x1
	.byte	0x2f
	.4byte	0x194
	.byte	0x2
	.byte	0x91
	.sleb128 40
	.byte	0x0
	.uleb128 0x1c
	.4byte	0xc91
	.byte	0x1
	.4byte	$LC247
	.byte	0x1
	.byte	0x49
	.byte	0x1
	.4byte	0xc17
	.4byte	$LFB33
	.4byte	$LFE33
	.4byte	$LSFDE4
	.byte	0x1
	.byte	0x6e
	.uleb128 0x1d
	.4byte	$LC248
	.byte	0x1
	.byte	0x48
	.4byte	0x194
	.byte	0x2
	.byte	0x91
	.sleb128 48
	.byte	0x0
	.uleb128 0x1c
	.4byte	0xccd
	.byte	0x1
	.4byte	$LC249
	.byte	0x1
	.byte	0x59
	.byte	0x1
	.4byte	0xc17
	.4byte	$LFB35
	.4byte	$LFE35
	.4byte	$LSFDE6
	.byte	0x1
	.byte	0x6e
	.uleb128 0x1b
	.ascii	"arg\000"
	.byte	0x1
	.byte	0x58
	.4byte	0x194
	.byte	0x2
	.byte	0x91
	.sleb128 48
	.uleb128 0x1d
	.4byte	$LC250
	.byte	0x1
	.byte	0x58
	.4byte	0xccd
	.byte	0x2
	.byte	0x91
	.sleb128 52
	.byte	0x0
	.uleb128 0xa
	.byte	0x4
	.4byte	0xbf3
	.uleb128 0x1c
	.4byte	0xd0f
	.byte	0x1
	.4byte	$LC251
	.byte	0x1
	.byte	0x73
	.byte	0x1
	.4byte	0xc17
	.4byte	$LFB37
	.4byte	$LFE37
	.4byte	$LSFDE8
	.byte	0x1
	.byte	0x6e
	.uleb128 0x1b
	.ascii	"arg\000"
	.byte	0x1
	.byte	0x72
	.4byte	0x194
	.byte	0x2
	.byte	0x91
	.sleb128 48
	.uleb128 0x1d
	.4byte	$LC250
	.byte	0x1
	.byte	0x72
	.4byte	0xccd
	.byte	0x2
	.byte	0x91
	.sleb128 52
	.byte	0x0
	.uleb128 0x1c
	.4byte	0xd4b
	.byte	0x1
	.4byte	$LC252
	.byte	0x1
	.byte	0x8d
	.byte	0x1
	.4byte	0xc17
	.4byte	$LFB39
	.4byte	$LFE39
	.4byte	$LSFDE10
	.byte	0x1
	.byte	0x6e
	.uleb128 0x1b
	.ascii	"arg\000"
	.byte	0x1
	.byte	0x8c
	.4byte	0x194
	.byte	0x2
	.byte	0x91
	.sleb128 48
	.uleb128 0x1d
	.4byte	$LC250
	.byte	0x1
	.byte	0x8c
	.4byte	0xccd
	.byte	0x2
	.byte	0x91
	.sleb128 52
	.byte	0x0
	.uleb128 0x1c
	.4byte	0xdde
	.byte	0x1
	.4byte	$LC253
	.byte	0x1
	.byte	0xa6
	.byte	0x1
	.4byte	0xc17
	.4byte	$LFB41
	.4byte	$LFE41
	.4byte	$LSFDE12
	.byte	0x1
	.byte	0x6e
	.uleb128 0x1d
	.4byte	$LC254
	.byte	0x1
	.byte	0xa5
	.4byte	0x78
	.byte	0x3
	.byte	0x91
	.sleb128 80
	.uleb128 0x1d
	.4byte	$LC255
	.byte	0x1
	.byte	0xa5
	.4byte	0xdde
	.byte	0x3
	.byte	0x91
	.sleb128 84
	.uleb128 0x1d
	.4byte	$LC250
	.byte	0x1
	.byte	0xa5
	.4byte	0xccd
	.byte	0x3
	.byte	0x91
	.sleb128 88
	.uleb128 0x1e
	.4byte	$LC256
	.byte	0x1
	.byte	0xa7
	.4byte	0x78
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x1e
	.4byte	$LC257
	.byte	0x1
	.byte	0xa8
	.4byte	0x78
	.byte	0x2
	.byte	0x91
	.sleb128 36
	.uleb128 0x1e
	.4byte	$LC258
	.byte	0x1
	.byte	0xaa
	.4byte	0xc17
	.byte	0x2
	.byte	0x91
	.sleb128 40
	.uleb128 0x1e
	.4byte	$LC259
	.byte	0x1
	.byte	0xab
	.4byte	0x194
	.byte	0x2
	.byte	0x91
	.sleb128 44
	.uleb128 0x1e
	.4byte	$LC260
	.byte	0x1
	.byte	0xb4
	.4byte	0x194
	.byte	0x2
	.byte	0x91
	.sleb128 48
	.byte	0x0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x194
	.uleb128 0x10
	.4byte	$LC262
	.byte	0x1
	.uleb128 0x1f
	.4byte	$LC263
	.byte	0x9
	.byte	0x9a
	.4byte	0x194
	.byte	0x1
	.byte	0x1
	.uleb128 0x10
	.4byte	$LC264
	.byte	0x1
	.uleb128 0x20
	.byte	0x1
	.4byte	0xae0
	.uleb128 0x1f
	.4byte	$LC265
	.byte	0xb
	.byte	0x8d
	.4byte	0xdfd
	.byte	0x1
	.byte	0x1
	.uleb128 0x7
	.4byte	0xe20
	.4byte	0x898
	.uleb128 0x8
	.4byte	0xfa
	.byte	0x5
	.byte	0x0
	.uleb128 0x21
	.4byte	$LC266
	.byte	0x1
	.byte	0x21
	.4byte	0xe10
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	cmdOptions
	.byte	0x0
	.section	.debug_abbrev
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x10
	.uleb128 0x6
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
	.uleb128 0x17
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
	.uleb128 0x35
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
	.uleb128 0x13
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x16
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x18
	.uleb128 0x28
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0x0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x2001
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x2001
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x2001
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1e
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1f
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x20
	.uleb128 0x1
	.byte	0x0
	.uleb128 0x3c
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x21
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",@progbits
	.4byte	0x89
	.2byte	0x2
	.4byte	$Ldebug_info0
	.4byte	0xe33
	.4byte	0xc22
	.ascii	"optVersion\000"
	.4byte	0xc39
	.ascii	"optHelp\000"
	.4byte	0xc63
	.ascii	"validateStreamName\000"
	.4byte	0xc91
	.ascii	"optInput\000"
	.4byte	0xcd3
	.ascii	"optOutput\000"
	.4byte	0xd0f
	.ascii	"optAction\000"
	.4byte	0xd4b
	.ascii	"parseCmdline\000"
	.4byte	0xe20
	.ascii	"cmdOptions\000"
	.4byte	0x0
	.section	.debug_aranges,"",@progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	$Ldebug_info0
	.byte	0x4
	.byte	0x0
	.2byte	0x0
	.2byte	0x0
	.4byte	$Ltext0
	.4byte	$Letext0-$Ltext0
	.4byte	0x0
	.4byte	0x0
	.section	.debug_str,"MS",@progbits,1
$LC227:
	.ascii	"_ext\000"
$LC210:
	.ascii	"option\000"
$LC198:
	.ascii	"ptb_lock\000"
$LC134:
	.ascii	"timer_t\000"
$LC161:
	.ascii	"ptma_private\000"
$LC259:
	.ascii	"programName\000"
$LC150:
	.ascii	"pthread_mutex_t\000"
$LC192:
	.ascii	"__pthread_rwlockattr_st\000"
$LC146:
	.ascii	"__pthread_attr_st\000"
$LC154:
	.ascii	"ptm_interlock\000"
$LC153:
	.ascii	"ptm_lock\000"
$LC42:
	.ascii	"short unsigned int\000"
$LC260:
	.ascii	"shortOpts\000"
$LC250:
	.ascii	"params\000"
$LC221:
	.ascii	"_lbfsize\000"
$LC141:
	.ascii	"pthread_queue_t\000"
$LC38:
	.ascii	"unsigned char\000"
$LC209:
	.ascii	"intptr_t\000"
$LC174:
	.ascii	"__pthread_once_st\000"
$LC119:
	.ascii	"mode_t\000"
$LC136:
	.ascii	"useconds_t\000"
$LC199:
	.ascii	"ptb_waiters\000"
$LC194:
	.ascii	"ptra_private\000"
$LC135:
	.ascii	"suseconds_t\000"
$LC244:
	.ascii	"outERROR\000"
$LC121:
	.ascii	"off_t\000"
$LC188:
	.ascii	"ptr_nreaders\000"
$LC264:
	.ascii	"timeval\000"
$LC190:
	.ascii	"ptr_private\000"
$LC242:
	.ascii	"outputStream\000"
$LC215:
	.ascii	"__sbuf\000"
$LC225:
	.ascii	"_seek\000"
$LC70:
	.ascii	"__in_port_t\000"
$LC130:
	.ascii	"size_t\000"
$LC105:
	.ascii	"longlong_t\000"
$LC116:
	.ascii	"id_t\000"
$LC224:
	.ascii	"_read\000"
$LC263:
	.ascii	"optarg\000"
$LC106:
	.ascii	"u_longlong_t\000"
$LC72:
	.ascii	"__off_t\000"
$LC184:
	.ascii	"ptr_magic\000"
$LC193:
	.ascii	"ptra_magic\000"
$LC213:
	.ascii	"flag\000"
$LC176:
	.ascii	"pto_done\000"
$LC60:
	.ascii	"mips_fpreg_t\000"
$LC78:
	.ascii	"__fsfilcnt_t\000"
$LC267:
	.ascii	"parser.c\000"
$LC110:
	.ascii	"fsfilcnt_t\000"
$LC239:
	.ascii	"params_t\000"
$LC101:
	.ascii	"cpuid_t\000"
$LC218:
	.ascii	"__sFILE\000"
$LC52:
	.ascii	"__mbstate8\000"
$LC58:
	.ascii	"mips_ureg_t\000"
$LC142:
	.ascii	"ptqh_first\000"
$LC95:
	.ascii	"u_int\000"
$LC79:
	.ascii	"int8_t\000"
$LC137:
	.ascii	"__fd_mask\000"
$LC53:
	.ascii	"__mbstateL\000"
$LC243:
	.ascii	"outOK\000"
$LC97:
	.ascii	"unchar\000"
$LC246:
	.ascii	"optHelp\000"
$LC108:
	.ascii	"blksize_t\000"
$LC162:
	.ascii	"pthread_cond_t\000"
$LC157:
	.ascii	"ptm_private\000"
$LC249:
	.ascii	"optInput\000"
$LC160:
	.ascii	"ptma_magic\000"
$LC235:
	.ascii	"div_t\000"
$LC238:
	.ascii	"qdiv_t\000"
$LC251:
	.ascii	"optOutput\000"
$LC62:
	.ascii	"psize_t\000"
$LC217:
	.ascii	"_size\000"
$LC223:
	.ascii	"_close\000"
$LC241:
	.ascii	"inputStream\000"
$LC187:
	.ascii	"ptr_wblocked\000"
$LC117:
	.ascii	"ino_t\000"
$LC214:
	.ascii	"fpos_t\000"
$LC48:
	.ascii	"__uint64_t\000"
$LC254:
	.ascii	"argc\000"
$LC122:
	.ascii	"pid_t\000"
$LC64:
	.ascii	"vsize_t\000"
$LC86:
	.ascii	"uint64_t\000"
$LC139:
	.ascii	"fd_set\000"
$LC255:
	.ascii	"argv\000"
$LC222:
	.ascii	"_cookie\000"
$LC237:
	.ascii	"lldiv_t\000"
$LC216:
	.ascii	"_base\000"
$LC172:
	.ascii	"ptca_private\000"
$LC270:
	.ascii	"outputCodes_\000"
$LC265:
	.ascii	"__sF\000"
$LC73:
	.ascii	"__pid_t\000"
$LC230:
	.ascii	"_blksize\000"
$LC59:
	.ascii	"long unsigned int\000"
$LC118:
	.ascii	"key_t\000"
$LC104:
	.ascii	"qaddr_t\000"
$LC247:
	.ascii	"validateStreamName\000"
$LC44:
	.ascii	"__uint32_t\000"
$LC195:
	.ascii	"pthread_barrier_t\000"
$LC168:
	.ascii	"ptc_private\000"
$LC231:
	.ascii	"_offset\000"
$LC234:
	.ascii	"quot\000"
$LC212:
	.ascii	"has_arg\000"
$LC113:
	.ascii	"dev_t\000"
$LC129:
	.ascii	"clock_t\000"
$LC123:
	.ascii	"lwpid_t\000"
$LC228:
	.ascii	"_ubuf\000"
$LC229:
	.ascii	"_nbuf\000"
$LC40:
	.ascii	"short int\000"
$LC87:
	.ascii	"u_int8_t\000"
$LC169:
	.ascii	"pthread_condattr_t\000"
$LC85:
	.ascii	"int64_t\000"
$LC127:
	.ascii	"uid_t\000"
$LC206:
	.ascii	"ptba_magic\000"
$LC47:
	.ascii	"long long int\000"
$LC205:
	.ascii	"__pthread_barrierattr_st\000"
$LC191:
	.ascii	"pthread_rwlockattr_t\000"
$LC114:
	.ascii	"fixpt_t\000"
$LC112:
	.ascii	"daddr_t\000"
$LC49:
	.ascii	"long long unsigned int\000"
$LC269:
	.ascii	"GNU C 3.3.3 (NetBSD nb3 20040520) -g\000"
$LC76:
	.ascii	"__uid_t\000"
$LC232:
	.ascii	"FILE\000"
$LC41:
	.ascii	"__uint16_t\000"
$LC120:
	.ascii	"nlink_t\000"
$LC126:
	.ascii	"swblk_t\000"
$LC140:
	.ascii	"pthread_spin_t\000"
$LC125:
	.ascii	"segsz_t\000"
$LC204:
	.ascii	"pthread_barrierattr_t\000"
$LC128:
	.ascii	"dtime_t\000"
$LC54:
	.ascii	"char\000"
$LC236:
	.ascii	"ldiv_t\000"
$LC258:
	.ascii	"optOutCode\000"
$LC171:
	.ascii	"ptca_magic\000"
$LC61:
	.ascii	"paddr_t\000"
$LC201:
	.ascii	"ptb_curcount\000"
$LC83:
	.ascii	"int32_t\000"
$LC240:
	.ascii	"action\000"
$LC173:
	.ascii	"pthread_once_t\000"
$LC63:
	.ascii	"vaddr_t\000"
$LC207:
	.ascii	"ptba_private\000"
$LC148:
	.ascii	"pta_flags\000"
$LC80:
	.ascii	"uint8_t\000"
$LC165:
	.ascii	"ptc_lock\000"
$LC56:
	.ascii	"mips_reg_t\000"
$LC252:
	.ascii	"optAction\000"
$LC186:
	.ascii	"ptr_rblocked\000"
$LC111:
	.ascii	"caddr_t\000"
$LC253:
	.ascii	"parseCmdline\000"
$LC178:
	.ascii	"__pthread_spinlock_st\000"
$LC203:
	.ascii	"ptb_private\000"
$LC183:
	.ascii	"__pthread_rwlock_st\000"
$LC164:
	.ascii	"ptc_magic\000"
$LC99:
	.ascii	"uint\000"
$LC170:
	.ascii	"__pthread_condattr_st\000"
$LC271:
	.ascii	"optVersion\000"
$LC181:
	.ascii	"pts_flags\000"
$LC167:
	.ascii	"ptc_mutex\000"
$LC261:
	.ascii	"__pthread_st\000"
$LC268:
	.ascii	"/root/src\000"
$LC256:
	.ascii	"indexptr\000"
$LC219:
	.ascii	"_flags\000"
$LC182:
	.ascii	"pthread_rwlock_t\000"
$LC50:
	.ascii	"__intptr_t\000"
$LC197:
	.ascii	"ptb_magic\000"
$LC81:
	.ascii	"int16_t\000"
$LC107:
	.ascii	"blkcnt_t\000"
$LC233:
	.ascii	"wchar_t\000"
$LC175:
	.ascii	"pto_mutex\000"
$LC245:
	.ascii	"outputCode\000"
$LC177:
	.ascii	"pthread_spinlock_t\000"
$LC266:
	.ascii	"cmdOptions\000"
$LC149:
	.ascii	"pta_private\000"
$LC37:
	.ascii	"signed char\000"
$LC211:
	.ascii	"name\000"
$LC151:
	.ascii	"__pthread_mutex_st\000"
$LC71:
	.ascii	"__mode_t\000"
$LC65:
	.ascii	"register_t\000"
$LC156:
	.ascii	"ptm_blocked\000"
$LC133:
	.ascii	"clockid_t\000"
$LC202:
	.ascii	"ptb_generation\000"
$LC45:
	.ascii	"unsigned int\000"
$LC103:
	.ascii	"quad_t\000"
$LC96:
	.ascii	"u_long\000"
$LC189:
	.ascii	"ptr_writer\000"
$LC185:
	.ascii	"ptr_interlock\000"
$LC90:
	.ascii	"u_int64_t\000"
$LC158:
	.ascii	"pthread_mutexattr_t\000"
$LC155:
	.ascii	"ptm_owner\000"
$LC208:
	.ascii	"pthread_key_t\000"
$LC100:
	.ascii	"ulong\000"
$LC93:
	.ascii	"u_char\000"
$LC75:
	.ascii	"__socklen_t\000"
$LC131:
	.ascii	"ssize_t\000"
$LC163:
	.ascii	"__pthread_cond_st\000"
$LC46:
	.ascii	"__int64_t\000"
$LC257:
	.ascii	"optCode\000"
$LC144:
	.ascii	"pthread_t\000"
$LC248:
	.ascii	"streamName\000"
$LC220:
	.ascii	"_file\000"
$LC91:
	.ascii	"in_addr_t\000"
$LC35:
	.ascii	"__int8_t\000"
$LC77:
	.ascii	"__fsblkcnt_t\000"
$LC115:
	.ascii	"gid_t\000"
$LC109:
	.ascii	"fsblkcnt_t\000"
$LC66:
	.ascii	"__cpu_simple_lock_t\000"
$LC89:
	.ascii	"u_int32_t\000"
$LC180:
	.ascii	"pts_spin\000"
$LC55:
	.ascii	"__mbstate_t\000"
$LC143:
	.ascii	"ptqh_last\000"
$LC98:
	.ascii	"ushort\000"
$LC51:
	.ascii	"__uintptr_t\000"
$LC68:
	.ascii	"__gid_t\000"
$LC43:
	.ascii	"__int32_t\000"
$LC200:
	.ascii	"ptb_initcount\000"
$LC159:
	.ascii	"__pthread_mutexattr_st\000"
$LC226:
	.ascii	"_write\000"
$LC36:
	.ascii	"__uint8_t\000"
$LC138:
	.ascii	"fds_bits\000"
$LC147:
	.ascii	"pta_magic\000"
$LC262:
	.ascii	"__pthread_spin_st\000"
$LC82:
	.ascii	"uint16_t\000"
$LC57:
	.ascii	"long int\000"
$LC84:
	.ascii	"uint32_t\000"
$LC145:
	.ascii	"pthread_attr_t\000"
$LC67:
	.ascii	"__caddr_t\000"
$LC92:
	.ascii	"in_port_t\000"
$LC196:
	.ascii	"__pthread_barrier_st\000"
$LC88:
	.ascii	"u_int16_t\000"
$LC132:
	.ascii	"time_t\000"
$LC152:
	.ascii	"ptm_magic\000"
$LC102:
	.ascii	"u_quad_t\000"
$LC179:
	.ascii	"pts_magic\000"
$LC69:
	.ascii	"__in_addr_t\000"
$LC124:
	.ascii	"rlim_t\000"
$LC74:
	.ascii	"__sa_family_t\000"
$LC94:
	.ascii	"u_short\000"
$LC39:
	.ascii	"__int16_t\000"
$LC166:
	.ascii	"ptc_waiters\000"
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
