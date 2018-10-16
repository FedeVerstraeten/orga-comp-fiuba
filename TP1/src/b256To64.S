#include "base64_s.h"

# Argument-building area (ABA).
#define ARG0 0
#define ARG1 4
#define ARG2 8
#define ARG3 12

# Local and Temporary Area (LTA).
#define headByte 16
#define prevByte 17
#define encodedCharsCount 18
#define i 20

# Saved-registers area (SRA).
#define GP 24
#define FP 28
#define RA 32
#define outBlock 36
#define inChar 40
#define inputEnded 41

#define PADDING_0 inputEnded + 3

#define SIZE_b256To64 PADDING_0 + 4

.text
.abicalls
.align	2
.globl	b256To64
.ent	b256To64
b256To64:

# Debugger metadata.
.frame	$fp,SIZE_b256To64,ra

# Pipeline magic.
.set	noreorder
.cpload	t9
.set	reorder

# Allocate memory for the stack.
	subu	sp,sp,SIZE_b256To64
# SRA beginning area.
.cprestore GP

# Save the callee-saved registers used by the caller in the SRA.
	sw	  ra,RA(sp)
	sw	  $fp,FP(sp)
	sw	  gp,GP(sp)

# We adopt the convention of using the frame pointer
# as our index in the stack.
	move	$fp,sp

# Now we save the arguments that were loaded by the caller
# in the area reserved by the callee.
	sw	  a0,outBlock($fp)
	sb	  a1,inChar($fp)
  sb	  a2,inputEnded($fp)

##############################
# body: b256To64             #
##############################
# Initialize locals.
  sb	 zero,headByte($fp)
  sb	 zero,prevByte($fp)
  sb	 zero,encodedCharsCount($fp)
  sw	 zero,i($fp)

# Clear outBlock.
for1_loop:
  lw	   t0,i($fp)
  li     t1,ENCODER_OUTPUT_CHARS
  bge    t0,t1,done_cleared
# Get outBlock[i].
  lw	   t1,outBlock($fp)
  lw	   t0,i($fp)
  addu	 t0,t1,t0
  sb	   zero,0(t0)

# Increase for index.
  lw	   t0,i($fp)
  addu	 t0,t0,1
  sw	   t0,i($fp)
  b	     for1_loop

done_cleared:
# Backup the previous tailByte.
  lbu	   t0,tailByte
  sb	   t0,prevByte($fp)

# Set padding.
  li	   t0,1
  lb	   t1,inputEnded($fp)
  bne	   t0,t1,no_padding

# Shifting.
  li	   t0,6
  lw	   t1,shiftRightBit
  bne	   t0,t1,no_shift_6

# 'OR' with zero, is the identity.
  lbu	   t0,prevByte($fp)
  sb	   t0,headByte($fp)

# Set outBlock[0].
  lbu	   t0,headByte($fp)
  lbu	   t0,translationTableB64(t0)
  lw	   t1,outBlock($fp)
# We only need the LSB.
  sb	   t0,0(t1)

# Call 'addPadding'
  lw	   a0,outBlock($fp)
  li	   a1,PADDING_ASCII
  li	   a2,1
  la	   t9,addPadding
  jal	   ra,t9

# Return to caller.
  lbu	   t0,encodedCharsCount($fp)
  addiu	 t0,t0,2
# Sign extension and we only want the LSB.
  andi	 v0,t0,0x000000ff
  b	     exit_function

no_shift_6:
  lw	   t1,shiftRightBit
  li	   t0,4
  bne	   t1,t0,no_shift_4
# 'OR' with zero, is the identity.
  lbu	   t0,prevByte($fp)
  sb	   t0,headByte($fp)

# Set outBlock[0].
  lbu	   t0,headByte($fp)
  lbu	   t0,translationTableB64(t0)
  lw	   t1,outBlock($fp)
# We only need the LSB.
  sb	   t0,0(t1)

  # Call 'addPadding'
  lw	   a0,outBlock($fp)
  li	   a1,PADDING_ASCII
  li	   a2,2
  la	   t9,addPadding
  jal	   ra,t9

# Return to caller.
  lbu	   t0,encodedCharsCount($fp)
  addiu	 t0,t0,3

# Sign extension and we only want the LSB.
  andi	 v0,t0,0x000000ff
  b	     exit_function

no_shift_4:
  lbu	   v0,encodedCharsCount($fp)
  b	     exit_function

no_padding:
# Save the head of input char.
  lbu	   t1,inChar($fp)
  lbu	   t0,bitMask
  and	   t0,t1,t0
  sb	   t0,headByte($fp)

# Shift right 2, 4 or 6bit the headByte.
  lbu	   t1,headByte($fp)
  lw	   t0,shiftRightBit
  srl	   t0,t1,t0
  sb	   t0,headByte($fp)

# Save the tail input char.
  lbu	   t0,bitMask
  nor	   t0,zero,t0
  lbu	   t1,inChar($fp)
  and	   t0,t1,t0
  sb	   t0,tailByte

# Shift left 4, 2 or 0bit the tailByte.
  lbu	   a0,tailByte
  li	   t1,TAIL_MAX_BITS_TO_SHIFT
  lw	   t0,shiftRightBit
  subu	 t0,t1,t0
  sll	   t0,a0,t0
  sb	   t0,tailByte

# Merge previous tailByte and current headByte.
  lbu	   t1,headByte($fp)
  lbu	   t0,prevByte($fp)
  or	   t0,t1,t0
  sb	   t0,headByte($fp)

# Print translation in outBlock.
  lw	   t1,outBlock($fp)
  lbu	   t0,headByte($fp)
  lbu	   t0,translationTableB64(t0)
  sb	   t0,0(t1)
# Increment counter.
  lbu	   t0,encodedCharsCount($fp)
  addu	 t0,t0,1
  sb	   t0,encodedCharsCount($fp)

  lw	   t0,shiftRightBit
  addu   t0,t0,2
  sw	   t0,shiftRightBit

# Shift left 2 bits the mask.
  lbu	   t0,bitMask
  sll	   t0,t0,2
  sb	   t0,bitMask
  andi	 v0,t0,0x000000ff
  bne	   v0,zero,return_count
# Restart mask at the beginning.
# Beware of the sign extension!
  li	   t0,ENCODER_MASK
  sb	   t0,bitMask
  li	   t0,2
  sw	   t0,shiftRightBit

# Print tailByte and clear.
# Set outBlock[1].
  lw	   t0,outBlock($fp)
  addu	 t1,t0,1
  lbu	   t0,tailByte
  lbu	   t0,translationTableB64(t0)
  sb	   t0,0(t1)
  lbu	   t0,encodedCharsCount($fp)
  addiu	 t0,t0,1
# Increment counter.
  sb	   t0,encodedCharsCount($fp)
# Set tailByte.
  sb	   zero,tailByte

return_count:
  lbu	   v0,encodedCharsCount($fp)

exit_function:
# Stack frame unwinding.
	lw	  ra,RA(sp)
	lw	  $fp,FP(sp)
	addu	sp,sp,SIZE_b256To64
	j	    ra

.end	b256To64

.data
    shiftRightBit: .word 2
    tailByte:      .byte 0
    bitMask:       .byte ENCODER_MASK
