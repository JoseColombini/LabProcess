/*
    arm-elf-gcc -g -o [nomeDesejadoParaGerarArquivo] [nomeDoArquivoSerCompilado]
    arm-elf-gdb [nomeDoArquivoGerado]
*/
  
    .text
    .globl main

main:

    ADR r0, data
    LDRSB sp, [r0]
    LDRSH sp, [r0]
    LDRH sp, [r0]    
    LDR sp,[r0]
    LDRB sp,[r0]

    SWI 0x123456

data: .byte    0x06, 0xFC, 0x03, 0xFF

