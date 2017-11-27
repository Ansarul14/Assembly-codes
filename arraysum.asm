
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

     w dw 1,2,3,1
     xor ax,ax
     lea si,w
     mov cx,10
   sum:
      add ax,[si]
      add si,2
      loop sum 
     
     mov ah,2 
     
   display:   
           add ax,48
           mov dx,ax
           int 21h
       
       mov ah,4ch
       int 21h

ret




