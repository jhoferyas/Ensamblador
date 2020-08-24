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

        asterisco db '*'

        new_line db "", 10

section .bss
    numero resb 1

section .text
        global _start

_start:
      
    imprimir nombres, len_nombres
    imprimir fecha, len_fecha
    imprimir curso, len_curso

    mov ecx, 8
	mov ebx, 1
l1:
	
	push rcx		;se envia la referencia de rcx a pila
	mov ebx, ecx
	push rbx		;Se decrementa en 2 el valor de SP y transfiere el operando del contenido fuente a rbx. 
	imprimir new_line,1						
	
	pop rbx		
	mov ecx, ebx
	push rbx
	
l2:
	push rcx		;se envia la referencia de rcx a pila

	imprimir asterisco, 1

	pop rcx
	loop l2			
	pop rcx
	pop rbx

	loop l1			; en este instante se decrementa cx en 1

	imprimir new_line, 1
	
	mov eax, 1  
	int 80h



