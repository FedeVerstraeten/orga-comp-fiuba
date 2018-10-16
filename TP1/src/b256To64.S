#include <mips/regdef.h>

# -----------------------------------------------------------
# b256To64()
# -----------------------------------------------------------

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
	sw	ra,RA(sp)
	sw	$fp,FP(sp)
	sw	gp,GP(sp)

# We adopt the convention of using the frame pointer
# as our index in the stack.
	move	$fp,sp

# Now we save the arguments that were loaded by the caller
# in the area reserved by the callee.
	sw	a0,outBlock($fp)
	sw	a1,inChar($fp)
  sw	a2,inputEnded($fp)

##############################
# body: b256To64             #
##############################
# Initialize locals.

return_0:
  li v0, 0

exit_function:
# Stack frame unwinding.
	lw	  ra,RA(sp)
	lw	  $fp,FP(sp)
	addu	sp,sp,SIZE_b256To64
	j	ra
.end	b256To64

# -----------------------------------------------------------
# addPadding()
# -----------------------------------------------------------
.text
.abicalls
.align	2
.globl	addPadding
.ent	addPadding
addPadding:

# Debugger metadata.
.frame	$fp,SIZE_addPadding,ra

# Pipeline magic.
.set	noreorder
.cpload	t9
.set	reorder

# Allocate memory for the stack.
	subu	sp,sp,SIZE_addPadding
# SRA beginning area.
.cprestore GP

# Save the callee-saved registers used by the caller in the SRA.
	sw	ra,RA(sp)
	sw	$fp,FP(sp)
	sw	gp,GP(sp)

# We adopt the convention of using the frame pointer
# as our index in the stack.
	move	$fp,sp

# Now we save the arguments that were loaded by the caller
# in the area reserved by the callee.
	sw	a0,outBlock($fp)
	sw	a1,pad($fp)
  sw	a2,numberPad($fp)

##############################
# body: addPadding           #
##############################
# Initialize locals.

return_0:
  li v0, 0

exit_function:
# Stack frame unwinding.
	lw	  ra,RA(sp)
	lw	  $fp,FP(sp)
	addu	sp,sp,SIZE_addPadding
	j	ra
.end	addPadding
