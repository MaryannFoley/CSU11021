;
; CSU11021 Introduction to Computing I 2019/2020
; Intersection
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R0, =0x40000000	; address of sizeC
	LDR	R1, =0x40000004	; address of elemsC
	
	LDR	R6, =sizeA	; address of sizeA
	LDR	R2, [R6]	; load sizeA
	LDR	R3, =elemsA	; address of elemsA
	
	LDR	R6, =sizeB	; address of sizeB
	LDR	R4, [R6]	; load sizeB
	LDR	R5, =elemsB	; address of elemsB

; x = 0
; while x < sizeA:
;	element = A[addressA]
;	store C[x]=element
;	x +=1
;	addressA+=4
;	addressC+=4
;	j = memory[R0]
;	j+=1
;	Store j in R0
; x =0
; numBytes = sizeA*4
; addressA -= numBytes
; while x < sizeB
;	 element = B[addressB]
;	 y=0
;	 while y < sizeA:
;		element2 = A[addressA]
;		if element == element2:
; 			branch to aaaa
;		else:
;			addressA+=4
; 	 store C[x]=element
; 	 addressC+=4
;	 j = memory[R0]
;	 j+=1
;	 Store j in R0
;	 aaaa
;	 addressB+=4
; 	 x+=1

	LDR R6, =0
while1
	CMP R6, R2
	BHS endwh1
	LDR R7, [R3]
	STR R7, [R1]
	ADD R6, R6, #1
	ADD R1, R1, #0x4
	ADD R3, R3, #0x4
	LDR R7, [R0]
	ADD R7, R7, #1
	STR R7, [R0]
	B while1
endwh1
	LDR R7, =4
	MUL R7, R2, R7
	SUB R3, R3, R7
	
	LDR R6, =0
	
while2
	CMP R6, R4
	BHS endwh2
	LDR R7, [R5]
	LDR R8, =0
while3
		CMP R8, R2
		BHS endwh3
		LDR R9, [R5]
		CMP R7, R9
		BEQ wh2
		ADD R3, R3, #0x4
		ADD R8, #1
		B while3
endwh3
	STR R7, [R1]
	ADD R1, R1, #0x4
	LDR R7, [R0]
	ADD R7, R7, #1
	STR R7, [R0]
wh2
	ADD R1, R1, #0x4
	ADD R6, R6, #1
	B while2
endwh2

	;
	; Your program to compute the interaction of A and B goes here
	;
	; Store the size of the intersection in memory at the address in R0
	;
	; Store the elements in the intersection in memory beginning at the
	;   address in R1
	;

STOP	B	STOP

sizeA	DCD	4
elemsA	DCD	7, 14, 6, 3

sizeB	DCD	9
elemsB	DCD	20, 11, 14, 5, 7, 2, 9, 12, 17

	END
