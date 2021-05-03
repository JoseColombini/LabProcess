 /*
    arm-elf-gcc -g -o [nomeDesejadoParaGerarArquivo] [nomeDoArquivoSerCompilado]
    arm-elf-gdb [nomeDoArquivoGerado]
*/
  
   .text
   .globl main
main:                             
   ADR  r0,  s
   ADR  r1,  array 
   LDR  r3,  =0x0   @ zero a ser storado
   LDR  r8,  =0x0
   LDR  r9,  =0x4
   LDR  r10, =0x0   @ contador
   LDR  r11, [r0]   @ valor carregado em s

   @ === rodar na forma 1 ===========
   @ BL   loop1       @ branch para loop

   @ === rodar na forma 2 ============
   ADR  r2, array
   BL   loop2

   SWI  0x123456

@ === forma 1 =========================
@ loop1:
   @ CMP     r10, r11
   @ MOVPL   pc, lr
   @ MUL     r8, r10, r9
   @ STR     r3, [r1,r8]
   @ ADD     r10, r10, #1
   @ B       loop1

@ === forma 2 =========================
loop2:
   CMP     r10, r11
   MOVPL   pc, lr
   STR     r3, [r2], #4
   ADD     r10, r10, #1
   B       loop2

@ === valores =========================

.align 1
s:      .word 5
array: