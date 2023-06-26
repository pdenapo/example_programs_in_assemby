section .data
msg:	db	"Hello, world!", 10,0

section .text
 	global _start

; Prints a message many times (example of a loop)

_start:
	mov rbx, 5 ; // How many times to print de message?
loop:	
	mov rdi, msg
	call printString
	dec rbx
	jnz loop

	mov rax,60 ; exit
	mov rdi,0  ; status = without errors.
	syscall


; prints a null-terminated string 
; INPUT: rdi= address of the string
global printString
printString:  
; We count the number of bytes in the string until the 0 byte
; rbx= pointer to walk over the string
; rdx= (at the end) lengh of the string
			  push rbx
			  mov rbx, rdi
			  mov rdx, 0
strCountLoop: cmp byte [rbx], 0
			  je strCountDone
			  inc rdx
			  inc rbx
			 jmp strCountLoop
strCountDone: 
; if the length is zero, there is nothing to print
			 cmp rdx, 0
			 je prtDone
; Call OS to output string.
		mov  rax, 1 ; which system call to use (write)
		mov	rsi, rdi ; we pass the length of the string
		mov rdi, 1; stdout 
		syscall
prtDone:
		pop rbx
		ret