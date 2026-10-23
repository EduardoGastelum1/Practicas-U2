; Materia: Lenguajes de Interfaz ; Alumno: Eduardo Eliu Gastelum Gurrola ; Horario: 10:00-11:00 ; Docente: Dr. José Luis Medina Jiménez ; Práctica: 4.1 Mayor, menor o igual con entrada del usuario ; Descripción: Mayor, menor o igual con entrada del usuario

INCLUDE Irvine32.inc

.data
	mensaje1   BYTE "Teclea el primer numero : ",0  ; Mensaje para el primer número
	Num1       SDWORD ?                              ; Variable para almacenar el primer número
	mensaje2   BYTE "Teclea el segundo numero : ",0 ; Mensaje para el segundo número
	Num2       SDWORD ?                              ; Variable para almacenar el segundo número
	msgIguales BYTE "Los valores son iguales",0      ; Mensaje si son iguales
	msgMayor   BYTE "El valor 1 es mayor",0          ; Mensaje si Num1 es mayor
	msgMenor   BYTE "El valor 1 es menor",0          ; Mensaje si Num1 es menor

.code
main PROC
	; 1. Capturar el primer número
	mov edx, OFFSET mensaje1
	call WriteString
	call ReadInt
	mov Num1, eax
	call Crlf

	; 2. Capturar el segundo número
	mov edx, OFFSET mensaje2
	call WriteString
	call ReadInt
	mov Num2, eax
	call Crlf

	; 3. Comparar ambos números
	mov eax, Num1
	cmp eax, Num2

	je iguales  ; Si son iguales (ZF=1)
	jg mayor    ; Si el primero es mayor (SF=OF)
	jl menor    ; Si el primero es menor

iguales:
	mov edx, OFFSET msgIguales
	call WriteString
	jmp fin

mayor:
	mov edx, OFFSET msgMayor
	call WriteString
	jmp fin

menor:
	mov edx, OFFSET msgMenor
	call WriteString

fin:
	call Crlf
	exit
main ENDP
END main
