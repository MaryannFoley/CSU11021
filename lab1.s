;
; CS1022 Introduction to Computing II 2018/2019
; Lab 1 - Array Move
;

N	EQU	16		; number of elements

	AREA	globals, DATA, READWRITE

; N word-size values

ARRAY	SPACE	N*4		; N words


	AREA	RESET, CODE, READONLY
	ENTRY

	; for convenience, let's initialise test array [0, 1, 2, ... , N-1]

	LDR	R0, =ARRAY
	LDR	R1, =0
L1	CMP	R1, #N
	BHS	L2
	STR	R1, [R0, R1, LSL #2]
	ADD	R1, R1, #1
	B	L1
L2

	; initialise registers for your program

	LDR	R0, =ARRAY
	LDR	R1, =3
	LDR	R2, =6
	LDR	R3, =N

	LDR R4, [R0, R1, LSL #2]	;Load initial value
	
	CMP R1, R2					;if startIndex >= endIndex:
	BLT lessWh

wh	CMP R1, R2					;	while startIndex!=endIndex:
	BEQ endShift				
	SUB R1, R1, #1				;		startIndex-=1
	LDR R5, [R0, R1, LSL #2]	;		temporary = memory[startIndex]
	ADD R1, R1, #1				;		startIndex+=1
	STR R5, [R0, R1, LSL #2]	;		memory[startIndex] = temporary
	SUB R1, R1, #1				;		startIndex-=1
	B wh

lessWh	CMP R1, R2				;else:	
	BEQ endShift				;	while startIndex!=endIndex:
	ADD R1, R1, #1				;		startIndex+=1
	LDR R5, [R0, R1, LSL #2]		;		temporary = memory[startIndex]
	SUB R1, R1, #1				;		startIndex-=1
	STR R5, [R0, R1, LSL #2]		;		memory[startIndex]=temporary
	ADD R1, R1, #1				;		startIndex+=1
	B lessWh
	
endShift
	STR R4, [R0, R2, LSL #2]		;memory[endIndex]= initialValue
	
STOP	B	STOP

	END
