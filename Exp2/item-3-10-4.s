/*
to run this code you should
	arm-elf-gcc [filename to generate] [this filename].s
	arm-elf-gdb [file name generated]

*/

	.text
	.globl main
main:
    LDR	 r0, =0xF631024C	     	
	LDR	 r1, =0x17539ABD
    EOR  r0,r0,r1 
    EOR  r1,r0,r1
    EOR  r0,r0,r1
    SWI	 0x123456 
        	
