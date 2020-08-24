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

    fecha DB "17-06-2020", 10 ;
    len_fecha EQU  $ - fecha ;
    
    resultado db 'El resultado de la suma es:'
    len_resultado equ $ - resultado

    resultador db 'El resultado de la resta es:'
    len_resultador equ $ - resultador

    resultadom db 'El resultado de la multiplicacion es:'
    len_resultadom equ $ - resultadom

    mcociente db 'El resultado de la division es: '
    len_mcociente equ $-mcociente

    mresiduo db 'El residuo de la division es: '
    len_mresiduo equ $-mresiduo

    new_line db "",10

section .bss
    suma resb 1 ;cuando no se nececita del enter
    resta resb 1 ;cuando no se nececita del enter
    multiplicacion resb 1 ;cuando no se nececita del enter
    cociente resb 1  ;cuando no se nececita del enter
    residuo resb 1  

section .text
    global _start

_start:
;***************************Nombres y Curso*************************
    imprimir nombres, len_nombres
    imprimir curso, len_curso
    imprimir fecha, len_fecha

;**************************** Suma *****************************
    mov eax,4
    mov ebx,2
    add eax, ebx ;eax = eax + ebx
    add eax, '0' ;Ajuste para que haga la suma en ascii

    mov [suma], eax
    imprimir resultado, len_resultado
    imprimir suma, 1
    imprimir new_line, 1

;************************************* resta ******************************
    mov eax,4
    mov ebx,2
    sub eax, ebx ;eax=eax-ebx
    add eax, '0' ;Ajuste para que haga la suma en ascii

    mov [resta], eax
    imprimir resultador, len_resultador
    imprimir resta, 1
    imprimir new_line,1

;**************************** Multiplicacion ***************************
    mov al,4
    mov bh,2
    mul bh ; eax = eax * ebx
    add al, '0' ;Ajuste para que haga la suma en ascii

    mov [multiplicacion], al
    imprimir resultadom, len_resultadom
    imprimir multiplicacion,1
    imprimir new_line,1

; ****************************** Division **************************
    mov al,5
    mov bh,2
    div bh ; ah = ah/bh
    add al, '0'
    mov [cociente], al
    add ah, '0'
    mov [residuo], ah

    imprimir mcociente, len_mcociente
    imprimir cociente,1
    imprimir new_line,1
    imprimir mresiduo, len_mresiduo
    imprimir residuo,1
    imprimir new_line,1

	;****************************salir del sistema******************
    mov eax, 1
    int 80h