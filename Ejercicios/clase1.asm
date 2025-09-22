.8086
.model small
.stack 100h
.data
	texto db "hola chicos",0dh,0ah,24h
	
.code
	main proc

		mov ax, @data
		mov ds, ax

		mov ah, 9 ; LLAMO AL SERVICIO DE IMPRESION
		mov dx, offset texto ; muevo al registro DX la dirección de mi variable
		int 21h

		mov ah, 4ch ; LLAMO AL SERVICIO PARA TERMINAR
		mov al, 00h ; LE DEVUELVO 00 PORQUE TERMINE BIEN! 
		int 21h


	main endp
end


ACA PONGO LO QUE QUIERO QUE NO LO VA A COMPILAR!!! NO ES UN ERROR