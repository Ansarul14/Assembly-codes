
.stack 100h
.data

 msg1 db 10,13,'Type a binary number upto 8 digits:$'
 msg2 db 10,13,'The binary sum is:$'


.code

 main proc


 mov ax,@data
 mov ds,ax
 lea dx,msg1
 mov ah,9
 int 21h

 mov ah,1
 ;int 21h

 xor bl,bl
 
 mov cx,8

input1:
 ;mov ah,1
 int 21h

 cmp al,0dh
 je break

 and al,0fh ;convert to binary
 shl bl,1 ;make room for new value

 or bl,al ;insert value

loop input1
break:

 lea dx,msg1
 mov ah,9
 int 21h

 mov cx,8
    xor dh,dh
   mov ah,1
input2:

 
 int 21h

 cmp al,0dh
 je break2

 and al,0fh ;convert to binary
 shl dh,1 ;make room for new value

 or dh,al ;insert value

 loop input2



break2:
 lea dx,msg2
 mov ah,9
 int 21h
 
 
 add  bl,dh
  
   
 mov cx,16  
 mov ah,2
   output:
   
       shl bx,1
       jnc print_zero 
       mov dl,31h
       jmp print
      
      print_zero:
       mov dl,30h
       print:
       int 21h
       loop output
 
