.8086
.model small
.stack 100h
.data

	saltoDeLinea db "", 0dh, 0ah, 24h
	nroAscii  	 db '000',0dh, 0ah, 24h

	
	public carga ; Recibe por BX el offset de la variable donde se dea guardar la cadena
	public reg2ascii; 
	public ascii2reg; 
	public largo ;Cuenta el largo de una cadena
	public contarcaracter
	public imprimir
	public imprimiralreves
	public quitarEspacios
	public salto ;Imprime un salto :D
	public borrarvariable ;Se manda el offset de la variable por si
	public carga_letras;Recibe por BX el offset de la variable donde se dea guardar la cadena
	public contar_vocales
.code
;---------------------CARGA------------------------------------------
; Recibe por BX el offset de la variable 

		carga proc

		push ax
		push bx

cargarcaracteres:
		mov ah, 1
		int 21h

		cmp al, 0dh
		je fincargacaracteres

		cmp byte ptr[bx], 255
		je fincargacaracteres

		mov byte ptr[bx], al
		inc bx
		jmp cargarcaracteres

fincargacaracteres:
		
		pop bx
		pop ax
		ret
		carga endp
;--------------------------------------------------------------------

;-------------------------Reg2ascii----------------------------------

		reg2ascii proc 
		;Recibe en BX el offset de la variable a donde guardar el ascii
		;Recibe en DL el numero a convertir, siempre el numero recibido tiene que ser mas chico que 256
    push ax
    push dx

	    xor ax,ax
	    mov al, dl          ; AL = número a convertir
	    mov cx, 10          ; divisor base decimal
	    add bx, 2           ; empieza por el dígito de las unidades

	    ; Unidades
	    xor ah, ah
	    div cl              ; AL = AL / 10 → AL=cociente, AH=resto
	    add ah, 30h         ; convierto a ASCII
	    mov [bx], ah        ; guardo carácter de unidades

	    ; Decenas
	    dec bx
	    xor ah, ah
	    div cl
	    add ah, 30h
	    mov [bx], ah

	    ; Centenas
	    dec bx
	    xor ah, ah
	    div cl
	    add ah, 30h
	    mov [bx], ah

    pop dx
    pop ax
    ret
		reg2ascii endp
;--------------------------------------------------------------------

;------------------------------Ascii2reg-----------------------------
		ascii2reg proc ;recibe el offset del numero por SI y lo duevuelve su valor por BL

		push ax
		push si
		push dx

		xor ah,ah
		mov dh, byte ptr[si]
		sub dh, 30h
		mov al, dh 
		mov dl, 100

		mul dl 
		add bl, al

		xor ah,ah
		mov dh, byte ptr[si+1]
		sub dh, 30h
		mov al, dh 
		mov dl, 10
		
		mul dl 
		add bl, al

		mov dh, byte ptr[si+2]
		sub dh, 30h
		add bl, dh 

		pop dx
		pop si
		pop ax

		ret

		ascii2reg endp

;--------------------------------------------------------------------

;------------------------ContarLargodelaCadena-----------------------
		largo proc ;Recibe en bx el offset de una variable y devuelve la cantidad de caracteres que tiene 
				   ;(hasta encontrar un 24h) por cl
		xor cx,cx
		push bx
		

tamanio:
		cmp byte ptr[bx], 24h 
		je fin2
		inc bx
		inc cl
		jmp tamanio

fin2:
 		
 		pop bx
 		ret

 		largo endp
;--------------------------------------------------------------------

;---------------------contarcaracter---------------------------------


		contarcaracter proc; recibe la direccion de una variable por dx y un caracter para contar en al, 
						   ; devuelve la cantidad de veces que aparece por dl

			push bx
			push ax

			mov bx, dx

	recorrer:
			cmp byte ptr[bx], 24h 
			je finRecorrer 
			cmp byte ptr[bx], al 
			je cont 
			inc bx 
			jmp recorrer 

	cont:
			inc dl 
			inc bx 
			jmp recorrer 

	finRecorrer:

		pop ax
		pop bx

		ret

		contarcaracter endp

;--------------------------------------------------------------------

;---------------------imprimir---------------------------------

		imprimir proc;Recibe en bx el offset de una variable y la imprime caracter a caracter hasta encontrar un 24h
		push ax
		push dx
		push bx

proceso:
		cmp byte ptr[bx], 24h
		je finProc
		mov ah, 2
		mov dl, byte ptr[bx]
		int 21h
		inc bx
		jmp proceso 

finProc:
		pop bx
		pop dx
		pop ax
		ret
		imprimir endp

;--------------------------------------------------------------------

;---------------------Imprimir al reves-------------------------------

		imprimiralreves proc ; recibe el offset de la variable por BX y El largo de la cadena po CX

		push bx
		push cx

		add bx, cx
		dec bx

		printa:	

		mov ah, 2
		mov dl, byte ptr[bx]
		int 21h 
		dec bx

loop printa

		pop cx
		pop bx

		ret

		imprimiralreves endp

;---------------------------------------------------------------------

;--------------------Imprimir al reves--------------------------------

		borrarvariable proc
	push ax
    push si
    mov si, dx

loop_llena:
    mov al, [si]
    cmp al, '$'
    je fin
    mov byte ptr [si], '$'
    inc si
    jmp loop_llena

fin:
    pop si
    pop ax
    ret

		borrarvariable endp 
;---------------------------------------------------------------------
;------------------Quitar Espacios -----------------------------------

quitarEspacios proc
    push ax
    push si
    push di

    mov si, dx
    mov di, dx

loop_q:
    mov al, [si]
    cmp al, '$'
    je listo
    cmp al, ' '
    je skip
    mov [di], al
    inc di
skip:
    inc si
    jmp loop_q

listo:
 

    pop di
    pop si
    pop ax
    ret
quitarEspacios endp
;-----------------------------------------------------------------
;-----------------Salto de linea ----------------------------------
salto proc ;Simplemente imprime un salto de línea (está por si lo necesitás)
    push ax
    push dx

    mov ah, 9
    mov dx, offset saltoDeLinea
    int 21h

    pop dx
    pop ax
    ret
salto endp
;-------------------------------------------------------------------------
;------------------- CARGA LETRAS ----------------------------------------
carga_letras proc
	push ax
	push bx

	ingreso:
		mov ah,1
		int 21h

		cmp al, 0dh
		je fin_ingreso

		cmp bx, 255
		je fin_ingreso

		cmp al, 'a'
		jae casi_min

		cmp al,'A'
		jae casi_may

		cmp al, ' '
		je si_letras

		jmp ingreso

casi_may:
		cmp al, 'Z'
		jbe si_letras
		jmp ingreso

casi_min:
		cmp al, 'z'
		jbe si_letras
		jmp ingreso


si_letras:
		mov [bx], al 
		inc bx
		jmp ingreso 

fin_ingreso:

	pop bx
	pop ax

	ret
carga_letras endp
;-----------------------------------------------------------------------------------------------------
;--------------------------------- CUENTA LAS VOCALES -----------------------------------------------

contar_vocales proc

	push bx

	xor cx, cx
contar:


	cmp byte ptr[bx], '$'
	je fin_conteo
	cmp byte ptr[bx], 'a'
	je es_vocal
	cmp byte ptr[bx], 'e'
	je es_vocal
	cmp byte ptr[bx], 'i'
	je es_vocal
	cmp byte ptr[bx], 'o'
	je es_vocal
	cmp byte ptr[bx], 'u'
	je es_vocal

	cmp byte ptr[bx], 'A'
	je es_vocal
	cmp byte ptr[bx], 'E'
	je es_vocal
	cmp byte ptr[bx], 'I'
	je es_vocal
	cmp byte ptr[bx], 'O'
	je es_vocal
	cmp byte ptr[bx], 'U'
	je es_vocal

	inc bx
	jmp contar


es_vocal:
	inc cl
	inc bx
	jmp contar

fin_conteo:

	pop bx

	ret 

contar_vocales endp
end