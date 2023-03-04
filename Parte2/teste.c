#include <stdio.h>

typedef unsigned char BYTE;
BYTE *const PGCR = (BYTE* ) 0xFE8001; //INICIALIZAÇÃO GERAL
BYTE *const PACR = (BYTE* ) 0xFE800D; //INICIALIZAÇÃO SUBMODO
BYTE *const PADDR = (BYTE* ) 0xFE8005; //INICIALIZAÇÃO DIREÇÃO
BYTE *const motor = (BYTE* ) 0xFE8011; //ENDEREÇO DA PORTA A
 BYTE *const gateB = (BYTE* ) 0xFE8013;
BYTE *const PBCR = (BYTE* ) 0xFE800F;
BYTE *const PBDDR = (BYTE* ) 0xFE8007;

struct estado {
    int num;
    struct estado* next;
    struct estado* bef;
};

    struct estado E1, E2, E3, E4;
    struct estado* Eat = &E1;

void espera (long i);

void setEstado (struct estado* Eatual, int i, struct estado* Enext, struct estado* Ebef);

void main(void)
{
    long i;
// activate I/O devices for simulation
    _trap(15);
    _word(32); // show LEDs
    *PGCR = 0x30;
    *PACR = 0xA0;
    *PADDR = 0xFF;
    *motor = 0x00;
    *PBCR = 0xA0;
    *PBDDR = 0x00;



     setEstado(&E1, 1, &E2, &E4);
     setEstado(&E2, 2, &E3, &E1);
     setEstado(&E3, 3, &E4, &E2);
     setEstado(&E4, 4, &E1, &E3);



    for (;;){
        int x = (*Eat).num;
        switch(x){
            case 1:
            *motor = 0x0C;
            break;

            case 2:
            *motor = 0x06;
            break;

            case 3:
            *motor = 0x03;
            break;

            case 4:
            *motor = 0x09;

        }



}
}

void espera (long i)
{
long j;
for(j=0 ; j <= i; j++);
}

void setEstado (struct estado* Eatual, int i, struct estado* Enext, struct estado* Ebef){
    (*Eatual).num = i;
    (*Eatual).next = Enext;
    (*Eatual).bef = Ebef;
}