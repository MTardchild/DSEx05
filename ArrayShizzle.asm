%include "io.inc"

POS_ARR DD 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
NEG_ARR DD 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

section .text
global CMAIN
CMAIN:
    mov ebx, 9
    
    xor eax, eax
    ret