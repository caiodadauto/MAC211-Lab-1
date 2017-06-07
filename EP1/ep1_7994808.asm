;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;           Nome:Caio vinicius Dadauto              
;           Nusp:7994808                            
;           EP1:Laboratorio de progamacao 1         
;       Encontra os numeros primos entre 1 e 1000   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

global _start
section .bss
    primos: resb 12

section .text
int2str:
    push ebp
    mov  ebp, esp
    push eax
    push ebx
    push ecx
    push edx

    mov  ecx, 2         ;Armazena o tamanho do primo a ser impresso (0 "numero primo" 0Ah)
    mov  ebx, 10        ;Fator para "descascar" o numero primo para converte-lo para ASCII
    push word 0Ah
    descascaPrimo:
        xor  dx, dx
        div  bx
        add  dx, 48     ;Encontra o codigo ASCII do digito menos significativo do primo
        push dx         ;Impilha esse digito em ASCII
        inc  ecx        ;Incrementa 1 ao tamanho do primo
        cmp ax, 0       ;Verifica se o primo foi "descascado" por completo
        jne descascaPrimo
    push word 48        ;Empilha o 0 em ASCII
    mov ebx, ecx
    criaString:
        pop  ax         ;Desempilha os digitos em ordem de impressao (mais significativo ao menos)
        mov  [esi], al  ;Move o digito (byte) para o vetor primos
        add  esi, 1     ;desloca o ponteiro
        dec  ebx        ;Numero de pops a serem realizados
        jnz  criaString
    sub  esi, ecx       ;Restaura ponteiro para o inicio do vetor primos
    ;Chamada de sistema para impressao
    mov  eax, 4
    mov  ebx, 1
    mov  edx, ecx
    mov  ecx, esi
    int 80h
    ;------------------

    pop edx
    pop ecx
    pop ebx
    pop eax
    pop ebp

    ret

_start:
    ;Imprime o numero 1
    mov  esi, primos        ; Armazena o valor:
    mov  [esi], byte 48     ;   01
    add  esi, 1             ;em ASII nas duas primeiras
    mov  [esi], byte 49     ;do vetor primos.
    add  esi, 1             ; Armazena na terceira posicao
    mov  [esi], byte 0Ah    ;o caracter '/n'.
    ;Chamada de sistema para impressao
    sub  esi, 2
    mov  eax, 4
    mov  ebx, 1
    mov  ecx, esi
    mov  edx, 3
    int  80h
    ;------------------

    ;Zera os registradores
    xor  eax, eax
    xor  ebx, ebx
    xor  ecx, ecx
    xor  edx, edx
    ;------------------
    mov  eax, 2             ;Para iniciar a busca por primos do numero 2
    varreValores:    
        mov  ebx, 2         ;Divisor de eax
    testaPrimo:
        cmp  ebx, 1000      ; Se percorrer os 1000 valores,
        je   primo          ;entao e primo.
        push eax
        div  ebx
        pop  eax
        cmp  edx, 0
        jz   divisivel
        jnz  continue
    divisivel:
        cmp  eax, ebx
        jne  naoPrimo
    continue:
        inc  ebx
        xor  edx, edx
        jmp  testaPrimo
    primo:
        call int2str
    naoPrimo:
        inc  eax
        cmp  eax, 1000
        jne  varreValores
        
    mov eax, 1
    xor ebx, ebx
    int 80h
