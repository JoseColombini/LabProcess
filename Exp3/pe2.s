/*
    arm-elf-gcc -g -o [nomeDesejadoParaGerarArquivo] [nomeDoArquivoSerCompilado]
    arm-elf-gdb [nomeDoArquivoGerado]
*/

    .text
    .globl main
main:
    @Multiplicacao sem utilizar o MUL pelos valores indicados nas funcoes
    BL  fun132
    BL  fun255
    BL  fun18
    BL  fun16384
    SWI 0x123456

fun132:
    LDR r4, =0x1
    MOV r0, r4, LSL #7
    ADD r4, r0, r4, LSL #2
    MOV	pc, lr

fun255:
    LDR r4, =0x1
    MOV r0, r4, LSL #8
    SUB r4, r0, r4
    MOV	pc, lr

fun18:
    LDR r4, =0x1
    MOV r0, r4, LSL #4
    ADD r4, r0, r4, LSL #1
    MOV	pc, lr

fun16384:
    LDR r4, =0x1
    MOV r4, r4, LSL #14
    MOV pc, lr

