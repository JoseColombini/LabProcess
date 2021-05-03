/*
	arm-elf-gcc -g -o [NomeDoArquivoGerado] [NomeDoCódigoFonte]
	arm-elf-gdb [NomeDoArquivoGerado]

*/
  .text
  .globl main

main:
   LDR r0, =-32   @ Valor signed
   LDR r1, =0     @ Valor absoluto
   LDR r2, =0

   SUBS  r1, r0, r2  @ Caso o valor seja positivo
   SUBMI r1, r2, r0  @ Caso o valor seja negativo
   SWI 0x123456
