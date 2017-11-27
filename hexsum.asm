
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

      msg1 db 'Enter the first hexadecimal number $'
      msg2 db 0dh,0Ah,'$'
      msg3 db 'Enter the second hexadecimal number $'
      
      mov ah,9
      lea dx,msg1
      int 21h
      xor bx,bx
      mov cl,4
      mov ah,1
      input1:
        int 21h
        
        cmp al,0dh
        
        je input2 
         
        cmp al,39h
        
        jg transfer
        
        and al,0fh 
        
        jmp shift
        
      transfer:
      
       sub al,37h 
       
      shift:  
      
        shl bx,cl
        
        or bl,al
        
       jmp input1
      
     input2:
     
           mov ah,9
           
      lea dx,msg2 
      
      int 21h
       
      mov ah,9 
      
      lea dx,msg3
      
      int 21h 
      xor dx,dx
      mov cl,4
      mov ah,1
     
     take:
        int 21h
        cmp al,0dh
        je break1
        cmp al,39h
        jg  transfer1
        and al,0fh
        jmp shift2
      
      transfer1:
        sub al,37h
       shift2: 
       shl dx,cl
       or dl,al
       jmp take
     
     break1:  
     
         
               
            add bx,dx
            
              mov ah,9
             
        lea dx,msg2 
      
        int 21h
        mov ah,2 
            
            jc print_1 
            ;jnc print_0
            mov dl,30h
            
            jmp dis
            
           print_1:
            mov dl,31h
            
           dis:
             int 21h 
            
            
            
             JMP output
             
            
      
          
        
          
       output: 
        
         
      mov cx,16
      mov ah,2
      print: 
          shl bx,1
          jnc print_zero
          mov dl,31h
          jmp show
         
         print_zero:
          
          mov dl,30h
         
         show:
          int 21h 
          
          loop print
         
       mov ah,4ch
       int 21h
         
        

ret




