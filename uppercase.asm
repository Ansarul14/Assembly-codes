
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

     msg db 'assembly'  
     mov cx,8
     xor si,si
   top:
     
     
     
     and msg[si],0DFh 
     inc si
     loop top
   
   
   
   display:
           mov ah,9
        lea dx,msg
        int 21h
        
      mov ah,4ch
      int 21h

ret




