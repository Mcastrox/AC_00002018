
	org 	100h

	section	.text
    mov  DX, msg1	
    call CreateString 
    mov BP, clave      
    call ReadString    
    cmp DI, 0
    jg PrintWrong  
    call CreateString 
    call KeyWait  

    int 20h

Compare:   
	; input our password
    mov BH, [SI + clave]
    mov BL, [SI + clave2]
    INC SI
    cmp BH, BL
    je Welcome
    jnp Wrong    
    jmp while

Welcome:       
        xor DX, DX
	
	mov 	DX, msg2 ;Print welcome message
	
	jmp while 

Wrong:
        xor DI,DI
        inc DI		
	;
	jmp     while

PrintWrong:
        MOV DX, msg3           ;Here we clean our strings register file
        call CreateString 
        call KeyWait    
           

	section	.data
msg1 	db 	"Ingresar clave:$"
msg2 	db 	"BIENVENIDO$"
msg3	db 	"INCORRECTO$"
clave 	times 5 db  " " 	
clave2 	 db "mauri$"

; Functions

CreateString:
	mov 	AH, 09h
	int 	21h
	ret

KeyWait:
        mov     AH, 01h         
        int     21h
        ret

ReadString:
        xor     SI, SI    ; SI = 0
       ; xor     DI, DI    ; DI=0  

while:  
        call    KeyWait    
        cmp     AL, 0x0D        
        je      exit           
        mov     [BP+SI], AL   
        jmp     Compare         
exit:
	mov 	byte [BP+SI], "$"	; Add the "$" at the end of our string
        ret

