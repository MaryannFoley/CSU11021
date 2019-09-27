;
; CSU11021 Introduction to Computing I 2019/2020
; Basic ARM Assembly Language
;

	AREA	RESET, CODE, READONLY
	ENTRY

; Write your solution for all parts (i) to (iv) below.

; Tip: Right-click on any instruction and select 'Run to cursor' to
; "fast forward" the processor to that instruction.

; (i) 3x+y

	LDR	R1, =2	; x = 2
	LDR	R2, =3	; y = 3
	LDR	R3, =3	; Store 3 for multiplication
	MUL R1, R3, R1	; R1 = 3x
	ADD	R0, R1, R2	; R0 = 3x + y
	; your program goes here


; (ii) 3x^2+5x

	LDR	R1, =2	; x = 2
	LDR	R2, =5	; Store 5 for multiplication
	MUL	R2, R1, R2
	LDR	R3, =3	; Store 3 for multiplication
	MUL R3, R1, R3	; R3=3x
	MUL R1, R3, R1	; R1=3x^2
	ADD	R0, R2, R1
	; your program goes here


; (iii) 2x^2+6xy+3y^2

	LDR	R1, =2	; x = 2
	LDR	R2, =3	; y = 3
	
	LDR	R3, =6	; Store 6 for multiplication
	MUL	R3, R1, R3 ; R3=6x
	MUL	R3, R2, R3 ; R3=6xy
	
	LDR	R4, =2	; Store 6 for multiplication
	MUL	R4, R1, R4 ; R4=2x
	MUL	R1, R4, R1 ; R1=2x^2
	ADD R1, R3, R1 ; R1 = 2x^2+6xy
	
	LDR	R3, =3	; Store 3 for multiplication
	MUL R3, R2, R3	; R3=3y
	MUL R2, R3, R2	; R1=3y^2
	ADD	R0, R2, R1	; R0 = 2x^2+6xy+3y^2
	; your program goes here


; (iv) x^3-4x^2+3x+8

	LDR	R1, =2	; x = 2
	LDR	R2, =8	
	LDR	R3, =3
	MUL R3, R1, R3 ;3x
	ADD	R2, R3, R2 ; 3x+8
	LDR	R3, =4
	MUL R3, R1, R3 ;4x
	MUL R3, R1, R3 ;4x^2
	ADD	R2, R3, R2 ;4x^2+3x+8
	MOV R3, R1 ;x
	MUL R3, R1, R3 ;x^2
	MUL R3, R1, R3 ;x^3
	ADD	R2, R3, R2 ;x^3+4x^2+3x+8

	; your program goes here


STOP	B	STOP

	END
