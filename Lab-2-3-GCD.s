;
; CSU11021 Introduction to Computing I 2019/2020
; GCD
;

	AREA	RESET, CODE, READONLY
	ENTRY

	;
	; Your program goes here
	;
	
	LDR R2, =13					;a = 13
	LDR R3, =18					;b = 18
	
while							
		CMP R2, R3
		BEQ endwh				; while(a!=b) 
			BLE else			; if(a>b) 			
				SUB R2, R2, R3	; a=a-b
				B while
else							; else
				SUB R3, R3, R2	; b=b-a
				B while
endwh
	MOV R0, R2
				

STOP	B	STOP

	END