.model small
.stack 100h
.data
      w db 26  dup (?)
      msg db 0dh,0Ah,'$'
.code
     
     
       lea si,w 
       mov ax,@data
       mov ds,ax
     
     initial:
               
          mov ah,1 
          int 21h
          cmp al,0dh
          je break
          mov bl,'a' 
          mov si,0
          jmp label1   
          
     
     label1: 
       cmp al,bl
       je input
       inc bl 
       inc si
       jmp label1
       
     input: 
         
         mov [si],1
         
         mov bl,'a'
         xor si,si
         lea si,w
         mov cx,26 
        jmp  display 
      
      display:
           
         cmp [si],1
         je show
         inc si 
         inc bl   
         
         loop display
         jmp again
      
      show: 
           mov ah,2
           mov dl, bl
           int 21h
           inc si
           inc bl
           jmp   display 
       again:  
           
           
            mov ah,9
           lea dx,msg
           int 21h
           jmp initial
           
        break:
           mov ah,4ch
           int 21h   
      
        
        
         
          
        
        
         
     