# include "base64_s.h"

.globl translationTableB64

translationTableB64:
.ascii	"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123"
.ascii	"456789+/"

LC0:
.asciiz	ERROR_OUTPUT_STREAM_WRITING_MSG

LC1:
.asciiz	ERROR_INPUT_STREAM_READING_MSG
LC2:
.asciiz	ERROR_B64_CHAR_NOT_FOUND_MSG
.globl	errmsg
.data
errmsg:
.word	0
.word	LC0
.word	LC1
.word	LC2
