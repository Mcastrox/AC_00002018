org 100h

;Promedio carnet 00002018

section .text
    mov AL, 0d
    mov [200h], AL
    mov AL, 0d
    mov [201h], AL
    mov AL, 0d
    mov [202h], AL
    mov AL, 0d
    mov [203h], AL
    mov AL, 2d
    mov [204h], AL
    mov AL, 0d
    mov [205h], AL
    mov AL, 1d
    mov [206h], AL
    mov AL, 8d
    mov [207h], AL

    XOR SI, SI 
    XOR DI, DI 
    XOR AX, AX 
    MOV AX, 0d 
    MOV BX, 0d 
    MOV CX, 8d 
    call iteracion
    call promedio
    call exit

promedio:
    MOV AX, BX
    MOV CX, 8d
    DIV CX;
    MOV [20Ah], AL
    ret
exit:
    int 20h
    
iteracion:
    ADD BX, [200h+SI]
    INC SI 
    LOOP iteracion 
    ret
    




