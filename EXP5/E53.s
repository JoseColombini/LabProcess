/*
    arm-elf-gcc -g -o [nomedesejado] [nomedestearquivo]
    arm-elf-gdb [nomedoarquivogerado]

 */

    .text
    .globl main
main:
    ADR     r0, serie
    ADR     r1, comps
    ADR     r2, max

    LDR     r3, [r0], #4
    LDR     r5, [r1]
    SUBS    r5, r5, #1
    BLPL     loop

    STR     r3, [r2]
    SWI     0x123456
    
loop:
    LDR     r4, [r0], #4
    CMP     r4, r3 
    MOVHI   r3, r4
    SUBS    r5, r5, #1
    MOVEQ   pc, lr
    B       loop



serie:  .word   58, 9, 1024, -1, 4589, -59, 3628800
comps:  .word   7

max:    .word   0

