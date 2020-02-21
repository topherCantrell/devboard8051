
._CPU = 8052

.include 8052_SFR.asm

; http://www.circuitstoday.com/interfacing-16x2-lcd-with-8051

; LCD      8052
; D0-D7 -> P0.0-P0.7
; RS    -> P3.5
; R/W-  -> P3.4
; E     -> P3.3

.RS_pin = P3_5
.RW_pin = P3_4
.E_pin  = P3_3

.data_port = P0


0x0000:
START:

    ACALL  DELAY
    ACALL  DELAY
    ACALL  DELAY
    ACALL  DELAY

    MOV    A,#0x38      ; 2 lines and 5x7 matrix
    ACALL  SendCommand

    MOV    A,#0x0F      ; LCD ON, cursor ON, cursor blinking ON
    ACALL  SendCommand

    MOV    A,#0x01      ; Clear screen
    ACALL  SendCommand

    MOV    A,#0x06      ; Increment cursor
    ACALL  SendCommand

    MOV    A,#0x82      ; Cursor line one, position 2
    ACALL  SendCommand

    MOV    A,#0x3C      ; Activate second line
    ACALL  SendCommand

    MOV    A,#49
    ACALL  SendData

DONE:
    SJMP  DONE

DELAY:
    MOV    R4,#0
    MOV    R3,#0
HERE:
    NOP
    NOP
    DJNZ   R4,HERE
    DJNZ   R3,HERE
    RET

Wait:
    CLR    E_pin
    CLR    RS_pin
    SETB   RW_pin
    MOV    P1,#0xFF
    SETB   E_pin
    MOV    A,P1
    JB     ACC_7,Wait
    CLR    E_pin
    CLR    RW_pin
    RET

SendCommand:
    ; Write data
    ; Clear RS and set RW
    ; Set E
    ; Pause
    ; Clear E
    MOV    data_port,A
    CLR    RS_pin
    CLR    RW_pin
    SETB   E_pin
    CLR    E_pin
    ;ACALL  DELAY
    ACALL  Wait
    RET

SendData:
    ; Write data
    ; Set RS and set RW
    ; Set E
    ; Pause
    ; Clear E
    MOV    data_port,A
    SETB   RS_pin
    CLR    RW_pin
    SETB   E_pin
    CLR    E_pin
    ;ACALL  DELAY
    ACALL  Wait
    RET
