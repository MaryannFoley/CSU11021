;
; CS1022 Introduction to Computing II 2019/2020
; eTest Group 3 Q1
;

N	EQU	9


	AREA	globals, DATA, READWRITE

array	SPACE	1024


	AREA	RESET, CODE, READONLY
	ENTRY

	; initialise the system stack pointer
	LDR	SP, =0x40010000


	LDR	R4, =array
	LDR	R5, =N	

	;
	; Your program goes here
	; (i.e. your translation of the pseudocode provided
	;

    LDR R6, =0 // i = 0;
for1
    CMP R6, R5 // while(i<N){
    BHS endfor1
    LDR R7, =0 // j = 0;
for2
    CMP R7, R5 // while(j<N){
    BHS endfor2
    CMP R6, R7 // if (i>j)
    BLS else // {
    STR R6, [R4], #4 //array[i,j] = i;
    B endif //}
else        // else {
    STR R7, [R4], #4 //array[i,j] = j;}
endif
    ADD R7, R7, #1 // j++;
    B for2 //}
endfor2
    ADD R6, R6, #1 // i++;
    B for1 // }
endfor1

STOP	B	STOP


	END
