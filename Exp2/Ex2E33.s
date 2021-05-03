/*
to run this code you should
	arm-elf-gcc [filename to generate] [this filename].s
	arm-elf-gdb [file name generated]

*/

	.text
	.globl	main
main:
    ldr     r1, =0x00000001
    MOV		r2, r1, LSL #5
	SWI	0x123456
