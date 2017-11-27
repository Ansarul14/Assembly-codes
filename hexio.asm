
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

     msg1 db 'Enter the hexadecimal number $'
     msg2 db 0DH,0Ah,'$' 
     msg3 db 'Enter the hexadecimal number $'
     mov cl,4
      
     mov ah,9
     lea dx,msg1
     int 21h
     xor bx,bx 
     mov ah,1
     input1:
       int 21h 
       cmp al,0dh
       je break1
       cmp al,39h
       jg letter
       and al,0Fh
      jmp shift                                 
        
       
       letter:
        sub al,37h
       shift:
        shl bx,cl
        or bl,al
       jmp input1
       break1:
       mov ah,9
       lea dx,msg2
       int 21h 
        mov ah,9
     lea dx,msg3
     int 21h 
     ;mov cl,4
       xor cx,cx
       mov ah,1
       
      input2:
      int 21h 
       cmp al,0dh
       je break
       cmp al,39h
       jg letter1
       and al,0Fh
      jmp shift1                                 
        
       
       letter1:
        sub al,37h
       shift1:
        shl cx,4
        or cl,al
        jmp input2
      
       ;mov ax,dx
       
        
      break:
      mov ah,9
       lea dx,msg2
       int 21h 
      add bx,cx
     mov cx,16
     mov ah,2 
     
     output:
     
       shl bx,1
       jnc pz
       mov dl,31h
       jmp print
      pz:
        mov dl,30h
      print:
       int 21h
      loop output 
     
    mov ah,4ch
    int 21h
     

ret




