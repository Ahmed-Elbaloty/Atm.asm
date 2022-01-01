.model small
.DATA
                 ;MAIN OPERATIONS
A      DB     10,    "Enter Your Password" ,"$" 
WELCOME DB    10,    " Welcome to Your Account" ,"$" 
INQUIRY DB    10,    "1- Balance Inquiry" ,"$" 
Withdraw DB   10,    "2- Money Withdraw" ,"$" 
DEPOST  DB    10,    "3- Deposit ","$"
EXIT DB       10,    "4- Exit $"

BCK DB        10,   "1- Back$" 
QUIT db       10,   "2- QUIT", "$"
      ;ERROR MASSAGE
B DB 10,"Invalid Password$","$"

      ;ACCOUNT PASSWORD
PASSWORD DB "ahmed","$" 
PASS Dw 5
         ;Invalid Input
INVALID DB  10,"Invalid Input" ,"$"
C DB "$"

MONEY DB   10, "YOUR VALID MONEY is:-  15000 LE $" 

;MONEY WANTED
FIRSTCASE DB 10, "1- 1000 LE " ,"$" 
SECONDCACE DB  10, "2- 2000 LE " ,"$"
THIRDCASE DB 10, "3- 5000 LE" ,"$"
FORTHCASE  DB 10, "4- 10,000 LE" ,"$"

FIFTHCASE DB 10, "1- 1000 LE ","$"
SIXTHCASE DB 10, "2- 2000 LE ","$"
SEVENTHCASE DB 10, "3- 5000 LE ","$"
EIGHTCASE DB 10, "4- 10000 LE ","$"

   ;BALANCE INFORMATION
C1 DB 10, "YOYR VALID MONEY is:14,000 LE " ,"$" 
C2 DB 10,"YOYR VALID MONEY is: 13,000 LE " ,"$" 
C3 DB 10, "YOYR VALID MONEY is: 10,000 LE " ,"$" 
C4 DB 10, "YOYR VALID MONEY is: 5000 LE " ,"$" 


C5 DB 10, "YOYR VALID MONEY is:16,000 LE " ,"$" 
C6 DB 10,"YOYR VALID MONEY is: 17,000 LE " ,"$" 
C7 DB 10, "YOYR VALID MONEY is: 20,000 LE " ,"$" 
C8 DB 10, "YOYR VALID MONEY is: 25,000 LE " ,"$" 

;Amount of money
AMOUNT DB 10, "ENTER MONEY WANTED" ,"$" 
SUCCESS DB  10, "Successfull operation get your money and card...","$" 
SUCCESS2 DB  10, "Successfull operation...","$" 
F DB 10, "ENTER DEPOSIT MONEY $"

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
    mov al,03h            ;get curser position in new place
    int 10h
    jmp MAIN_OPERATION
    
    worng:
    mov ah,00h
    mov al,03h
    int 10h 
    mov ah,9
    mov dx, offset B
    int 21h
    mov ah,4ch
    int 21h
    
    
    MAIN_OPERATION:
    mov ah,9
    mov dx, offset WELCOME 
    int 21h 
    
    mov ah,9
    mov dx , offset INQUIRY
    int 21h
    
    mov ah,9
    mov dx, offset Withdraw
    int 21h
    
      mov ah,9
      mov dx, offset DEPOST
     int 21h
    
    
    mov ah,9
    mov dx , offset EXIT
    int 21h
    
    mov ah,9
    mov dx, OFFSET C
    int 21h
    
    mov ah,1             ;take char from user
    int 21h
    
    mov bl,al
     
     ;Input Cheek 
    cheek:
    cmp bl,49 
    je blance
    
    cmp bl,50 
    je wdraw
    
    cmp bl,52
    je ex
    
    cmp bl,51
    jMP DEPOSIT 
    ex:
    .exit 
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
     
    wdraw:
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
    lea dx,c1     ;display avaliable money after withdraw operation
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
    
 DEPOSIT:
    mov ah,00h
    mov al,03h
    int 10h
    mov ah,9
    lea dx,c
    int 21h
    mov ah,9
    lea dx,F
    int 21h  

    ; money deposited options
    mov ah,9
    lea dx,FIFTHCASE
    int 21h
    
    mov ah,9
    lea dx,SIXTHCASE
    int 21h 
    
    mov ah,9
    lea dx,SEVENTHCASE
    int 21h
    
    mov ah,9
    lea dx,EIGHTCASE
    int 21h
    
    mov ah,9
    lea dx,C
    int 21h
    
    mov ah,1
    int 21h   ; tap
    mov bl,al 
    
    ;Input Condition Cheek
    cmp bl,49 
    je COMPARE1 
    cmp bl,50 
    je COMPARE2
    cmp bl,51
    je COMPARE3
    cmp bl,52
    jmp COMPARE4
    
    COMPARE1 :
    mov ah,00h
    mov al,03h
    int 10h
    mov ah,9
    lea dx,success2
    int 21h 
    mov ah,9
    lea dx,c
    int 21h
    mov ah,9
    lea dx,c
    int 21h 
    
    mov ah,09
    lea dx,C5              ;display avaliable money after deposit operation
    int 21h 
    mov ah,9
    lea dx,c
    int 21h
    jmp option
    
    COMPARE2 :
    mov ah,00h
    mov al,03h
    int 10h
    mov ah,9
    lea dx,success2
    int 21h 
    mov ah,9
    lea dx,c
    int 21h
    mov ah,9
    lea dx,c
    int 21h 
    
    mov ah,09
    lea dx,C6
    int 21h 
    mov ah,9
    lea dx,c
    int 21h
    jmp option
    
    COMPARE3 :
    mov ah,00h
    mov al,03h
    int 10h
    mov ah,9
    lea dx,success2
    int 21h 
    mov ah,9
    lea dx,c
    int 21h
    mov ah,9
    lea dx,c
    int 21h 
    
    mov ah,09
    lea dx,C7
    int 21h 
    mov ah,9
    lea dx,c
    int 21h
    jmp option
    
      COMPARE4 :
    mov ah,00h
    mov al,03h
    int 10h
    mov ah,9
    lea dx,success2
    int 21h 
    mov ah,9
    lea dx,c
    int 21h
    mov ah,9
    lea dx,c
    int 21h 
    
    mov ah,09
    lea dx,C8
    int 21h 
    mov ah,9
    lea dx,c
    int 21h
    jmp option
 
    back:
    mov ah,00h
    mov al,03h
    int 10h
    call MAIN_OPERATION
      
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
    call MAIN_OPERATION
  
    main endp
end main 
      