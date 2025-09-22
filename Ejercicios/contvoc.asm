;Ingrese un texto e imprima la cantidad de letras consonantes y de vocales utilizadas
.8086
.model small
.stack 100h

.data
 menu db "Ingrese un texto de hasta 256 caracteres.",0dh,0ah,24h
 vocales db 0
   consonantes db 0
 mensaje db "La cantidad de vocales es: "
   nroASCII db '000',0dh,0ah
 mensaje2 db "Y la cantidad de consonantes es: "
   nroASCII2 db '000',0dh,0ah,24h
   dataDiv db 100,10,1

   textoOriginal db 255 dup (24h),0dh,0ah,24h
   textoModificado db 255 dup (24h),0dh,0ah,24h

.code
   main proc
      mov ax, @data
      mov ds, ax

      mov ah, 9
      mov dx, offset menu
      int 21h

      ;Parte1: Analizar lo ingresado y separar entre el texto original y el texto que me conviene analizar
      mov bx, 0
      mov di, 0

      carga:
         mov ah, 1
         int 21h

         cmp al, 0dh
         je finCarga
         cmp al, 20h
         je esEspacio
         cmp al, 60h
         ja casiMinuscula

         mov textoOriginal[bx], al
         mov textoOriginal[di], al
       inc bx
         inc di
      jmp carga

      esEspacio:
         mov textoOriginal[bx], al
         inc bx
      jmp carga

      casiMinuscula:
         cmp al, 7bh
         jb esMinuscula

         mov textoOriginal[bx], al
         mov textoOriginal[di], al
         inc bx
         inc di
      jmp carga

      esMinuscula:
         mov textoOriginal[bx], al

         sub al, 20h

         mov textoModificado[di], al
         inc bx
         inc di
      jmp carga

      ;Fin Parte1
      ;Parte2: Contar vocales o consonantes
      finCarga:
         mov bx, 0
         mov di, 0
         mov si, 0
      
   
      comparador:
         cmp textoModificado[bx], 41h
         je esVocal

         cmp textoModificado[bx], 45h
         je esVocal

         cmp textoModificado[bx], 49h
         je esVocal

         cmp textoModificado[bx], 4fh
         je esVocal

         cmp textoModificado[bx], 55h
         je esVocal

         jmp casiConsonante

      esVocal:
         inc si
         inc bx
      jmp comparador

      casiConsonante:
         cmp textoModificado[bx], 41h
         jb noEsConsonante

         cmp textoModificado[bx], 5ah
         ja noEsConsonante

         jmp esConsonante

      noEsConsonante:
         inc bx
      jmp comparador

      esConsonante:
         inc di
         inc bx
      jmp comparador


      ;Fin Parte2
      ;Parte3: Mostrar los contadores

      mov ah, 0
      mov bx, 0
      mov cx, 3
      mov al, si ; ax toma el valor tambien (ej: 25)

      conversor:
         mov dl, dataDiv[bx]
         div dl ; ax / dl = cociente almacenado en al, residuo almacenado en ah
         add nroASCII[bx], al
         mov al, ah
         mov ah, 0
         inc bx
      loop conversor


      mov ah, 0
      mov bx, 0
      mov cx, 3
      mov al, di ; ax toma el valor tambien (ej: 25)

      conversor2:
         mov dl, dataDiv[bx]
         div dl ; ax / dl = cociente almacenado en al, residuo almacenado en ah
         add nroASCII2[bx], al
         mov al, ah
         mov ah, 0
         inc bx
      loop conversor2

     fin:

        mov ah, 9
        mov dx, offset mensaje
        int 21h

        mov ax, 4c00h
        int 21h
   main endp
end