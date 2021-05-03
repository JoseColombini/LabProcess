/*
    arm-elf-gcc -g -o [nomeDesejadoParaGerarArquivo] [nomeDoArquivoSerCompilado]
    arm-elf-gdb [nomeDoArquivoGerado]
*/

    .text
    .globl main
main:
    SUBS r0, r2, r4
    SUBEQS r1, r3, r5
