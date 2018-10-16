#include "base64_s.h"

# Argument-building area (ABA).
#define ARG0 0
#define ARG1 4
#define ARG2 8
#define ARG3 12

# Local and Temporary Area (LTA).
#define i 16

# Saved-registers area (SRA).
#define RA 20
#define FP 24
#define GP 28
#define outBlock 32
#define pad 36
#define numberPad pad + 4
#define PADDING_0 numberPad + 4

#define SIZE PADDING_0 + 4

.text
.abicalls
.align	2
.globl	addPadding
.ent	addPadding

addPadding:
# Debugger metadata.
.frame	$fp,SIZE,ra
# Pipeline magic.
.set	noreorder
.cpload	t9
.set	reorder

# Allocate memory for the stack.
  subu	sp,sp,SIZE
# SRA beginning area.
.cprestore GP

# Save the callee-saved registers used by the caller in the SRA.
  sw  ra, RA(sp)
  sw	$fp,FP(sp)
  sw  gp, GP(sp)
# We adopt the convention of using the frame pointer
# as our index in the stack.
  move $fp,sp

# Now we save the arguments that were loaded by the caller
# in the area reserved by the callee.
  sw a0, outBlock($fp)
  sb a1, pad($fp)
  sw a2, numberPad($fp)

##############################
# body: addPadding           #
##############################
	sw	zero,i($fp)
# Check if it's the null character.
while1_loop:
# Get outBlock[i].
  lw    t0,outBlock($fp)
  lw    t1,i($fp)
  addu  t1,t1,t0
# We only need the LSB.
  lb	  t1,0(t1)
  li    t2,ASCII_NULL
  beq   t1,t2,null_char

# Increment index.
	lw	t0,i($fp)
	addu	t0,t0,1
	sw	t0,i($fp)
	b	while1_loop

null_char:
while2_loop:
	lw	t0,numberPad($fp)
	ble	t0,zero,set_null_char
# Get outBlock[i].
  lw    t0,outBlock($fp)
  lw    t1,i($fp)
  addu  t1,t1,t0
  lbu   t2,pad($fp)
  sb    t2,0(t1)

# Increment numberPad.
  lw    t0,numberPad($fp)
  subu  t0,t0,1
  sw    t0,numberPad($fp)

# Increment index.
  lw    t0,i($fp)
  addiu t0,t0,1
  sw    t0,i($fp)
  b     while2_loop

set_null_char:
# Get outBlock[i+1].
  lw    t0,outBlock($fp)
  lw    t1,i($fp)
  addiu t1,t1,1
  addu  t1,t1,t0
  li    t2,ASCII_NULL
  sb    t2,0(t1)

exit_function:
# Stack frame unwinding.
  lw   ra, RA(sp)
	lw   $fp, FP(sp)
	lw   gp, GP(sp)
	addu sp, sp, SIZE
	j    ra

.end	addPadding
