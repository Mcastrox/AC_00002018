

 	org 	100h

section .text
	call 	texto	
	call 	cursor  
	call 	phrase
	call	kbwait
	int 	20h

texto:	
    mov ah, 00h
	mov	al, 03h
	int 	10h
	ret

cursor: mov	ah, 01h
	mov 	ch, 00000000b
	mov 	cl, 00001110b
	int 	10h
	ret

w_char:	mov 	ah, 09h
	mov 	al, cl
	mov 	bh, 0h
	mov 	bl, 00001011b
	mov 	cx, 1h
	int 	10h
	ret

kbwait: mov 	ax, 0000h
	int 	16h
	ret

m_cursr:
    mov 	ah, 02h
	mov 	dx, di  ; Son las columnas
    add     dl, bl
	mov 	dh, al ; Son las filas
	mov 	bh, 0h
	int 	10h
	ret

phrase: 
    mov di, 0d
    mov bl, 20d ; columna

lupi:	
    mov al, 5d ; fila
    mov 	cl, [msg+di]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len
	jb	lupi
    mov di, 0d
lupi2:	
    mov al, 7d
    mov 	cl, [msg1+di]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len2
	jb	lupi2   
    mov di, 0d
lupi3:	
    mov al, 9d
    mov 	cl, [msg2+di]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len3
	jb	lupi3 
    mov di, 0d  
lupi4:	
    mov al, 11d
    mov 	cl, [msg3+di]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len4
	jb	lupi4  
	ret

section .data
msg	    db 	" Jose "
len 	equ	$-msg
msg1	db 	" Mauricio "
len2 	equ	$-msg1
msg2	db 	" Castro "
len3 	equ	$-msg2
msg3	db 	" Anaya "
len4 	equ	$-msg3