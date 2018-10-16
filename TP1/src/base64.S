# include "base64_s.h"

.globl translationTableB64

translationTableB64:
.ascii	"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123"
.ascii	"456789+/"

msg0:
.asciiz	ERROR_OUTPUT_STREAM_WRITING_MSG

msg1:
.asciiz	ERROR_INPUT_STREAM_READING_MSG
msg2:
.asciiz	ERROR_B64_CHAR_NOT_FOUND_MSG
.globl	errmsg
.data
errmsg:
.word	0
.word	msg0
.word	msg1
.word	msg2
