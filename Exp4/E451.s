/*
    arm-elf-gcc -g -o [nomeDesejadoParaGerarArquivo] [nomeDoArquivoSerCompilado]
    arm-elf-gdb [nomeDoArquivoGerado]
*/
  

    .text
    .globl main
main:                              
    ADR   r0, x 
    ADR   r1, y
    ADR   r2, array
    LDR   r3, =20    @ 20 = 5*4

@ === pre indexing =========================

    LDRB  r4, [r2,r3]
    LDR   r5, [r1]  
    ADD   r4, r4, r5
    STR   r4, [r0] 

@ === post indexing ========================

    ADD  r4, r2, r3
    LDR  r5, [r4], -r3
    LDR  r6, [r1]
    ADD  r5, r5, r6
    STR  r5, [r0]

    SWI   0x123456
 
@ === arrays ===============================

array: .word  0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24  
.align  2     
x:     .skip  1*4   
y:     .4byte 1