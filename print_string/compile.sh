nasm -f elf64 -o hello.o hello.asm -l hello.lst
ld hello.o -o hello