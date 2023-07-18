.model small
.stack 100h
.data ;row (0-24)
      ;column (0-79)
    cols dw 185
    rows dw 220
    cols_char  db 33
    rows_char  db 11
    count1 db 0
    count2 db 0
    

    digitCount db 0 
    temp1 dw 0
    counter db 0

    name1 db 6 dup('$')
    name_size = $ - offset name1

    name_txt DB' ENTER YOUR NAME:  ','$'

    WELCOME_txt DB' WELCOME TO BRICK BREAKER ','$'
    WELCOME_txt2 DB' 1) PRESS ENTER TO START A NEW GAME ','$'
    WELCOME_txt3 DB' 2) PRESS I FOR INSTRUCTION ','$'
    WELCOME_txt4 DB' 3) PRESS ESC To EXIT ','$'
    
    inst_txt1 DB '1) USE LEFT AND RIGHT KEYS TO MOVE BOARD',"$"
    inst_txt2 DB '2) DONT LET THE BALL DROP ELSE YOUR LOSE :(',"$"
    inst_txt3 DB '3) BREAK AS MANY BRICKS AS YOUR CAN',"$"

    
     strt_txt DB'NEW GAME','$'
     highscore_TXT db 'HIGHEST SCORE', "$"
     inst_TXT db 'INSTRUCTIONS', "$"

     score dw 0
     score_size = $ - offset score


    ;game text
     game_TXT db 'PRESS SPACE TO START GAME', "$"
     gameover_TXT db ' GAME OVER!!! ',"$"
     gameover2_TXT db 'PRESS SPACE TO EXIT GAME', "$"
     leaderboard_TXT db "WELCOME TO LEADERBOARD$"
      level2_2TXT db 'PRESS SPACE TO START GAME', "$"
      level2_1TXT db 'YOU MADE IT TO LEVEL 2', "$"

      level3_2TXT db 'PRESS SPACE TO START GAME', "$"  
      level3_1TXT db 'YOU MADE IT TO LEVEL 3', "$"

     SCORE_TXT db 'SCORE: ', "$"
     Lives_TXT db 'lives: ', "$"
     
     sndfreq dw 1000
     ;ball coordibates
     ball_X1 db 36 ; starting changing coordinate of ball
     ball_X2 db 37 ;
     ball_Y db 24

     ball_xvel db 00000001B ; x velocity
     ball_yvel db 00000001B ; y velocity

     paddle_X1 db 31
     paddle_X2 db 41

    LEVEL db 1 ; the initaial Level of every Player will be 1
    Level_size = $ - offset LEVEL
;--------------LEVEL 1-----------

     brick_starting_col db 2 , 14 , 26 , 38 , 50 , 62       ;UPPER BRICK
     brick_ending_col db 12 , 24 , 36 , 48 , 60 , 72    ;UPPER BRICK
     ;brick1_color db 4 , 4 , 4 , 4 , 4 , 4 ; BRICKCOLOR

     brick2_starting_col db 2 , 14 , 26 , 38 , 50 , 62 ;LOWER BRICK
     brick2_ending_col db 12 , 24 , 36 , 48 , 60 , 72 ;LOWER BRICK
     ;brick2_color db 4 , 4 , 4 , 4 , 4 , 4 ; BRICKCOLOR

     total_bricks dw 6 ; total bricks in 1 row
     loop_backup dw 0

    ;hit brick bool
     brick1_row1_bool db 0
     brick2_row1_bool db 0
     brick3_row1_bool db 0
     brick4_row1_bool db 0
     brick5_row1_bool db 0
     brick6_row1_bool db 0
     brick1_row2_bool db 0
     brick2_row2_bool db 0
     brick3_row2_bool db 0
     brick4_row2_bool db 0
     brick5_row2_bool db 0
     brick6_row2_bool db 0

     ;TIME DELAY
     delaytime dw 180

     up_right_bool db 1 ; initialy true
     up_left_bool db 0
     down_right_bool db 0
     down_left_bool db 0
     exit_bool db 0
     exit_bool2 db 0

     LIVES db 3 ; initial lives of player

    box dw 4

     color_x dw ? ; used for chekcing specific pixel colors
     color_y dw ?
    
    ;------------------------Level 2 Varaibles---------------

    brick_starting_col_level2 db 2 , 14 , 26 , 38 , 50 , 62       ;UPPER BRICK
     brick_ending_col_level2 db 12 , 24 , 36 , 48 , 60 , 72    ;UPPER BRICK
     ;brick1_color db 4 , 4 , 4 , 4 , 4 , 4 ; BRICKCOLOR

     brick2_starting_col_level2 db 2 , 14 , 26 , 38 , 50 , 62 ;LOWER BRICK
     brick2_ending_col_level2 db 12 , 24 , 36 , 48 , 60 , 72 ;LOWER BRICK
     ;brick2_color db 4 , 4 , 4 , 4 , 4 , 4 ; BRICKCOLOR

     brick3_starting_col_level2 db 2 , 14, 50 , 62
     brick3_ending_col_level2 db 12 , 24, 60 , 72
     total_bricks_r3_l2 DW 4 

     brick3_fixed_starting_col_level3 db 26 , 38
     brick3_fixed_ending_col_level3 db 36 , 48
    
     brick1_row1_bool_lvl2 db 0
     brick2_row1_bool_lvl2 db 0
     brick3_row1_bool_lvl2 db 0
     brick4_row1_bool_lvl2 db 0
     brick5_row1_bool_lvl2 db 0
     brick6_row1_bool_lvl2 db 0
     
     brick1_row2_bool_lvl2 db 0
     brick2_row2_bool_lvl2 db 0
     brick3_row2_bool_lvl2 db 0
     brick4_row2_bool_lvl2 db 0
     brick5_row2_bool_lvl2 db 0
     brick6_row2_bool_lvl2 db 0

     brick1_row3_bool_lvl2 db 0
     brick2_row3_bool_lvl2 db 0
     brick3_row3_bool_lvl2 db 0
     brick4_row3_bool_lvl2 db 0
     brick5_row3_bool_lvl2 db 0
     brick6_row3_bool_lvl2 db 0
     
    
     total_bricks_level2 dw 6 ; total bricks in 1 row
     loop_backup_level2 dw 0
     loop_backup_R3_level2 dw 0

      delaytime_level2 dw 120

    paddle_X1_level2 db 31
    paddle_X2_level2 db 38 ; reduced Paddle Size by 3 pixels


;#################################################
    fname2 db "data.txt"
    handle dw ?
    dummy_score db 3 dup("$")
    buffer db 1000 dup ("$")
    tempp db ?
    Spacef db " ", "$"
    COUNT db 8

    Firstname db 6 dup("$")
        Sname db 6 dup("$")
        Tname db 6 dup("$")
        Fourthname db 5 dup("$")

    player1_level db 2 dup("$")
        player2_level db 2 dup("$")
        player3_level db 2 dup("$")
        player4_level db 2 dup("$")
        idk_ignore db  "$"
        player1_score db 3 dup("$")
        player2_score db 3 dup("$")
        player3_score db 3 dup("$")
        player4_score db 3 dup("$")
        idk_ignore2 db 2 dup ("$")

.code
main PROC 
    mov ax, @data
mov ds, ax
mov ax,0


    mov ah, 0
    mov al, 12h    
    int 10h

     mov ah,2
     mov dh,12
     mov dl,20
     mov bh,0
    int 10h

     mov dx, offset NAME_txt
     mov ah, 9
     int 21h

;input name
 Mov dx, offset name1
 Mov ah, 3fh
 Int 21h


    MOV ROWS, 220
    MOV COLS, 185
   top:
    mov ah, 0
    mov al, 12h    
    int 10h
    
         call drawball
     mov ah,6 ; Drawing paddle
 mov al,0
 mov bh, 8 ; GRAY
 mov ch, 26 ; top row
 mov cl, paddle_X1 ; left-most column
 mov dh, 26 ; bottom row
 mov dl, paddle_X2 ; bottom column
 int 10h ;
  
    call menu_texts
    mov cols,185
    call printrectangle
     ;print start
        mov ah,2
        mov dh,12
        mov dl,32
        mov bh,0
        int 10h
   
        mov dx, offset strt_txt
        mov ah, 9
        int 21h

    ;printing next 
    ;mov ax, cols
    ;add ax,45
    mov cols, 230

    call printrectangle
        ;print start
           mov ah,2
           mov dh, 15
           mov dl, 30
           mov bh,0
           int 10h
           mov dx, offset highscore_TXT
           mov ah, 9
        int 21h

    ;printing next 
    ;mov ax, cols
    ;add ax,45
    mov cols, 275 
    call printrectangle
        ;print start
           mov ah,2
           mov dh, 18
           mov dl, 30
           mov bh,0
           int 10h
           mov dx, offset inst_TXT
           mov ah, 9
           int 21h

    
        ; waits for user input in main screen
   
   
   
   
   
   
   
   
   

        mov ah,1
        int 16h
        jz move
        mov ah,0
        int 16h

        cmp AL, 13
        je strt

        CMP AL, 27
        je exitscreen

        cmp aL,'i'
        je instruct

        cmp aL,'I'
        je instruct

        cmp aL,'h'
        je highscore

        cmp aL,'H'
        je highscore
         
    move:
    mov delaytime,120
    call delay
    call menumove
    jmp top
;jmp key
    
        
    
    strt: ; needs to be implemented properly
    mov delaytime,180
    call gameplay
    jmp exitscreen ;exit


    instruct:
    call instruction_screen
    jmp TOP

    highscore:
    call highscorescreen
    jmp TOP

    exitscreen:
    mov ah, 4ch
    int 21h

main ENDP



printrectangle PROC
mov count1,0
mov count2,0 
     Label1:
    	mov bl,count1
    	cmp bl, 140
    	je exit
    	mov cx, rows    
    	mov dx, cols    
    	MOV AL, 1110b 
    	MOV AH, 0CH 
    	INT 10H
    	inc rows
    	inc count1
    loop Label1
    exit:
    Label3:
    	mov bl,count2
    	cmp bl, 29
    	je exit3
    	mov cx, rows    
    	mov dx, cols    
    	MOV AL, 1110b 
    	MOV AH, 0CH 
    	INT 10H
    	inc cols
    	inc count2
    loop Label3
    exit3:
    
    mov count2,0
    Label2:
    	mov bl,count2
    	cmp bl, 140
    	je exit2
    	mov cx, rows   
    	mov dx, cols   
    	MOV AL, 1110b  
    	MOV AH, 0CH 
    	INT 10H
    	dec rows
    	inc count2
    loop Label2
    exit2:
    mov count2,0
    Label4:
    	mov bl,count2
    	cmp bl, 29
    	je exit4
    	mov cx, rows    
    	mov dx, cols    
    	MOV AL, 1110b  
    	MOV AH, 0CH 
    	INT 10H
    	dec cols
    	inc count2
    loop Label4
    exit4:
    RET
printrectangle ENDP


menu_texts PROC 
     ;setting cursor position
 mov ah,2
 mov dh,5
 mov dl,24
 mov bh,0
 int 10h
 
 mov dx, offset WELCOME_txt
 mov ah, 9
 int 21h
 
 mov dx, offset name1
 mov ah, 9
 int 21h
 ;setting cursor position
 mov ah,2
 mov dh,7
 mov dl,20
 mov bh,0
 int 10h

 mov dx, offset WELCOME_txt2
 mov ah, 9
 int 21h
 
  ;setting cursor position
 mov ah,2
 mov dh,8
 mov dl,20
 mov bh,0
 int 10h
 
 mov dx, offset WELCOME_txt3
 mov ah, 9
 int 21h 

 ;setting cursor position
    mov ah,2
    mov dh,9
    mov dl,20
    mov bh,0
    int 10h
    
    mov dx, offset WELCOME_txt4
    mov ah, 9
    int 21h 

    RET
menu_texts ENDP   

;##################################################################################### GAMEPLAY STARTS HERE

gameplay PROC 
    
    call gamescreen
      
      
      
   call level1
   cmp al,27
    je exit 
    
    cmp score,12
    jne exit
   mov LEVEL , 2 
 
    call level2_menu
    CALL level2
    cmp al,27
   je exit
  ;sub ball_xvel,1
  ;sub ball_yvel,1

  cmp score,28
  jne exit

      mov LEVEL , 3  
      call level3_menu
      call level3
      
      cmp al,27
      je exit
    
    
   ; call drawball
   exit:
   ;CHANGING VALUES
;################################write in file

      call writeToFile
      call gameover  
      RET
gameplay ENDP

draw_bricks PROC ; draws bricks

    mov si, offset brick_starting_col
    mov di, offset brick_ending_col

    mov cx, total_bricks ; loop runs as many bricks are
    printbricks_loop:

    mov loop_backup,cx ; store backup of cx
    

        
    mov ah,6 ; Drawing paddle
    mov al,0
    mov bh, 4 ; RED
    mov ch, 4 ; top row
    mov cl, [si] ; left-most column
    mov dh, 4; bottom row
    mov dl, [di] ; bottom column
    int 10h ;
    
    skip_iteration:
    inc si
    inc di
    mov cx,loop_backup ; restore
    loop printbricks_loop

    mov si,0 ; set default parameters
    mov di,0
    ret
draw_bricks endp

draw_bricks2 PROC uses ax bx cx dx ;uses ax bx cx si di; draws bricks

    mov si, offset brick2_starting_col
    mov di, offset brick2_ending_col
     
    mov cx, total_bricks ; loop runs as many bricks are
    
    printbricks_loop2:


    mov loop_backup,cx ; store backup of cx

    mov ah,6 ; Drawing paddle
    mov al,0
    mov bh, 4 ; RED 
    mov ch, 7 ; top row
    mov cl, [si] ; left-most column
    mov dh, 7 ; bottom row
    mov dl, [di] ; bottom column
    int 10h ;
    
    inc si
    inc di
    mov cx,loop_backup ; restore
    loop printbricks_loop2

    mov si,0 ; set default parameters
    mov di,0
    ret
draw_bricks2 endp

draw_bricks_level2 PROC ; draws bricks

    mov si, offset brick_starting_col_level2
    mov di, offset brick_ending_col_level2

    mov cx, total_bricks_level2 ; loop runs as many bricks are
    printbricks_loop2:

    mov loop_backup_level2,cx ; store backup of cx
    

        
    mov ah,6 ; Drawing paddle
    mov al,0
    ;mov bh, 4 ; RED
    mov ch, 4 ; top row
    mov cl, [si] ; left-most column
    mov dh, 4 ; bottom row
    mov dl, [di] ; bottom column
    int 10h ;
    
    skip_iteration2:
    inc si
    inc di
    mov cx,loop_backup_level2 ; restore
    loop printbricks_loop2

    mov si,0 ; set default parameters
    mov di,0
    ret
draw_bricks_level2 endp

draw_bricks2_level2 PROC uses ax bx cx dx ;uses ax bx cx si di; draws bricks

    mov si, offset brick2_starting_col_level2
    mov di, offset brick2_ending_col_level2
     
    mov cx, total_bricks_level2 ; loop runs as many bricks are
    
    printbricks_loop22:


    mov loop_backup_level2,cx ; store backup of cx

    mov ah,6 ; Drawing paddle
    mov al,0
   ; mov bh, 4 ; RED 
    mov ch, 7 ; top row
    mov cl, [si] ; left-most column
    mov dh, 7 ; bottom row
    mov dl, [di] ; bottom column
    int 10h ;
    
    inc si
    inc di
    mov cx,loop_backup_level2 ; restore
    loop printbricks_loop22

    mov si,0 ; set default parameters
    mov di,0
    ret
draw_bricks2_level2 endp


draw_bricks3_level2 PROC ;uses ax bx cx dx ;uses

    mov si, offset brick3_starting_col_level2
    mov di, offset brick3_ending_col_level2
     
    mov cx, total_bricks_r3_l2 ; loop runs as 
    
    printbricks_loop32:


    mov loop_backup_level2,cx ; store backup of

    mov ah,6 ; Drawing paddle
    mov al,0
   ; mov bh, 4 ; RED 
    mov ch, 11 ; top row
    mov cl, [si] ; left-most column
    mov dh,11 ; bottom row
    mov dl, [di] ; bottom column
    int 10h ;
    
    inc si
    inc di
    mov cx,loop_backup_level2 ; restore
    loop printbricks_loop32

    mov si,0 ; set default parameters
    mov di,0
    ret
draw_bricks3_level2 endp


draw_bricks3_fixed_level2 PROC ;uses ax bx cx dx ;uses

    mov si, offset brick3_fixed_starting_col_level3
    mov di, offset brick3_fixed_ending_col_level3
     
    mov cx, 2 ; loop runs as 2 fixed bricks
    
    printbricks_loop32:


    mov loop_backup_level2,cx ; store backup of

    mov ah,6 ; Drawing paddle
    mov al,0
    mov bh, 15 ; green
    mov ch, 11 ; top row
    mov cl, [si] ; left-most column
    mov dh,11 ; bottom row
    mov dl, [di] ; bottom column
    int 10h ;
    
    inc si
    inc di
    mov cx,loop_backup_level2 ; restore
    loop printbricks_loop32

    mov si,0 ; set default parameters
    mov di,0
    ret
draw_bricks3_fixed_level2 endp
;-----------------------------------------------------------------
level1 PROC

movement_key:

mov ah, 0 ; Set Video Mode
mov al, 12h   
mov bh,0 
int 10h
 

    call boundry
    call draw_bricks ;1st row
    call draw_bricks2 ;2nd row  
    call hide  
      ; call drawball
    mov ah,6 ; Drawing paddle
    mov al,0
    mov bh, 8 ; GRAY
    mov ch, 26 ; top row
    mov cl, paddle_X1 ; left-most column
    mov dh, 26 ; bottom row
    mov dl, paddle_X2 ; bottom column
    int 10h ;

    ;output lives
      mov ah,2
      mov dh,2 ;cols
      mov dl,5 ;rows
      mov bh,0
      int 10h
      ;output lives on screen
      mov dx, offset lives_txt
      mov ah, 9
      int 21h
      
      mov ah,2
      mov dh,2 ;cols
      mov dl,12 ;rows
      mov bh,0
      int 10h
          
      mov al,3    ;ASCII code of Character 
      mov bx,0
      mov bl,4   ;Green color
      mov ch,0
      mov cl,lives       ;repetition count
      mov ah,09h
      int 10h                ;change to hearts              ;change to hearts          ;change to hearts      ;change to hearts

      ;output score on screen
        mov ah,2
       mov dh,2 ;cols
       mov dl,60 ;rows
       mov bh,0
       int 10h
     mov dx, offset score_txt
     mov ah, 9
     int 21h
     
     mov ah,2
     mov dh,2 ;cols
     mov dl,67 ;rows
     mov bh,0
     int 10h
         
         call score_output
     ;mov dl, score
     ;add dl,48
     ;Mov ah, 2
     ;int 21h
     CALL drawball

        mov ah,1
        int 16h
         JZ CHANGE_BALL_POSITION ; if no key pressed mov ball
        mov ah,0    ;ELSE MOVE KEYSTROKER WITH BALL
        int 16h


        cmp Ah, 4bh ; LEFT ARROW KEY    
        je left_key_pressed


        cmp Ah, 4dh ; Right ARROW KEY
        je right_key_pressed

        cmp Al, 27 ; END KEY
        je exit

        cmp Al, 'p' ; pause game
        je pause
        
        jmp CHANGE_BALL_POSITION; if not key pressed

        pause:
            mov ah,1
            int 16h
            mov ah,0    
            int 16h
            cmp Al, 'p' ; pause game
            je movement_key
        jmp pause

        


        left_key_pressed:

            cmp paddle_X1,3 ; leftmost row
            je CHANGE_BALL_POSITION ; dont move

                DEC paddle_X1 ; dec left column
                dec paddle_X2 ; dec right column
                DEC paddle_X1 ; dec left column
                dec paddle_X2 ; dec right column
            jmp CHANGE_BALL_POSITION

        right_key_pressed:
            cmp paddle_X1,65
            je CHANGE_BALL_POSITION ; dont move mo

            inc paddle_X1 ; move riughte
            inc paddle_X2
            inc paddle_X1 ; move riughte
            inc paddle_X2

CHANGE_BALL_POSITION:
   
   call delay    ; CALLING DELAY 
   CALL ballmovement 
   cmp exit_bool,1 ;exit bool will run 1 throughout the game denotes lives
   je exit
   cmp score,12  ; if all bricks break exit
   je exit
   
JMP movement_key
  
exit:
    ret
level1 endp    

;####################################################################################################################
;------------------------------------------------------------LEVEL 2 IMPLEMENTATIOM----------------------------------
level2 proc
    mov LEVEL, 2 ; Set players Level to 2
    mov lives , 3 ; players have defualt lives in 2nd level
    mov exit_bool , 0


    movement_key2:

mov ah, 0 ; Set Video Mode
mov al, 12h   
mov bh,0 
int 10h
call boundry
    mov bh,8
    call draw_bricks_level2 ;1st row
    mov bh,9
    call draw_bricks2_level2 ;2nd row  
    mov bh,10
    CALL draw_bricks3_level2
    call hide 
    CALL drawball

   ; call drawball
    mov ah,6 ; Drawing paddle
    mov al,0
    mov bh, 8 ; GRAY
    mov ch, 26 ; top row
    mov cl, paddle_X1_level2 ; left-most column
    mov dh, 26 ; bottom row
    mov dl, paddle_X2_level2 ; bottom column
    int 10h ;

    ;output lives
      mov ah,2
      mov dh,2 ;cols
      mov dl,5 ;rows
      mov bh,0
      int 10h
      ;output lives on screen
      mov dx, offset lives_txt
      mov ah, 9
      int 21h
      
      mov ah,2
      mov dh,2 ;cols
      mov dl,12 ;rows
      mov bh,0
      int 10h
          
      mov al,3    ;ASCII code of Character 
      mov bx,0
      mov bl,4   ;Green color
      mov ch,0
      mov cl,lives       ;repetition count
      mov ah,09h
      int 10h                ;change to hearts              ;change to hearts          ;change to hearts      ;change to hearts

      ;output score on screen
        mov ah,2
       mov dh,2 ;cols
       mov dl,60 ;rows
       mov bh,0
       int 10h
     mov dx, offset score_txt
     mov ah, 9
     int 21h
     
     mov ah,2
     mov dh,2 ;cols
     mov dl,67 ;rows
     mov bh,0
     int 10h
         
         call score_output
      ;mov dl, score
     ;add dl,48
     ;Mov ah, 2
     ;int 21h

        mov ah,1
        int 16h
         JZ CHANGE_BALL_POSITION2 ; if no key pressed mov ball
        mov ah,0    ;ELSE MOVE KEYSTROKER WITH BALL
        int 16h


        cmp Ah, 4bh ; LEFT ARROW KEY    
        je left_key_pressed


        cmp Ah, 4dh ; Right ARROW KEY
        je right_key_pressed

        cmp Al, 27 ; END KEY
        je exit_level2

        cmp Al, 'p' ; pause game
        je pause
        
        jmp CHANGE_BALL_POSITION2; if not key pressed

        pause:
            mov ah,1
            int 16h
            mov ah,0    
            int 16h
            cmp Al, 'p' ; pause game
            je movement_key2
        jmp pause

        left_key_pressed:

            cmp paddle_X1_level2,3 ; leftmost row
            jle CHANGE_BALL_POSITION2 ; dont move

                sub paddle_X1_level2,3 ; dec left column
                sub paddle_X2_level2,3 ; dec right column

            jmp CHANGE_BALL_POSITION2

        right_key_pressed:
            cmp paddle_X1_level2,65
            jge CHANGE_BALL_POSITION2 ; dont move mo

            add paddle_X1_level2,3 ; move riughte
            add paddle_X2_level2,3 ; move riughte


CHANGE_BALL_POSITION2:
   
   call delay    ; CALLING DELAY 
   CALL ballmovement2   ;-------------------------- NEW BALL MOVEMENT----------------------;
   cmp exit_bool,1 ;exit bool will run 1 throughout the game denotes lives
   je exit_level2
   cmp score,28  ; if all bricks break exit
   je exit_level2
   
JMP movement_key2
  
exit_level2:
    ret
level2 endp
                ;note make new variable for blocks 
                ;make new funct for lvl 2 and ball movement ammend it using score
;--------------------------------------------------------------------------------------------------------------------
;####################################################################################################################

restore_bricks proc


    mov brick_starting_col_level2[0] , 2 
     mov brick_starting_col_level2[1] , 14 
     mov brick_starting_col_level2[2], 26 
     mov brick_starting_col_level2[3], 38 
     mov brick_starting_col_level2[4], 50 
     mov brick_starting_col_level2[5], 62 ;LOWER BRICK

     mov brick_ending_col_level2[0] , 12 
     mov brick_ending_col_level2[1] , 24 
     mov brick_ending_col_level2[2], 36 
     mov brick_ending_col_level2[3], 48 
     mov brick_ending_col_level2[4], 60 
     mov brick_ending_col_level2[5], 72 ;LOWER BRICK


     mov brick2_starting_col_level2[0] , 2 
     mov brick2_starting_col_level2[1] , 14 
     mov brick2_starting_col_level2[2], 26 
     mov brick2_starting_col_level2[3], 38 
     mov brick2_starting_col_level2[4], 50 
     mov brick2_starting_col_level2[5], 62 ;LOWER BRICK

     mov brick2_ending_col_level2[0] , 12 
     mov brick2_ending_col_level2[1] , 24 
     mov brick2_ending_col_level2[2], 36 
     mov brick2_ending_col_level2[3], 48 
     mov brick2_ending_col_level2[4], 60 
     mov brick2_ending_col_level2[5], 72 ;LOWER BRICK
     ;brick2_color db 4 , 4 , 4 , 4 , 4 , 4 ; BRICKCOLOR



    mov brick3_starting_col_level2[0] , 2 
    mov brick3_starting_col_level2[1] , 14
    mov brick3_starting_col_level2[2] , 50
    mov brick3_starting_col_level2[3] , 62

    mov brick3_ending_col_level2[0] , 12
    mov brick3_ending_col_level2[1] , 24
    mov brick3_ending_col_level2[2] , 60 
    mov brick3_ending_col_level2[3] , 72

    mov total_bricks_r3_l2 , 4 

    mov brick1_row1_bool_lvl2 , 0
    mov brick2_row1_bool_lvl2 , 0
    mov brick3_row1_bool_lvl2 , 0
    mov brick4_row1_bool_lvl2 , 0
    mov brick5_row1_bool_lvl2 , 0
    mov brick6_row1_bool_lvl2 , 0
     
    mov brick1_row2_bool_lvl2 , 0
    mov brick2_row2_bool_lvl2 , 0
    mov brick3_row2_bool_lvl2 , 0
    mov brick4_row2_bool_lvl2 , 0
    mov brick5_row2_bool_lvl2 , 0
    mov brick6_row2_bool_lvl2 , 0

    mov brick1_row3_bool_lvl2 , 0
    mov brick2_row3_bool_lvl2 , 0
    mov brick3_row3_bool_lvl2 , 0
    mov brick4_row3_bool_lvl2 , 0
    mov brick5_row3_bool_lvl2 , 0
    mov brick6_row3_bool_lvl2 , 0
     
    
   mov  loop_backup_level2 , 0
    mov loop_backup_R3_level2 , 0

   mov   delaytime_level2 , 90

   mov paddle_X1_level2 , 31
   mov paddle_X2_level2 , 35 ; reduced Paddle Size by 3 pixels

ret
restore_bricks endp 

;--------------------------------------------------------------------------------------------------------------------
;####################################################################################################################
level3 proc
    mov LEVEL, 3 ; Set players Level to 2
    mov lives , 3 ; players have defualt lives in 2nd level
    mov exit_bool , 0

    call restore_bricks ; using level 2 coordinates

    movement_key2:

mov ah, 0 ; Set Video Mode
mov al, 12h   
mov bh,0 
int 10h
    
    call boundry
    MOV BH, 11
    call draw_bricks_level2 ;1st row
    MOV BH, 11
    call draw_bricks2_level2 ;2nd row  
     MOV BH, 11
    CALL draw_bricks3_level2
    call draw_bricks3_fixed_level2
    call hide 
    CALL drawball

   ; call drawball
    mov ah,6 ; Drawing paddle
    mov al,0
    mov bh, 8 ; GRAY
    mov ch, 26 ; top row
    mov cl, paddle_X1_level2 ; left-most column
    mov dh, 26 ; bottom row
    mov dl, paddle_X2_level2 ; bottom column
    int 10h ;

    ;output lives
      mov ah,2
      mov dh,2 ;cols
      mov dl,5 ;rows
      mov bh,0
      int 10h
      ;output lives on screen
      mov dx, offset lives_txt
      mov ah, 9
      int 21h
      
      mov ah,2
      mov dh,2 ;cols
      mov dl,11 ;rows
      mov bh,0
      int 10h
     ;--------------------------IF LIVES == 3 PRINT 3 HEARTS AND SO ON----------------------------
      mov dl, lives         ;change to hearts
      add dl,48         ;change to hearts
      Mov ah, 2         ;change to hearts
      int 21h           ;change to hearts

      ;output score on screen
        mov ah,2
       mov dh,2 ;cols
       mov dl,52 ;rows
       mov bh,0
       int 10h

        mov dx, offset score_txt
        mov ah, 9
        int 21h
     
     mov ah,2
     mov dh,2 ;cols
     mov dl,59 ;rows
     mov bh,0
     int 10h
         
         call score_output
     ;mov dl, score
     ;add dl,48
     ;Mov ah, 2
     ;int 21h

        mov ah,1
        int 16h
         JZ CHANGE_BALL_POSITION2 ; if no key pressed mov ball
        mov ah,0    ;ELSE MOVE KEYSTROKER WITH BALL
        int 16h


        cmp Ah, 4bh ; LEFT ARROW KEY    
        je left_key_pressed


        cmp Ah, 4dh ; Right ARROW KEY
        je right_key_pressed

        cmp Al, 27 ; END KEY
        je exit_level3

        cmp Al, 'p' ; pause game
        je pause
        
        jmp CHANGE_BALL_POSITION2; if not key pressed

        pause:
            mov ah,1
            int 16h
            mov ah,0    
            int 16h
            cmp Al, 'p' ; pause game
            je movement_key2
        jmp pause

        left_key_pressed:

            cmp paddle_X1_level2,3 ; leftmost row
            jle CHANGE_BALL_POSITION2 ; dont move

                sub paddle_X1_level2,3 ; dec left column
                sub paddle_X2_level2,3 ; dec right column

            jmp CHANGE_BALL_POSITION2

        right_key_pressed:
            cmp paddle_X1_level2,65
            jge CHANGE_BALL_POSITION2 ; dont move mo

            add paddle_X1_level2,3 ; move riughte
            add paddle_X2_level2,3 ; move riughte


CHANGE_BALL_POSITION2:
   
   call delay    ; CALLING DELAY 
   CALL ballmovement2   ;-------------------------- NEW BALL MOVEMENT----------------------;
   cmp exit_bool,1 ;exit bool will run 1 throughout the game denotes lives
   je exit_level3
   cmp score, 44  ; if all bricks break exit
   je exit_level3
   
JMP movement_key2
  
exit_level3:
    ret
level3 endp

;####################################################################################################################


;--------------------------------------------------------------------------------------------------------------------
ballmovement proc
  
  mov al, ball_xvel   ; moving velocity to variable
  mov bl, ball_yvel
    ;---------------------------------------------------- boundry check
    cmp ball_X2 , 73 ; check right most column range
    jge bounce_off_right_column ; ball is going out of range

    cmp ball_X1 , 1 ; check left column range
    jle bounce_off_left_column

    cmp ball_Y , 3 ; check top row
    jle bounce_off_top_row
    ;---------------------------------------------------------

    ;--------------------------------------------------------- Lives Decrement If it goes below Paddle
    cmp ball_y , 27 ; if ball goes below paddle
    jge decrease_life
    ;---------------------------------------------------------

;-------------------------------------------------------------PADDLE COLLISION DETECTION
    mov ch , paddle_X2
    cmp ball_X2 , ch; 31-41
    jle next1
    jnle brick_collision
        next1:
            mov ch , paddle_X1
            cmp ball_X1 , ch
            jge next2
            jnge brick_collision
                next2:
                    cmp ball_Y , 25 ; y coordinates
                    jge bounce_off_bottom_row
                    jnge brick_collision
    
    ;---------------------------------------------------------------


;--------------------------------------------------------- Brick collision Check
brick_collision:
;lower brick y =5
;upper brick y =2

    ;for lower bricks use brick2 array and for upper 
    ; 2COL 2ND  BRICK


;------------------------- row 2 bricks ---------------------------------
.IF (ball_X1>=1 && BALL_X2 <= 13 && (ball_Y==8 || ball_Y==6))  ; 6 is bottom of brick , 5is top
    
        CMP brick1_row2_bool,1
        JE skip1                     ; FOR MULTIPLE CONDITION
    ;   if not run these 
        inc score
        ;debug  mov is temp change color  
        mov brick2_starting_col[0],79 ;seperate arrays for diff rows brick lower row use brick2 array
        mov brick2_ending_col[0],79   ; MOVE IT AWAY 
        mov brick1_row2_bool,1          ;make collision bool 1
        call beep
        cmp ball_Y,8
        Je bounce_off_top_row
        jne bounce_off_bottom_row

        skip1:
.ENDIF 


 .IF ball_X1>=13 && BALL_X2 <= 25 && (ball_Y==6 || ball_Y==8)
        CMP brick2_row2_bool,1
        JE skip2                     ; FOR MULTIPLE CONDITION
    ;   if not run these 
        inc score
        ;debug  mov is temp change color  
        mov brick2_starting_col[1],79 ;seperate arrays for diff rows brick lower row use brick2 array
        mov brick2_ending_col[1],79   ; MOVE IT AWAY 
        mov brick2_row2_bool,1          ;make collision bool 1
        call beep
        cmp ball_Y,8
        Je bounce_off_top_row
        jne bounce_off_bottom_row

        skip2:
.ENDIF 
    
 .IF ball_X1>=25 && BALL_X2 <= 37 && (ball_Y==6 || ball_Y==8)
    ;   check collison bool-  (initially 0)  - if 1 then skip 
  
        CMP brick3_row2_bool,1
        JE skip3                     ; FOR MULTIPLE CONDITION
    ;   if not run these 
        inc score
        ;debug  mov is temp change color  
        mov brick2_starting_col[2],79 ;seperate arrays for diff rows brick lower row use brick2 array
        mov brick2_ending_col[2],79   ; MOVE IT AWAY 
        mov brick3_row2_bool,1          ;make collision bool 1
        call beep
        cmp ball_Y,8
        Je bounce_off_top_row
        jne bounce_off_bottom_row

        skip3:
.ENDIF 

.IF ball_X1>=37 && BALL_X2 <= 49 && (ball_Y==6 || ball_Y==8)
    ;   check collison bool-  (initially 0)  - if 1 then skip 
 
        CMP brick4_row2_bool,1
        JE skip4                   ; FOR MULTIPLE CONDITION
    ;   if not run these 
        inc score
        ;debug  mov is temp change color  
        mov brick2_starting_col[3],79 ;seperate arrays for diff rows brick lower row use brick2 array
        mov brick2_ending_col[3],79   ; MOVE IT AWAY 
        mov brick4_row2_bool,1          ;make collision bool 1
        call beep
        cmp ball_Y,8
        Je bounce_off_top_row
        jne bounce_off_bottom_row
        skip4:
.ENDIF 

.IF ball_X1>=49 && BALL_X2 <= 61 && (ball_Y==6 || ball_Y==8)
        CMP brick5_row2_bool,1
        JE skip5                    ; FOR MULTIPLE CONDITION
    ;   if not run these 
        inc score
        ;debug  mov is temp change color  
        mov brick2_starting_col[4],79 ;seperate arrays for diff rows brick lower row use brick2 array
        mov brick2_ending_col[4],79   ; MOVE IT AWAY 
        mov brick5_row2_bool,1          ;make collision bool 1
        call beep
        cmp ball_Y,8
        Je bounce_off_top_row
        jne bounce_off_bottom_row


        skip5:
.ENDIF 

.IF ball_X1>=61 && BALL_X2 <= 73 && (ball_Y==6 || ball_Y==8)

        collision_level1_4:
        CMP brick6_row2_bool,1
        JE skip6                     ; FOR MULTIPLE CONDITION
    ;   if not run these 
        inc score
        ;debug  mov is temp change color  
        mov brick2_starting_col[5],79 ;seperate arrays for diff rows brick lower row use brick2 array
        mov brick2_ending_col[5],79   ; MOVE IT AWAY 
        mov brick6_row2_bool,1          ;make collision bool 1
        call beep
 
        cmp ball_Y,8
        Je bounce_off_top_row
        jne bounce_off_bottom_row

        skip6:
.ENDIF 


;----------------------------------------------------------
;------------------------- row 1 bricks -------------------
.IF ball_X1>=1 && BALL_X2 <= 13 && (ball_Y==3 || ball_Y==5)
    ;   check collison bool-  (initially 0)  - if 1 then skip 
        CMP brick1_row1_bool,1
        JE skip7                     ; FOR MULTIPLE CONDITION
    ;   if not run these 
        inc score
        ;debug  mov is temp change color  
        mov brick_starting_col[0],79 ;seperate arrays for diff rows brick lower row use brick2 array
        mov brick_ending_col[0],79   ; MOVE IT AWAY 
        mov brick1_row1_bool,1          ;make collision bool 1
        call beep
     
        cmp ball_Y,5
        Je bounce_off_top_row
        jne bounce_off_bottom_row

   
        skip7:
.ENDIF 


 .IF ball_X1>=13 && BALL_X2 <= 25 && (ball_Y==3 || ball_Y==5)
    ;   check collison bool-  (initially 0)  - if 1 then skip 
        CMP brick2_row1_bool,1
        JE skip8                     ; FOR MULTIPLE CONDITION
    ;   if not run these 
        inc score
        ;debug  mov is temp change color  
        mov brick_starting_col[1],79 ;seperate arrays for diff rows brick lower row use brick2 array
        mov brick_ending_col[1],79   ; MOVE IT AWAY 
        mov brick2_row1_bool,1          ;make collision bool 1
        call beep
        cmp ball_Y,5
        Je bounce_off_top_row
        jne bounce_off_bottom_row

        skip8:
.ENDIF 
    
 .IF ball_X1>=25 && BALL_X2 <= 37 && (ball_Y==3 || ball_Y==5)
        CMP brick3_row1_bool,1
        JE skip9                     ; FOR MULTIPLE CONDITION
    ;   if not run these 
        inc score
        ;debug  mov is temp change color  
        mov brick_starting_col[2],79 ;seperate arrays for diff rows brick lower row use brick2 array
        mov brick_ending_col[2],79   ; MOVE IT AWAY 
        mov brick3_row1_bool,1          ;make collision bool 1
        call beep
        cmp ball_Y,5
        Je bounce_off_top_row
        jne bounce_off_bottom_row

        skip9:
.ENDIF 

.IF ball_X1>=37 && BALL_X2 <= 49 && (ball_Y==3 || ball_Y==5)
        CMP brick4_row1_bool,1
        JE skip10                     ; FOR MULTIPLE CONDITION
    ;   if not run these 
        inc score
        ;debug  mov is temp change color  
        mov brick_starting_col[3],79 ;seperate arrays for diff rows brick lower row use brick2 array
        mov brick_ending_col[3],79   ; MOVE IT AWAY 
        mov brick4_row1_bool,1          ;make collision bool 1
        call beep
        cmp ball_Y,5
        Je bounce_off_top_row
        jne bounce_off_bottom_row

        skip10:
.ENDIF 

.IF ball_X1>=49 && BALL_X2 <= 61 && (ball_Y==3 || ball_Y==5)
        CMP brick5_row1_bool,1
        JE skip11                     ; FOR MULTIPLE CONDITION
    ;   if not run these 
        inc score
        ;debug  mov is temp change color  
        mov brick_starting_col[4],79 ;seperate arrays for diff rows brick lower row use brick2 array
        mov brick_ending_col[4],79   ; MOVE IT AWAY 
        mov brick5_row1_bool,1          ;make collision bool 1
        call beep
        cmp ball_Y,5
        Je bounce_off_top_row
        jne bounce_off_bottom_row

        skip11:
.ENDIF 

.IF ball_X1>=61 && BALL_X2 <= 73 && (ball_Y==3 || ball_Y==5)
        CMP brick6_row1_bool,1
        JE skip12                     ; FOR MULTIPLE CONDITION
    ;   if not run these 
        inc score
        ;debug  mov is temp change color  
        mov brick_starting_col[5],79 ;seperate arrays for diff rows brick lower row use brick2 array
        mov brick_ending_col[5],79   ; MOVE IT AWAY 
        mov brick6_row1_bool,1          ;make collision bool 1
        call beep
        cmp ball_Y,5
        Je bounce_off_top_row
        jne bounce_off_bottom_row

        skip12:
.ENDIF 
    ;---------------------------------------------------------


    ; if no condtions are met, dont boucne off 
    jmp skip_collision_detection

    bounce_off_top_row:
        cmp up_right_bool , 1 ; check direction of ball
        je next_down_right ; change direction
        jne next_down_left

    bounce_off_bottom_row:
        cmp down_right_bool , 1 ; check direction of ball
        je next_up_right ; change direction
        jne next_up_left
    
    bounce_off_right_column:
        cmp up_right_bool , 1 ; check direction of ball
        je next_up_left ; change direction
        jne next_down_left

    bounce_off_left_column:
        cmp up_left_bool ,1 ; check direction of ball
        je next_up_right ; change direction
        jne next_down_right    


    next_up_left:
        mov up_left_bool, 1 ; changed direction
        mov up_right_bool , 0 ; Set Previous Direction to False
        mov down_left_bool , 0
        mov down_right_bool , 0
        jmp RUN_DIRECTION

    next_up_right:
        mov up_right_bool, 1 ; changed direction
        mov up_left_bool , 0 ; Set Previous Direction to False
        mov down_left_bool , 0
        mov down_right_bool , 0
        jmp RUN_DIRECTION    

    next_down_left:
        mov down_left_bool , 1 ; change direction
        mov down_right_bool , 0 ; set previous direction to false
        mov up_left_bool, 0 ; changed direction
        mov up_right_bool , 0
        jmp RUN_DIRECTION

    next_down_right:
        
        mov down_right_bool , 1 ; change direction
        mov down_left_bool , 0 ; set previous direction to false
        mov up_left_bool, 0 ; changed direction
        mov up_right_bool , 0
        jmp RUN_DIRECTION    

    
    decrease_life:
        sub LIVES, 1 ; life is lost
        cmp LIVES,0
        jne restore

         mov exit_bool,1  ;exit bool to move out of all loops
         ret; REFRESH GAME MINOR BUG NEEDS TO BE FIXED

        restore:
        ;----------------------------- RESTORE BALL ORIGINAL PLACE
        push ax  ;reg values shouldnt be  lost pus into stack
        push bx
        mov al,36; x1 coordinate
        mov ah,37; x2 coordinate
        mov bl, 24; y coordinate
        mov ball_x1,al
        mov ball_x2,ah
        mov ball_y,bl
        pop bx      ;pop back into registers
        pop ax
        jmp next_up_left
        ;---------------
    skip_collision_detection:
    RUN_DIRECTION:
    ;################# FIRST CHECK FLAGS
    cmp score,12   ;if all bricks break end game
    je exit
    cmp up_right_bool, 1 ; only move in this direction if flag allows it
    je up_right

    cmp up_left_bool, 1 ; only move in this direction if flag allows it
    je up_left

    cmp down_left_bool, 1 ; only move in this direction if flag allows it
    je down_left

    cmp down_right_bool, 1 ; only move in this direction if flag allows it
    je down_right

    up_right:
    ;----------------------------------------
    add ball_X1, al   ;adding to MOVE RIGHT             ######## move up-right
    add ball_X2, al   ;adding tomov right
    sub ball_Y, bl       ;subtracting to move up
    jmp EXIT
    ;------------------------------------------

    up_left:
    ;----------------------------------------
    sub ball_X1, al   ;sub to MOVE left             ######## move up-left
    sub ball_X2, al    ;sub tomov left
    sub ball_Y, bl       ;subtracting to move up
    jmp EXIT
    ;------------------------------------------

    down_left:
    ;----------------------------------------
    sub ball_X1, al   ; subtract to move lft             ######## move Down-left
    sub ball_X2, al   ; subtract to move left
    add ball_Y, bl       ;adding to move down
    jmp EXIT
    ;------------------------------------------

    down_right:
    ;----------------------------------------
    add ball_X1, al   ; add to move right             ######## move Down-Right
    add ball_X2, al   ; add to move right
    add ball_Y, bl       ;adding to move down
    jmp EXIT
    ;------------------------------------------
    

    EXIT:
ret
ballmovement endp 


;------------------------------------------------------------ LEVEL 2 -------------------------------------------------------
;#################################################################################################
ballmovement2 proc
  
  mov al, ball_xvel   ; moving velocity to variable
  mov bl, ball_yvel
    ;---------------------------------------------------- boundry check
    cmp ball_X2 , 73 ; check right most column range
    jge bounce_off_right_column ; ball is going out of range

    cmp ball_X1 , 1 ; check left column range
    jle bounce_off_left_column

    cmp ball_Y , 3 ; check top row
    jle bounce_off_top_row
    ;---------------------------------------------------------

    ;--------------------------------------------------------- Lives Decrement If it goes below Paddle
    cmp ball_y , 27 ; if ball goes below paddle
    jge decrease_life
    ;---------------------------------------------------------
;-------------------------------------------------------------PADDLE COLLISION DETECTION
    mov ch , paddle_X2_level2
    cmp ball_X2 , ch; 31-41 ; lvl3 31-35
    jle next1_level2
    jnle brick_collision
        next1_level2:
            mov ch , paddle_X1_level2
            inc ch
            cmp ball_X1 , ch
            jge next2_level2
            jnge brick_collision
                next2_level2:
                    cmp ball_Y , 25 ; y coordinates
                    jge bounce_off_bottom_row
                    jnge brick_collision

;--------------------------------------------------------- Brick collision Check
brick_collision:
;lower brick y =5
;upper brick y =2

    ;for lower bricks use brick2 array and for upper 
    ; 2COL 2ND  BRICK
;-------------------------------------- row 3------------------------------
.IF ball_X1>=1 && BALL_X2 <= 13 && (ball_Y==10 || ball_Y==12)

       .IF (LEVEL == 2)
        CMP brick1_row3_bool_lvl2,1
       jl collide1                       ;if collision 0 collide   
       JE explode1                       ;if collision 1 explode FOR MULTIPLE CONDITION; FOR MULTIPLE CONDITION
       jg skip1                          ;else skip  
   ;   if not run these 
       .ENDIF 
       
       .IF (LEVEL == 3)
        CMP brick1_row3_bool_lvl2,2
       jl collide1                       ;if collision 2 collide   
       JE explode1                       ;if collision 1 explode FOR MULTIPLE CONDITION; FOR MULTIPLE CONDITION
       jg skip1                          ;else skip  
   ;   if not run these 
       .ENDIF 

        explode1:
       inc score
       ;debug  mov is temp change color  
       mov brick3_starting_col_level2[0],79 ;seperate arrays for diff rows brick lower row use brick2 array
       mov brick3_ending_col_level2[0],79   ; MOVE IT AWAY 
       call beep

       collide1:    
       call beep
       inc brick1_row3_bool_lvl2          ;make collision bool 1
       cmp ball_Y,12
       Je bounce_off_top_row
       jne bounce_off_bottom_row
       
       skip1:
.ENDIF

.IF ball_X1>=13 && BALL_X2 <= 25 && (ball_Y==10 || ball_Y==12)

       .IF (LEVEL == 2)
            CMP brick2_row3_bool_lvl2,1
       jl collide2                       ;if collision 0 collide   
       JE explode2                       ;if collision 1 explode FOR MULTIPLE CONDITION; FOR MULTIPLE CONDITION
       jg skip2                          ;else skip  
   ;   if not run these 
       .ENDIF 
       
       .IF (LEVEL == 3)
            CMP brick2_row3_bool_lvl2,2
       jl collide2                      ;if collision 2 collide   
       JE explode2                       ;if collision 1 explode FOR MULTIPLE CONDITION; FOR MULTIPLE CONDITION
       jg skip2                          ;else skip  
   ;   if not run these 
       .ENDIF 

        explode2:
       inc score
       ;debug  mov is temp change color  
       mov brick3_starting_col_level2[1],79 ;seperate arrays for diff rows brick lower row use brick2 array
       mov brick3_ending_col_level2[1],79   ; MOVE IT AWAY 
       call beep

       collide2:    
       call beep
       inc brick2_row3_bool_lvl2          ;make collision bool 1
       cmp ball_Y,12
       Je bounce_off_top_row
       jne bounce_off_bottom_row
       
       skip2:
.ENDIF

.IF (LEVEL == 3) ; only collide with fixed bricks in level3 

    .IF ball_X1>=25 && BALL_X2 <= 37 && (ball_Y==10 || ball_Y==12)
;        inc score

        call beep
        cmp ball_Y,12
        Je bounce_off_top_row
        jne bounce_off_bottom_row

        
    .ENDIF 

    .IF ball_X1>=37 && BALL_X2 <= 49 && (ball_Y==10 || ball_Y==12)
;        inc score

        call beep
        cmp ball_Y,12
        Je bounce_off_top_row
        jne bounce_off_bottom_row

        
    .ENDIF 

.ENDIF


.IF ball_X1>=49 && BALL_X2 <= 61 && (ball_Y==10 || ball_Y==12)

       .IF (LEVEL == 2)
            CMP brick3_row3_bool_lvl2,1
       jl collide3                       ;if collision 0 collide   
       JE explode3                       ;if collision 1 explode FOR MULTIPLE CONDITION; FOR MULTIPLE CONDITION
       jg skip3                          ;else skip  
   ;   if not run these 
       .ENDIF 
       
       .IF (LEVEL == 3)
            CMP brick3_row3_bool_lvl2,2
       jl collide3                       ;if collision 2 collide   
       JE explode3                       ;if collision 1 explode FOR MULTIPLE CONDITION; FOR MULTIPLE CONDITION
       jg skip3                          ;else skip  
   ;   if not run these 
       .ENDIF 

        explode3:
       inc score
       ;debug  mov is temp change color  
       mov brick3_starting_col_level2[2],79 ;seperate arrays for diff rows brick lower row use brick2 array
       mov brick3_ending_col_level2[2],79   ; MOVE IT AWAY 
       call beep

       collide3:    
       call beep
       inc brick3_row3_bool_lvl2          ;make collision bool 1
       cmp ball_Y,12
       Je bounce_off_top_row
       jne bounce_off_bottom_row
       
       skip3:
.ENDIF

.IF ball_X1>=61 && BALL_X2 <= 73 && (ball_Y==10 || ball_Y==12)

       .IF (LEVEL == 2)
            CMP brick4_row3_bool_lvl2,1
       jl collide4                       ;if collision 0 collide   
       JE explode4                       ;if collision 1 explode FOR MULTIPLE CONDITION; FOR MULTIPLE CONDITION
       jg skip4                          ;else skip  
   ;   if not run these 
       .ENDIF 
       
       .IF (LEVEL == 3)
            CMP brick4_row3_bool_lvl2,2
       jl collide4                       ;if collision 2 collide   
       JE explode4                       ;if collision 1 explode FOR MULTIPLE CONDITION; FOR MULTIPLE CONDITION
       jg skip4                         ;else skip  
   ;   if not run these 
       .ENDIF 

        explode4:
       inc score
       ;debug  mov is temp change color  
       mov brick3_starting_col_level2[3],79 ;seperate arrays for diff rows brick lower row use brick2 array
       mov brick3_ending_col_level2[3],79   ; MOVE IT AWAY 
       call beep

       collide4:    
       call beep
       inc brick4_row3_bool_lvl2          ;make collision bool 1
       cmp ball_Y,12
       Je bounce_off_top_row
       jne bounce_off_bottom_row
       
       skip4:
.ENDIF
;---------------------------------------- row 2 ---------------------------------------


.IF ball_X1>=1 && BALL_X2 <= 13 && (ball_Y==6 || ball_Y==8)
;if collision 0 collide 
;if collision 1 explode FOR MULTIPLE CONDITION
;else skip
       .IF (LEVEL == 2)
        CMP brick1_row2_bool_lvl2,1
       jl collide5                       ;if collision 0 collide   
       JE explode5                       ;if collision 1 explode FOR MULTIPLE CONDITION; FOR MULTIPLE CONDITION
       jg skip5                          ;else skip  
   ;   if not run these 
       .ENDIF 
       
       .IF (LEVEL == 3)
            CMP brick1_row2_bool_lvl2,2
       jl collide5                       ;if collision 2 collide   
       JE explode5                       ;if collision 1 explode FOR MULTIPLE CONDITION; FOR MULTIPLE CONDITION
       jg skip5                          ;else skip  
   ;   if not run these 
       .ENDIF  

        explode5:
       inc score
       ;debug  mov is temp change color  
       mov brick2_starting_col_level2[0],79 ;seperate arrays for diff rows brick lower row use brick2 array
       mov brick2_ending_col_level2[0],79   ; MOVE IT AWAY 
       call beep

       collide5:    
       call beep
       inc brick1_row2_bool_lvl2          ;make collision bool 1
       cmp ball_Y,8
       Je bounce_off_top_row
       jne bounce_off_bottom_row
       
       skip5:
.ENDIF

.IF ball_X1>=13 && BALL_X2 <= 25 && (ball_Y==6 || ball_Y==8)
;if collision 0 collide 
;if collision 1 explode FOR MULTIPLE CONDITION
;else skip
       .IF (LEVEL == 2)
            CMP brick2_row2_bool_lvl2,1
       jl collide6                       ;if collision 0 collide   
       JE explode6                       ;if collision 1 explode FOR MULTIPLE CONDITION; FOR MULTIPLE CONDITION
       jg skip6                          ;else skip  
   ;   if not run these 
       .ENDIF 
       
       .IF (LEVEL == 3)
            CMP brick2_row2_bool_lvl2,2
       jl collide6                       ;if collision 2 collide   
       JE explode6                       ;if collision 1 explode FOR MULTIPLE CONDITION; FOR MULTIPLE CONDITION
       jg skip6                          ;else skip  
   ;   if not run these 
       .ENDIF 

    explode6:
       inc score
       ;debug  mov is temp change color  
       mov brick2_starting_col_level2[1],79 ;seperate arrays for diff rows brick lower row use brick2 array
       mov brick2_ending_col_level2[1],79   ; MOVE IT AWAY 
       call beep

       collide6:    
       call beep
       inc brick2_row2_bool_lvl2          ;make collision bool 1
       cmp ball_Y,8
       Je bounce_off_top_row
       jne bounce_off_bottom_row
       
       skip6:
.ENDIF 

.IF ball_X1>=25 && BALL_X2 <= 37 && (ball_Y==6 || ball_Y==8)
;if collision 0 collide 
;if collision 1 explode FOR MULTIPLE CONDITION
;else skip
       .IF (LEVEL == 2)
        CMP brick3_row2_bool_lvl2,1
       jl collide7                       ;if collision 0 collide   
       JE explode7                       ;if collision 1 explode FOR MULTIPLE CONDITION; FOR MULTIPLE CONDITION
       jg skip7                          ;else skip  
   ;   if not run these 
       .ENDIF 
       
       .IF (LEVEL == 3)
            CMP brick3_row2_bool_lvl2,2
       jl collide7                       ;if collision 2 collide   
       JE explode7                       ;if collision 1 explode FOR MULTIPLE CONDITION; FOR MULTIPLE CONDITION
       jg skip7                          ;else skip  
   ;   if not run these 
       .ENDIF 

      explode7:
       inc score
       ;debug  mov is temp change color  
       mov brick2_starting_col_level2[2],79 ;seperate arrays for diff rows brick lower row use brick2 array
       mov brick2_ending_col_level2[2],79   ; MOVE IT AWAY 
       call beep

       collide7:    
       call beep
       inc brick3_row2_bool_lvl2          ;make collision bool 1
       cmp ball_Y,8
       Je bounce_off_top_row
       jne bounce_off_bottom_row
       
       skip7:
.ENDIF

.IF ball_X1>=37 && BALL_X2 <= 49 && (ball_Y==6 || ball_Y==8)
;if collision 0 collide 
;if collision 1 explode FOR MULTIPLE CONDITION
;else skip
       .IF (LEVEL == 2)
            CMP brick4_row2_bool_lvl2,1
       jl collide8                       ;if collision 0 collide   
       JE explode8                       ;if collision 1 explode FOR MULTIPLE CONDITION; FOR MULTIPLE CONDITION
       jg skip8                          ;else skip  
   ;   if not run these 
       .ENDIF 
       
       .IF (LEVEL == 3)
            CMP brick4_row2_bool_lvl2,2
       jl collide8                       ;if collision 2 collide   
       JE explode8                       ;if collision 1 explode FOR MULTIPLE CONDITION; FOR MULTIPLE CONDITION
       jg skip8                          ;else skip  
   ;   if not run these 
       .ENDIF 

      explode8:
       inc score
       ;debug  mov is temp change color  
       mov brick2_starting_col_level2[3],79 ;seperate arrays for diff rows brick lower row use brick2 array
       mov brick2_ending_col_level2[3],79   ; MOVE IT AWAY 
       call beep

       collide8:    
       call beep
       inc brick4_row2_bool_lvl2          ;make collision bool 1
       cmp ball_Y,8
       Je bounce_off_top_row
       jne bounce_off_bottom_row
       
       skip8:
.ENDIF

.IF ball_X1>=49 && BALL_X2 <= 61 && (ball_Y==6 || ball_Y==8)
;if collision 0 collide 
;if collision 1 explode FOR MULTIPLE CONDITION
;else skip
      .IF (LEVEL == 2)
            CMP brick5_row2_bool_lvl2,1
       jl collide9                       ;if collision 0 collide   
       JE explode9                       ;if collision 1 explode FOR MULTIPLE CONDITION; FOR MULTIPLE CONDITION
       jg skip9                          ;else skip  
   ;   if not run these 
       .ENDIF 
       
       .IF (LEVEL == 3)
            CMP brick5_row2_bool_lvl2,2
       jl collide9                       ;if collision 2 collide   
       JE explode9                       ;if collision 1 explode FOR MULTIPLE CONDITION; FOR MULTIPLE CONDITION
       jg skip9                          ;else skip  
   ;   if not run these 
       .ENDIF 

      explode9:
       inc score
       ;debug  mov is temp change color  
       mov brick2_starting_col_level2[4],79 ;seperate arrays for diff rows brick lower row use brick2 array
       mov brick2_ending_col_level2[4],79   ; MOVE IT AWAY 
       call beep

       collide9:    
       call beep
       inc brick5_row2_bool_lvl2          ;make collision bool 1
       cmp ball_Y,8
       Je bounce_off_top_row
       jne bounce_off_bottom_row
       
       skip9:
.ENDIF

.IF ball_X1>=61 && BALL_X2 <= 73 && (ball_Y==6 || ball_Y==8)
;if collision 0 collide 
;if collision 1 explode FOR MULTIPLE CONDITION
;else skip
       .IF (LEVEL == 2)
            CMP brick6_row2_bool_lvl2,1
       jl collide10                       ;if collision 0 collide   
       JE explode10                       ;if collision 1 explode FOR MULTIPLE CONDITION; FOR MULTIPLE CONDITION
       jg skip10                          ;else skip  
   ;   if not run these 
       .ENDIF 
       
       .IF (LEVEL == 3)
            CMP brick6_row2_bool_lvl2,2
       jl collide10                       ;if collision 2 collide   
       JE explode10                       ;if collision 1 explode FOR MULTIPLE CONDITION; FOR MULTIPLE CONDITION
       jg skip10                          ;else skip  
   ;   if not run these 
       .ENDIF 
   ;   if not run these 

      explode10:
       inc score
       ;debug  mov is temp change color  
       mov brick2_starting_col_level2[5],79 ;seperate arrays for diff rows brick lower row use brick2 array
       mov brick2_ending_col_level2[5],79   ; MOVE IT AWAY 
       call beep

       collide10:    
       call beep
       inc brick6_row2_bool_lvl2          ;make collision bool 1
       cmp ball_Y,8
       Je bounce_off_top_row
       jne bounce_off_bottom_row
       
       skip10:
.ENDIF

;---------------------------------------- row 1 ---------------------------------------


.IF ball_X1>=1 && BALL_X2 <= 13 && (ball_Y==3 || ball_Y==5)
;if collision 0 collide 
;if collision 1 explode FOR MULTIPLE CONDITION
;else skip
       .IF (LEVEL == 2)
            CMP brick1_row1_bool_lvl2,1
       jl collide11                       ;if collision 0 collide   
       JE explode11                       ;if collision 1 explode FOR MULTIPLE CONDITION; FOR MULTIPLE CONDITION
       jg skip11                          ;else skip  
   ;   if not run these 
       .ENDIF 
       
       .IF (LEVEL == 3)
            CMP brick1_row1_bool_lvl2,2
       jl collide11                       ;if collision 2 collide   
       JE explode11                       ;if collision 1 explode FOR MULTIPLE CONDITION; FOR MULTIPLE CONDITION
       jg skip11                          ;else skip  
   ;   if not run these 
       .ENDIF  

        explode11:
       inc score
       ;debug  mov is temp change color  
       mov brick_starting_col_level2[0],79 ;seperate arrays for diff rows brick lower row use brick2 array
       mov brick_ending_col_level2[0],79   ; MOVE IT AWAY 
       call beep

       collide11:    
       call beep
       inc brick1_row1_bool_lvl2          ;make collision bool 1
       cmp ball_Y,5
       Je bounce_off_top_row
       jne bounce_off_bottom_row
       
       skip11:
.ENDIF

.IF ball_X1>=13 && BALL_X2 <= 25 && (ball_Y==3 || ball_Y==5)
;if collision 0 collide 
;if collision 1 explode FOR MULTIPLE CONDITION
;else skip
       .IF (LEVEL == 2)
            CMP brick2_row1_bool_lvl2,1
       jl collide12                       ;if collision 0 collide   
       JE explode12                       ;if collision 1 explode FOR MULTIPLE CONDITION; FOR MULTIPLE CONDITION
       jg skip12                          ;else skip  
   ;   if not run these 
       .ENDIF 
       
       .IF (LEVEL == 3)
            CMP brick2_row1_bool_lvl2,2
       jl collide12                       ;if collision 2 collide   
       JE explode12                       ;if collision 1 explode FOR MULTIPLE CONDITION; FOR MULTIPLE CONDITION
       jg skip12                          ;else skip  
   ;   if not run these 
       .ENDIF 

    explode12:
       inc score
       ;debug  mov is temp change color  
       mov brick_starting_col_level2[1],79 ;seperate arrays for diff rows brick lower row use brick2 array
       mov brick_ending_col_level2[1],79   ; MOVE IT AWAY 
       call beep

       collide12:    
       call beep
       inc brick2_row1_bool_lvl2          ;make collision bool 1
       cmp ball_Y,5
       Je bounce_off_top_row
       jne bounce_off_bottom_row
       
       skip12:
.ENDIF 

.IF ball_X1>=25 && BALL_X2 <= 37 && (ball_Y==3 || ball_Y==5)
;if collision 0 collide 
;if collision 1 explode FOR MULTIPLE CONDITION
;else skip
       .IF (LEVEL == 2)
            CMP brick3_row1_bool_lvl2,1
       jl collide13                       ;if collision 0 collide   
       JE explode13                       ;if collision 1 explode FOR MULTIPLE CONDITION; FOR MULTIPLE CONDITION
       jg skip13                          ;else skip  
   ;   if not run these 
       .ENDIF 
       
       .IF (LEVEL == 3)
            CMP brick3_row1_bool_lvl2,2
       jl collide13                       ;if collision 2 collide   
       JE explode13                       ;if collision 1 explode FOR MULTIPLE CONDITION; FOR MULTIPLE CONDITION
       jg skip13                          ;else skip  
   ;   if not run these 
       .ENDIF 

      explode13:
       inc score
       ;debug  mov is temp change color  
       mov brick_starting_col_level2[2],79 ;seperate arrays for diff rows brick lower row use brick2 array
       mov brick_ending_col_level2[2],79   ; MOVE IT AWAY 
       call beep

       collide13:    
       call beep
       inc brick3_row1_bool_lvl2          ;make collision bool 1
       cmp ball_Y,5
       Je bounce_off_top_row
       jne bounce_off_bottom_row
       
       skip13:
.ENDIF

.IF ball_X1>=37 && BALL_X2 <= 49 && (ball_Y==3 || ball_Y==5)
;if collision 0 collide 
;if collision 1 explode FOR MULTIPLE CONDITION
;else skip
       .IF (LEVEL == 2)
            CMP brick4_row1_bool_lvl2,1
       jl collide14                       ;if collision 0 collide   
       JE explode14                       ;if collision 1 explode FOR MULTIPLE CONDITION; FOR MULTIPLE CONDITION
       jg skip14                          ;else skip  
   ;   if not run these 
       .ENDIF 
       
       .IF (LEVEL == 3)
            CMP brick4_row1_bool_lvl2,2
       jl collide14                       ;if collision 2 collide   
       JE explode14                       ;if collision 1 explode FOR MULTIPLE CONDITION; FOR MULTIPLE CONDITION
       jg skip14                          ;else skip  
   ;   if not run these 
       .ENDIF 
   ;   if not run these 

      explode14:
       inc score
       ;debug  mov is temp change color  
       mov brick_starting_col_level2[3],79 ;seperate arrays for diff rows brick lower row use brick2 array
       mov brick_ending_col_level2[3],79   ; MOVE IT AWAY 
       call beep

       collide14:    
       call beep
       inc brick4_row1_bool_lvl2          ;make collision bool 1
       cmp ball_Y,5
       Je bounce_off_top_row
       jne bounce_off_bottom_row
       
       skip14:
.ENDIF

.IF ball_X1>=49 && BALL_X2 <= 61 && (ball_Y==3 || ball_Y==5)
;if collision 0 collide 
;if collision 1 explode FOR MULTIPLE CONDITION
;else skip
       .IF (LEVEL == 2)
            CMP brick5_row1_bool_lvl2,1
       jl collide15                       ;if collision 0 collide   
       JE explode15                       ;if collision 1 explode FOR MULTIPLE CONDITION; FOR MULTIPLE CONDITION
       jg skip15                          ;else skip  
   ;   if not run these 
       .ENDIF 
       
       .IF (LEVEL == 3)
            CMP brick5_row1_bool_lvl2,2
       jl collide15                       ;if collision 2 collide   
       JE explode15                       ;if collision 1 explode FOR MULTIPLE CONDITION; FOR MULTIPLE CONDITION
       jg skip15                          ;else skip  
   ;   if not run these 
       .ENDIF  

      explode15:
       inc score
       ;debug  mov is temp change color  
       mov brick_starting_col_level2[4],79 ;seperate arrays for diff rows brick lower row use brick2 array
       mov brick_ending_col_level2[4],79   ; MOVE IT AWAY 
       call beep

       collide15:    
       call beep
       inc brick5_row1_bool_lvl2          ;make collision bool 1
       cmp ball_Y,5
       Je bounce_off_top_row
       jne bounce_off_bottom_row
       
       skip15:
.ENDIF

.IF ball_X1>=61 && BALL_X2 <= 73 && (ball_Y==3 || ball_Y==5)
;if collision 0 collide 
;if collision 1 explode FOR MULTIPLE CONDITION
;else skip
       .IF (LEVEL == 2)
            CMP brick6_row1_bool_lvl2,1
       jl collide16                       ;if collision 0 collide   
       JE explode16                       ;if collision 1 explode FOR MULTIPLE CONDITION; FOR MULTIPLE CONDITION
       jg skip16                          ;else skip  
   ;   if not run these 
       .ENDIF 
       
       .IF (LEVEL == 3)
            CMP brick6_row1_bool_lvl2,2
       jl collide16                       ;if collision 2 collide   
       JE explode16                       ;if collision 1 explode FOR MULTIPLE CONDITION; FOR MULTIPLE CONDITION
       jg skip16                          ;else skip  
   ;   if not run these 
       .ENDIF 

      explode16:
       inc score
       ;debug  mov is temp change color  
       mov brick_starting_col_level2[5],79 ;seperate arrays for diff rows brick lower row use brick2 array
       mov brick_ending_col_level2[5],79   ; MOVE IT AWAY 
       call beep

       collide16:    
       call beep
       inc brick6_row1_bool_lvl2          ;make collision bool 1
       cmp ball_Y,5
       Je bounce_off_top_row
       jne bounce_off_bottom_row
       
       skip16:
.ENDIF


    ;---------------------------------------------------------


    ; if no condtions are met, dont boucne off 
    jmp skip_collision_detection

    bounce_off_top_row:
        cmp up_right_bool , 1 ; check direction of ball
        je next_down_right ; change direction
        jne next_down_left

    bounce_off_bottom_row:
        cmp down_right_bool , 1 ; check direction of ball
        je next_up_right ; change direction
        jne next_up_left
    
    bounce_off_right_column:
        cmp up_right_bool , 1 ; check direction of ball
        je next_up_left ; change direction
        jne next_down_left

    bounce_off_left_column:
        cmp up_left_bool ,1 ; check direction of ball
        je next_up_right ; change direction
        jne next_down_right    


    next_up_left:
        mov up_left_bool, 1 ; changed direction
        mov up_right_bool , 0 ; Set Previous Direction to False
        mov down_left_bool , 0
        mov down_right_bool , 0
        jmp RUN_DIRECTION

    next_up_right:
        mov up_right_bool, 1 ; changed direction
        mov up_left_bool , 0 ; Set Previous Direction to False
        mov down_left_bool , 0
        mov down_right_bool , 0
        jmp RUN_DIRECTION    

    next_down_left:
        mov down_left_bool , 1 ; change direction
        mov down_right_bool , 0 ; set previous direction to false
        mov up_left_bool, 0 ; changed direction
        mov up_right_bool , 0
        jmp RUN_DIRECTION

    next_down_right:
        
        mov down_right_bool , 1 ; change direction
        mov down_left_bool , 0 ; set previous direction to false
        mov up_left_bool, 0 ; changed direction
        mov up_right_bool , 0
        jmp RUN_DIRECTION    

    
    decrease_life:
        
        sub LIVES, 1 ; life is lost
        cmp LIVES,0
        jne restore2

         mov exit_bool,1  ;exit bool to move out of all loops
         ret; REFRESH GAME MINOR BUG NEEDS TO BE FIXED

        restore2:
        ;----------------------------- RESTORE BALL ORIGINAL PLACE
        push ax  ;reg values shouldnt be  lost pus into stack
        push bx
        mov al,36; x1 coordinate
        mov ah,37; x2 coordinate
        mov bl, 24; y coordinate
        mov ball_x1,al
        mov ball_x2,ah
        mov ball_y,bl
        pop bx      ;pop back into registers
        pop ax
        jmp next_up_left
        ;---------------
    skip_collision_detection:
    RUN_DIRECTION:
    ;################# FIRST CHECK FLAGS
    .if level==2
    cmp score,28   ;if all bricks break end game
    je exit
    .endif

    .if level==3
    cmp score,44   ;if all bricks break end game
    je exit
    .endif

 cmp up_left_bool, 1 ; only move in this direction if flag allows it
 je up_left

    cmp up_right_bool, 1 ; only move in this direction if flag allows it
    je up_right


    cmp down_left_bool, 1 ; only move in this direction if flag allows it
    je down_left

    cmp down_right_bool, 1 ; only move in this direction if flag allows it
    je down_right

    up_right:
    ;----------------------------------------
    add ball_X1, al   ;adding to MOVE RIGHT             ######## move up-right
    add ball_X2, al   ;adding tomov right
    sub ball_Y, bl       ;subtracting to move up
    jmp EXIT
    ;------------------------------------------

    up_left:
    ;----------------------------------------
    sub ball_X1, al   ;sub to MOVE left             ######## move up-left
    sub ball_X2, al    ;sub tomov left
    sub ball_Y, bl       ;subtracting to move up
    jmp EXIT
    ;------------------------------------------

    down_left:
    ;----------------------------------------
    sub ball_X1, al   ; subtract to move lft             ######## move Down-left
    sub ball_X2, al   ; subtract to move left
    add ball_Y, bl       ;adding to move down
    jmp EXIT
    ;------------------------------------------

    down_right:
    ;----------------------------------------
    add ball_X1, al   ; add to move right             ######## move Down-Right
    add ball_X2, al   ; add to move right
    add ball_Y, bl       ;adding to move down
    jmp EXIT
    ;------------------------------------------
    

    EXIT:
ret
ballmovement2 endp 

;############################# ball make and movement ########################### 

drawball proc
;drawing ball
mov ah, 6
mov al, 0
mov bh, 1110B     ;color
mov ch, ball_Y     ;top row of window
mov cl, ball_X1     ;left most column of window
mov dh, ball_Y     ;Bottom row of window
mov dl, ball_X2     ;Right most column of window
INT 10H   
ret
drawball endp

  
delay proc uses ax bx cx dx si di                ;requires delaytime
      
      cmp delaytime,0
      je delay_exit_12

      mov si,0
      loopdel:
            mov cx,2000
            loop $
            inc si
            .IF (LEVEL == 2 || LEVEL == 3)
                jmp fast
            .ENDIF
            ;je fast 
            jmp slow

            fast: ; level2 and 3
            mov dx, delaytime_level2
            cmp si,dx
            jle loopdel

            jmp delay_exit_12

            slow: ; level1 ball speed
            mov dx,delaytime
            cmp si,dx
            jle loopdel

      delay_exit_12:
      
      
        

ret                ;Return to caller
delay endp             ;end of function
;----------------------------------------------------------------------------------------- SOUND BEEP 
beep proc
        push ax
        push bx
        push cx
        push dx
        mov     al, 182         ; Prepare the speaker for the
        out     43h, al         ;  note.
        mov     ax, 2000      ; Frequency number (in decimal)
                                ;  for middle C.
        out     42h, al         ; Output low byte.
        mov     al, ah          ; Output high byte.
        out     42h, al 
        in      al, 61h         ; Turn on note (get value from
                                ;  port 61h).
        or      al, 00000011b   ; Set bits 1 and 0.
        out     61h, al         ; Send new value.
        mov     bx, 2          ; Pause for duration of note.
pause1:
        mov     cx, 65535
pause2:
        dec     cx
        jne     pause2
        dec     bx
        jne     pause1
        in      al, 61h         ; Turn off note (get value from
                                ;  port 61h).
        and     al, 11111100b   ; Reset bits 1 and 0.
        out     61h, al         ; Send new value.

        pop dx
        pop cx
        pop bx
        pop ax

ret
beep endp
;--------------------------------------------------------------------------------------------------
;########################################## instructions ###########################################

instruction_screen PROC

  mov ah, 0
  mov al, 12h  
  int 10h
;print start
   mov ah,2
   mov dh,12
   mov dl,20
   mov bh,0
   int 10h

   mov dx, offset inst_txt1
   mov ah, 9
   int 21h

   ;print start
      mov ah,2
      mov dh, 15
      mov dl, 20
      mov bh,0
      int 10h
      mov dx, offset inst_txt2
      mov ah, 9
   int 21h

   ;print start
      mov ah,2
      mov dh, 18
      mov dl, 20
      mov bh,0
      int 10h
     
      mov dx, offset inst_txt3
      mov ah, 9
      int 21h


    keY1:
        mov ah,1
        int 16h
        mov ah,0
        int 16h
        cmp AL, 27
        je EXIT_inst
    jmp key1

    EXIT_inst:
RET
instruction_screen endp

;#################################################   game screen     ####################################
;game opening screen proc

gamescreen PROC 

    ;Clear screen
    mov ax, 3
    int 10h
    ;--------------
    mov ah, 0 ; Set Video Mode
    mov al, 12h    
    int 10h

    mov ah,6 ; Drawing paddle
    mov al,0
    mov bh, 8 ; GRAY
    mov ch, 26 ; top row
    mov cl, paddle_X1 ; left-most column
    mov dh, 26 ; bottom row
    mov dl, paddle_X2 ; bottom column
    int 10h ;
    ;drawing ball
    ;---------------------set default vlaues of ball starting postion !!!!!!!!!!!!!!!!!!!! FIX THIS CODE
    mov ball_X1, 36
    mov ball_X2, 37
    mov ball_Y, 24
    mov up_right_bool, 0 ; true
    mov up_left_bool, 1 ; true
    mov down_right_bool, 0 ; true
    mov down_left_bool, 0 ; true   
    ;---------------------
    CALL drawball
    
    ; setting cursor position for text
     mov ah,2
     mov dh,15 ;row
     mov dl,24 ;col
     mov bh,0 ; video page does nothing dont cher char
    int 10h

    ;output text "press space for game start"
    mov dx, offset game_txt
    mov ah, 9
    int 21h
 
 ;menu space to start game
     l1:
      mov ah,1
      int 16h
      mov ah,0
      int 16h
      cmp al,' '
      je exit ; start game
      jmp l1; else dont start game


  exit:
    RET
gamescreen ENDP


gameover PROC 

    ;Clear screen
    mov ax, 3
    int 10h
    ;--------------
    mov ah, 0 ; Set Video Mode
    mov al, 12h    
    int 10h


    mov ah,6 ; Drawing paddle
    mov al,0
    mov bh, 8 ; GRAY
    mov ch, 26 ; top row
    mov cl, paddle_X1 ; left-most column
    mov dh, 26 ; bottom row
    mov dl, paddle_X2 ; bottom column
    int 10h ;
    ;drawing ball
    ;---------------------set default vlaues of ball starting p
    mov ball_X1, 36
    mov ball_X2, 37
    mov ball_Y, 24
    mov up_right_bool, 0 ; true
    mov up_left_bool, 1 ; true
    mov down_right_bool, 0 ; true
    mov down_left_bool, 0 ; true   
    ;---------------------
    CALL drawball
    
    ; setting cursor position for text
     mov ah,2
     mov dh,15;row
     mov dl,28 ;col
     mov bh,0 ; video page does nothing dont cher char
    int 10h

    ;output text " game over"
    mov dx, offset gameover_txt
    mov ah, 9
    int 21h
  
     ; setting cursor position for text
     mov ah,2
     mov dh,16 ;row
     mov dl,23 ;col
     mov bh,0 ; video page does nothing dont cher char
    int 10h
    ;output text "press space for game over"
    mov dx, offset gameover2_txt
    mov ah, 9
    int 21h
 
     mov sndfreq,1200
    mov delaytime,175
    call BALLGAMEOVERSOUND
    mov sndfreq, 1450
     mov delaytime, 175
    call BALLGAMEOVERSOUND
    mov sndfreq, 1950
      mov delaytime, 150
    call BALLGAMEOVERSOUND
    mov sndfreq, 2950
     mov delaytime, 600
    call BALLGAMEOVERSOUND

 ;menu space to start game
     l1:
      mov ah,1
      int 16h
     ; jnz sound
      mov ah,0
      int 16h

      cmp al,' '
      je exit ; start game
      jmp l1; else dont start game
         

  exit:
    RET
gameover ENDP


;################################################ level 2 ##########################################
level2_menu  PROC 
      ;Clear screen
  mov ax, 3
  int 10h
  ;--------------
  mov ah, 0 ; Set Video Mode
  mov al, 12h    
  int 10h
  mov ah,6 ; Drawing paddle
  mov al,0
  mov bh, 8 ; GRAY
  mov ch, 26 ; top row
  mov cl, paddle_X1 ; left-most column
  mov dh, 26 ; bottom row
  mov dl, paddle_X2 ; bottom column
  int 10h ;
  ;drawing ball
  ;---------------------set default vlaues of ball starting
  mov ball_X1, 36
  mov ball_X2, 37
  mov ball_Y, 24
  mov up_right_bool, 0 ; true
  mov up_left_bool, 1 ; tr                                                                                                                                                                                                                                              ue
  mov down_right_bool, 0 ; true
  mov down_left_bool, 0 ; true   
  ;---------------------
  CALL drawball
  
  ; setting cursor position for text
   mov ah,2
   mov dh,15 ;row
   mov dl,24 ;col
   mov bh,0 ; video page does nothing dont cher char
  int 10h
  ;output text "press space for game start"
  mov dx, offset level2_1txt
  mov ah, 9
  int 21h

  ; setting cursor position for text
   mov ah,2
   mov dh,17 ;row
   mov dl,24 ;col
   mov bh,0 ; video page does nothing dont cher char
  int 10h
  ;output text "press space for game start"
  mov dx, offset level2_2txt
  mov ah, 9
  int 21h
;menu space to start game
   l1:
    mov ah,1
    int 16h
    mov ah,0
    int 16h
    cmp al,' '
    je exit ; start game
    jmp l1; else dont start game
exit:
    RET
level2_menu  ENDP

;################################################ level 3 Menu ##########################################
level3_menu  PROC 
      ;Clear screen
  mov ax, 3
  int 10h
  ;--------------
  mov ah, 0 ; Set Video Mode
  mov al, 12h    
  int 10h
  mov ah,6 ; Drawing paddle
  mov al,0
  mov bh, 8 ; GRAY
  mov ch, 26 ; top row
  mov cl, paddle_X1_level2 ; left-most column
  mov dh, 26 ; bottom row
  mov dl, paddle_X2_level2 ; bottom column
  int 10h ;
  ;drawing ball
  ;---------------------set default vlaues of ball starting
  mov ball_X1, 36
  mov ball_X2, 37
  mov ball_Y, 24
  mov up_right_bool, 0 ; true
  mov up_left_bool, 1 ; true
  mov down_right_bool, 0 ; true
  mov down_left_bool, 0 ; true   
  ;---------------------
  CALL drawball
  
  ; setting cursor position for text
   mov ah,2
   mov dh,15 ;row
   mov dl,24 ;col
   mov bh,0 ; video page does nothing dont cher char
  int 10h
  ;output text "press space for game start"
  mov dx, offset level3_1txt
  mov ah, 9
  int 21h

  ; setting cursor position for text
   mov ah,2
   mov dh,17 ;row
   mov dl,24 ;col
   mov bh,0 ; video page does nothing dont cher char
  int 10h
  ;output text "press space for game start"
  mov dx, offset level3_2txt
  mov ah, 9
  int 21h
;menu space to start game
   l1:
    mov ah,1
    int 16h
    mov ah,0
    int 16h
    cmp al,' '
    je exit ; start game
    jmp l1; else dont start game
exit:
    RET
level3_menu  ENDP








hide proc
 mov ah,6 ; Drawing paddle
 mov al,0
 mov bh, 0 ; RED
 mov ch, 4 ; top row
 mov cl, 79 ; left-most column
 mov dh, 4 ; bottom row
 mov dl, 79 ; bottom column
 int 10h ;

 mov ah,6 ; Drawing paddle
 mov al,0
 mov bh, 0 ; RED
 mov ch, 7 ; top row
 mov cl, 79 ; left-most column
 mov dh, 7 ; bottom row
 mov dl, 79 ; bottom column
 int 10h

 mov ah,6 ; Drawing paddle
 mov al,0
 mov bh, 0 ; RED
 mov ch, 11 ; top row
 mov cl, 79 ; left-most column
 mov dh, 11 ; bottom row
 mov dl, 79 ; bottom column
 int 10h 
ret 
hide endp


score_output proc

OUTPUT:
    mov dx, 0
	MOV AX, score
	MOV Bx, 10
	L1:
          mov dx, 0
		CMP Ax, 0
		JE DISP
		DIV Bx
		MOV cx, dx
		PUSH CX
		inc counter
		MOV AH, 0
		JMP L1

DISP:
	CMP counter, 0
	JE EXIT
	POP DX
	ADD DX, 48
	MOV AH, 02H
	INT 21H
	dec counter
	JMP DISP

EXIT:
ret
score_output endp


BALLGAMEOVERSOUND PROC
    mov     al, 182         ; Prepare the speaker for the note
    out     43h, al
    mov     ax, sndfreq        ; Frequency number (in decimal) ----  increase for heavier voice
    out     42h, al         ; Output low byte.
    mov     al, ah          ; Output high byte.
    out     42h, al 
    in      al, 61h

  ;Start the sound
  in al, 61h
  or al, 3h    ;Set bit 0 (PIT to speaker) and bit 1 (Speaker enable)
  out 61h, al

 ;mov delaytime,175
  call delay

  ;Stop the sound
  in al, 61h
  and al, 0fch    ;Clear bit 0 (PIT to speaker) and bit 1 (Speaker enable)
  out 61h, al
  ret
BALLGAMEOVERSOUND ENDP

boundry PROC 

    mov ah,6 ; Drawing paddle
    mov al,0
    mov bh, 15 ; RED
    mov ch, 0 ; top row
    mov cl, 1 ; left-most column
    mov dh, 0; bottom row
    mov dl, 74 ; bottom column
    int 10h ;
 

    mov ah,6 ; Drawing paddle
    mov al,0
    mov bh, 15 ; RED
    mov ch, 0 ; top row
    mov cl, 74 ; left-most column
    mov dh, 25; bottom row
    mov dl, 75 ; bottom column
    int 10h ;

     mov ah,6 ; Drawing paddle
    mov al,0
    mov bh, 15 ; RED
    mov ch, 0 ; top row
    mov cl, 0 ; left-most column
    mov dh, 25; bottom row
    mov dl, 0; bottom column
    int 10h ;
 RET
    
boundry ENDP

menumove proc

  
  mov al, 1   ; moving velocity to variable
  mov bl, 1
    ;---------------------------------------------------- bou
    
    cmp ball_X2 , 78 ; check right most column range
    jge bounce_off_right_column ; ball is going out of range

    cmp ball_X1 , 1 ; check left column range
    jle bounce_off_left_column

    cmp ball_Y , 0 ; check top row
    jle bounce_off_top_row

    cmp ball_Y , 28 ; check top row
    jge bounce_off_bottom_row

    ; if no condtions are met, dont boucne off 
    jmp skip_collision_detection

    bounce_off_top_row:
        cmp up_right_bool , 1 ; check direction of ball
        je next_down_right ; change direction
        jne next_down_left

    bounce_off_bottom_row:
        cmp down_right_bool , 1 ; check direction of ball
        je next_up_right ; change direction
        jne next_up_left
    
    bounce_off_right_column:
        cmp up_right_bool , 1 ; check direction of ball
        je next_up_left ; change direction
        jne next_down_left

    bounce_off_left_column:
        cmp up_left_bool ,1 ; check direction of ball
        je next_up_right ; change direction
        jne next_down_right    


    next_up_left:
        mov up_left_bool, 1 ; changed direction
        mov up_right_bool , 0 ; Set Previous Direction to Fal
        mov down_left_bool , 0
        mov down_right_bool , 0
        jmp RUN_DIRECTION

    next_up_right:
        mov up_right_bool, 1 ; changed direction
        mov up_left_bool , 0 ; Set Previous Direction to Fals
        mov down_left_bool , 0
        mov down_right_bool , 0
        jmp RUN_DIRECTION    

    next_down_left:
        mov down_left_bool , 1 ; change direction
        mov down_right_bool , 0 ; set previous direction to f
        mov up_left_bool, 0 ; changed direction
        mov up_right_bool , 0
        jmp RUN_DIRECTION

    next_down_right:
        mov down_right_bool , 1 ; change direction
        mov down_left_bool , 0 ; set previous direction to fa
        mov up_left_bool, 0 ; changed direction
        mov up_right_bool , 0
        jmp RUN_DIRECTION    


        ;---------------
    skip_collision_detection:
    RUN_DIRECTION:
    ;################# FIRST CHECK FLAGS
    cmp up_right_bool, 1 ; only move in this direction if fla
    je up_right

    cmp up_left_bool, 1 ; only move in this direction if flag
    je up_left

    cmp down_left_bool, 1 ; only move in this direction if fl
    je down_left

    cmp down_right_bool, 1 ; only move in this direction if f
    je down_right

    up_right:
    ;----------------------------------------
    add ball_X1, al   ;adding to MOVE RIGHT             #####
    add ball_X2, al   ;adding tomov right
    sub ball_Y, bl       ;subtracting to move up
    jmp EXIT
    ;------------------------------------------

    up_left:
    ;----------------------------------------
    sub ball_X1, al   ;sub to MOVE left             ######## 
    sub ball_X2, al    ;sub tomov left
    sub ball_Y, bl       ;subtracting to move up
    jmp EXIT
    ;------------------------------------------

    down_left:
    ;----------------------------------------
    sub ball_X1, al   ; subtract to move lft             ####
    sub ball_X2, al   ; subtract to move left
    add ball_Y, bl       ;adding to move down
    jmp EXIT
    ;------------------------------------------

    down_right:
    ;----------------------------------------
    add ball_X1, al   ; add to move right             #######
    add ball_X2, al   ; add to move right
    add ball_Y, bl       ;adding to move down
    jmp EXIT
    ;------------------------------------------
    

    EXIT:
ret
menumove endp


highscorescreen PROC 
  mov ah, 0 ; set video mode
  mov al, 12h  
  int 10h


;###################### read #######################
call readfromfile

;-----------------------------------
     ;setting cursor position
 mov ah,2
 mov dh,5
 mov dl,24
 mov bh,0
 int 10h
 
 mov dx, offset leaderboard_TXT
 mov ah, 9
 int 21h
;---------------------------

;##################### cursor position ##############




;##################### cursor position ##############
   
      mov ah,2
      mov dh, 18
      mov dl, 20
      mov bh,0
      int 10h
     



    keY1:
        mov ah,1
        int 16h
        mov ah,0
        int 16h
        cmp AL, 27
        je EXIT_inst
    jmp key1

    EXIT_inst:
RET
    
    RET
highscorescreen ENDP
;################################### FILE HANDLING ###############################



writetofile PROC
   
    ;-------opening n reading file
    mov handle, 0
    mov ah, 3Dh
    mov dx, offset fname2
    mov al, 1               ;0 for reading / 1 for writing
    int 21h
    mov handle, ax

    ; APPEND A FILE 
			mov cx, 0
			mov dx, 0
			mov bx, handle
			mov ah, 42h
			mov al, 2; 0 for file beginning 2 for file end 
			int 21h

 
    mov ah, 40h
    mov bx, handle
    mov cx, 6                  ;number of characters in msg
    mov dx, offset name1   ; msg is the thing to write into file
    int 21h

    mov ah, 40h
    mov bx, handle
    mov cx, 1                  ;number of characters in msg
    mov dx, offset spacef   ; msg is the thing to write into file
    int 21h

    ;-----------------
     mov tempp , 0     
    add tempp , 48
    mov ah , LEVEL
    add tempp , ah

    mov ah, 40h
    mov bx, handle
    mov cx, 1             ;number of characters in msg
    mov dx, offset tempp   ; msg is the thing to write into file
    int 21h

    mov ah, 40h
    mov bx, handle
    mov cx, 1                  ;number of characters in msg
    mov dx, offset Spacef   ; msg is the thing to write into file
    int 21h

    mov ax, score
    mov si, offset dummy_score
    call number2string

    mov ax,0
    mov ah, 40h
    mov bx, handle
    mov cx, 2
    mov dx, offset dummy_score   ; msg is the thing to write into file
    int 21h


    mov ah, 3Eh
    mov dx, handle
    int 21h

    ret
    writetofile ENDP
;----------------------------------


   readfromfile proc
 
    ;-------opening n reading file
    mov handle, 0
    mov ah, 3Dh
    mov dx, offset fname2
    mov al, 0               ;0 for reading / 1 for writing
    int 21h
    mov handle, ax

    mov ah, 3fh
    mov bx, handle
    mov cx, 100              ;number of characters in msg
    mov dx, offset buffer   ; the msg thst been read from file stored here
    int 21h

    mov si, offset buffer
    mov di, offset Firstname
    mov cx, 1
    .WHILE cx > 0
          
        mov dl, [si]
        .IF (dl == " ")
            jmp l1
        .ELSE  
        mov [di], dl
        inc di
        inc si
        ;dec cx
        .ENDIF
    .ENDW
    l1:
    ;print start
   mov ah,2
   mov dh,7
   mov dl,19
   mov bh,0
   int 10h


 mov dx, offset Firstname
 mov ah, 9
 int 21h

    mov di, offset player1_level
    mov cx, 1
    .WHILE cx > 0
        mov dl, [si]
        .IF dl != " "
            mov [di], dl
            inc di
            dec cx
        .ENDIF
        inc si
    .ENDW

   mov ah,2
   mov dh,8
   mov dl,20
   mov bh,0
   int 10h


 mov dx, offset player1_level
 mov ah, 9
 int 21h

    mov di, offset player1_score
    mov cx, 3
    .WHILE cx > 0
           mov dl, [si]
        .IF dl != " "
            mov [di], dl
            inc di
            dec cx
        .ENDIF
        inc si
    .ENDW

   mov ah,2
   mov dh,9
   mov dl,20
   mov bh,0
   int 10h


 mov dx, offset player1_score
 mov ah, 9
 int 21h
;----------------------------------------2nd player
    ;mov si, offset buffer
    mov di, offset Sname
    mov cx, 1
    
    .WHILE cx > 0
          
        mov dl, [si]
        .IF (dl == " ")
            jmp l2
        .ELSE  
        mov [di], dl
        inc di
        inc si
        ;dec cx
        .ENDIF
    .ENDW
    l2:
    
 
   mov ah,2
   mov dh,12
   mov dl,20
   mov bh,0
   int 10h


 mov dx, offset Sname
 mov ah, 9
 int 21h

    mov di, offset player2_level
    mov cx, 1
    .WHILE cx > 0
        mov dl, [si]
        .IF dl != " "
            mov [di], dl
            inc di
            dec cx
        .ENDIF
        inc si
    .ENDW
    ; set cursor postion
   mov ah,2
   mov dh,13
   mov dl,20
   mov bh,0
   int 10h

    ;print string
 mov dx, offset player2_level
 mov ah, 9
 int 21h


    mov di, offset player2_score
    mov cx, 3
    .WHILE cx > 0
           mov dl, [si]
        .IF dl != " "
            mov [di], dl
            inc di
            dec cx
        .ENDIF
        inc si
    .ENDW

       ; set cursor postion
   mov ah,2
   mov dh,14
   mov dl,20
   mov bh,0
   int 10h

    ;print string
 mov dx, offset player2_score
 mov ah, 9
 int 21h
    
;-----------------------------------------------------PLayer 3

;mov si, offset buffer
   ; mov si,offset buffer
    ;mov di,offset Tname
    ;mov cx,41
    ;temp:
    ;    inc si

    ;loop temp
    ;inc si
    mov di, offset Tname
    mov cx, 1
    .WHILE cx > 0
          
        mov dl, [si]
        .IF (dl == " ")
            jmp l3
        .ELSE  
        mov [di], dl
        inc di
        inc si
        ;dec cx
        .ENDIF
    .ENDW
    l3:
    
 
   mov ah,2
   mov dh,17
   mov dl,21
   mov bh,0
   int 10h


 mov dx, offset Tname
 mov ah, 9
 int 21h
 

    mov di, offset player3_level
    mov cx, 1
    .WHILE cx > 0
        mov dl, [si]
        .IF dl != " "
            mov [di], dl
            inc di
            dec cx
        .ENDIF
        inc si
    .ENDW

   mov ah,2
   mov dh,18
   mov dl,20
   mov bh,0
   int 10h


 mov dx, offset player3_level
 mov ah, 9
 int 21h


    mov di, offset player3_score
    mov cx, 3
    .WHILE cx > 0
           mov dl, [si]
        .IF dl != " "
            mov [di], dl
            inc di
            dec cx
        .ENDIF
        inc si
    .ENDW

    mov ah,2
   mov dh,19
   mov dl,20
   mov bh,0
   int 10h


 mov dx, offset player3_score
 mov ah, 9
 int 21h


;-----------------------------------------------Player 4
    ;mov si, offset buffer
    
    mov di, offset Fourthname
    mov cx, 1
    .WHILE cx > 0
          
        mov dl, [si]
        .IF (dl == " ")
            jmp l4
        .ELSE  
        mov [di], dl
        inc di
        inc si
        ;dec cx
        .ENDIF
    .ENDW
    l4:
    
 
   mov ah,2
   mov dh,22
   mov dl,20
   mov bh,0
   int 10h


 mov dx, offset Fourthname
 mov ah, 9
 int 21h


    mov di, offset player4_level
    mov cx, 1
    .WHILE cx > 0
        mov dl, [si]
        .IF dl != " "
            mov [di], dl
            inc di
            dec cx
        .ENDIF
        inc si
    .ENDW

    mov ah,2
   mov dh,23
   mov dl,20
   mov bh,0
   int 10h


 mov dx, offset player4_level
 mov ah, 9
 int 21h

    inc si
    mov di, offset player4_score
    mov cx, 3
    .WHILE cx > 0
           mov dl, [si]
        .IF dl != " "
            mov [di], dl
            inc di
            dec cx
        .ENDIF
        inc si
    .ENDW

    
    mov ah,2
   mov dh,24
   mov dl,20
   mov bh,0
   int 10h


 mov dx, offset player4_score
 mov ah, 9
 int 21h

    ret
    readfromfile endp

;--------------------------------


    number2string proc 
  mov  bx, 10  ;DIGITS ARE EXTRACTED DIVIDING BY 10.
  mov  cx, 0   ;
cycle1:       
  mov  dx, 0   ;NECESSARY TO DIVIDE BY BX.
  div  bx      ;DX:AX / 10 = AX:QUOTIENT DX:REMAINDER.
  push dx      ;PRESERVE DIGIT EXTRACTED FOR LATER.
  inc  cx      ;INCREASE COUNTER FOR EVERY DIGIT EXTRACTED.
  cmp  ax, 0   
  jne  cycle1  

cycle2:  
  pop  dx        
  add  dl, 48  ;CONVERT DIGIT TO CHARACTER.
  mov  [ si ], dl
  inc  si
  loop cycle2  

  ret
number2string endp

end