
.CPU 8052

.include 8051_SFR.asm

0x0000:
START:

    MOV    P2,#0xFF
    ACALL  DELAY

    MOV    P2,#0x00
    ACALL  DELAY

    SJMP   START

DELAY:
    MOV    R2,#5
    MOV    R3,#0
    MOV    R4,#0
DEL01:
    DJNZ   R4,DEL01
    DJNZ   R3,DEL01
    DJNZ   R2,DEL01
    RET
