/*
to run this code you should
	arm-elf-gcc [filename to generate] [this filename].s
	arm-elf-gdb [file name generated]

*/
	.text
	.globl	main
main:
	BL	firstfunc
	BL	secondfunc
	BL	thirdfunc
	SWI	0x12345678
firstfunc:
    LDR     r0, =0xFFFF0000
    LDR     r1, =0x87654321
	ADDS	r0, r0, r1
	MOV	    pc, lr
secondfunc:
    LDR     r0, =0xFFFFFFFF
    LDR     r1, =0x12345678
	ADDS	r0, r0, r1
	MOV	    pc, lr
thirdfunc:
    LDR     r0, =0x67654321
    LDR     r1, =0x23110000
	ADDS	r0, r0, r1
	MOV	    pc, lr
