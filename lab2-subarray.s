;
; CS1022 Introduction to Computing II 2018/2019
; Lab 2 - Subarray
;

N	EQU	7
M	EQU	3		

	AREA	RESET, CODE, READONLY
	ENTRY

	; initialize system stack pointer (SP)
	LDR	SP, =0x40010000

	;
	; Write your program here to determine whether SMALL_A
	;   is a subarray of LARGE_A
	;
	; Store 1 in R0 if SMALL_A is a subarray and zero otherwise
	;
LDR R0, =0						;Initialize R0 to zero presuming false
	LDR R1, =LARGE_A				;Assign Address location 
	LDR R2, =SMALL_A				;Assign Address location
	LDR R5,=0						;Initialize R5
	LDR R6, =N						;Assign length of large matrix to R6
	MOV R8, R6, LSL#2				;Move Length of large Matrix*4 to R8	
	LDR R7,=0						;Initialize R7
	SUB R6, R6, #M					;Subtract length of small Matrix from length of large Matrix
	ADD R6, R6, #1					;Add 1
	LDR R12, =M						;Assign length of small matrix to R12
	MOV R12, R12, LSL#2				;Multiply length by 4
	LDR R3, [R2]					;Load first value from small matrix 
	B loop							
change								
	ADD R7, R7, #1					;Update Count
	CMP R7, R6						;Compare count and R6
	BEQ over						
	ADD R1, R1, R8					;Update Address
	LDR R5,=0						;Re initialize R5 
	B loop							
loops								
	POP {R1-R3, R5}					;Pop the values from stack
	MOV R11, #0						;Re initialize R11
loop								
	CMP R5, R6						;Compare
	BEQ change 						
	LDR R4, [R1, R5, LSL#2 ]		;Load Value from Large Array
	CMP R3, R4						;Compare value with first value of small array
	ADD R5, R5, #1					;Add 1 to counter 
	BNE loop						
	PUSH {R1-R3, R5}				;Push values 
	LDR R3, =0						;Re Initialize R3
	SUB R5, R5, #1					;R5=R5-1
check								
	LDR R9, [R2, R11, LSL#2]		;Load value from Large Array
	LDR R10, [R1, R5, LSL#2]		;Load value from Small Array
	ADD R11, R11, #1				;Update Counter
	ADD R5, R5, #1					;Update Counter
	CMP R9, R10						;Compare
	BNE loops						
	CMP R11, #M						;Compare counter to small array length
	BNE check						
	ADD R1, R1, R8					;Update Address of Large Array
	ADD R2, R2, R12					;Update Address of Small Array	
	SUB R5, R5, #M					;Reset counter back the length of the small array
	ADD R3, R3, #1					;Update counter
	LDR R11, =0						;Re Initialize R11
	CMP R3, #M						;Compare
	BEQ same						
							
	B check 						
		
same LDR R0, =1						;Assign 1 to R0 if the small Array is in the large Array
	


over								




STOP	B	STOP


;
; test data
;

LARGE_A	DCD	 48, 37, 15, 44,  3, 17, 26
	DCD	  2,  9, 12, 18, 14, 33, 16
	DCD	 13, 20,  1, 22,  7, 48, 21
	DCD	 27, 19, 44, 49, 44, 18, 10
	DCD	 29, 17, 22,  4, 46, 43, 41
	DCD	 37, 35, 38, 34, 16, 25,  0
	DCD	 17,  0, 48, 15, 27, 35, 11

SMALL_A	DCD	 49, 44, 18
	DCD	  4, 46, 43
	DCD	 34, 16, 25

	END
