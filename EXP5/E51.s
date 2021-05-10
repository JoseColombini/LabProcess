   .text
   .globl main
main:
   MOV  r0, #0x4000
   MOV  r1, #0x5000

   ADR  r2, A @ estara decrescente
   ADR  r3, B @ estara crescente

@ Devemos carregar os vetores nos espaços de memória pre definidos
   LDR  r4, [r2]
   LDR  r5, [r2,#4]
   LDR  r6, [r3]
   LDR  r7, [r3,#4]

   STR  r4, [r0]
   STR  r5, [r0,#4]
   STR  r6, [r1]
   STR  r7, [r1,#4]

   LDR  r10, =0x0
   BL   loop  
   SWI 0x123456

 loop:
   CMP     r10, #8
   MOVPL   pc, lr

   RSB     r8, r10, #7
   LDRB    r9, [r1, r8]
   STRB    r9, [r0, r10]       

   ADD     r10, r10, #1
   B       loop

B: .byte 1, 2, 3, 4, 5, 6, 7, 8
.align 3
A: .skip 8*1