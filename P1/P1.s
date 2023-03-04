/*
    arm-elf-gcc -g -o [nomedesejado] [nomedestearquivo]
    arm-elf-gdb [nomedoarquivogerado]
    Dentro do dbg digitar:
        "target sim"
        "laod"
        após isso só definir os pontos de break e proceder normalmente

 */

    .text
    .globl main

main:
    LDR r1, = 9795060 @ N    
    LDR r0, = 0
    ADR r10, primos_anteriores


    loopOut:
        LDR     r2, = 2     @divisor
        SUB     r1, r1, #1
        CMP     r1, #2
        STREQ   r1, [r10], #4
        ADDEQ   r0, r0, #1
        BEQ     zeros
        CMP     r0, #3
        BEQ     final
        loopIN:
            BL      division        @Realiza a divisao
            CMP     r5, #0          @Verifica se o numero e divisor
            BEQ     loopOut

            ADD     r2, r2, #1      @incrementa divisor para novos testes
            CMP     r2, r1          @verifica se ja acabou os possíveis valores
            STREQ   r1, [r10], #4
            ADDEQ   r0, r0, #1
            BEQ     loopOut           @encerra a rotina
            B       loopIN


zeros:
    LDR r5, =-1
    STR r5, [r10] , #4
    ADD r0, r0, #1
    CMP     r0, #3
    BNE     zeros   

final:
    SWI 0x123456



@R1 dividendo
@R2 divisor
@R3 retorna quciente
@R5 retorna resto
@R4, R9m R6, R7 sao difinidos em rotina interna (descartaveis apos o uso)
division:
    MOV r11, lr
    LDR r3, =0x0        @ Quociente
    MOV r5, r1          @ Resto

    @Elementos auxiliares
    LDR r4, =0x80000000 @Identificador de primeiro bit signficativo de r1 e r2
    LDR r9, =0x80000000 @Identificador de primeiro bit signficativo de r1 e r2
    LDR r6, =0x1F       @Contador de bit mais significativo de r1
    LDR r7, =0x1F       @Contador de bit mais significativo de r2


    BL  shiftdividend
    BL  opdivision
    MOV pc, r11


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
    @ CLZ     r6, r1
    @ RSB     r6, r6, #31
    @ CLZ     r7, r2
    @ RSB     r7, r7, #31
    SUBS    r8, r6, r7
    operation:
        MOVPL   r3, r3, LSL #1
        MOVMI   pc, lr
        CMP     r5, r2, LSL r8
        SUBPL   r5, r5, r2, LSL r8     
        ADDPL   r3, r3, #1
        SUBS    r8, r8, #1
        B       operation

primos_anteriores: .skip 3*4
