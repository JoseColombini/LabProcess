/*
    arm-elf-gcc -g -o [nomeDesejadoParaGerarArquivo] [nomeDoArquivoSerCompilado]
    arm-elf-gdb [nomeDoArquivoGerado]
*/
  
    .text
    .globl main
main:
    ADR r0, fibonacci
    ADR r1, n

    LDR r10, =0
    STR r10, [r0], #4
    LDR r9, =1
    STR r9, [r0], #4
    LDR r2, =1
    LDR r3, [r1]

loop:
    ADD     r8, r9, r10
    MOV     r10, r9
    MOV     r9, r8
    STR     r8, [r0], #4
    ADD     r2, r2, #1
    CMP     r2, r3
    BPL     end
    B       loop

end:
    SWI 0x123456

fibonacci: .skip 60*4
n:  .word 59
