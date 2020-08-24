;Suma de dos numero estaticos
%macro imprimir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data

    nombres DB "Estudiante: Jhon Faver Henao Saldarriaga", 10 ;
    len_nombres EQU  $ - nombres ;
    
    curso DB "Curso: 6to 'A'", 10 ;
    len_curso EQU  $ - curso ;
    
    resultado db 'El resultado de la suma es:'
    len_resultado equ $ - resultado

    new_line db "",10

section .bss
    suma resb 1 ;cuando no se nececita del enter

section .text
    global _start

_start:

    imprimir nombres, len_nombres    
    imprimir curso, len_curso

    mov eax,6
    mov ebx,3
    add eax, ebx ;eax = eax + ebx
    add eax, '0' ;Ajuste para que haga la suma en ascii

    mov [suma], eax

    imprimir resultado, len_resultado
    imprimir suma,1
    imprimir new_line,1
	;****************************salir del sistema******************
    mov eax, 1
    int 80h