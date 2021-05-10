   .text
   .globl main
main:     
   LDR     r1, =0x16C764CB  @ p/t $r1 para o valor em binário
   LDR     r2, =0x0
   LDR     r3, =0x0
   LDR     r4, =32
   LDR     r5, =0x0

   MOV   r6, r1

   LDR     r8, =7  @Y 
   LDR     r9, =3  @len(Y)
   RSB     r10, r9, #32

   BL      maqEstado
   LDR     r4, =32 
   BL      rotateBits

   SWI     0x123456

maqEstado:
   MOV     r3, r1, LSL r10
   MOV     r3, r3, LSR r10
   MOV     r5, r5, LSL #1

   CMP     r3, r8
   ADDEQ   r5, r5, #1
   MOV     r1, r1, LSR #1

   SUBS    r4, r4, #1 
   MOVEQ   pc, lr
   B       maqEstado

rotateBits:
   MOVS    r5, r5, LSR #1
   MOV     r2, r2, LSL #1
   ADC     r2, r2, #0

   SUBS    r4, r4, #1 
   MOVEQ   pc, lr
   B       rotateBits
