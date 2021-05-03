/*
to run this code you should
	arm-elf-gcc [filename to generate] [this filename].s
	arm-elf-gdb [file name generated]

*/
	.text
	.globl	main
main:
    ldr     r1, =0xFFFFFFFF
    ldr     r2, =0x80000000
	BL	firstfunc
	SWI	0x123456
firstfunc:
	MULS	r0 , r1, r2
	@UMULL r4, r3, r1, r2
	@SMULL r4, r3, r1, r2
	MOV	    pc, lr
