%macro imprimir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data
        nombres DB "Estudiante: Jhon Faver Henao Saldarriaga", 10 
        len_nombres EQU  $ - nombres 
        
        curso DB "Curso: 6to 'A'", 10 
        len_curso EQU  $ - curso 

        fecha DB "29-07-2020", 10 ;
        len_fecha EQU  $ - fecha ;
        
        saludo db 10, 'Hola: '
        len_saludo equ $ - saludo

        new_line db "", 10

section .bss
    numero resb 1

section .text
        global _start

_start:
    imprimir nombres, len_nombres
    imprimir fecha, len_fecha
    imprimir curso, len_curso

    mov ecx, 9

    for:
        push rcx
        add ecx, '0'
        mov [numero], ecx
        imprimir saludo, len_saludo
        imprimir numero,1

        pop rcx
        loop for
        
    salir:
    imprimir new_line,1
    mov eax, 1
    int 80h