.model small
.stack 100h
.data
  w1 db 11 dup  (0)
  w2 db 11 dup (0) 
  
 .code
   mov ax,@data
   mov ds,ax  
   mov es,ax
 .main proc 
     input1:
         lea di,w1
         mov ah,1
         mov cx,5
      take1:
            int 21h
            stosb
            loop take1 
             
      newline:
            mov ah,2
          mov dl,0dh
          int 21h
          mov dl,0ah
          int 21h
    
     input2:
        lea di,w2
        mov ah,1
        mov cx,5
       take2:
            int 21h
            stosb 
            loop take2 
       
            
     newline1:
          mov ah,2
          mov dl,0dh
          int 21h
          mov dl,0ah
          int 21h 
           
      check1:
          lea si,w1
          lea di,w2
          mov al,[di]
          cmp [si],al
          jl terminate
          jge check2
          
      terminate:
             lea si,w1
             mov ah,2
             mov cx,5 
             cld
           print1:
                 lodsb
                 mov dl,al
                 int 21h
                 loop print1
                
             mov ah,4ch
             int 21h
      check2:
              mov cx,4
              lea si,w1
              lea di,w2
            
           bcheck:
               mov al,[si]
               cmp al,[di]
               jne break 
               inc si
               inc di
               loop bcheck 
       bcheck2: 
              
              mov al,[si]
              
              cmp al,[di]
              jl terminate
              jge break
       
       break:
              lea si,w2
             mov ah,2
             mov cx,5 
             cld
           print2:
                 lodsb
                 mov dl,al
                 int 21h
                 loop print2
             mov ah,4ch
             int 21h
              
      
           
          
          
        