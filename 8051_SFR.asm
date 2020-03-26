; Special Function Registers

; Name      Address   AfterReset   Description
.P0       = 0x80    ; 11111111     GPIO Port 0
.SP       = 0x81    ; 00000111
.DP0L     = 0x82    ; 00000000
.DP0H     = 0x83    ; 00000000
.DP1L     = 0x84    ; 00000000
.DP1H     = 0x85    ; 00000000
.PCON     = 0x87    ; 0xxx0000
.TCON     = 0x88    ; 00000000
.TMOD     = 0x89    ; 00000000
.TL0      = 0x8A    ; 00000000
.TL1      = 0x8B    ; 00000000
.TH0      = 0x8C    ; 00000000
.TH1      = 0x8D    ; 00000000
.AUXR     = 0x8E    ; 00000000
;
.P1       = 0x90    ; 11111111     GPIO Port 1
.SCON     = 0x98    ; 00000000
.SBUF     = 0x99    ; xxxxxxxx
;
.P2       = 0xA0    ; 11111111     GPIO Port 2
.AUXR1    = 0xA2    ; xxxxxxx0     Auxiliary Regsister 1
.WDTRST   = 0xA6    ; xxxxxxxx
.IE       = 0xA8    ; 0x000000
;
.P3       = 0xB0    ; 11111111
.IP       = 0xB8    ; xx000000
;
.T2CON    = 0xC8    ; 00000000     Timer/Counter 2 Control Register
.T2MOD    = 0xC9    ; xxxxxx00
.RCAP2L   = 0xCA    ; 00000000
.RCAP2H   = 0xCB    ; 00000000
.TL2      = 0xCC    ; 00000000
.TH2      = 0xCD    ; 00000000
;
.PSW      = 0xD0    ; 00000000
;
.ACC      = 0xE0    ; 00000000
;
.B        = 0xF0    ; 00000000

; Bit Addressing
;  - 00 – 7FH are assigned to RAM locations of 20 – 2FH.
;  - 80 – 87H are assigned to the PO port.
;  - 88 – 8FH are assigned to the TCON register.
;  - 90 – 97H are assigned to the P1 port.
;  - 98 – 9FH are assigned to the SCON register.
;  - AO – A7H are assigned to the P2 port.
;  - A8 – AFH are assigned to the IE register.
;  - BO – B7H are assigned to the P3 port.
;  - B8 – BFH are assigned to IP.
;  - CO – CFH (not assigned)
;  - DO – D7H are assigned to the PSW register.
;  - D8 – DFH (not assigned)
;  - EO – E7H are assigned to the Accumulator register.
;  - E8 – EFH (not assigned)
;  - FO – F7H are assigned to the B register.

.P0_0 = 0x80
.P0_1 = 0x81
.P0_2 = 0x82
.P0_3 = 0x83
.P0_4 = 0x84
.P0_5 = 0x85
.P0_6 = 0x86
.P0_7 = 0x87
;
;| 88b | TCON.0 | |
;| 89b | TCON.1 | |
;| 8Ab | TCON.2 | |
;| 8Bb | TCON.3 | |
;| 8Cb | TCON.4 | |
;| 8Db | TCON.5 | |
;| 8Eb | TCON.6 | |
;| 8Fb | TCON.7 | |
;
.P1_0 = 0x90
.P1_1 = 0x91
.P1_2 = 0x92
.P1_3 = 0x93
.P1_4 = 0x94
.P1_5 = 0x95
.P1_6 = 0x96
.P1_7 = 0x97
;
;| 98b | SCON.0 | |
;| 99b | SCON.1 | |
;| 9Ab | SCON.2 | |
;| 9Bb | SCON.3 | |
;| 9Cb | SCON.4 | |
;| 9Db | SCON.5 | |
;| 9Eb | SCON.6 | |
;| 9Fb | SCON.7 | |
;
.P2_0 = 0xA0
.P2_1 = 0xA1
.P2_2 = 0xA2
.P2_3 = 0xA3
.P2_4 = 0xA4
.P2_5 = 0xA5
.P2_6 = 0xA6
.P2_7 = 0xA7
;
;| A8b | IE.0   | |
;| A9b | IE.1   | |
;| AAb | IE.2   | |
;| ABb | IE.3   | |
;| ACb | IE.4   | |
;| ADb | IE.5   | |
;| AEb | IE.6   | |
;| AFb | IE.7   | |
;
.P3_0 = 0xB0
.P3_1 = 0xB1
.P3_2 = 0xB2
.P3_3 = 0xB3
.P3_4 = 0xB4
.P3_5 = 0xB5
.P3_6 = 0xB6
.P3_7 = 0xB7
;
;| B8b | IP.0   | |
;| B9b | IP.1   | |
;| BAb | IP.2   | |
;| BBb | IP.3   | |
;| BCb | IP.4   | |
;| BDb | IP.5   | |
;| BEb | IP.6   | |
;| BFb | IP.7   | |
;
;| D0b | PSW.0  | |
;| D1b | PSW.1  | |
;| D2b | PSW.2  | |
;| D3b | PSW.3  | |
;| D4b | PSW.4  | |
;| D5b | PSW.5  | |
;| D6b | PSW.6  | |
;| D7b | PSW.7  | |
;
.ACC_0 = 0xE0
.ACC_1 = 0xE1
.ACC_2 = 0xE2
.ACC_3 = 0xE3
.ACC_4 = 0xE4
.ACC_5 = 0xE5
.ACC_6 = 0xE6
.ACC_7 = 0xE7
;
;| F0b | B.0    | |
;| F1b | B.1    | |
;| F2b | B.2    | |
;| F3b | B.3    | |
;| F4b | B.4    | |
;| F5b | B.5    | |
;| F6b | B.6    | |
;| F7b | B.7    | |
