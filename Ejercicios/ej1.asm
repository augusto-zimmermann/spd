;Ingrese un texto de hasta 255 caracteres terminados por el signo $.Imprima el 
;texto modificando la letra a por la letra x. Imprima el texto modificado y luego 
;el texto original.

.8086
.model small
.stack 100h
.data
    texto       db 255 dup (24h), 0dh, 0ah, 24h
    textoMod    db 255 dup (24h), 0dh, 0ah, 24h
    arty        db "Este es un software que cambia A por X", 0dh, 0ah
			    db "Ingrese un texto: ", 0dh, 0ah, 24h
    salto       db 0dh,0ah,24h
.code
    main proc
        mov ax, @data
        mov ds, ax

        mov ah, 9                   ; LLAMO AL SERVICIO 9 DE IMPRESION DE LA INT 21
        mov dx, offset arty         ; offset obtiene direccion de la variable
        int 21h
        
        mov bx, 0                   ; DIR+IDX
    Carga:
        cmp bx, 256
	    je finCarga
        
        mov ah, 1                   ;LLAMO AL SERVICIO 1 PARA LECTURA DE CARACTER POR TECLADO 
        int 21h
        
        cmp al, 0dh                 ; Compara el registro AL con (enter)
        je finCarga
        
        mov texto[bx], al           ; ojo con el elusivo AL
        mov textoMod[bx], al
        inc bx                      ; es lo mismo que add bx, 1
        
        jmp Carga
    finCarga:
        mov bx, 0
    comparador:
        cmp textoMod[bx], 24h
        je finProceso

        cmp textoMod[bx], 'A'
        je conversor0

        cmp textoMod[bx], 'a'
        je conversor1

        inc bx
        jmp comparador
    conversor0:
        mov textoMod[bx], 'X'
        inc bx

        jmp comparador
    conversor1:
        mov textoMod[bx], 'x'
        inc bx

        jmp comparador
    finProceso:
        mov ah, 9
        mov dx, offset textoMod
        int 21h

        mov ah, 9
        mov dx, offset salto
        int 21h

        mov ah, 9
        mov dx, offset texto
        int 21h
    finPrograma:
        mov ax, 4c00h
        int 21h
    endp
end
