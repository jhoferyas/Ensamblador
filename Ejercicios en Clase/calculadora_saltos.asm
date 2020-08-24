section .data
	msg1		db		10,'-Calculadora-',10,0
	lmsg1		equ		$ - msg1

	msg2		db		10,'Numero 1: ',0
	lmsg2		equ		$ - msg2

	msg3		db		'Numero 2: ',0
	lmsg3		equ		$ - msg3

    msg4		db		'1.Sumar ',10,0
	lmsg4		equ		$ - msg4

    msg5		db		'2.Restar ',10,0
	lmsg5		equ		$ - msg5

    msg6		db		'3.Multiplicar ',10,0
	lmsg6		equ		$ - msg6

    msg7		db		'4.Dividir ',10,0
	lmsg7		equ		$ - msg7

	msg8		db		10,'5.Salir: ',10,0
	lmsg8		equ		$ - msg8

    msg9		db		10,'Resultado: ',0
	lmsg9		equ		$ - msg9

	msg10		db		10,'Opcion Invalida',10,0
	lmsg10		equ		$ - msg10

	msg11		db		10,'Seleccione la opcion:  ',0
	lmsg11		equ		$ - msg11

	nlinea		db		10,10,0
	lnlinea		equ		$ - nlinea

section .bss
    
    opcion:     resb    2
  	num1:		resb	2
	num2:		resb 	2
	resultado:	resb 	2
section .text
 	global _start
_start:

;********************** Mensaje o encabezado de ejercicio************
	; Imprimimos en pantalla el mensaje 1
	mov eax, 4
	mov ebx, 1
	mov ecx, msg1
	mov edx, lmsg1
	int 80h

    ;**********************Mensaje del primer numero ********************
	; Imprimimos en pantalla el mensaje 2
	mov eax, 4
	mov ebx, 1
	mov ecx, msg2
	mov edx, lmsg2
	int 80h
	; Obtenemos el numero 1
	mov eax, 3
	mov ebx, 0
	mov ecx, num1
	mov edx, 2
	int 80h
	; Imprimimos en pantalla el mensaje 3
	mov eax, 4
	mov ebx, 1
	mov ecx, msg3
	mov edx, lmsg3
	int 80h
	; Obtenemos el numero 2
	mov eax, 3
	mov ebx, 0
	mov ecx, num2
	mov edx, 2
	int 80h


;******************** Mensajes del menu**********************
;********************Mensaje de Suma****************
mov eax, 4
mov ebx, 1
mov ecx, msg4
mov edx,lmsg4
int 80h
;********************Mensaje de Resta****************
mov eax, 4
mov ebx, 1
mov ecx, msg5
mov edx,lmsg5
int 80h
;********************Mensaje de Multiplicacion****************
mov eax, 4
mov ebx, 1
mov ecx, msg6
mov edx,lmsg6
int 80h
;********************Mensaje de Division****************
mov eax, 4
mov ebx, 1
mov ecx, msg7
mov edx,lmsg7
int 80h
;********************Mensaje de Salir****************
mov eax, 4
mov ebx, 1
mov ecx, msg8
mov edx,lmsg8
int 80h

;**************************** Selecciona la opcion ************************
mov eax, 4
mov ebx, 1
mov ecx, msg11
mov edx, lmsg11
int 80h

mov eax, 3
mov ebx, 0
mov ecx, num1
mov edx, 2
int 80h

mov ah,[opcion]
sub ah, '0'

cmp ah, 1
JE sumar

cmp ah, 2
JE restar

cmp ah, 3
JE multiplicar

cmp ah, 4
JE dividir

cmp ah, 5
JE salir

; Si el valor ingresado no cumple con ninguna de las condiciones anteriores entonces mostramos un mensaje de error y finalizamos
; la ejecucion del programa
mov eax, 4
mov ebx, 1
mov ecx, msg10
mov edx, lmsg10
int 80h

sumar:
	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]
	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'
	; Sumamos el registro AL y BL
	add al, bl
    ;	aaa
	; Convertimos el resultado de la suma de decimal a ascii
	add al, '0'
	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], al
	; Imprimimos en pantalla el mensaje 9
	mov eax, 4
	mov ebx, 1
	mov ecx, msg9
	mov edx, lmsg9
	int 80h
	; Imprimimos en pantalla el resultado
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 2
	int 80h

restar:
	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]
	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'
	; Restamos el registro AL y BL
	sub al, bl
	; Convertimos el resultado de la resta de decimal a ascii
	add al, '0'
	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], al
	; Imprimimos en pantalla el mensaje 9
	mov eax, 4
	mov ebx, 1
	mov ecx, msg9
	mov edx, lmsg9
	int 80h
	; Imprimimos en pantalla el resultado
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 1
	int 80h

multiplicar:
	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]
	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'
	; Multiplicamos. AX = AL X BL
	mul bl
	; Convertimos el resultado de la resta de decimal a ascii
	add ax, '0'
	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], ax
	; Imprimimos en pantalla el mensaje 9
	mov eax, 4
	mov ebx, 1
	mov ecx, msg9
	mov edx, lmsg9
	int 80h
	; Imprimimos en pantalla el resultado
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 1
	int 80h

dividir:
	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]
	; Igualamos a cero los registros DX y AH
	mov dx, 0
	mov ah, 0
	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'
	; Division. AL = AX / BL. AX = AH:AL
	div bl
	; Convertimos el resultado de la resta de decimal a ascii
	add ax, '0'
	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], ax
	; Print on screen the message 9
	mov eax, 4
	mov ebx, 1
	mov ecx, msg9
	mov edx, lmsg9
	int 80h
	; Imprimimos en pantalla el resultado
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 1
	int 80h

salir:
	; Imprimimos en pantalla dos nuevas lineas
	mov eax, 4
	mov ebx, 1
	mov ecx, nlinea
	mov edx, lnlinea
	int 80h
	; Finalizamos el programa
	mov eax, 1
	mov ebx, 0
	int 80h