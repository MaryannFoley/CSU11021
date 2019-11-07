;
; CSU11021 Introduction to Computing I 2019/2020
; Mode
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R4, =tstN	; load address of tstN
	LDR	R1, [R4]	; load value of tstN

	LDR	R2, =tstvals	; load address of numbers
	
	;
	; Write your progam here to compute the mode in R0
	;

STOP	B	STOP

tstN	DCD	8			; N (number of numbers)
tstvals	DCD	5, 3, 7, 5, 3, 5, 1, 9	; numbers

	END
