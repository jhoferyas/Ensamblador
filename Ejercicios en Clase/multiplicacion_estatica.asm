;Multiplicacion de numeros estaticos    
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

        resultado db 'El resultado de la multiplicacion es:'
        len_resultado equ $ - resultado

        new_line db "", 10

section .bss
    multiplicacion resb 1 ;cuando no se nececita del enter
        
section .text
        global _start

_start:
        imprimir nombres,len_nombres
        imprimir curso, len_curso
        
        mov al,4
        mov bh,2
        mul bh ; eax = eax * ebx
        add al, '0' ;Ajuste para que haga la suma en ascii

        mov [multiplicacion], al

        imprimir resultado, len_resultado
        imprimir multiplicacion, 1
        imprimir new_line, 1

        ;*****************Salir del Sistema*************
        mov eax, 1
        mov ebx, 0
        int 80h