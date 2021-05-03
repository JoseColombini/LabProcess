/*
    arm-elf-gcc -g -o [nomeDesejadoParaGerarArquivo] [nomeDoArquivoSerCompilado]
    arm-elf-gdb [nomeDoArquivoGerado]
*/
  
    .text
    .globl main

main:
    LDR r1, =0x1
    ADR r2, array
@Pre index solution
    @ LDR r3, [r2, #20] @5*4
    @ ADD r3, r1, r3
    @ STR r3, [r2, #40]
@post index solution
    ADD r2, r2, #20
    LDR r3, [r2], #20
    ADD r3, r3, r1
    STR r3, [r2]

    SWI 0x123456


array: .word 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25

