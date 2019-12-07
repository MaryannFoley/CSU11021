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

	LDR R6, =0			; indexB = 0
	
while2					; while indexB < sizeB
	CMP R6, R4	
	BHS endwh2
	LDR R7, [R5]		;	 element = B[addressB]
	LDR R8, =0
while3					;	 indexA=0
		CMP R8, R2		;	 while indexA < sizeA:
		BHS wh2
		LDR R9, [R3]	;		element2 = A[addressA]
		CMP R7, R9		;		if element == element2:
		BEQ endwh3		; 			branch to end of while
		ADD R3, R3, #4	;		else:	addressA+=4
		ADD R8, #1		;				indexA+=4
		B while3
endwh3
	STR R7, [R1]		; 	 store C[x]=element
	ADD R1, R1, #4		; 	 addressC+=4
	LDR R7, [R0]		;	 j = memory[R0]
	ADD R7, R7, #1		;	 j+=1
	STR R7, [R0]		;	 memory[R0] = j
wh2							
	LDR R3, =elemsA		;	address of elemsA
	ADD R5, R5, #4		;	 addressB+=4
	ADD R6, R6, #1		; 	 x+=1
	B while2
endwh2
	
	
	


	B STOP
; x = 0
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
elemsB	DCD	7, 6, 11, 14, 5, 2, 9, 12, 17

	END
