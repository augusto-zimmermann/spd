.8086
.model small
.stack 100h
.data
    menu db "Ingrese un texto de hasta 255 caracteres",0dh,0ah,24h

    textoIngresado db 255 dup (24h),0dh,0ah,24h
.code
    main proc
        mov ax, @data
        mov ds, ax

        mov ah, 9
        mov dx, offset menu
        int 21h

        mov bx, 0

        carga:
            mov ah, 1
            int 21h

            cmp al, 0dh
            je finCarga

            mov textoIngresado[bx], al
            inc bx
        jmp carga

        finCarga:
            mov bx, 0
        comparador:
            cmp textoIngresado[bx], 24h
            je finComparador

            cmp textoIngresado[bx], 'a'
            je conversor

            cmp textoIngresado[bx], 'e'
            je conversor

            cmp textoIngresado[bx], 'i'
            je conversor

            cmp textoIngresado[bx], 'o'
            je conversor

            cmp textoIngresado[bx], 'u'
            je conversor

            inc bx
        jmp comparador

        conversor:
            sub textoIngresado[bx], 20h ; restar 20h lo vuelve mayuscula, revisar tabla ASCII
            inc bx
        jmp comparador



        finComparador:
            mov ah, 9
            mov dx, offset textoIngresado
            int 21h
        finPrograma:
            mov ax, 4c00h
            int 21h
    main endp
end