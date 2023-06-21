section .data
msg:	db	"Hello, world!", 10
.len:	equ	$ - msg 

section .text
 	global _start

_start:
	mov	rax, 1 ; write
	mov	rdi, 1 ; stdout
	mov	rsi, msg
	mov	rdx, msg.len
	syscall   ; write(stdout, msg, strlen(msg));

	mov rax,60 ; exit
	mov rdi,0  ; status = without errors.
	syscall

 