; Materia: Lenguajes de Interfaz ; Alumno: Eduardo Eliu Gastelum Gurrola ; Horario: 10:00-11:00 ; Docente: Dr. José Luis Medina Jiménez ; Práctica: 2. Captura y desplegado de mensajes ; Descripción: Captura y desplegado de mensajes

INCLUDE Irvine32.inc

.data
	mensajeBienvenida BYTE "Que quieres escribir?",0  ; Mensaje que se mostrará al usuario
	palabra BYTE 20 DUP(0)                          ; Buffer de 20 bytes para almacenar la cadena ingresada

.code
main PROC
	; 1. Cargar y mostrar el mensaje de bienvenida en pantalla
	mov edx,OFFSET mensajeBienvenida
	call WriteString

	; 2. Preparar los registros para leer la cadena desde el teclado
	mov edx,OFFSET palabra
	mov ecx, SIZEOF palabra

	; 3. Leer la cadena ingresada por el usuario
	call ReadString
	call Crlf

	; 4. Volver a cargar la variable para desplegar el texto capturado
	mov edx,OFFSET palabra
	call WriteString
	call Crlf
	
	exit
main ENDP

END main
