/*
    arm-elf-gcc -g -o [nomedesejado] [nomedestearquivo]
    arm-elf-gdb [nomedoarquivogerado]

 */

    .text
    .globl main
main:
    LDR     r1, =0x5555AAAA @X de entrada
    LDR     r2, =0x0        @Z de saida 
    LDR     r8, =5      @Sequencia a ser reconhecida
    LDR     r9, =3          @Tamanho da sequencia


    RSB     r5, r9, #32
    MOV     r11, r8, LSL r5



    LDR r3, =0x80000000 @Ponta de escrita
    LDR r4, =0x80000000 @Ponta de leitura
    MOV r10, r9         @Contador de estados

    BL Estat1

    SWI 0x123456


Estat1:
    AND r0, r1, r4
    AND r7, r11, r4
    CMP r7, r0

    BEQ     Estat2
   
 
    MOV r10, r9
    MOV r11, r8, LSL r5
    B   Err  
    

Estat2:
    MOV     r11, r11, LSL #1
    SUBS    r10, r10, #1
    BEQ     Estat3
    B       Eatt
    



Estat3:
    MOV r10, r9
    MOV r11, r8, LSL r5
    ADD r2, r2, r3
    B   Estat1

Eatt:    
    MOVS    r3, r3, LSR #1
    MOV     r1, r1, LSL #1  
    MOVEQ   pc, lr
    B       Estat1


Err:
    AND r0, r1, r4
    AND r7, r11, r4
    CMP r7, r0
    BEQ     Estat2
    B       Eatt

