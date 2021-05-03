/*
to run this code you should
	arm-elf-gcc [name to generate] [this file name].s
	arm-elf-gdb [name of file generated]

*/

	.text
	.globl	main
main:
	MOV	r0, #15
	MOV	r1, #20
	BL	firstfunc
	MOV	r0, #0x18
	LDR	r1, =0x20026
	SWI	0x123456
firstfunc:
	ADDS	r0, r0, r1
	MOV	pc, lr
