    .text
    .globl main

main:




    srl     $t3, $s1, 3
    srl     $t4, $s2, 1

    SUB     $t5, $s1, $t3    

    ADD     $t6, $t4, $t5

    bge     $t6, $s1, MaxFim
    move    $t7, $s1


maxMin:
    bge $t1, $t2, maxSelect
    move    $s1, $t2
    move    $s2, $t1
    srl     $t3, $s1, 3

    maxSelect:
        move    $s1, $t1
        move    $s2, $t2
        srl     $t3, $s1, 3


