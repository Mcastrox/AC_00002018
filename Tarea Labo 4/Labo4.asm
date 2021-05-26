org     100h
        section .text
        mov     BP, arrByte     ; BP  equivale a un  puntero hacia arrByte
        xor SI, SI          ; SI = 0
        XOR AX,AX
        call    StoreArr        ; call hacia la  función
        int     20h

 section .data
 arrByte db      01,02,03,04,05,06,07,08,09,10    ; arreglo de numeros byte empezando en la direccion de dirección arrByte
 
 
StoreArr:
while:
        mov CL , 2d
        mov BL,0d
        MOV AL, [BP+SI]
        div CL
        cmp AH, BL
        jz NumPares
        ja NumImpares
end:    
        ret                     ; return to  MAIN        
NumPares:
        mov     BX, 300h 
        mov     AL, [BP+SI]     
        cmp     AL, 10d         
        mov     [BX+SI], AL     
        inc     SI              
        je      end             
        jmp     StoreArr           
NumImpares: 
        mov     BX, 320h        
        mov     AL, [BP+SI]     
        mov     [BX+SI], AL     
        inc     SI              
        jmp     StoreArr           