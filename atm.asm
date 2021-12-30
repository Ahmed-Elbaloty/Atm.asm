.model small
.DATA
                 ;MAIN OPERATIONS
A    DB         "Enter Your Password" ,"$" 
WELCOME DB    10,  " Welcome to Your Account" ,"$" 
INQUIRY DB    10,  "1- Balance Inquiry" ,"$" 
WANTED DB    10,   "2- Money WANTED" ,"$" 
EXIT DB       10,  "3- Exit $"

BCK DB       10,   "1- Back$" 
QUIT db       10,   "2- QUIT", "$"
      ;ERROR MASSAGE
      B DB 10,"Invalid Password$","$"

      ;ACCOUNT PASSWORD
PASSWORD DB "ahmed","$" 
PASS Dw 5

INVALID DB  10,"Invalid Input" ,"$"
C DB "$"

MONEY DB   10, "YOUR VALID MONEY is:-  15000 LE", "$" 

;MONEY WANTED
FIRSTCASE DB 10, "1- 1000 LE " ,"$" 
SECONDCACE DB  10, "2- 2000 LE " ,"$"
THIRDCASE DB 10, "3- 5000 LE" ,"$"
FORTHCASE  DB 10, "4- 10,000 LE" ,"$"


   ;BALANCE INFORMATION
C1 DB 10, "YOYR VALID MONEY is:14,000 LE " ,"$" 
C2 DB 10,"YOYR VALID MONEY is: 13,000 LE " ,"$" 
C3 DB 10, "YOYR VALID MONEY is: 10,000 LE " ,"$" 
C4 DB 10, "YOYR VALID MONEY is: 5000 LE " ,"$" 


;Amount of money
AMOUNT DB 10, "ENTER MONEY WANTED" ,"$" 
tranamount db 10,"Enter Your Transaction Amount", "$"  
SUCCESS DB  10, "Your Transaction is Successfull...$" 


.code
main proc far
.STARTUP 
  
    ;CHECK PASSWORD
    mov cx,PASS
    mov bx,offset PASSWORD
    
    mov ah,9
    mov dx, OFFSET A
    int 21h
    
    cheekpass:
    mov ah,8
    int 21h
    
    cmp al,[bx] 
    jne worng
    mov ah,2
    mov dl,42
    int 21h
    inc bx
    loop cheekpass
    mov ah,00h
    mov al,03h   ;get curser position
    int 10h
    jmp newoperation
    
    worng:
    mov ah,00h
    mov al,03h
    int 10h 
    mov ah,9
    mov dx, offset B
    int 21h
    mov ah,4ch
    int 21h
    
    
    newoperation:
    mov ah,9
    mov dx, offset WELCOME 
    int 21h 
    
    mov ah,9
    mov dx , offset INQUIRY
    int 21h
    
    mov ah,9
    mov dx, offset WANTED
    int 21h
    
    mov ah,9
    mov dx , offset EXIT
    int 21h
    
    mov ah,9
    mov dx, OFFSET C
    int 21h
    
    mov ah,1
    int 21h
    
    mov bl,al
     
     ;Input Cheek 
    cheek:
    cmp bl,49 
    je blance
    cmp bl,50 
    je withdraw
    cmp bl,52 
    jmp ex
    jmp error
    
     
       ;Account Balance 
    blance:
    mov ah,00h
    mov al,03h
    int 10h 
    mov ah,9
    lea dx,MONEY
    int 21h 
    mov ah,9
    jmp option
    
    
     option: 
    mov ah,9
    mov dx,offset c
    int 21h
    mov ah,9
    lea dx,BCK
    int 21h
    mov ah,9
    lea dx,QUIT
    int 21h
    mov ah,9
    lea dx,C
    int 21h
    mov ah,1
    int 21h
    cmp al,49
    jmp back
    cmp al,50
    jmp ex
    jmp error
   
    
    withdraw:
    mov ah,00h
    mov al,03h
    int 10h
    mov ah,9
    lea dx,c
    int 21h
    mov ah,9
    lea dx,AMOUNT
    int 21h  
    
    ;Money wanted Options 
    mov ah,9
    lea dx,FIRSTCASE
    int 21h
    
    mov ah,9
    lea dx,SECONDCACE
    int 21h 
    
    mov ah,9
    lea dx,thirdcase
    int 21h
    
    mov ah,9
    lea dx,FORTHCASE
    int 21h
     
    mov ah,9
    lea dx,C
    int 21h
    mov ah,1
    int 21h   ; tap
    mov bl,al 
    
    ;Input Condition Cheek
    cmp bl,49 
    je pross1 
    
    cmp bl,50 
    je pross2
    
    cmp bl,51 
    jmp pross3
    
    cmp bl,52
    jmp pross4  
    jmp error
    
    
     pross1:
    mov ah,00h
    mov al,03h
    int 10h 
    mov ah,9
    lea dx,success
    int 21h 
    mov ah,9
    lea dx,c
    int 21h
    mov ah,9
    lea dx,c
    int 21h
    
    mov ah,9
    lea dx,c1
    int 21h 
  
    mov ah,9
    lea dx,c
    int 21h
    jmp option
    
   
     pross2:
    mov ah,00h
    mov al,03h
    int 10h
    mov ah,9
    lea dx,success
    int 21h 
    mov ah,9
    lea dx,c
    int 21h
    mov ah,9
    lea dx,c
    int 21h 
    
    mov ah,9
    lea dx,c2
    int 21h 
    
    mov ah,9
    lea dx,c
    int 21h
    jmp option
    
    pross3:
    mov ah,00h
    mov al,03h
    int 10h
    mov ah,9
    lea dx,success
    int 21h 
    mov ah,9
    lea dx,c
    int 21h
    mov ah,9
    lea dx,c
    int 21h 
    
    mov ah,9
    lea dx,c3
    int 21h 
    mov ah,9
    lea dx,c
    int 21h
    jmp option
    
    pross4:
    mov ah,00h
    mov al,03h
    int 10h
    mov ah,9
    lea dx,success
    int 21h 
    mov ah,9
    lea dx,c
    int 21h
    mov ah,9
    lea dx,c
    int 21h 
    
    mov ah,09
    lea dx,c4
    int 21h 
    mov ah,9
    lea dx,c
    int 21h
    jmp option
        
    back:
    mov ah,00h
    mov al,03h
    int 10h
    call  newoperation
      
      error:
    mov ah,00h
    mov al,03h
    int 10h 
    mov ah,9
    lea dx,b
    int 21h 
    mov ah,9
    lea dx,c
    int 21h  
    call newoperation
  
    ex:
    mov ah,4ch
    int 21h
    main endp
end main 
      
    
     
    
    
    

