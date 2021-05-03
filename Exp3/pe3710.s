/*
    arm-elf-gcc -g -o [nomeDesejadoParaGerarArquivo] [nomeDoArquivoSerCompilado]
    arm-elf-gdb [nomeDoArquivoGerado]
*/
  
    .text
    .globl main
main:
    LDR r1, =9795060    @ Dividendo
    LDR r2, =1000       @ Divisor
    LDR r3, =0x0        @ Quociente
    MOV r5, r1          @ Resto

    @Elementos auxiliares
    LDR r4, =0x80000000 @Identificador de primeiro bit signficativo de r1 e r2
    LDR r9, =0x80000000 @Identificador de primeiro bit signficativo de r1 e r2
    LDR r6, =0x1F       @Contador de bit mais significativo de r1
    LDR r7, =0x1F       @Contador de bit mais significativo de r2


    BL  shiftdividend
    BL  opdivision

    @MOV r5, r1
    SWI 0x123456

shiftdividend:
@Primeiro verificamos o bit do dividendo
    ANDS    r8, r4, r1
    BNE     shiftdivisor
    MOV     r4, r4,  LSR #1
    SUBS    r6, r6, #1
    B       shiftdividend
shiftdivisor:
@Depois verificamos o do divisor
    ANDS    r8, r9, r2
    MOVNE   pc, lr
    MOV     r9, r9, LSR #1
    SUBS    r7, r7, #1
    B       shiftdivisor

opdivision:
    SUBS r8, r6, r7
    operation:
        MOVPL   r3, r3, LSL #1
        MOVMI   pc, lr
        CMP     r5, r2, LSL r8
        SUBPL   r5, r5, r2, LSL r8     
        ADDPL   r3, r3, #1
        SUBS    r8, r8, #1
        B       operation


@ opdivision:
@     LDR r8, =31
@     CMP r1, r2
@     operation:
@         MOVPL   r3, r3, LSL #1
@         MOVMI   pc, lr
@         CMP     r1, r2, LSL r8
@         SUBPL   r1, r1, r2, LSL r8     
@         ADDPL   r3, r3, #1
@         SUBS    r8, r8, #1
@         B       operation


