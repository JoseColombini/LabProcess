/*
    arm-elf-gcc -g -o [nomeDesejadoParaGerarArquivo] [nomeDoArquivoSerCompilado]
    arm-elf-gdb [nomeDoArquivoGerado]
*/

    .text
    .globl main
main:
    MOV r3, #1
    ADD r3,r7, #1023
    SUB r11, r12, r3, LSL #31
	SWI	0x123456
