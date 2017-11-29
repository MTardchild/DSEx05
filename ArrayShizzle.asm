%include "io.inc"

section .data
POS_ARR DD 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
NEG_ARR DD 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
FORMAT DB "%d, %d, %d, %d, %d, %d, %d, %d, %d, %d"

%macro PRINT_ME_AN_ARRAY 0
    push ebp
    mov ebp, esp
    mov eax, 9
    PUSHER_CODING:
        push dword [POS_ARR + 4*eax]
        sub eax, 1
    jnz PUSHER_CODING
    push dword [POS_ARR]
    push FORMAT
    call printf
    mov esp, ebp
    pop ebp
%endmacro
    
%macro DONT_BE_SO_NEGATIVE 0
    push ebp
    mov ebp, esp
    mov eax, 9
    NEGATIVE_PUSHER_CODING:
        push dword [NEG_ARR + 4*eax]
        sub eax, 1
    jnz NEGATIVE_PUSHER_CODING
    push dword [NEG_ARR]
    push FORMAT
    call printf
    mov esp, ebp
    pop ebp
%endmacro

section .text
global CMAIN
CMAIN:  
    mov ebx, 9
    CHEAPO_MEAPO_JUMPO:
    mov [POS_ARR + 4*ebx], ebx
    sub ebx, 1
    jnz CHEAPO_MEAPO_JUMPO
    
    mov eax, 9
    mov ebx, -10
    CHILLIG_BILLIG_JUMPIG:
    mov [NEG_ARR + 4*eax], ebx
    add ebx, 1
    sub eax, 1
    jnz CHILLIG_BILLIG_JUMPIG
    mov [NEG_ARR], ebx
    
    PRINT_ME_AN_ARRAY
    NEWLINE
    DONT_BE_SO_NEGATIVE
    
    xor eax, eax    
    ret