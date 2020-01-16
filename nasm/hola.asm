; ----------------------------------------------------------------------------------------
; Writes "Hola, mundo" to the console using a C library. Runs on Linux.
;
;     nasm -felf64 hola.asm && gcc hola.o && ./a.out (causes overflow in R_X86_64_PC32 relocation)
;
;     nasm -felf64 hola.asm && gcc -no-pie hola.o && ./a.out
; ----------------------------------------------------------------------------------------

          global    main
          extern    printf

          section   .text
main:                                       ; This is called by the C library startup code
          mov       rdi, message            ; First integer (or pointer) argument in rdi
          call      printf                    ; puts(message)
          ret                               ; Return from main back into C library wrapper
message:
          db        "Hola, mundo", 0        ; Note strings must be terminated with 0 in C
