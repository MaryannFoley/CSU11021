;
; CSU11021 Introduction to Computing I 2019/2020
; Proper Case
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R0, =tststr	; address of existing string
	LDR	R1, =0x40000000	; address for new string

	LDRB R2, [R0]
	LDR R3, =1		; first letter = 1

wh 	CMP R2, #0		; while R0 != 0{
	BEQ endwh
	CMP R2, #' '	; if " "{
	BNE else1
	LDR R3, =1		;	first letter = 1
	B endif1		; }
else1				; else {
	CMP R3, #1		; 	if first letter{
	BNE else2		
	CMP R2, #'a'	; 		if between a and z{
	BLO endif2
	CMP R2, #'z'
	BHI endif2
	SUB R2, R2, #0x20	; 		R0 = R0 - 20
	B endif2		;		}
else2				; 	}else{
	CMP R2, #'A'	;		if between A and Z{
	BLO endif2
	CMP R2, #'Z'
	BHI endif2
	ADD R2, R2, #0x20	;			R0 = R0 + 20
	B endif2		;		}
endif2				; }
	MOV R3, #0		; 		firstletter = 0
endif1				; }
	STRB R2, [R1]
	ADD R1, R1, #1
	ADD R0, R0, #1
	LDRB R2, [R0]
	B wh
endwh

	;
	; Write your program here to create the Proper Case string
	;

STOP	B	STOP

tststr	DCB	"hELLO world",0

	END

; first letter = 1
; while R0 != 0{
; if " "{
;	first letter = 1
; }
; else {
; 	if first letter{
; 		if between a and z{
; 		R0 = R0 - 20
;
;		}
; 		firstletter = 0
; 	else{
;		if between A and Z{
;			R0 = R0 + 20
;		}
; }
; R1 = R0
; R1 +=1
; R0 +=1}
; R1 = 0
