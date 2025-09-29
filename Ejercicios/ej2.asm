; Ingrese un texto e imprímalo con las vocales en mayusculas
.8086
.model small
.stack 100h
.data
	cartelardo 	db "Ingresa un texto m a s t e r, yo te convierto vocales a mayusculas", 0dh, 0ah, 24h
	textito 	db 255 dup (24h), 0dh, 0ah, 24h
.code
	main proc
		mov ax, @data
		mov ds, ax
		
		mov ah, 9
		mov dx, offset cartelardo
		int 21

		mov bx, 0
		carga:
			cmp bx, 256
	    	je finCarga
			
			mov ah, 1 ; servicio 1 de la int 21 (lee el teclado)
			int 21h

			cmp al, 0dh
			je finCarga

			mov textito[bx], al
			inc bx

			jmp carga
		finCarga:
			mov bx, 0
		comparador:
			cmp textito[bx], 24h
			je finProceso

			cmp textito[bx], 'a'
			je conversor
			
			cmp textito[bx], 'e'
			je conversor						
			
			cmp textito[bx], 'i'
			je conversor
			
			cmp textito[bx], 'o'
			je conversor
			
			cmp textito[bx], 'u'
			je conversor

			inc bx

			jmp comparador
		conversor:
			sub textito[bx], 20h
			inc bx
			
			jmp comparador
		finProceso:
			mov ah, 9
			mov dx, offset textito
			int 21h
		finPrograma:
			mov ax, 4c00h
			int 21h
	endp
end