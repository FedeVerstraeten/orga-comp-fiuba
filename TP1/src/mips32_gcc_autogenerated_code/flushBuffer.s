	.section .mdebug.abi32
	.previous
	.abicalls
	.file 1 "flushBuffer.c"
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
	.file 10 "/usr/include/stdio.h"
	.file 11 "/usr/include/stdlib.h"
	.file 12 "buffer_t.h"
	.align	2
	.globl	flushBuffer
$LFB29:
	.loc 1 33 0
	.ent	flushBuffer
flushBuffer:
	.frame	$fp,64,$ra		# vars= 24, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,64
	.cprestore 16
$LCFI0:
	sw	$ra,56($sp)
$LCFI1:
	sw	$fp,52($sp)
$LCFI2:
	sw	$gp,48($sp)
$LCFI3:
	move	$fp,$sp
$LCFI4:
	sw	$a0,64($fp)
	.loc 1 37 0
$LBB2:
	lw	$v0,64($fp)
	lw	$v0,0($v0)
	sw	$v0,28($fp)
	.loc 1 38 0
	sw	$zero,32($fp)
	.loc 1 40 0
	lw	$v0,64($fp)
	addu	$v0,$v0,12
	sw	$v0,36($fp)
	.loc 1 42 0
$L18:
	lw	$v0,32($fp)
	lw	$v1,28($fp)
	sltu	$v0,$v0,$v1
	bne	$v0,$zero,$L20
	b	$L19
$L20:
	.loc 1 44 0
	lw	$v1,28($fp)
	lw	$v0,32($fp)
	subu	$v0,$v1,$v0
	sw	$v0,28($fp)
	.loc 1 45 0
	lw	$v1,36($fp)
	lw	$v0,32($fp)
	addu	$v0,$v1,$v0
	sw	$v0,36($fp)
	.loc 1 46 0
	lw	$v0,64($fp)
	lw	$a0,8($v0)
	lw	$a1,36($fp)
	lw	$a2,28($fp)
	la	$t9,write
	jal	$ra,$t9
	sw	$v0,32($fp)
	.loc 1 47 0
	la	$t9,__errno
	jal	$ra,$t9
	lw	$v0,0($v0)
	sw	$v0,24($fp)
	.loc 1 48 0
	lw	$v0,24($fp)
	beq	$v0,$zero,$L18
	.loc 1 50 0
	lw	$v0,24($fp)
	sw	$v0,40($fp)
	b	$L17
$L19:
	.loc 1 54 0
	lw	$v0,64($fp)
	sw	$zero,0($v0)
	.loc 1 56 0
	sw	$zero,40($fp)
	.loc 1 57 0
$L17:
$LBE2:
	lw	$v0,40($fp)
	move	$sp,$fp
	lw	$ra,56($sp)
	lw	$fp,52($sp)
	addu	$sp,$sp,64
	j	$ra
	.end	flushBuffer
$LFE29:
	.size	flushBuffer, .-flushBuffer
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
	.uleb128 0x40
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
	.uleb128 0x40
	.align	2
$LEFDE0:
	.align	0
	.text
$Letext0:
	.section	.debug_info
	.4byte	0xc42
	.2byte	0x2
	.4byte	$Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	$Ldebug_line0
	.4byte	$Letext0
	.4byte	$Ltext0
	.4byte	$LC211
	.4byte	$LC212
	.4byte	$LC213
	.byte	0x1
	.uleb128 0x2
	.4byte	$LC0
	.byte	0x2
	.byte	0x30
	.4byte	0x30
	.uleb128 0x3
	.4byte	$LC2
	.byte	0x1
	.byte	0x6
	.uleb128 0x2
	.4byte	$LC1
	.byte	0x2
	.byte	0x31
	.4byte	0x42
	.uleb128 0x3
	.4byte	$LC3
	.byte	0x1
	.byte	0x8
	.uleb128 0x2
	.4byte	$LC4
	.byte	0x2
	.byte	0x32
	.4byte	0x54
	.uleb128 0x3
	.4byte	$LC5
	.byte	0x2
	.byte	0x5
	.uleb128 0x2
	.4byte	$LC6
	.byte	0x2
	.byte	0x33
	.4byte	0x66
	.uleb128 0x3
	.4byte	$LC7
	.byte	0x2
	.byte	0x7
	.uleb128 0x2
	.4byte	$LC8
	.byte	0x2
	.byte	0x34
	.4byte	0x78
	.uleb128 0x4
	.ascii	"int\000"
	.byte	0x4
	.byte	0x5
	.uleb128 0x2
	.4byte	$LC9
	.byte	0x2
	.byte	0x35
	.4byte	0x8a
	.uleb128 0x3
	.4byte	$LC10
	.byte	0x4
	.byte	0x7
	.uleb128 0x2
	.4byte	$LC11
	.byte	0x2
	.byte	0x3e
	.4byte	0x9c
	.uleb128 0x3
	.4byte	$LC12
	.byte	0x8
	.byte	0x5
	.uleb128 0x2
	.4byte	$LC13
	.byte	0x2
	.byte	0x40
	.4byte	0xae
	.uleb128 0x3
	.4byte	$LC14
	.byte	0x8
	.byte	0x7
	.uleb128 0x2
	.4byte	$LC15
	.byte	0x2
	.byte	0x4b
	.4byte	0x78
	.uleb128 0x2
	.4byte	$LC16
	.byte	0x2
	.byte	0x4c
	.4byte	0x8a
	.uleb128 0x5
	.4byte	0xea
	.byte	0x80
	.byte	0x3
	.byte	0x65
	.uleb128 0x6
	.4byte	$LC17
	.byte	0x3
	.byte	0x63
	.4byte	0xea
	.uleb128 0x6
	.4byte	$LC18
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
	.4byte	$LC10
	.byte	0x4
	.byte	0x7
	.uleb128 0x3
	.4byte	$LC19
	.byte	0x1
	.byte	0x6
	.uleb128 0x2
	.4byte	$LC20
	.byte	0x3
	.byte	0x65
	.4byte	0xcb
	.uleb128 0x2
	.4byte	$LC21
	.byte	0x4
	.byte	0x3b
	.4byte	0x11e
	.uleb128 0x3
	.4byte	$LC22
	.byte	0x4
	.byte	0x5
	.uleb128 0x2
	.4byte	$LC23
	.byte	0x4
	.byte	0x3c
	.4byte	0x130
	.uleb128 0x3
	.4byte	$LC24
	.byte	0x4
	.byte	0x7
	.uleb128 0x2
	.4byte	$LC25
	.byte	0x4
	.byte	0x3d
	.4byte	0x11e
	.uleb128 0x2
	.4byte	$LC26
	.byte	0x4
	.byte	0x46
	.4byte	0x130
	.uleb128 0x2
	.4byte	$LC27
	.byte	0x4
	.byte	0x47
	.4byte	0x130
	.uleb128 0x2
	.4byte	$LC28
	.byte	0x4
	.byte	0x49
	.4byte	0x130
	.uleb128 0x2
	.4byte	$LC29
	.byte	0x4
	.byte	0x4a
	.4byte	0x130
	.uleb128 0x2
	.4byte	$LC30
	.byte	0x4
	.byte	0x51
	.4byte	0x11e
	.uleb128 0x2
	.4byte	$LC31
	.byte	0x4
	.byte	0x5a
	.4byte	0x184
	.uleb128 0x9
	.4byte	0x78
	.uleb128 0x2
	.4byte	$LC32
	.byte	0x5
	.byte	0x2c
	.4byte	0x194
	.uleb128 0xa
	.byte	0x4
	.4byte	0x101
	.uleb128 0x2
	.4byte	$LC33
	.byte	0x5
	.byte	0x2d
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC34
	.byte	0x5
	.byte	0x2e
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC35
	.byte	0x5
	.byte	0x2f
	.4byte	0x5b
	.uleb128 0x2
	.4byte	$LC36
	.byte	0x5
	.byte	0x30
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC37
	.byte	0x5
	.byte	0x31
	.4byte	0x91
	.uleb128 0x2
	.4byte	$LC38
	.byte	0x5
	.byte	0x32
	.4byte	0x6d
	.uleb128 0x2
	.4byte	$LC39
	.byte	0x5
	.byte	0x33
	.4byte	0x37
	.uleb128 0x2
	.4byte	$LC40
	.byte	0x5
	.byte	0x34
	.4byte	0x8a
	.uleb128 0x2
	.4byte	$LC41
	.byte	0x5
	.byte	0x35
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC42
	.byte	0x5
	.byte	0x36
	.4byte	0xa3
	.uleb128 0x2
	.4byte	$LC43
	.byte	0x5
	.byte	0x37
	.4byte	0xa3
	.uleb128 0x2
	.4byte	$LC44
	.byte	0x6
	.byte	0x36
	.4byte	0x25
	.uleb128 0x2
	.4byte	$LC45
	.byte	0x6
	.byte	0x3b
	.4byte	0x37
	.uleb128 0x2
	.4byte	$LC46
	.byte	0x6
	.byte	0x40
	.4byte	0x49
	.uleb128 0x2
	.4byte	$LC47
	.byte	0x6
	.byte	0x45
	.4byte	0x5b
	.uleb128 0x2
	.4byte	$LC48
	.byte	0x6
	.byte	0x4a
	.4byte	0x6d
	.uleb128 0x2
	.4byte	$LC49
	.byte	0x6
	.byte	0x4f
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC50
	.byte	0x6
	.byte	0x54
	.4byte	0x91
	.uleb128 0x2
	.4byte	$LC51
	.byte	0x6
	.byte	0x59
	.4byte	0xa3
	.uleb128 0x2
	.4byte	$LC52
	.byte	0x6
	.byte	0x5d
	.4byte	0x37
	.uleb128 0x2
	.4byte	$LC53
	.byte	0x6
	.byte	0x5e
	.4byte	0x5b
	.uleb128 0x2
	.4byte	$LC54
	.byte	0x6
	.byte	0x5f
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC55
	.byte	0x6
	.byte	0x60
	.4byte	0xa3
	.uleb128 0x2
	.4byte	$LC56
	.byte	0x7
	.byte	0x3a
	.4byte	0x1a5
	.uleb128 0x2
	.4byte	$LC57
	.byte	0x7
	.byte	0x3f
	.4byte	0x1b0
	.uleb128 0x2
	.4byte	$LC58
	.byte	0x6
	.byte	0x65
	.4byte	0x42
	.uleb128 0x2
	.4byte	$LC59
	.byte	0x6
	.byte	0x66
	.4byte	0x66
	.uleb128 0x2
	.4byte	$LC60
	.byte	0x6
	.byte	0x67
	.4byte	0x8a
	.uleb128 0x2
	.4byte	$LC61
	.byte	0x6
	.byte	0x68
	.4byte	0x130
	.uleb128 0x2
	.4byte	$LC62
	.byte	0x6
	.byte	0x6a
	.4byte	0x42
	.uleb128 0x2
	.4byte	$LC63
	.byte	0x6
	.byte	0x6b
	.4byte	0x66
	.uleb128 0x2
	.4byte	$LC64
	.byte	0x6
	.byte	0x6c
	.4byte	0x8a
	.uleb128 0x2
	.4byte	$LC65
	.byte	0x6
	.byte	0x6d
	.4byte	0x130
	.uleb128 0x2
	.4byte	$LC66
	.byte	0x6
	.byte	0x6f
	.4byte	0x2ce
	.uleb128 0x2
	.4byte	$LC67
	.byte	0x6
	.byte	0x72
	.4byte	0xa3
	.uleb128 0x2
	.4byte	$LC68
	.byte	0x6
	.byte	0x73
	.4byte	0x91
	.uleb128 0x2
	.4byte	$LC69
	.byte	0x6
	.byte	0x74
	.4byte	0x331
	.uleb128 0xa
	.byte	0x4
	.4byte	0x31b
	.uleb128 0x2
	.4byte	$LC70
	.byte	0x6
	.byte	0x80
	.4byte	0x91
	.uleb128 0x2
	.4byte	$LC71
	.byte	0x6
	.byte	0x81
	.4byte	0xa3
	.uleb128 0x2
	.4byte	$LC72
	.byte	0x6
	.byte	0x83
	.4byte	0x91
	.uleb128 0x2
	.4byte	$LC73
	.byte	0x6
	.byte	0x84
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC74
	.byte	0x6
	.byte	0x87
	.4byte	0x1fd
	.uleb128 0x2
	.4byte	$LC75
	.byte	0x6
	.byte	0x8c
	.4byte	0x208
	.uleb128 0x2
	.4byte	$LC76
	.byte	0x6
	.byte	0x91
	.4byte	0x189
	.uleb128 0x2
	.4byte	$LC77
	.byte	0x6
	.byte	0x99
	.4byte	0x91
	.uleb128 0x2
	.4byte	$LC78
	.byte	0x6
	.byte	0x9c
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC79
	.byte	0x6
	.byte	0x9d
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC80
	.byte	0x6
	.byte	0xa0
	.4byte	0x19a
	.uleb128 0x2
	.4byte	$LC81
	.byte	0x6
	.byte	0xa4
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC82
	.byte	0x6
	.byte	0xa5
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC83
	.byte	0x6
	.byte	0xa6
	.4byte	0x11e
	.uleb128 0x2
	.4byte	$LC84
	.byte	0x6
	.byte	0xa9
	.4byte	0x1bb
	.uleb128 0x2
	.4byte	$LC85
	.byte	0x6
	.byte	0xad
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC86
	.byte	0x6
	.byte	0xb0
	.4byte	0x1c6
	.uleb128 0x2
	.4byte	$LC87
	.byte	0x6
	.byte	0xb5
	.4byte	0x1d1
	.uleb128 0x2
	.4byte	$LC88
	.byte	0x6
	.byte	0xb8
	.4byte	0x6d
	.uleb128 0x2
	.4byte	$LC89
	.byte	0x6
	.byte	0xb9
	.4byte	0x31b
	.uleb128 0x2
	.4byte	$LC90
	.byte	0x6
	.byte	0xba
	.4byte	0x6d
	.uleb128 0x2
	.4byte	$LC91
	.byte	0x6
	.byte	0xbb
	.4byte	0x6d
	.uleb128 0x2
	.4byte	$LC92
	.byte	0x6
	.byte	0xbe
	.4byte	0x1f2
	.uleb128 0x2
	.4byte	$LC93
	.byte	0x6
	.byte	0xc2
	.4byte	0x6d
	.uleb128 0x2
	.4byte	$LC94
	.byte	0x6
	.byte	0xfc
	.4byte	0x130
	.uleb128 0xb
	.4byte	$LC95
	.byte	0x6
	.2byte	0x101
	.4byte	0x8a
	.uleb128 0xb
	.4byte	$LC96
	.byte	0x6
	.2byte	0x107
	.4byte	0x78
	.uleb128 0xb
	.4byte	$LC97
	.byte	0x6
	.2byte	0x10c
	.4byte	0x11e
	.uleb128 0xb
	.4byte	$LC98
	.byte	0x6
	.2byte	0x111
	.4byte	0x78
	.uleb128 0xb
	.4byte	$LC99
	.byte	0x6
	.2byte	0x116
	.4byte	0x78
	.uleb128 0xb
	.4byte	$LC100
	.byte	0x6
	.2byte	0x11b
	.4byte	0x78
	.uleb128 0xb
	.4byte	$LC101
	.byte	0x6
	.2byte	0x120
	.4byte	0x8a
	.uleb128 0xb
	.4byte	$LC102
	.byte	0x6
	.2byte	0x12d
	.4byte	0x6d
	.uleb128 0xc
	.4byte	0x4c7
	.4byte	$LC104
	.byte	0x20
	.byte	0x6
	.2byte	0x142
	.uleb128 0xd
	.4byte	$LC103
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
	.4byte	$LC104
	.byte	0x6
	.2byte	0x144
	.4byte	0x4aa
	.uleb128 0x2
	.4byte	$LC105
	.byte	0x8
	.byte	0x2e
	.4byte	0x184
	.uleb128 0xe
	.4byte	0x517
	.4byte	$LC106
	.byte	0x8
	.byte	0x8
	.byte	0x39
	.uleb128 0xf
	.4byte	$LC107
	.byte	0x8
	.byte	0x39
	.4byte	0x51d
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC108
	.byte	0x8
	.byte	0x39
	.4byte	0x523
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x10
	.4byte	$LC208
	.byte	0x1
	.uleb128 0xa
	.byte	0x4
	.4byte	0x517
	.uleb128 0xa
	.byte	0x4
	.4byte	0x51d
	.uleb128 0x2
	.4byte	$LC109
	.byte	0x8
	.byte	0x47
	.4byte	0x51d
	.uleb128 0x2
	.4byte	$LC110
	.byte	0x8
	.byte	0x48
	.4byte	0x53f
	.uleb128 0xe
	.4byte	0x576
	.4byte	$LC111
	.byte	0xc
	.byte	0x8
	.byte	0x3c
	.uleb128 0xf
	.4byte	$LC112
	.byte	0x8
	.byte	0x56
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC113
	.byte	0x8
	.byte	0x58
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.uleb128 0xf
	.4byte	$LC114
	.byte	0x8
	.byte	0x59
	.4byte	0x885
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC115
	.byte	0x8
	.byte	0x49
	.4byte	0x581
	.uleb128 0xe
	.4byte	0x5e2
	.4byte	$LC116
	.byte	0x1c
	.byte	0x8
	.byte	0x3d
	.uleb128 0xf
	.4byte	$LC117
	.byte	0x8
	.byte	0x5d
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC118
	.byte	0x8
	.byte	0x66
	.4byte	0x184
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.uleb128 0xf
	.4byte	$LC119
	.byte	0x8
	.byte	0x69
	.4byte	0x184
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.uleb128 0xf
	.4byte	$LC120
	.byte	0x8
	.byte	0x6a
	.4byte	0x529
	.byte	0x2
	.byte	0x10
	.uleb128 0xc
	.uleb128 0xf
	.4byte	$LC121
	.byte	0x8
	.byte	0x6b
	.4byte	0x4ee
	.byte	0x2
	.byte	0x10
	.uleb128 0x10
	.uleb128 0xf
	.4byte	$LC122
	.byte	0x8
	.byte	0x6c
	.4byte	0x885
	.byte	0x2
	.byte	0x10
	.uleb128 0x18
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC123
	.byte	0x8
	.byte	0x4a
	.4byte	0x5ed
	.uleb128 0xe
	.4byte	0x616
	.4byte	$LC124
	.byte	0x8
	.byte	0x8
	.byte	0x3e
	.uleb128 0xf
	.4byte	$LC125
	.byte	0x8
	.byte	0x7c
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC126
	.byte	0x8
	.byte	0x7d
	.4byte	0x885
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC127
	.byte	0x8
	.byte	0x4b
	.4byte	0x621
	.uleb128 0xe
	.4byte	0x674
	.4byte	$LC128
	.byte	0x18
	.byte	0x8
	.byte	0x3f
	.uleb128 0xf
	.4byte	$LC129
	.byte	0x8
	.byte	0x85
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC130
	.byte	0x8
	.byte	0x88
	.4byte	0x184
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.uleb128 0xf
	.4byte	$LC131
	.byte	0x8
	.byte	0x89
	.4byte	0x4ee
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.uleb128 0xf
	.4byte	$LC132
	.byte	0x8
	.byte	0x8b
	.4byte	0x887
	.byte	0x2
	.byte	0x10
	.uleb128 0x10
	.uleb128 0xf
	.4byte	$LC133
	.byte	0x8
	.byte	0x8c
	.4byte	0x885
	.byte	0x2
	.byte	0x10
	.uleb128 0x14
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC134
	.byte	0x8
	.byte	0x4c
	.4byte	0x67f
	.uleb128 0xe
	.4byte	0x6a8
	.4byte	$LC135
	.byte	0x8
	.byte	0x8
	.byte	0x40
	.uleb128 0xf
	.4byte	$LC136
	.byte	0x8
	.byte	0x9a
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC137
	.byte	0x8
	.byte	0x9b
	.4byte	0x885
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC138
	.byte	0x8
	.byte	0x4d
	.4byte	0x6b3
	.uleb128 0xe
	.4byte	0x6dc
	.4byte	$LC139
	.byte	0x20
	.byte	0x8
	.byte	0x4d
	.uleb128 0xf
	.4byte	$LC140
	.byte	0x8
	.byte	0xa2
	.4byte	0x576
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC141
	.byte	0x8
	.byte	0xa3
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC142
	.byte	0x8
	.byte	0x4e
	.4byte	0x6e7
	.uleb128 0xe
	.4byte	0x71e
	.4byte	$LC143
	.byte	0xc
	.byte	0x8
	.byte	0x4e
	.uleb128 0xf
	.4byte	$LC144
	.byte	0x8
	.byte	0xa9
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC145
	.byte	0x8
	.byte	0xaa
	.4byte	0x184
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.uleb128 0xf
	.4byte	$LC146
	.byte	0x8
	.byte	0xab
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC147
	.byte	0x8
	.byte	0x4f
	.4byte	0x729
	.uleb128 0xe
	.4byte	0x798
	.4byte	$LC148
	.byte	0x24
	.byte	0x8
	.byte	0x42
	.uleb128 0xf
	.4byte	$LC149
	.byte	0x8
	.byte	0xb9
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC150
	.byte	0x8
	.byte	0xbc
	.4byte	0x184
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.uleb128 0xf
	.4byte	$LC151
	.byte	0x8
	.byte	0xbe
	.4byte	0x4ee
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.uleb128 0xf
	.4byte	$LC152
	.byte	0x8
	.byte	0xbf
	.4byte	0x4ee
	.byte	0x2
	.byte	0x10
	.uleb128 0x10
	.uleb128 0xf
	.4byte	$LC153
	.byte	0x8
	.byte	0xc0
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x18
	.uleb128 0xf
	.4byte	$LC154
	.byte	0x8
	.byte	0xc1
	.4byte	0x529
	.byte	0x2
	.byte	0x10
	.uleb128 0x1c
	.uleb128 0xf
	.4byte	$LC155
	.byte	0x8
	.byte	0xc2
	.4byte	0x885
	.byte	0x2
	.byte	0x10
	.uleb128 0x20
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC156
	.byte	0x8
	.byte	0x50
	.4byte	0x7a3
	.uleb128 0xe
	.4byte	0x7cc
	.4byte	$LC157
	.byte	0x8
	.byte	0x8
	.byte	0x43
	.uleb128 0xf
	.4byte	$LC158
	.byte	0x8
	.byte	0xd2
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC159
	.byte	0x8
	.byte	0xd3
	.4byte	0x885
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC160
	.byte	0x8
	.byte	0x51
	.4byte	0x7d7
	.uleb128 0xe
	.4byte	0x846
	.4byte	$LC161
	.byte	0x20
	.byte	0x8
	.byte	0x44
	.uleb128 0xf
	.4byte	$LC162
	.byte	0x8
	.byte	0xda
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC163
	.byte	0x8
	.byte	0xdd
	.4byte	0x184
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.uleb128 0xf
	.4byte	$LC164
	.byte	0x8
	.byte	0xdf
	.4byte	0x4ee
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.uleb128 0xf
	.4byte	$LC165
	.byte	0x8
	.byte	0xe0
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x10
	.uleb128 0xf
	.4byte	$LC166
	.byte	0x8
	.byte	0xe1
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x14
	.uleb128 0xf
	.4byte	$LC167
	.byte	0x8
	.byte	0xe2
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x18
	.uleb128 0xf
	.4byte	$LC168
	.byte	0x8
	.byte	0xe4
	.4byte	0x885
	.byte	0x2
	.byte	0x10
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC169
	.byte	0x8
	.byte	0x52
	.4byte	0x851
	.uleb128 0xe
	.4byte	0x87a
	.4byte	$LC170
	.byte	0x8
	.byte	0x8
	.byte	0x45
	.uleb128 0xf
	.4byte	$LC171
	.byte	0x8
	.byte	0xeb
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC172
	.byte	0x8
	.byte	0xec
	.4byte	0x885
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC173
	.byte	0x8
	.byte	0x53
	.4byte	0x78
	.uleb128 0x11
	.byte	0x4
	.uleb128 0xa
	.byte	0x4
	.4byte	0x576
	.uleb128 0x2
	.4byte	$LC174
	.byte	0x9
	.byte	0xe9
	.4byte	0xb5
	.uleb128 0x2
	.4byte	$LC175
	.byte	0xa
	.byte	0x3a
	.4byte	0x1c6
	.uleb128 0xe
	.4byte	0x8cc
	.4byte	$LC176
	.byte	0x8
	.byte	0xa
	.byte	0x4a
	.uleb128 0xf
	.4byte	$LC177
	.byte	0xa
	.byte	0x4b
	.4byte	0x8cc
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC178
	.byte	0xa
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
	.4byte	0x9f4
	.4byte	$LC179
	.byte	0x58
	.byte	0xa
	.byte	0x69
	.uleb128 0x12
	.ascii	"_p\000"
	.byte	0xa
	.byte	0x6a
	.4byte	0x8cc
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0x12
	.ascii	"_r\000"
	.byte	0xa
	.byte	0x6b
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.uleb128 0x12
	.ascii	"_w\000"
	.byte	0xa
	.byte	0x6c
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.uleb128 0xf
	.4byte	$LC180
	.byte	0xa
	.byte	0x6d
	.4byte	0x54
	.byte	0x2
	.byte	0x10
	.uleb128 0xc
	.uleb128 0xf
	.4byte	$LC181
	.byte	0xa
	.byte	0x6e
	.4byte	0x54
	.byte	0x2
	.byte	0x10
	.uleb128 0xe
	.uleb128 0x12
	.ascii	"_bf\000"
	.byte	0xa
	.byte	0x6f
	.4byte	0x8a3
	.byte	0x2
	.byte	0x10
	.uleb128 0x10
	.uleb128 0xf
	.4byte	$LC182
	.byte	0xa
	.byte	0x70
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x18
	.uleb128 0xf
	.4byte	$LC183
	.byte	0xa
	.byte	0x73
	.4byte	0x885
	.byte	0x2
	.byte	0x10
	.uleb128 0x1c
	.uleb128 0xf
	.4byte	$LC184
	.byte	0xa
	.byte	0x74
	.4byte	0xa04
	.byte	0x2
	.byte	0x10
	.uleb128 0x20
	.uleb128 0xf
	.4byte	$LC185
	.byte	0xa
	.byte	0x75
	.4byte	0xa24
	.byte	0x2
	.byte	0x10
	.uleb128 0x24
	.uleb128 0xf
	.4byte	$LC186
	.byte	0xa
	.byte	0x76
	.4byte	0xa44
	.byte	0x2
	.byte	0x10
	.uleb128 0x28
	.uleb128 0xf
	.4byte	$LC187
	.byte	0xa
	.byte	0x77
	.4byte	0xa6f
	.byte	0x2
	.byte	0x10
	.uleb128 0x2c
	.uleb128 0xf
	.4byte	$LC188
	.byte	0xa
	.byte	0x7a
	.4byte	0x8a3
	.byte	0x2
	.byte	0x10
	.uleb128 0x30
	.uleb128 0x12
	.ascii	"_up\000"
	.byte	0xa
	.byte	0x7d
	.4byte	0x8cc
	.byte	0x2
	.byte	0x10
	.uleb128 0x38
	.uleb128 0x12
	.ascii	"_ur\000"
	.byte	0xa
	.byte	0x7e
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x3c
	.uleb128 0xf
	.4byte	$LC189
	.byte	0xa
	.byte	0x81
	.4byte	0xa75
	.byte	0x2
	.byte	0x10
	.uleb128 0x40
	.uleb128 0xf
	.4byte	$LC190
	.byte	0xa
	.byte	0x82
	.4byte	0xa85
	.byte	0x2
	.byte	0x10
	.uleb128 0x43
	.uleb128 0x12
	.ascii	"_lb\000"
	.byte	0xa
	.byte	0x85
	.4byte	0x8a3
	.byte	0x2
	.byte	0x10
	.uleb128 0x44
	.uleb128 0xf
	.4byte	$LC191
	.byte	0xa
	.byte	0x88
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x4c
	.uleb128 0xf
	.4byte	$LC192
	.byte	0xa
	.byte	0x89
	.4byte	0x898
	.byte	0x2
	.byte	0x10
	.uleb128 0x50
	.byte	0x0
	.uleb128 0x13
	.4byte	0xa04
	.byte	0x1
	.4byte	0x78
	.uleb128 0x14
	.4byte	0x885
	.byte	0x0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x9f4
	.uleb128 0x13
	.4byte	0xa24
	.byte	0x1
	.4byte	0x78
	.uleb128 0x14
	.4byte	0x885
	.uleb128 0x14
	.4byte	0x194
	.uleb128 0x14
	.4byte	0x78
	.byte	0x0
	.uleb128 0xa
	.byte	0x4
	.4byte	0xa0a
	.uleb128 0x13
	.4byte	0xa44
	.byte	0x1
	.4byte	0x898
	.uleb128 0x14
	.4byte	0x885
	.uleb128 0x14
	.4byte	0x898
	.uleb128 0x14
	.4byte	0x78
	.byte	0x0
	.uleb128 0xa
	.byte	0x4
	.4byte	0xa2a
	.uleb128 0x13
	.4byte	0xa64
	.byte	0x1
	.4byte	0x78
	.uleb128 0x14
	.4byte	0x885
	.uleb128 0x14
	.4byte	0xa64
	.uleb128 0x14
	.4byte	0x78
	.byte	0x0
	.uleb128 0xa
	.byte	0x4
	.4byte	0xa6a
	.uleb128 0x15
	.4byte	0x101
	.uleb128 0xa
	.byte	0x4
	.4byte	0xa4a
	.uleb128 0x7
	.4byte	0xa85
	.4byte	0x42
	.uleb128 0x8
	.4byte	0xfa
	.byte	0x2
	.byte	0x0
	.uleb128 0x7
	.4byte	0xa95
	.4byte	0x42
	.uleb128 0x8
	.4byte	0xfa
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC193
	.byte	0xa
	.byte	0x8a
	.4byte	0x8d2
	.uleb128 0x2
	.4byte	$LC194
	.byte	0xb
	.byte	0x34
	.4byte	0x78
	.uleb128 0x16
	.4byte	0xad0
	.byte	0x8
	.byte	0xb
	.byte	0x3b
	.uleb128 0xf
	.4byte	$LC195
	.byte	0xb
	.byte	0x39
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0x12
	.ascii	"rem\000"
	.byte	0xb
	.byte	0x3a
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC196
	.byte	0xb
	.byte	0x3b
	.4byte	0xaab
	.uleb128 0x16
	.4byte	0xb00
	.byte	0x8
	.byte	0xb
	.byte	0x40
	.uleb128 0xf
	.4byte	$LC195
	.byte	0xb
	.byte	0x3e
	.4byte	0x11e
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0x12
	.ascii	"rem\000"
	.byte	0xb
	.byte	0x3f
	.4byte	0x11e
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC197
	.byte	0xb
	.byte	0x40
	.4byte	0xadb
	.uleb128 0x16
	.4byte	0xb30
	.byte	0x10
	.byte	0xb
	.byte	0x4a
	.uleb128 0xf
	.4byte	$LC195
	.byte	0xb
	.byte	0x47
	.4byte	0x9c
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0x12
	.ascii	"rem\000"
	.byte	0xb
	.byte	0x49
	.4byte	0x9c
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC198
	.byte	0xb
	.byte	0x4a
	.4byte	0xb0b
	.uleb128 0x16
	.4byte	0xb60
	.byte	0x10
	.byte	0xb
	.byte	0x51
	.uleb128 0xf
	.4byte	$LC195
	.byte	0xb
	.byte	0x4f
	.4byte	0x31b
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0x12
	.ascii	"rem\000"
	.byte	0xb
	.byte	0x50
	.4byte	0x31b
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC199
	.byte	0xb
	.byte	0x51
	.4byte	0xb3b
	.uleb128 0x17
	.4byte	0xbb0
	.4byte	$LC200
	.2byte	0x40c
	.byte	0xc
	.byte	0x2b
	.uleb128 0xf
	.4byte	$LC201
	.byte	0xc
	.byte	0x2c
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xf
	.4byte	$LC202
	.byte	0xc
	.byte	0x2d
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.uleb128 0x12
	.ascii	"fd\000"
	.byte	0xc
	.byte	0x2e
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.uleb128 0xf
	.4byte	$LC203
	.byte	0xc
	.byte	0x2f
	.4byte	0xbb0
	.byte	0x2
	.byte	0x10
	.uleb128 0xc
	.byte	0x0
	.uleb128 0x7
	.4byte	0xbc1
	.4byte	0x42
	.uleb128 0x18
	.4byte	0xfa
	.2byte	0x3ff
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC200
	.byte	0xc
	.byte	0x30
	.4byte	0xb6b
	.uleb128 0x19
	.4byte	0xc33
	.byte	0x1
	.4byte	$LC214
	.byte	0x1
	.byte	0x21
	.byte	0x1
	.4byte	0x78
	.4byte	$LFB29
	.4byte	$LFE29
	.4byte	$LSFDE0
	.byte	0x1
	.byte	0x6e
	.uleb128 0x1a
	.4byte	$LC203
	.byte	0x1
	.byte	0x20
	.4byte	0xc33
	.byte	0x3
	.byte	0x91
	.sleb128 64
	.uleb128 0x1b
	.4byte	$LC204
	.byte	0x1
	.byte	0x24
	.4byte	0x78
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x1b
	.4byte	$LC205
	.byte	0x1
	.byte	0x25
	.4byte	0x44a
	.byte	0x2
	.byte	0x91
	.sleb128 28
	.uleb128 0x1b
	.4byte	$LC206
	.byte	0x1
	.byte	0x26
	.4byte	0x44a
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x1b
	.4byte	$LC207
	.byte	0x1
	.byte	0x28
	.4byte	0x8cc
	.byte	0x2
	.byte	0x91
	.sleb128 36
	.byte	0x0
	.uleb128 0xa
	.byte	0x4
	.4byte	0xbc1
	.uleb128 0x10
	.4byte	$LC209
	.byte	0x1
	.uleb128 0x10
	.4byte	$LC210
	.byte	0x1
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
	.uleb128 0x14
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.uleb128 0x26
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
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x18
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.byte	0x0
	.section	.debug_pubnames,"",@progbits
	.4byte	0x1e
	.2byte	0x2
	.4byte	$Ldebug_info0
	.4byte	0xc46
	.4byte	0xbcc
	.ascii	"flushBuffer\000"
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
$LC188:
	.ascii	"_ext\000"
$LC163:
	.ascii	"ptb_lock\000"
$LC99:
	.ascii	"timer_t\000"
$LC115:
	.ascii	"pthread_mutex_t\000"
$LC157:
	.ascii	"__pthread_rwlockattr_st\000"
$LC111:
	.ascii	"__pthread_attr_st\000"
$LC119:
	.ascii	"ptm_interlock\000"
$LC118:
	.ascii	"ptm_lock\000"
$LC7:
	.ascii	"short unsigned int\000"
$LC182:
	.ascii	"_lbfsize\000"
$LC106:
	.ascii	"pthread_queue_t\000"
$LC3:
	.ascii	"unsigned char\000"
$LC174:
	.ascii	"intptr_t\000"
$LC139:
	.ascii	"__pthread_once_st\000"
$LC84:
	.ascii	"mode_t\000"
$LC101:
	.ascii	"useconds_t\000"
$LC164:
	.ascii	"ptb_waiters\000"
$LC159:
	.ascii	"ptra_private\000"
$LC126:
	.ascii	"ptma_private\000"
$LC86:
	.ascii	"off_t\000"
$LC153:
	.ascii	"ptr_nreaders\000"
$LC210:
	.ascii	"timeval\000"
$LC155:
	.ascii	"ptr_private\000"
$LC205:
	.ascii	"bytesToWrite\000"
$LC176:
	.ascii	"__sbuf\000"
$LC186:
	.ascii	"_seek\000"
$LC35:
	.ascii	"__in_port_t\000"
$LC95:
	.ascii	"size_t\000"
$LC70:
	.ascii	"longlong_t\000"
$LC81:
	.ascii	"id_t\000"
$LC185:
	.ascii	"_read\000"
$LC71:
	.ascii	"u_longlong_t\000"
$LC37:
	.ascii	"__off_t\000"
$LC149:
	.ascii	"ptr_magic\000"
$LC158:
	.ascii	"ptra_magic\000"
$LC141:
	.ascii	"pto_done\000"
$LC25:
	.ascii	"mips_fpreg_t\000"
$LC43:
	.ascii	"__fsfilcnt_t\000"
$LC100:
	.ascii	"suseconds_t\000"
$LC75:
	.ascii	"fsfilcnt_t\000"
$LC214:
	.ascii	"flushBuffer\000"
$LC66:
	.ascii	"cpuid_t\000"
$LC179:
	.ascii	"__sFILE\000"
$LC17:
	.ascii	"__mbstate8\000"
$LC23:
	.ascii	"mips_ureg_t\000"
$LC107:
	.ascii	"ptqh_first\000"
$LC60:
	.ascii	"u_int\000"
$LC44:
	.ascii	"int8_t\000"
$LC102:
	.ascii	"__fd_mask\000"
$LC18:
	.ascii	"__mbstateL\000"
$LC203:
	.ascii	"buffer\000"
$LC62:
	.ascii	"unchar\000"
$LC211:
	.ascii	"flushBuffer.c\000"
$LC73:
	.ascii	"blksize_t\000"
$LC127:
	.ascii	"pthread_cond_t\000"
$LC122:
	.ascii	"ptm_private\000"
$LC125:
	.ascii	"ptma_magic\000"
$LC196:
	.ascii	"div_t\000"
$LC199:
	.ascii	"qdiv_t\000"
$LC27:
	.ascii	"psize_t\000"
$LC178:
	.ascii	"_size\000"
$LC184:
	.ascii	"_close\000"
$LC152:
	.ascii	"ptr_wblocked\000"
$LC82:
	.ascii	"ino_t\000"
$LC204:
	.ascii	"errsv\000"
$LC175:
	.ascii	"fpos_t\000"
$LC13:
	.ascii	"__uint64_t\000"
$LC87:
	.ascii	"pid_t\000"
$LC29:
	.ascii	"vsize_t\000"
$LC51:
	.ascii	"uint64_t\000"
$LC104:
	.ascii	"fd_set\000"
$LC183:
	.ascii	"_cookie\000"
$LC198:
	.ascii	"lldiv_t\000"
$LC177:
	.ascii	"_base\000"
$LC137:
	.ascii	"ptca_private\000"
$LC38:
	.ascii	"__pid_t\000"
$LC191:
	.ascii	"_blksize\000"
$LC24:
	.ascii	"long unsigned int\000"
$LC83:
	.ascii	"key_t\000"
$LC69:
	.ascii	"qaddr_t\000"
$LC9:
	.ascii	"__uint32_t\000"
$LC160:
	.ascii	"pthread_barrier_t\000"
$LC133:
	.ascii	"ptc_private\000"
$LC192:
	.ascii	"_offset\000"
$LC195:
	.ascii	"quot\000"
$LC78:
	.ascii	"dev_t\000"
$LC94:
	.ascii	"clock_t\000"
$LC88:
	.ascii	"lwpid_t\000"
$LC189:
	.ascii	"_ubuf\000"
$LC190:
	.ascii	"_nbuf\000"
$LC5:
	.ascii	"short int\000"
$LC52:
	.ascii	"u_int8_t\000"
$LC134:
	.ascii	"pthread_condattr_t\000"
$LC50:
	.ascii	"int64_t\000"
$LC92:
	.ascii	"uid_t\000"
$LC171:
	.ascii	"ptba_magic\000"
$LC12:
	.ascii	"long long int\000"
$LC207:
	.ascii	"relativeIndex\000"
$LC201:
	.ascii	"index\000"
$LC170:
	.ascii	"__pthread_barrierattr_st\000"
$LC156:
	.ascii	"pthread_rwlockattr_t\000"
$LC79:
	.ascii	"fixpt_t\000"
$LC77:
	.ascii	"daddr_t\000"
$LC14:
	.ascii	"long long unsigned int\000"
$LC213:
	.ascii	"GNU C 3.3.3 (NetBSD nb3 20040520) -g\000"
$LC41:
	.ascii	"__uid_t\000"
$LC193:
	.ascii	"FILE\000"
$LC6:
	.ascii	"__uint16_t\000"
$LC85:
	.ascii	"nlink_t\000"
$LC91:
	.ascii	"swblk_t\000"
$LC105:
	.ascii	"pthread_spin_t\000"
$LC90:
	.ascii	"segsz_t\000"
$LC169:
	.ascii	"pthread_barrierattr_t\000"
$LC93:
	.ascii	"dtime_t\000"
$LC19:
	.ascii	"char\000"
$LC197:
	.ascii	"ldiv_t\000"
$LC136:
	.ascii	"ptca_magic\000"
$LC26:
	.ascii	"paddr_t\000"
$LC166:
	.ascii	"ptb_curcount\000"
$LC48:
	.ascii	"int32_t\000"
$LC138:
	.ascii	"pthread_once_t\000"
$LC28:
	.ascii	"vaddr_t\000"
$LC172:
	.ascii	"ptba_private\000"
$LC113:
	.ascii	"pta_flags\000"
$LC45:
	.ascii	"uint8_t\000"
$LC130:
	.ascii	"ptc_lock\000"
$LC21:
	.ascii	"mips_reg_t\000"
$LC151:
	.ascii	"ptr_rblocked\000"
$LC76:
	.ascii	"caddr_t\000"
$LC143:
	.ascii	"__pthread_spinlock_st\000"
$LC168:
	.ascii	"ptb_private\000"
$LC148:
	.ascii	"__pthread_rwlock_st\000"
$LC129:
	.ascii	"ptc_magic\000"
$LC64:
	.ascii	"uint\000"
$LC135:
	.ascii	"__pthread_condattr_st\000"
$LC146:
	.ascii	"pts_flags\000"
$LC132:
	.ascii	"ptc_mutex\000"
$LC208:
	.ascii	"__pthread_st\000"
$LC212:
	.ascii	"/root/src\000"
$LC180:
	.ascii	"_flags\000"
$LC147:
	.ascii	"pthread_rwlock_t\000"
$LC15:
	.ascii	"__intptr_t\000"
$LC162:
	.ascii	"ptb_magic\000"
$LC46:
	.ascii	"int16_t\000"
$LC72:
	.ascii	"blkcnt_t\000"
$LC194:
	.ascii	"wchar_t\000"
$LC140:
	.ascii	"pto_mutex\000"
$LC142:
	.ascii	"pthread_spinlock_t\000"
$LC114:
	.ascii	"pta_private\000"
$LC2:
	.ascii	"signed char\000"
$LC116:
	.ascii	"__pthread_mutex_st\000"
$LC36:
	.ascii	"__mode_t\000"
$LC30:
	.ascii	"register_t\000"
$LC121:
	.ascii	"ptm_blocked\000"
$LC98:
	.ascii	"clockid_t\000"
$LC167:
	.ascii	"ptb_generation\000"
$LC10:
	.ascii	"unsigned int\000"
$LC200:
	.ascii	"buffer_t\000"
$LC68:
	.ascii	"quad_t\000"
$LC61:
	.ascii	"u_long\000"
$LC154:
	.ascii	"ptr_writer\000"
$LC150:
	.ascii	"ptr_interlock\000"
$LC55:
	.ascii	"u_int64_t\000"
$LC123:
	.ascii	"pthread_mutexattr_t\000"
$LC120:
	.ascii	"ptm_owner\000"
$LC173:
	.ascii	"pthread_key_t\000"
$LC65:
	.ascii	"ulong\000"
$LC58:
	.ascii	"u_char\000"
$LC40:
	.ascii	"__socklen_t\000"
$LC96:
	.ascii	"ssize_t\000"
$LC128:
	.ascii	"__pthread_cond_st\000"
$LC11:
	.ascii	"__int64_t\000"
$LC109:
	.ascii	"pthread_t\000"
$LC181:
	.ascii	"_file\000"
$LC56:
	.ascii	"in_addr_t\000"
$LC0:
	.ascii	"__int8_t\000"
$LC42:
	.ascii	"__fsblkcnt_t\000"
$LC80:
	.ascii	"gid_t\000"
$LC74:
	.ascii	"fsblkcnt_t\000"
$LC31:
	.ascii	"__cpu_simple_lock_t\000"
$LC54:
	.ascii	"u_int32_t\000"
$LC145:
	.ascii	"pts_spin\000"
$LC20:
	.ascii	"__mbstate_t\000"
$LC108:
	.ascii	"ptqh_last\000"
$LC63:
	.ascii	"ushort\000"
$LC16:
	.ascii	"__uintptr_t\000"
$LC33:
	.ascii	"__gid_t\000"
$LC206:
	.ascii	"bytesWriten\000"
$LC8:
	.ascii	"__int32_t\000"
$LC165:
	.ascii	"ptb_initcount\000"
$LC124:
	.ascii	"__pthread_mutexattr_st\000"
$LC187:
	.ascii	"_write\000"
$LC1:
	.ascii	"__uint8_t\000"
$LC103:
	.ascii	"fds_bits\000"
$LC112:
	.ascii	"pta_magic\000"
$LC209:
	.ascii	"__pthread_spin_st\000"
$LC47:
	.ascii	"uint16_t\000"
$LC202:
	.ascii	"size\000"
$LC22:
	.ascii	"long int\000"
$LC49:
	.ascii	"uint32_t\000"
$LC110:
	.ascii	"pthread_attr_t\000"
$LC32:
	.ascii	"__caddr_t\000"
$LC57:
	.ascii	"in_port_t\000"
$LC161:
	.ascii	"__pthread_barrier_st\000"
$LC53:
	.ascii	"u_int16_t\000"
$LC97:
	.ascii	"time_t\000"
$LC117:
	.ascii	"ptm_magic\000"
$LC67:
	.ascii	"u_quad_t\000"
$LC144:
	.ascii	"pts_magic\000"
$LC34:
	.ascii	"__in_addr_t\000"
$LC89:
	.ascii	"rlim_t\000"
$LC39:
	.ascii	"__sa_family_t\000"
$LC59:
	.ascii	"u_short\000"
$LC4:
	.ascii	"__int16_t\000"
$LC131:
	.ascii	"ptc_waiters\000"
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"