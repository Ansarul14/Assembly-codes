
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

 
      .model small
      .stack 100h
      .data  
      ;msg1 db 'palindrome$' 
      ;msg2 db 'not palindrome$'
      w  db 10 ? 
      w1 db 10 ?
      
      .code     
      main proc
       mov ax,@data
        mov ds,ax
        mov es,ax
      xor ax,ax
      lea si,w
      mov cx,5 
      mov ah,1 
      mov bx,0
    
       input:
          
          int 21h
          ;cmp al,'a'
          ;jnge continue
          ;cmp al,'z'
          ;jnle continue
          mov [si],al
          inc si
          inc bx
          loop input
        
        ;continue:
             ;loop input 
             
             newline:
             MOV AH, 2                   
     MOV DL, 0DH          
     INT 21H

     MOV DL, 0AH                  
     INT 21H      
            
       forward:
              
          
            mov cx,5
            mov ah,2
            lea si,w
            
            
       print:
            
            lodsb
            
            mov dl,al
           ; dec si
            int 21h
            ;inc di 
            loop print
            jmp newline1 
        newline1:
          MOV AH, 2                   
     MOV DL, 0DH          
     INT 21H

    MOV DL, 0AH                  
     INT 21H
          jmp display
          
        display:
         
                mov cx,5
                   mov si,0
                lea si,w 
                
                lea di,w1
                add di,4
                  cld 
                  jmp reverse
               reverse:
                   lodsb
                   stosb
                   sub di,2
                  loop reverse
                  jmp forward1
                
           forward1:
              
          
            mov cx,5
            mov ah,2
            lea si,w1
            
            
       print1:
            
            lodsb
            
            mov dl,al
           ; dec si
            int 21h
            ;inc di 
            loop print1 
         end main   