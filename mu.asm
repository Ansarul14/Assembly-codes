
org 100h
    .model small
    .stack 100h
    .code
    main proc
         
        call multiply
         mov ah,4ch
         int 21h
     main endp
    
   multiply proc
   
    mov bx,0 
    mov cx,3
    ; mov ah,1
    input:
    mov ah,1 
      int 21h
      and ax,0fh
      push ax
      mov ax,10
      mul bx
      pop bx
      add bx,ax
      loop input
      
   multiply endp
   end main   






