;
; CSU11021 Introduction to Computing I 2019/2020
; Convert a sequence of ASCII digits to the value they represent
;

	AREA	RESET, CODE, READONLY
	ENTRY
		
	LDR	R1, ='2'	; Load R1 with ASCII code for symbol '2'
	LDR	R2, ='0'	; Load R2 with ASCII code for symbol '0'
	LDR	R3, ='3'	; Load R3 with ASCII code for symbol '3'
	LDR	R4, ='4'	; Load R4 with ASCII code for symbol '4'

	SUB R1, R1, #30	; Change ascii symbols to numbers
	SUB R2, R2, #30	; Change ascii symbols to numbers
	SUB R3, R3, #30	; Change ascii symbols to numbers
	SUB R4, R4, #30	; Change ascii symbols to numbers

	LDR R0, =0		; Load 0 as a running tota

	LDR R5, =0x10

	MUL R3, R5, R3

	LDR R5, =0x100
	MUL R2, R5, R2

	LDR R5, =0x1000
	MUL R1, R5, R1

	ADD R0, R4, R0
	ADD R0, R3, R0
	ADD R0, R2, R0
	ADD R0, R1, R0
		
		;		your program goes here
		
STOP		B		STOP
		
		END
