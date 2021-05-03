/*
    arm-elf-gcc -g -o [nomeDesejadoParaGerarArquivo] [nomeDoArquivoSerCompilado]
    arm-elf-gdb [nomeDoArquivoGerado]
*/
  
    .text
    .globl main

main:
    LDR     r0, =0x4000 @base para o vetor de fibonacci
    LDR     r4, =0x400C
    LDR     r1, =0
    STRB    r1, [r0], #1
    LDR     r2, =1
    STRB    r2, [r0], #1

    BL loop
    SWI 0x123456


loop:
    ADD     r3, r2, r1
    MOV     r1, r2
    MOV     r2, r3
    STRB    r3, [r0], #1
    CMP     r0, r4 
    MOVPL   pc, lr
    B loop




