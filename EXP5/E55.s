/*
    arm-elf-gcc -g -o [nomedesejado] [nomedestearquivo]
    arm-elf-gdb [nomedoarquivogerado]

 */
   .text
   .globl main
main:
   LDR  r0, =0x68123912   @ valor inicial
   LDR  r1, =0x0          @ valor a ser retornado
   LDR  r2, =0x0         
   LDR  r3, =0x0          @ contador de bits 1 na palavra
   LDR  r4, =32

   BL   contador          @ r3 armazena o numero de 1's
   BL   paridade          @ r1 recebe o valor apropriado para retorno
   
   SWI 0x123456

 contador:
   MOV     r2, r0, LSL #31
   CMP     r2, #0x80000000
   ADDEQ   r3, r3, #1
   MOV     r0, r0, LSR #1   
   SUBS    r4, r4, #1
   MOVEQ   pc, lr
   B       contador

paridade:
   MOVS    r3, r3, LSR #1
   MOVCS   r1, #0x001 
   MOVCC   r1, #0x000      
   MOV     pc, lr
