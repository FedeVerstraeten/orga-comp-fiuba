#include <mips/regdef.h>

#define B64_CHARS_PER_BLOCK 4
#define DECODER_MASK 0xFF000000
#define PADDING_ASCII 61
#define PAD_INDEX 0
#define SIZETABLEB64 64
#define BITS_PER_BYTE 8
#define OUTPUT_BLOCK_SIZE 3
#define SIZEOF_UCHAR 1

#define ERROR_NUMBER_B64_CHAR_NOT_FOUND_MSG 3

# Argument-building area (ABA).
#define ARG0 0
#define ARG1 4
#define ARG2 8
#define ARG3 12

# Local and Temporary Area (LTA).
#define bitMask 16
#define index1 20
#define index2 21
#define accumBit 22
#define indexTable 24
#define charHolder indexTable + B64_CHARS_PER_BLOCK
#define bitPattern charHolder + 4

# Saved-registers area (SRA).
#define GP bitPattern + 4
#define FP GP + 4
#define RA FP + 4
#define outBlock RA + 4
#define inBlock outBlock + 4
#define decCount inBlock + 4
#define PADDING_0 decCount + 4

#define SIZE_b64To256 PADDING_0 + 4

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
  li	v0,DECODER_MASK
	sw	v0,bitMask($fp)
	sb	zero,index1($fp)
	sb	zero,index2($fp)
	sw	zero,indexTable($fp)
	sw	zero,charHolder($fp)
	sw	zero,bitPattern($fp)
	sb	zero,accumBit($fp)

# Search char index in translationTableB64.
	sb	zero,index1($fp)
for1_loop:
  lbu   t0,index1($fp)
  li    t1,B64_CHARS_PER_BLOCK
  bge   t0,t1,end_table_search

# Check if it's a padding char.
  lbu	  t0,index1($fp)
	lw	  t1,inBlock($fp)
	addu	t0,t1,t0
# We are comparing bytes, so we must stay
# with the lower byte of 't0'.
  lbu	  t0,0(t0)
	li	  t1,PADDING_ASCII
	bne	  t0,t1,not_padding_char

# If it was a padding char, save the index and 'continue'.
	lbu	  t0,index1($fp)
	addu	t1,$fp,indexTable
	addu	t0,t1,t0
  li    t2,PAD_INDEX
	sb	  t2,0(t0)
	b	    next_iteration_for1_loop

not_padding_char:
	sb	  zero,index2($fp)
for2_loop:
	lbu	  t0,index2($fp)
  li    t1,SIZETABLEB64
  bge   t0,t1,char_not_in_table64

search_table64:
	lw	  t0,inBlock($fp)
  lbu	  t1,index1($fp)
	addu	t0,t1,t0
# Get the lower byte.
	lbu	  t1,0(t0)
	lbu	  t0,index2($fp)
	lb	  t0,translationTableB64(t0)
	bne	  t1,t0,next_iteration_for2_loop
# If the char is found in the table, store it.
	addu	t0,$fp,indexTable
  lbu	  t1,index1($fp)
	addu	t1,t0,t1
	lbu	  t0,index2($fp)
	sb	  t0,0(t1)
# Increment decoded chars count and break from loop2.
	lw	  t0,decCount($fp)
  lw	  t1,decCount($fp)
	lbu	  t0,0(t0)
	addiu	t0,t0,1
	sb	  t0,0(t1)
	b	    char_not_in_table64

# Increment loop2 index.
next_iteration_for2_loop:
	lbu	  t0,index2($fp)
	addiu	t0,t0,1
	sb	  t0,index2($fp)
	b	    for2_loop

# If the read char is not in the table,
# we must exit with an error.
char_not_in_table64:
	lbu	  t0,index2($fp)
  li    t1,SIZETABLEB64
  blt   t0,t1,next_iteration_for1_loop
  li	  v0,ERROR_NUMBER_B64_CHAR_NOT_FOUND_MSG
  b	    exit_function

# Increment loop1 index.
next_iteration_for1_loop:
	lbu	  t0,index1($fp)
	addiu	t0,t0,1
	sb	  t0,index1($fp)
	b	    for1_loop

# bitPattern generation using indexTable.
end_table_search:
	sb	  zero,index1($fp)
# Check loop condition.
for3_loop:
	lbu	  t0,index1($fp)
  li    t1,B64_CHARS_PER_BLOCK
  bge   t0,t1,get_decoded_chars

gen_bit_pattern:
# Increment 'accumBit'.
	lbu	  t0,accumBit($fp)
	addiu	t0,t0,2
	sb	  t0,accumBit($fp)

# Get the current 'charHolder'.
	addu	t0,$fp,indexTable
  lbu	  t1,index1($fp)
	addu	t0,t0,t1
# Get the LSB only.
	lbu	  t0,0(t0)
	sw	  t0,charHolder($fp)

# Shift the 'charHolder' appropriately.
  li	  t1,(B64_CHARS_PER_BLOCK - 1)
	lbu	  t2,index1($fp)
	subu	t1,t1,t2
  li    t2,(SIZEOF_UCHAR*BITS_PER_BYTE)
  mulou t2,t1,t2
	sll	  t0,t0,t2
	sw	  t0,charHolder($fp)

# Shift by 'accumBit'.
  lw	  t0,charHolder($fp)
	lbu	  t1,accumBit($fp)
	sll	  t0,t0,t1
	sw	  t0,charHolder($fp)

# Finally, produce the bitPattern.
  lw	  t0,charHolder($fp)
	lw	  t1,bitPattern($fp)
	or	  t0,t1,t0
	sw	  t0,bitPattern($fp)

next_iteration_for3_loop:
	lbu	  t0,index1($fp)
	addiu	t0,t0,1
	sb	  t0,index1($fp)
	b	    for3_loop

# Get the decoded chars and store them in the output block.
get_decoded_chars:
	sb	zero,index1($fp)
do_loop:
# Extract the decoded character from bitPattern.
  lw	  t0,bitMask($fp)
	lw	  t1,bitPattern($fp)
	and	  t0,t1,t0
	sw	  t0,charHolder($fp)

# Shift right the decoded character to the correct position.
  li	  t1,(B64_CHARS_PER_BLOCK - 1)
  lbu	  t2,index1($fp)
  subu	t1,t1,t2
  li    t2,(SIZEOF_UCHAR*BITS_PER_BYTE)
  mulou t2,t1,t2
  srl	  t0,t0,t2
  sw	  t0,charHolder($fp)

# Store in outBlock.
  lw	  t1,outBlock($fp)
	lbu	  t2,index1($fp)
	addu	t2,t2,t1
	sb	  t0,0(t2)

# Shift right 0,8,16...bits the bitMask.
	lw	  t0,bitMask($fp)
  li    t1,(SIZEOF_UCHAR*BITS_PER_BYTE)
  srl	  t0,t0,t1
	sw	  t0,bitMask($fp)

# Increase do-while index.
	lbu	  t0,index1($fp)
	addiu	t0,t0,1
	sb	  t0,index1($fp)

# Check do-while condition.
	lbu	  t0,index1($fp)
  li    t1,OUTPUT_BLOCK_SIZE
  blt   t0,t1,do_loop

return_0:
  li    v0, 0

exit_function:
# Stack frame unwinding.
	lw	  ra,RA(sp)
	lw	  $fp,FP(sp)
  lw    gp, GP(sp)
	addu	sp,sp,SIZE_b64To256
	j	    ra

.end	b64To256

.rdata
.align	2
.type	translationTableB64, @object
.size	translationTableB64, 64
translationTableB64:
.ascii	"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123"
.ascii	"456789+/"
