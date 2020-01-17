; nasm -felf64 hello_glibc.asm; ld hello_glibc.o -dynamic-linker /lib64/ld-linux-x86-64.so.2 -lc -melf_x86_64 -o hello_glibc; ./hello_glibc

          global    _start
          extern    puts
          extern    _exit

          section   .text
_start:
          mov       rdi, message            ; First integer (or pointer) argument in rdi
          call      puts                    ; puts(message)
          mov rax, 0    
          jmp _exit
message:
          db       "Hello World (via glibc)!", 0        ; Note strings must be terminated with 0 in C
