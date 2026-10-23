; Materia: Lenguajes de Interfaz ; Alumno: Eduardo Eliu Gastelum Gurrola ; Horario: 10:00-11:00 ; Docente: Dr. José Luis Medina Jiménez ; Práctica: 3. Comparación y prueba ; Descripción: Comparación y prueba

INCLUDE Irvine32.inc
.data
	msgIguales BYTE "Los valores son iguales",0       ; Mensaje si la comparación resulta igual
	msgDiferentes BYTE "Los valores son diferentes",0 ; Mensaje si la comparación resulta diferente

.code
main PROC
	mov eax,10      ; Asignamos el valor 10 al registro eax
	mov ebx,10      ; Asignamos el valor 10 al registro ebx

	cmp eax,ebx     ; Comparamos eax con ebx (se enciende la bandera Zf=1 si son iguales)

	je iguales      ; Si la bandera de igualdad está activa (Jump if Equal), salta a 'iguales'

	; Si no son iguales, continúa aquí:
	mov edx, OFFSET msgDiferentes
	call WriteString    ; Muestra en pantalla que son diferentes

	jmp fin             ; Salta al final del programa

iguales:
	mov edx,OFFSET msgIguales
	call WriteString    ; Muestra en pantalla que son iguales

fin:
	call Crlf           ; Salto de línea final
	exit                ; Termina el programa
main ENDP

END main
