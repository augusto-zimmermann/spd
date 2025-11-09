.8086
.model small
.stack 100h
.data
    caracteres  db "" ; todos los putos caracteres
                db
                db '0', '1', 01h ; inventamos un caracter de finalizacion
.code
public carga
    ; RECIBE EN AH EL SERVICIO A UTILIZAR 1 NROS Y BYTE (0-9 3 DIGITOS)
    ;                                       2 TEXTO EN BASE A CARACTERES DEFINIDOS EN VARIABLE
    ;                                       3 TEXTO LIBRE (TODOS LOS CARACTERESPOSIBLES)
    ;

    ; RECIBE EN AL LA CANTIDAD DE DIGITOS, SI ESTA EN 0 LA CARGA TERMINA EN 0DH,
    ; DEVUELVE EN UN OFFSET LA VARIABLE LEIDA QUE DEBE SER PASADDO EN DX
    
    carga proc
    push bx
    
    mov bx, dx
    
    
    cmp ah, 1
    je nros
    cmp ah, 2
    je textoFijo
    cmp ah, 3
    je textoLibre
    jmp fin

; SERIVICIO 1 LEO NUMEROS

    leeNro:
        add dx, 3 ; cuando le sumas 3 al offset, va 3 bytes adelante
    nros:
        cmp dx, bx
        je finOk
        mov ah, 8
        int 21h
        cmp al, 30h
        jae casiNro
    jmp nros
    casiNro:
        cmp al, 39h
        jbe esNro
    jmp nros
    esNro:
    push dx
    push ax

    mov ah, 2
    mov dl, al
    int 21h
    pop dx
    mov byte ptr [bx], al
    inc bx
    jmp nros

;SERVICIO 2 LEO TEXTO

textoFijo:
    mov si, offset caracteres
cargoNuevo:
    mov ah, 1
    int 21h
    cmp al, 0dh
    je finCarga
comparoNuevo:
    cmp al, [si]
    je guardo
    cmp [si], 01h ; caracter finalizacion
    je textofijo
    inc si
jmp comparoNuevo

    guardo:
        push dx
        push ax

        mov ah, 2
        mov dl, al
        int 21h

        pop ax
        pop dx
        mov [bx], al
        inc bx
    jmp textoFijo
textoLibre:
fin:
    mov ah, 99 ; para comparar ah con 99, si es asi da error
finCarga:
finOk:
    pop dx    
    pop bx
    ret

    carga endp
; pop y push generan muchos problemas, ponelos primero

cuentac proc
    ; RECIBE EN BX EL OFFESET DE UNA VARIABLE
    ; DEUVLE EN CX LA CANTIDAD DE CARACTERES QUE TIENE
push bx
    mov cx, 0
cuenta:
    cmp byte ptr [bx], 01h
    je finCuenta
    inc cx
    inc bx
jmp cuenta
finCuenta:
pop bx
ret
cuentac endp