#include <mips/regdef.h>

.text
.abicalls
.align	2
.globl	b64To256
.ent	b64To256
b64To256:

# Debugger metadata.
.frame	$fp,SIZE_b64To256,ra

# Pipeline magic.
.set	noreorder
.cpload	t9
.set	reorder

# Allocate memory for the stack.
	subu	sp,sp,SIZE_b64To256
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
	sw	a1,inBlock($fp)
  sw	a2,decCount($fp)

##############################
# body: b64To256             #
##############################
# Initialize locals.

return_0:
  li v0, 0

exit_function:
# Stack frame unwinding.
	lw	  ra,RA(sp)
	lw	  $fp,FP(sp)
	addu	sp,sp,SIZE_b64To256
	j	ra
.end	b64To256
