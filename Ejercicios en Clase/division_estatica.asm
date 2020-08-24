;division estatica
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

        mcociente db 'El resultado de la division es: '
        len_mcociente equ $-mcociente

        mresiduo db 'El residuo es: '
        len_mresiduo equ $-mresiduo

        new_line db "",10
        
section .bss
    cociente resb 1  ;cuando no se nececita del enter
    residuo resb 1    
section .textS
        global _start

_start:
        imprimir nombres, len_nombres
        imprimir curso, len_curso

        mov al,20
        mov bh,3
        div bh ; ah = ah/bh
        add al, '0'
        mov [cociente], al
        add ah, '0'
        mov [residuo], ah

        imprimir mcociente, len_mcociente
        imprimir cociente, 1
        imprimir new_line, 1
        imprimir mresiduo, len_mresiduo
        imprimir residuo, 1
        imprimir new_line, 1
        
        mov eax, 1
        int 80h