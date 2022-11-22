
.CPU  8052

.include 8051_SFR.asm

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

    ACALL  DELAY

    MOV    A,#0x0F      ; LCD ON, cursor ON, cursor blinking ON
    ACALL  SendCommand

    ACALL  DELAY

    MOV    A,#0x01      ; Clear screen
    ACALL  SendCommand

    ACALL  DELAY

    MOV    A,#0x06      ; Increment cursor
    ACALL  SendCommand

    ACALL  DELAY

    MOV    A,#0x82      ; Cursor line one, position 2
    ACALL  SendCommand

    ACALL  DELAY

    MOV    A,#0x3C      ; Activate second line
    ACALL  SendCommand

    ACALL  DELAY

    MOV    A,#78
    ACALL  SendData

DONE:
    SJMP  DONE

DELAY:
    MOV    R4,#0
HERE:
    NOP
    NOP
    DJNZ   R4,HERE
    RET

WaitOnBF:
    MOV    P1,#0xFF       ; Port in read mode
    SETB   RW_pin         ; 1=Read
    CLR    RS_pin         ; 0=Command
WBF1:
    CLR    E_pin          ; We loop back here for another cycle with E_pin high
    SETB   E_pin          ; Raise the enable
    NOP                   ; Give LCD time to output data TODO:
    MOV    A,P1           ; Read the data
    JB     ACC_7,WBF1     ; If the Busy Flag is set, keep checking
    CLR    E_pin          ; Turn the enable off
    CLR    RW_pin         ; Back to write mode
    RET

SendCommand:    
    MOV    data_port,A    ; Data to the bus
    CLR    RS_pin         ; 0=Command
    CLR    RW_pin         ; 0=Write
    SETB   E_pin          ; High ...
    CLR    E_pin          ; ... to low transition
    ACALL  WaitOnBF       ; Wait on Busy Flag to clear
    RET

SendData:    
    MOV    data_port,A    ; Data to the bus
    SETB   RS_pin         ; 1=Data
    CLR    RW_pin         ; 0=Write
    SETB   E_pin          ; High ...
    CLR    E_pin          ; ... to low transition
    ACALL  WaitOnBF       ; Wait on Busy Flag to clear
    RET
