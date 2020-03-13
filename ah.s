;
; CS1022 Introduction to Computing II 2019/2020
; Sample eTest Q1
;

N	EQU	9


	AREA	globals, DATA, READWRITE

array	SPACE	1024


	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R4, =array
	LDR	R5, =N	

	;
	; Your program goes here
	; (i.e. your translation of the pseudocode provided
	;

    LDR R6, =0
    LDR R4, =0
for1
    CMP R6, R5
    BHS endfor1
            LDR R7, =0
for2
            CMP R7, R5
            BHS endfor2
                CMP R7, R6
                BNE notEqual
                    LDR R8, =0
                    STR R8, [R4], #4
                    B endif
notEqual
                BHS greater
                    SUB R8, R7, R6
                    STR R8, [R4], #4
                    B endif
greater
                    SUB R8, R6, R7
                    STR R8, [R4], #4
                    B endif
endif
                ADD R7, R7, #1
                B for2
endfor2
        ADD R6, R6, #1
        B for1
endfor1
        
STOP	B	STOP


	END

;
; CS1022 Introduction to Computing II 2019/2020
; Sample eTest Q2
;

	AREA	globals, DATA, READWRITE

array	SPACE	1024


	AREA	RESET, CODE, READONLY
	ENTRY

	;
	; initialise the system stack pointer
	;
	LDR	SP, =0x40010000

	;
	; initialise array in RAM by copying from init_array
	;

	LDR	R0, =array	; destination in RAM		
	LDR	R1, =init_array	; source in ROM
	LDR	R4, =N
	LDR	R2, [R4]	; size of array
	BL	copy_arr	; initialise


	;
	; Your program to test your subroutine goes here
	;

STOP	B	STOP

;
; Initial data
;
init_array
	DCD	6, 2, 7, 9, 1, 3, 2, 6, 9, 1	; test array elements

N	DCD	10				; test array size (in words)

;
; Your subroutine goes here
;

sort
    PUSH {R5, R6, R7, R8, lr}
    LDR R6, =1
wh
    CMP R6, 0
    BEQ endwh
        LDR R6, =0
        LDR R5, =1
for
        CMP R5, R4
        BGE endfor
        LDR R7, [R0, R5, #2]
        SUB R5, R5, #1
        LDR R8, [R0, R5, #2]
        CMP R8, R7
        BGE endif
            LDR R1, R5
            ADD R5, R5, #1
            LDR R2, R5
            swap
            LDR R6, =0
endif
        ADD R5, R5, #1
        B for
endfor
endwh
POP {R5, R6, R7, R8, pc}
            


; swap subroutine
; Swaps two elements in an array of word size values
; Parameters:
;   R0 - start address of array
;   R1 - index of first element to swap
;   R2 - index of second element to swap
; Return Value:
;   none
swap
	PUSH	{R4, R5}
	LDR	R4, [R0, R1, LSL #2]
	LDR	R5, [R0, R2, LSL #2]
	STR	R5, [R0, R1, LSL #2]
	STR	R4, [R0, R2, LSL #2]
	POP	{R4, R5}
	BX	LR


; copy_arr subroutine
; Copies an array of words in memory
; Parameters:
;   R0 - destination address
;   R1 - source address
;   R2 - number of words to copy
; Return Value:
;   none
copy_arr
	PUSH	{R4-R5}
	LDR	R4, =0
wh_copy_arr
	CMP	R4, R2
	BHS	ewh_copy_arr
	LDR	R5, [R1, R4, LSL #2]
	STR	R5, [R0, R4, LSL #2]
	ADD	R4, R4, #1
	B	wh_copy_arr
ewh_copy_arr
	POP	{R4-R5}
	BX	LR

	END
