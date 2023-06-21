nasm -f elf64 -o hello.o hello.nasm -l hello.lst
ld hello.o -o hello