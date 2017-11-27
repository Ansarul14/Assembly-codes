  .model small
  .stack 100h
  .data
  msg1 db "Enter the first number $" 
  msg db 0dh,0Ah,'$'
  msg2 db "Enter the second number $" 
  msg3 db "No value in dx $"
  msg4 db "Value exists in dx $"
 .code 
  mov ax,@data
  mov ds,ax
  mov ah,9
  lea dx,msg1
  int 21h   
 
 mov ah,9
 lea dx,msg
 int 21h
 
  mov bx,0 
  mov cx,0
  input:
  
    mov ah,1
    int 21h
    cmp al,0dh
    je print1  
    
    and ax,0fh  
    
    
    push ax 
    
    mov ax,10 
    mul bx
    pop bx
    add bx,ax
    
    inc cx
    
   
    jmp input   
    
   print1:
      xor ax,ax
     mov ah,9
     lea dx,msg
     int 21h
     jmp print
    
  print: 
        ;mov al,bl
      add cl,48
      mov ah,2
      mov dl,cl
      int 21h
    
   
    
      
    mov ah,9
   lea dx,msg
    int 21h
 
 
    mov ah,9
   lea dx,msg2 
   int 21h 
 
   mov dx,0
   
   mov cx,0
 
 input1:
    
     mov ah,1
     int 21h
     cmp al,0dh
     je print2
     
     inc cx
     and ax,0fh
     
     push ax
     
     mov ax,10
     
     mul dx
     pop dx
     
     add dx,ax
     jmp input1
     
  print2:
      
       mov al,dl 
       mul bl
       mov bl,al
       mov ah,9
       lea dx,msg
       int 21h
       mov ah,2
       add cl,48
       mov dl,cl
       int 21h 
       mov ah,9
       lea dx,msg
       int 21h
       
      
      cmp bl,0
      je display
      jne display1  
   
   display:
    mov ah,9
    lea dx,msg
    int 21h
     mov ah,9
     lea dx,msg3
     int 21h 
     mov ah,4ch
     int 21h 
   
   display1:
   mov ah,9
    lea dx,msg
    int 21h
     mov ah,9
     lea dx,msg4
     int 21h
      
      
   
   
     
   
      
    
    
    
  
  
      
    