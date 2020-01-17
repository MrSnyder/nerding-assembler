; nasm -f elf64 hello_syscall.asm
; ld -static -o hello_syscall -e start hello_syscall.o
section .data
        msg db "Hello World (via syscall)!", 0x0a
        len equ $ - msg
section .text
global start:
start:
        mov eax, 4 ; 4=write
        mov ebx, 1 ; 1=stdout
        mov ecx, msg
        mov edx, len
        int 0x80


        mov eax, 1 ; 1=exit
        mov ebx, 0 ; 0=no error        
        int 0x80
