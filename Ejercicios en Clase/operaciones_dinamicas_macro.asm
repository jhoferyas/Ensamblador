;operacones dinamicas con macros

%macro escribir 2
        mov eax, 4
        mov ebx, 1
        mov ecx, %1
        mov edx, %2
        int 80h
%endmacro

%macro leer 2
	mov eax, 3
	mov ebx, 2
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

section .data

    nombres DB "Estudiante: Jhon Faver Henao Saldarriaga", 10 ;
    len_nombres EQU  $ - nombres ;
    
    curso DB "Curso: 6to 'A'", 10 ;
    len_curso EQU  $ - curso ;

    fecha DB "22-06-2020", 10 ;
    len_fecha EQU  $ - fecha ;
        
	mensajeS db "El resultado de la suma es: "
	lenS equ $-mensajeS
	
	mensajeR db "El resultado de la resta es: "
	lenR equ $-mensajeR
	
	mensajeM db "El resultado de la multiplicacion es: "
	lenM equ $-mensajeM
	
	mensajeD db "El resultado de la division es: "
	lenD equ $-mensajeD

    mresiduo db 'El residuo de la division es: '
    len_mresiduo equ $-mresiduo

	num1 db "Ingrese el primer numero: "
	len_num1 equ $-num1

	num2 db "Ingrese el segundo numero: "
	len_num2 equ $-num2

    new_line db "", 10

section .bss
    n1 resb 1
	n2 resb 1
	suma resb 1
	resta resb 1
	multiplicacion resb 1
	division resb 1
    residuo resb 1

section .text
        global _start

_start:
;**************Datos Personales**************
	escribir nombres, len_nombres
    escribir curso, len_curso
	escribir fecha, len_fecha

;************ Ingreso numero 1*******************
	escribir num1, len_num1
	leer n1, 2

;************ Ingreso numero 2******************
	escribir num2, len_num2
	leer n2, 2
;************ Proceso de suma*****************			
	mov ax, [n1]
	mov bx, [n2]
	sub ax,'0'
	sub bx,'0'
	add ax, bx
	add ax, '0'
	mov [suma], ax
	int 80h

;************ Imprime suma****************	
	escribir mensajeS, lenS
	escribir suma, 1
	escribir new_line, 1

;************ Proceso de resta*****************			
	mov ax, [n1]
	mov bx, [n2]
	sub ax,'0'
	sub bx,'0'
	sub ax, bx
	add ax, '0'
	mov [resta], ax
	int 80h

;************ Imprime resta****************	
	escribir mensajeR, lenR
	escribir resta, 1
	escribir new_line, 1

;************ Proceso de multiplicacion*****************			
	mov ax, [n1]
	mov bx, [n2]
	sub ax,'0'
	sub bx,'0'
	mul bx
	add ax, '0'
	mov [multiplicacion], ax
	int 80h

;************ Imprime multiplicacion****************	
	escribir mensajeM, lenM
	escribir multiplicacion, 1
	escribir new_line, 1

;************ Proceso de division*****************			
	mov al, [n1]
	mov bl, [n2]
	sub al,'0'
	sub bl,'0'
	div bl
	add al, '0'
	mov [division], al
        add ah, '0'
        mov [residuo], ah
	int 80h

;************ Imprime division****************	
	escribir mensajeD, lenD
	escribir division, 1
    escribir new_line, 1
    escribir mresiduo, len_mresiduo
    escribir residuo, 1
	escribir new_line, 1

;********************cierre*********
    mov eax, 1
    mov ebx, 0
    int 80h
