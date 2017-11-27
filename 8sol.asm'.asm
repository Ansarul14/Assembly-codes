.model small
      .stack 100h
      .data  
      msg1 db 'palindrome$' 
      msg2 db 'not palindrome$'
      w  db 10 dup(0)
      w1 db 10 dup(0)
      
      .code     
      main proc
        mov ax,@data
          mov ds,ax
          mov   es,ax
     
      lea si,w
      lea di,w1
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
             mov ah,2                   
             mov dl,0dh          
             int 21h

             mov dl,0ah                 
             int 21h    
            
       forward:
              
          
            mov cx,bx
            mov ah,2
            lea si,w
            
            
       print:
            
            lodsb
            
            mov dl,al
           ; dec si
            int 21h
            ;inc di 
            loop print
            
             newline1:
             mov ah,2                   
             mov dl,0dh          
             int 21h

             mov dl,0ah                 
             int 21h        
       reverse:
           mov cx,5
           lea si,w
           lea di,w1+bx-1
           cld
         make_rev:
             lodsb
             stosb
             sub di,2
             loop make_rev
         show:
             mov cx,bx
             mov ah,2
             lea si,w1
          print1:
              lodsb
              mov dl,al
              int 21h
              loop print1 
           newline2:
             MOV AH, 2                   
            MOV DL, 0DH          
           INT 21H

            MOV DL, 0AH                  
           INT 21H    
          palindrome:
             mov cx,bx
             lea si,w
             lea di,w1
             cld
             repe cmpsb
             je yes
             jne no
         yes:
         
            mov ah,9
            lea dx,msg1
            int 21h
            mov ah,4ch
            int 21h
         no:
           
            mov ah,9
            lea dx,msg2
            int 21h
            mov ah,4ch
            int 21h