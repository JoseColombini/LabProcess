@ para rodar:
@ > gcc -o primos_anteriores primos_anteriores.s
@ > gdb primos_anteriores
@ >> b main
@ >> r
@ >> c
@ esperar um pouco se o numero for alto como um nusp...
@ >> x/10d primos_anteriores
@ ir apertando enter para ver todos os valores ate o -1... 
	
	.text
	.globl	main

main:

    	ldr 	r1, =9795060 @ N

	adr r4, primos_anteriores
	mov r11, #3
	
loop_geral:
	sub r1, r1, #1

	mov r2, #2
	mov	r3, #0
    	mov	r5, r1
    	mov 	r12, #1

divide_func:

	cmp r5, #0
	beq loop_geral

cont:
	cmp r2, r1
	BGE salva


    	mov	r3, #0

	clz	r6, r1
    	clz	r7, r2
    	sub	r8, r7, r6      @ diferenca entre os tamanhos de r1 e r2 original

	MOV 	r9, r2, LSL r8  @ salva em r9 o valor em r2 shiftado para a esquerda r8 vezes (alinhado com r1)
	MOV	r10, r1, LSR r8 @ salva em r10 o valor em r1 shiftado para a direita r8 vezes (mesmo tamanho de r2)
	MOV	r5, r1          @ remainder, sera obtido subtraindo de r1
	b	loop
	
loop:
	cmp 	r10, r2
	BGE	subtrair
	BLT	concat
	
prox:	MOV	r9, r9, LSR #1
    	clz	r6, r9
    	sub	r8, r7, r6
    	MOV	r10, r5, LSR r8
    	
    	cmp 	r7, r6
    	ADDLT	r2, r2, #1
    	BLT	divide_func
    	B loop
	
subtrair:

	SUB	r5, r5, r9 	
	ADD	r3, r12, r3, LSL #1
	b 	prox
		
concat:
	
	MOV	r3, r3, LSL #1
	b	prox	
	
	
salva:
	str r1, [r4], #4
	sub r11, r11, #1
	cmp r1, #2 
	beq termina
	cmp r11, #0
	beq termina
	b loop_geral

termina:
	mov r0, #-1
	str r0, [r4] 
	b main



primos_anteriores:
	.word






















