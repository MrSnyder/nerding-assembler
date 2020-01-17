; nasm -f elf64 hello_syscall.asm; ld -static -o hello_syscall hello_syscall.o; ./hello_syscall
        global    _start
        section   .text
_start: mov       rax, 1                  ; system call for write
        mov       rdi, 1                  ; file handle 1 is stdout
        mov       rsi, message            ; address of string to output
        mov       rdx, len                ; number of bytes
        syscall                           ; invoke operating system to do the write
        mov       rax, 60                 ; system call for exit
        xor       rdi, rdi                ; exit code 0
        syscall                           ; invoke operating system to exit

        section .data
message db "Hello World (via syscall)!", 0x0a
len equ $ - message
