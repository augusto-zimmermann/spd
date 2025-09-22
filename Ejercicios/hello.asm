.model small
.stack 100h

.data
    msg db "Hello World!$" ; The message to display, terminated with '$'

.code
main proc
    ; Initialize data segment register
    mov ax, @data
    mov ds, ax

    ; Load the effective address of the message into DX
    lea dx, msg

    ; Set AH to 09h for DOS function to display a string
    mov ah, 09h

    ; Call DOS interrupt to display the string
    int 21h

    ; Set AH to 4Ch for DOS function to terminate the program
    mov ah, 4ch

    ; Call DOS interrupt to exit
    int 21h
main endp
end main