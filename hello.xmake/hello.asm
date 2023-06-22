; assembly with nasm, options
; -f elf64 $SOURCE$ -l $LSTOUTPUT$ -o $PROGRAM.OBJ$
; link with gcc, linker options
; $PROGRAM.OBJ$ $MACRO.OBJ$ -g -o $PROGRAM$ -m64 -no-pie
; in the settings menu
section .data
msg:	db	"Hello, world!", 10
.len:	equ	$ - msg 

section .text
global main
main:
    mov rbp, rsp; for correct debugging
    mov	rax, 1 ; write
    mov	rdi, 1 ; stdout
    mov	rsi, msg
    mov	rdx, msg.len
    syscall   ; write(stdout, msg, strlen(msg));
    
    xor rax, rax
    ret