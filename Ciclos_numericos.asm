; Materia: Lenguajes de Interfaz ; Alumno: Eduardo Eliu Gastelum Gurrola ; Horario: 10:00-11:00 ; Docente: Dr. José Luis Medina Jiménez ; Práctica: 1. Ciclos numéricos ; Descripción: Ciclos numéricos

INCLUDE Irvine32.inc
	
.code
main PROC
	mov ebx,1  ; Valor inicial para el ciclo while
ciclo:
	cmp ebx,100 ; Condicion de salida para el ciclo while

	jg fin ; Salto a la etiqueta fin una vez se cumpla la condicion de  salida

	mov eax,ebx
	call WriteDec ; Se imprime el valor actual de ebx en la consola
	call Crlf ; Salto de linea

	inc ebx ; Realiza un incremento de +1 en el registro señalado (ebx)

	jmp ciclo


fin:
	exit
main ENDP
END main