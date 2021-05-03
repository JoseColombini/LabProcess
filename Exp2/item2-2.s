/*
to run this code you should
	arm-elf-gcc [filename to generate] [this filename].s
	arm-elf-gdb [file name generated]

*/

	.text
	.globl main
main:
	MOV	r0, #15	     @ comentarios vem depois de @ ou entre /* ... */		
	MOV	r1, #20
	BL	firstfunc    @ desvia para funcao, coloca o enderenco de retorno em R14 ou LR (link register).		
	MOV	r0, #0x18		
	LDR	r1, =0x20026		
	SWI	0x123456		
firstfunc:
	ADD	r0, r0, r1		
	MOV	pc, lr	     @ retorna da funcao		
