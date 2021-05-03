/*
    arm-elf-gcc -g -o [nomeDesejadoParaGerarArquivo] [nomeDoArquivoSerCompilado]
    arm-elf-gdb [nomeDoArquivoGerado]
*/

    .text
    .globl main
main:
    LDR r0, =0xB4 @2bitGrayCode
    MOV r1, r0
    LDR r3, =0x0
    LDR r8, =0
    LDR r4, =0xFFFFFFFF
    LDR r10, =0x0
    LDR r7, =0

    BL funcA
    ldr r2, =0
    ldr r3, =0
    BL  montador
    LDR r3, =0x0
    BL insert1

    SWI 0x123456

funcA:
    LDR     r2, =0
    CMP     r3, #4
    MOVEQ   pc, lr
    ADD     r3, r3, #1
    funcB:
        MOVS    r1, r1, ROR #1
        MOV     r10, r10, RRX
        CMP     r2, #1
        MOVEQ   r10, r10, LSR #1
        BEQ     funcA
        ADD     r2, r2, #1
        B       funcB


montador:
    CMP     r3, #4
    MOVEQ   pc, lr
    MOVS    r0, r0, LSR #1
    MOV     r1, r1, RRX
    CMP     r2, #1
    ldrEQ    r2, =0
    BEQ     recompoe
    ADD     r2, r2, #1
    B       montador
    recompoe:
        MOVS r1, r1, LSL #1
        MOV r8, r8, RRX
        CMP     r2, #1
        ldrEQ    r2, =0
        ADDEQ   r3, r3, #1
        BEQ     montador
        ADD     r2, r2, #1
        B       recompoe       


    
        

insert1:
    LDR     r2, =0
    CMP     r3, #4
    MOVEQ   pc, lr
    ADD     r3, r3, #1    

    loop1:
        MOVS    r8, r8, LSL #1
        MOV     r10, r10, RRX
        MOVS    r4, r4, ROR #1
        CMP     r2, #1
        MOVEQ   r10, r10, RRX
        BEQ     insert1
        ADD     r2, r2, #1
        B      loop1
