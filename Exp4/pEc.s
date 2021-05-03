/*
    arm-elf-gcc -g -o [nomeDesejadoParaGerarArquivo] [nomeDoArquivoSerCompilado]
    arm-elf-gdb [nomeDoArquivoGerado]
*/
  
    .text
    .globl main

main:

    ADR  r0, A
    ADR  r1, B

    LDR r10, =0x0
    BL  loop    
    
    SWI 0x123456
    
    
    
loop:
    CMP     r10, #8
    MOVPL   pc, lr

    RSB     r2, r10, #7
    @SUB    r2, #7, r10 nao funciona
    LDRB   r3, [r1, r2]
    STRB   r3, [r0, r10]         

    ADD     r10, r10, #1
    B       loop
    


B: .byte 1, 2, 3, 4, 5, 6, 7, 8


A: .skip 8*1


    


