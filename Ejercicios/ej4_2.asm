.8086
.model small
.stack 100h
.data
    cartelovich db "Ingrese un texto de hasta 4 caracteres",0dh,0ah,24h

    textoIngresado db 255 dup (24h),0dh,0ah,24h
    textoInvertido db 255 dup (24h),0dh,0ah,24h

    salto db 0dh,0ah,24h

.code
    main proc
        mov ax, @data
        mov ds, ax

        mov ah, 9
        lea dx, cartelovich
        int 21h

        mov bx, 0
        carga: 
            mov ah, 1             ; Hola
            int 21h

            cmp bx, 4             ; 1ra letra ---> bx = 0, 5 letra ---> bx = 4
            je finCarga

            cmp al, 0dh         ;HOLA($)$$$$$$$$$$$$$$
            je finCarga

            mov textoIngresado[bx], al
            inc bx                 ; Ya tiene el largo del texto
        jmp carga

        finCarga:
            mov si, 0
            mov cx, bx
            dec bx                 ; sub bx, 1. Ahora bx está apuntando a la A
        invertido:
            mov al, textoIngresado[bx] ;HOL(A)
            mov textoInvertido[si], al ;(A)LOH
            inc si
            dec bx
        loop invertido             ; Va a repetir el codigo mientras que CX != 0

        mov ah, 9
        lea dx, salto
        int 21h

        mov ah, 9
        lea dx, textoInvertido
        int 21h
        finPrograma:
            mov ax, 4c00h
            int 21h
    main endp
end
