%macro imprimir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data

		nombres DB "Estudiantes:", 10 ;
        len_nombres EQU  $ - nombres ;

		jhon DB "  *Jhon Faver Henao Saldarriaga",10
		len_jhon EQU $ - jhon

		cesar DB "  *Cesar Augusto Santin Pinzon",10
		len_cesar EQU $ - cesar

		yannela DB "  *Yannela Mishelle Castro Valarezo",10
		len_yannela EQU $ - yannela

		anthonny DB "  *Anthonny Paul Torres Carpio",10
		len_anthonny EQU $ - anthonny
        
        curso DB "Curso: 6to 'A'      Grupo: 9", 10 ;
        len_curso EQU  $ - curso ;

		inicio DB "-------------- INICIO -------------", 10 ;
        len_inicio EQU  $ - inicio ;

		asterisco db '*'
		;leng equ $-asterisco
		
		nueva_linea db 10,'',10
		len_nueva equ $-nueva_linea

section .text
		global _start

_start:

imprimir nombres, len_nombres
imprimir jhon, len_jhon
imprimir cesar, len_cesar
imprimir yannela, len_yannela
imprimir anthonny, len_anthonny
imprimir curso, len_curso
imprimir nueva_linea, len_nueva
imprimir inicio, len_inicio

	mov ecx, 10
	mov ebx, 10
l1:
	
	push rcx		;se envia la referencia de rcx a pila
	mov ebx, ecx
	push rbx		;Se decrementa en 2 el valor de SP y transfiere el operando del contenido fuente a rbx. 					
	call linea
	pop rbx		
	mov ecx, ebx
	push rbx
	
l2:
	push rcx		;se envia la referencia de rcx a pila	
	call asteriscoc
	pop rcx
	loop l2			
	;***************************************
	pop rcx
	pop rbx

	loop l1			; en este instante se decrementa cx en 1

	mov eax, 4
	mov ebx, 1
	mov ecx, nueva_linea
	mov edx, 1
	int 80h
	
	mov eax, 1
	int 80h

asteriscoc:
	mov eax, 4
	mov ebx, 1
	mov ecx, asterisco
	mov edx, 1
	int 80h
	ret


linea:
	mov eax, 4
	mov ebx, 1
	mov ecx, nueva_linea
	mov edx, 1
	int 80h
	ret
	


