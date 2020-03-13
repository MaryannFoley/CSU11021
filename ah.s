;
; CS1022 Introduction to Computing II 2019/2020
; Sample eTest Q1
;

N	EQU	9


	AREA	globals, DATA, READWRITE

array	SPACE	1024


	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R4, =array
	LDR	R5, =N	

	;
	; Your program goes here
	; (i.e. your translation of the pseudocode provided
	;

    LDR R6, =0
    LDR R4, =0
for1
    CMP R6, R5
    BHS endfor1
            LDR R7, =0
for2
            CMP R7, R5
            BHS endfor2
                CMP R7, R6
                BNE notEqual
                    LDR R8, =0
                    STR R8, [R4], #4
                    B endif
notEqual
                BHS greater
                    SUB R8, R7, R6
                    STR R8, [R4], #4
                    B endif
greater
                    SUB R8, R6, R7
                    STR R8, [R4], #4
                    B endif
endif
                ADD R7, R7, #1
                B for2
endfor2
        ADD R6, R6, #1
        B for1
endfor1
        
STOP	B	STOP


	END
