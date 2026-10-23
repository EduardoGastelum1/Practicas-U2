; Materia: Lenguajes de Interfaz ; Alumno: Eduardo Eliu Gastelum Gurrola ; Horario: 10:00-11:00 ; Docente: Dr. José Luis Medina Jiménez ; Práctica: 5.1 Repetir hasta que el usuario ingrese cero ; Descripción: Repetir hasta que el usuario ingrese cero

INCLUDE Irvine32.inc

.data
	Mensaje1 BYTE "TECLEA EL NUMERO 0 : ", 0       ; Mensaje inicial para pedir el número al usuario
	Mensaje2 BYTE "ERROR TECLEA EL NUMERO 0 : ", 0  ; Mensaje de error si el usuario ingresa un número diferente de cero
	Num      SDWORD ?                              ; Variable para almacenar el valor numérico ingresado

.code
main PROC
	; --- PRIMERA LECTURA ---
	mov edx, OFFSET Mensaje1  ; Cargamos la dirección del mensaje inicial
	call WriteString          ; Mostramos el mensaje en la consola
	call ReadInt              ; Leemos el número entero ingresado por el usuario (se almacena en EAX)
	mov Num, eax              ; Guardamos el valor leído en nuestra variable Num
	call Crlf                 ; Salto de línea

	; Evaluamos si el número ingresado es igual a cero
	cmp eax, 0
	jne ciclo                 ; Si no es cero (Jump Not Equal), salta al bloque del ciclo para pedirlo nuevamente

	exit                      ; Si el usuario ingresó cero a la primera, el programa termina correctamente

ciclo:
	; --- BUCLE DE REPETICIÓN HASTA INGRESAR CERO ---
	mov edx, OFFSET Mensaje2  ; Cargamos el mensaje de error/repetición
	call WriteString          ; Mostramos el mensaje en pantalla
	call ReadInt              ; Volvemos a leer el número ingresado por el usuario
	mov Num, eax              ; Actualizamos la variable Num con el nuevo valor
	call Crlf                 ; Salto de línea

	cmp eax, 0
	jne ciclo                 ; Si sigue sin ser cero, se repite el ciclo; si es cero, continúa y sale

	exit                      ; Finaliza la ejecución del programa
main ENDP
END main
