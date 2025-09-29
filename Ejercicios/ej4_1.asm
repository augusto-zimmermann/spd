; Ingrese un texto de hasta 5 caracteres e imprima en forma de espejo.
.8086
.model small
.stack 100h
.data
    cartelito       db "Ingresa 5 caracteres, dale que no tengo todo el dia", 0ah, 0dh, 24h
    textoIngresado  db 5 dup (24h), 0ah, 0dh, 24h
    textoInvertido  db 5 dup (24h), 0ah, 0dh, 24h
.code
    main proc
        mov ax, @data
        mov ds, ax

        mov ah, 9
        lea dx, cartelito
        int 21h

        mov bx, 0
        carga:
            mov ah, 1
            int 21h     ; CUIDADO CON LA H

            cmp al, 0dh
            je finCarga

            mov caracteres[bx], al
            inc bx ; ya tiene el largo del texto

            jmp carga
        finCarga:
            mov si, 0
            mov cx, bx

            dec bx ; es lo mismo que sub bx, 1. Ahora bx esta apuntando a la A
        invertido:
            mov al, textoIngresado[bx]
            mov textoInvertido[si], al
            inc si
            dec bx
            
            loop invertido ; Va a repetir el codigo mientras que CX != 0
        mov ah, 9
        lea dx, textoInvertido
        int 21h
        finPrograma:
            mov ax, 4c00h
            int 21h
    endp
end