;
; CSU11021 Introduction to Computing I 2019/2020
; Mode
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR R8, =0
	LDR R9, =1
	LDR	R4, =tstN	; load address of tstN
	LDR	R1, [R4]	; load value of tstN

	LDR	R2, =tstvals	; load address of numbers

load
	LDR R5, [R2]
	LDR R6, =0
	LDR R7, =0
	LDR R2, =tstvals
	B loop

main
	CMP R8, R1
	BEQ end
	LDR R2, =tstvals
	LDR R6, =4
	MUL R7, R6, R8
	ADD R2, R2, R7
	LDR R5, [R2]
	CMP R5, R0
	BEQ next
	B load

loop
	LDR R3, [R2]
	CMP R5, R3
	BNE after
	ADD R6, R6, #1
after
	ADD R2, R2, #4
	ADD R7, R7, #1
	CMP R7, R1
	BEQ next
	B repeat

next
	ADD R8, R8, #1
	CMP R9, R6
	BHI main
	MOV R0, R5
	MOV R9, R6
	B start
end
	

STOP	B	STOP

tstN	DCD	8			; N (number of numbers)
tstvals	DCD	5, 3, 7, 5, 3, 5, 1, 9	; numbers

	END
