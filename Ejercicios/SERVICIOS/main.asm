.code
    extern carga:proc

    main proc
    mov ax, @data
    mov ds, ax

    ; RECIBE EN AH EL SERVICIO A UTILIZAR 1 NROS Y BYTE (0-9 3 DIGITOS)
    ;                                       2 TEXTO EN BASE A CARACTERES DEFINIDOS EN VARIABLE
    ;                                       3 TEXTO LIBRE (TODOS LOS CARACTERESPOSIBLES)
    ;

    ; RECIBE EN AL LA CANTIDAD DE DIGITOS, SI ESTA EN 0 LA CARGA TERMINA EN 0DH,
    ; DEVUELVE EN UN OFFSET LA VARIABLE LEIDA QUE DEBE SER PASADDO EN DX

    lea dx, nro
    mov ah, 1
    mov al, 3
    call carga

    lea dx, texto
    mov ah, 2
    mov al, 3
    call carga
    
    mov ah, 9
    mov dx, offset nro
    int 21h
    
    mov ah 9
    mov dx, offset texto
    int 21h
    ;minimo para aprobar el parcial, funciones que van y vuelven
