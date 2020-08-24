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

    fecha DB "22-07-2020", 10 ;
    len_fecha EQU  $ - fecha ;
    
    asterisco db '*'

    new_line db "",10
    len_line EQU $ - new_line


section .text
    global _start

_start:
;********************** Datos *********************
    imprimir nombres, len_nombres
    imprimir curso, len_curso
    imprimir fecha, len_fecha
    imprimir new_line, len_line

 ;************************** imprimir****************
mov ax,9
        
saltar: 
    mov cx,9
    dec ax
    push ax
    jmp imprimira        

imprimira:
    dec cx
    push cx

    imprimir asterisco, 1

    pop cx
    cmp cx,0
    jnz imprimira

    imprimir new_line, 1

    pop ax
    cmp ax,0
    jnz saltar
        
salir:
    mov eax,1
    int 80h
