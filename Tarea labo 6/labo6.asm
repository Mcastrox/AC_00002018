org 	100h

	section	.text

call  Writemsg

 
;Print welcome message
Welcome:       
        MOV DX, 0
	
	mov 	DX, msg2 
	
	jmp while 

Wrong:
        MOV DI,0
        inc DI	
	jmp  while

PrintWrong:
        MOV DX, msg3           ;Here we clean our strings register file
        call CreateString 
        call KeyWait   
           
    	section	.data
msg2 	db 	"BIENVENIDO$"
msg3	db 	"INCORRECTO$"
pass1	times 5 db  " " 	
pass2 	 db "mauri$"

; Functions

CreateString:
	mov 	AH, 09h
	int 	21h
	ret

KeyWait:
        mov     AH, 01h         
        int     21h
        ret

  Writemsg:
    mov BP, pass1     
    call ReadString    
    cmp DI, 0
    jg PrintWrong  
    call CreateString 
    call KeyWait  

    int 20h  
    
ReadString:
      MOV SI,0

while:  
        call    KeyWait    
        cmp     AL, 0x0D        
        je      exit           
        mov     [BP+SI], AL   
         mov CL, [SI + pass1]
         mov BL, [SI + pass2]
        
         INC SI
         cmp CL, BL
         je Welcome
         jnp Wrong    
         jmp while 

exit:
	mov 	byte [BP+SI], "$"	; Add the "$" at the end of our string
        ret