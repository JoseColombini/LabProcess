/*
    arm-elf-gcc -g -o [nomedesejado] [nomedestearquivo]
    arm-elf-gdb [nomedoarquivogerado]

 */

    .text
    .globl main
main:

    MOV r6, #0xA    
    MOV r4, r6
    loop:
        SUBS    r4, r4, #1
        MULNE   r7, r4, r6
        MOVNE   r6, r7
        BNE     loop

    SWI 0x123456
