;
; CSU11021 Introduction to Computing I 2019/2020
; Mode
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR R8, =0		; counter =0
	LDR R9, =1
	LDR	R4, =tstN	; load address of tstN
	LDR	R1, [R4]	; load value of tstN

	LDR	R2, =tstvals	; load address of numbers

load
	LDR R5, [R2]
	LDR R6, =0
	LDR R7, =0			; nextAddress
	LDR R2, =tstvals	; load address of numbers
	B loop

main
	CMP R8, R1			; while counter != tstN
	BEQ end
	LDR R2, =tstvals	; load address of numbers
	LDR R6, =4
	MUL R7, R6, R8		; shift = counter * 4
	ADD R2, R2, R7		; address = shift + address
	LDR R5, [R2]		; load next number of A
	CMP R5, R0			
	BEQ next
	B load

loop
	LDR R3, [R2]
	CMP R5, R3			; if current number == checking number
	BNE after
	ADD R6, R6, #1		
after
	ADD R2, R2, #4		; address+=4
	ADD R7, R7, #1		; add one to frequency counter
	CMP R7, R1
	BEQ next
	B loop

next
	ADD R8, R8, #1		; counter += 1 (to move to next current number)
	CMP R9, R6
	BHI main
	MOV R0, R5
	MOV R9, R6
	B main
end
	

STOP	B	STOP

tstN	DCD	8			; N (number of numbers)
tstvals	DCD	4, 4, 4, 5, 5, 5, 5, 9	; numbers

	END
