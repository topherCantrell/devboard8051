._CPU = 8052

.P0 = 0xA0
.P1 = 0x90

0x0000:
        MOV     P0,#0xFF     ; P0 will be inputs
LOOP:
        MOV     P1,P0       ; Copy inputs port0 to ouputs port1
        SJMP    LOOP        ; Infinite loop
