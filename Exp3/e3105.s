/*
    arm-elf-gcc -g -o [nomeDesejadoParaGerarArquivo] [nomeDoArquivoSerCompilado]
    arm-elf-gdb [nomeDoArquivoGerado]
*/

    .text
    .globl main
main:
    LDR     r0, =0xFFFFFFFF
    LDR     r1, =0x0FF0F00F
    LDR     r2, =0x0
    LDR     r3, =0x0
    LDR     r6, =0xFFFFFFFF

    SMULL   r9, r10, r0, r1

    CMP     r0, #0
    EORMI   r4, r0, r6
    ADDMI   r4, r4, #1
    MOVPL   r4, r0
    CMP     r1, #0
    EORMI   r5, r1, r6
    ADDMI   r5, r5, #1
    MOVPL   r5, r1

    UMULL   r3, r2, r5, r4

    CMP     r0, #0
    BMI    funcA
    BPL    funcB

result:
    SWI 0x123456


funcA:
    CMP     r1, #0
    BMI     result
    EOR     r3, r3, r6
    ADDS    r3, r3, #1
    EOR     r2, r2, r6
    ADD     r2, r2, #1
    SUBCC   r2, r2, #1
    B       result

funcB:
    CMP     r1, #0
    BPL     result
    EOR     r3, r3, r6
    ADDS    r3, r3, #1
    EOR     r2, r2, r6
    ADD     r2, r2, #1
    SUBCC   r2, r2, #1
    B       result




