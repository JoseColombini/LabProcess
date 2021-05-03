/*
    arm-elf-gcc -g -o [nomeDesejadoParaGerarArquivo] [nomeDoArquivoSerCompilado]
    arm-elf-gdb [nomeDoArquivoGerado]
*/
  
    .text
    .globl main

main:

    LDR r3, =0x4000
    LDR r4, =0x20

    STRB r9, [r3,r4]
    LDRB r8,[r3,r4,LSL #3]
    LDR r7, [r3], r4
    STRB r6, [r3], r4, ASR #2

    SWI 0x123456




