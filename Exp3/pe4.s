/*
    arm-elf-gcc -g -o [nomeDesejadoParaGerarArquivo] [nomeDoArquivoSerCompilado]
    arm-elf-gdb [nomeDoArquivoGerado]
*/

    .text
    .globl main
main:
    LDR r0, =0x0FFFFFFF
    LDR r1, =0xFFFFFFFF
    LDR r2, =0x0

@Rotina para desloca a direita
@   LDR r0, =0xFFFFFFFF
@   LDR r1, =0xFFFFFFFF
@
@   MOVS r0, r0, LSR #1
@   MOV  r1, r1, RRX
@   SWI  0x123456

@Rotina para Deslocar a esquerda
    MOVS r0, r0, LSL #1
    MOV r1, r1, ROR #31
    MOV r1, r1, RRX
    MOV r1, r1, ROR #31
    SWI 0x123456
