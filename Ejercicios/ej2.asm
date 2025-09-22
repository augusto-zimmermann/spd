.8086
.model small
.stack 100h
.data
	
	texto db 255 dup (24h), 0dh,0ah,24h
	texto2 db 255 dup (24h), 0dh,0ah,24h


.code
	main procmov texto
		mov ax, @data
		mov ds, ax

; COMIENZA CAJA DE CARGA, FUNCIONA EN CUALQUIER LADO
		mov bx, 0
	
	carga:
		mov ah, 1
		int 21h
		cmp al, 0dh
		je finCarga
		mov texto[bx], al
		cmp al, 'a'
		je cambiaMay			; je = JUMP EQUAL
		cmp al, 'e'
		je cambiaMay
		cmp al, 'i'
		je cambiaMay
		cmp al, 'o'
		je cambiaMay
		cmp al, 'u'
		je cambiaMay
	
	guardoValor:
		mov texto2[bx], al
		inc bx
	
	jmp carga
	
	cambiaMay:
		sub al, 20h
		mov texto2[bx], al
		jmp guardoValor
	
	finCarga:
; FIN CAJA CARGA
	
		mov ax, 4c00h
		int 21h
	main endp
end main	