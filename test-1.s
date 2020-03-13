;
; CS1022 Introduction to Computing II 2019/2020
; eTest Group 3 Q1
;

	AREA	globals, DATA, READWRITE

arrA	SPACE	1024
arrB	SPACE	1024


	AREA	RESET, CODE, READONLY
	ENTRY

	; initialise the system stack pointer
	LDR	SP, =0x40010000

	;
	; initialise arrays by copying from ROM to RAM
	;

	LDR	R0, =arrA	; destination in RAM
	LDR	R1, =initA	; source in ROM
	LDR	R4, =sizeA
	LDR	R2, [R4]	; size of arrA
	BL	copy_arr

	LDR	R0, =arrB	; destination in RAM
	LDR	R1, =initB	; source in ROM
	LDR	R4, =sizeB
	LDR	R2, [R4]	; size of arrB
	BL	copy_arr

	;
	; Your program to test your subroutine goes here
	;

STOP	B	STOP

;
; Initial data
;
sizeA	DCD	10				; test array size
initA	DCD	6, 2, 7, 9, 1, 3, 2, 6, 9, 1	; test array elements

sizeB	DCD	4				; test array size
initB	DCD	2, 7, 5, 3			; test array elements



;
; Your subroutine goes here
;

; difference subroutine
; remove all elements from array A that are repeated in array B
; Parameters:
;   R0 - start address of array A
;   R1 - start address of array B
;   R2 - size of array A
;   R3 - size of array B
; Return value:
;   none

difference
    PUSH {R4-R9, lr}
    MOV R4, R1  // startB = startB
    LDR R6, =0  // i=0
for1
    CMP R6, R3 // while(i<sizeB){
    BHS endfor1
    LDR R7, =0 // j = 0;
for2
    CMP R7, R1 // while(j<sizeA){
    BHS endfor2
    LDR R8, [R0, R7, LSL #2] // a = arrA[j]
    LDR R9, [R4, R6, LSL #2] // b = arrB[i]
    CMP R8, R9 // if (a == b) {
    BNE notEq
    MOV R1, R7
    BL remove //remove(arrA , j , sizeA );
    ADD R2, R2, #-1 //sizeA = sizeA − 1;
notEq           // }
    ADD R7, R7, #1  // j++;
    B for2 //}
endfor2
    ADD R6, R6, #1  // i++;
    B for1 //}
endfor1
    POP{R4-R9, pc}




; remove subroutine
; Removes an element from an array of word size values
; Parameters:
;   R0 - start address of array
;   R1 - index of element to remove
;   R2 - number of elements in the array
; Return Value:
;   none
remove
	PUSH	{R4-R6}

	ADD	R4, R1, #1
whRemove
	CMP	R4, R2
	BHS	eWhRemove
	LDR	R5, [R0, R4, LSL #2]
	SUB	R6, R4, #1
	STR	R5, [R0, R6, LSL #2]
	ADD	R4, R4, #1
	B	whRemove
eWhRemove
	POP	{R4-R6}
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
