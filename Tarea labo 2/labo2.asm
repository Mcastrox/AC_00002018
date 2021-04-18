org 100h


;Escribir cuatro iniciales de su nombre completo 
;empezando en la dirección de memoria 200h
mov AL, 'J'
mov [200h], AL
mov AL, 'M'
mov [201h], AL
mov AL, 'C'
mov [202h], AL
mov AL, 'A'
mov [203h], AL

;Luego, mover a los siguientes registros los códigos 
;ASCII de los caracteres guardados en 200h


;1B
mov AX, [200h]

;2B

mov BX, [201h]
mov CX, BX

;3B
mov BX, 200h
mov SI, 2h
mov DX, DS:[BX+SI]
;4B

mov SI, 3h
mov DI, DS:[200h+SI]
int 20h