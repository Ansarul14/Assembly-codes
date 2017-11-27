
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h 
      .model small
      .stack 100h
      .data  
      msg1 db 'palindrome$' 
      msg2 db 'not palindrome$'
      w  db ? 
      w1 db ?
      
      .code
       mov ax,@data
       mov ds,ax
      xor ax,ax
      lea si,w
      mov cx,5 
      mov ah,1 
      mov bx,0
    
       input:
          
          int 21h
          cmp al,'a'
          jnge continue
          cmp al,'z'
          jnle continue
          mov [si],al
          inc si
          inc bx
          ;loop input
        
        continue:
             loop input 
             
             newline:
             MOV AH, 2                   
     MOV DL, 0DH          
     INT 21H

     MOV DL, 0AH                  
     INT 21H      
            
       forward:
             mov si,0 
          
          
          lea si,w 
          
          
          mov cx,bx 
          
          mov ah,2  
       print:
            
            mov al,[si]
            mov dl,al
            int 21h
           ; dec si
            inc si
            ;inc di 
            loop print
        newline1:
           MOV AH, 2                   
     MOV DL, 0DH          
     INT 21H

     MOV DL, 0AH                  
     INT 21H      
                
      display:
           
              
            mov si,0 
         
          
          lea si,w 
          
          
          mov cx,bx 
          ;mov bx,4
          mov ah,2  
       show:
            
            mov al,[si+bx-1] 
            
            
            mov dl,al
            int 21h
           ; dec si 
            
            dec bx
            
            loop show  
            
         newline2:
           MOV AH, 2                   
     MOV DL, 0DH          
     INT 21H

     MOV DL, 0AH                  
     INT 21H   
        palindrome:
                
                std
                push ds
                pop es
            LEA SI, w+4         
            LEA DI, w1+4         
           MOV CX, 5

          REP MOVSB 
                
         
         newline3:
             MOV AH, 2                   
     MOV DL, 0DH          
     INT 21H

     MOV DL, 0AH                  
     INT 21H      
            
       show_palin:
          
          je ok
          jne nook
       
      ok:
        mov ah,9
        lea dx,msg1
        int 21h
        mov ah,4ch
        int 21h
        
      nook:
         mov ah,9
         lea dx,msg2
         int 21h
        mov ah,4ch
         int 21h
         
          
       
      

ret




