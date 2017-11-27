.model small
.stack 100h
.data
  w db 110 dup  ('s')  
  w1 db 15 dup (0)
  a db ?
 .code
   mov ax,@data
   mov ds,ax  
   mov es,ax
 .main proc
     lea si,w
     mov a ,0
       
     lea di,w1  
      
     mov bx,10
     label:
            mov a,0 
        input:
             mov ah,1
            int 21h
            cmp al,0dh
            je break
            mov [si],al 
            inc si
            inc a
            ;inc bx
            
            loop input
          break: 
          mov ah,2
          mov dl,0dh
          int 21h
          mov dl,0ah
          int 21h
          inc si 
          mov al,10
          sub al,a 
          and al,0fh
           mov [di],al
           inc di
          dec bx
          cmp bx,0
          je break1
          loop label 
       break1:
              mov ah,2
              
              lea si,w 
              lea di,w1
          
           print_space:
               
                mov dl,[di]
                int 21h
                loop printspace 
           
               
      mov ah,2        
     mov ah,4ch
     int 21h
 endp main 
 
 
 
   