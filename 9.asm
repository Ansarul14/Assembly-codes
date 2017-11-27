.model small
.stack 100h
.data
  w db 11 dup  (' ')
 .code
   mov ax,@data
   mov ds,ax  
   mov es,ax
 .main proc
     lea di,w
     mov bx,0
       
        
     mov ah,1 
     mov cx,0
    input:
        int 21h
        cmp al,0dh
        je break
        stosb 
        inc bx
        
        loop input
      break:
     newline: 
          mov ah,2
          mov dl,0dh
          int 21h
          mov dl,0ah
          int 21h
    
    show:
          mov ax,10
          sub ax,bx
          mov cx,ax 
          lea si,w+bx
          mov ah,2
          print_space:
               mov dl,[si] 
               int 21h
               inc si
               loop print_space
          mov cx,bx
          lea si,w
          mov ah,2
        display:
            mov dl,[si]
            int 21h
            inc si
            loop display 
        mov ah,4ch
        int 21h
      endp main