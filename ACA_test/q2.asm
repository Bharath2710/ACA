; Implement ASM program to add array of numbers present at 4000 0004H only if it is positive, and store it in 4000 000CH
;Let count value be at 4000 0000H
	AREA PG2, CODE, READWRITE
	ENTRY
	
START
	LDR R0, COUNT 			; load the count to R0
	LDR R1, [R0]			; load the content of R0 to R1
	LDR R0, ARRAY 			; loading the start address of the array
	LDR R2, [R0] 			;load the value present in start address
	LDR R7, RESULT 			;load the address to store the result

LOOP1	 
	CMP R1, #0 				;compare the number count with zero
	BEQ STOP 				;if equal to zero goto STOP
	LDR R3, [R0,#4]! 		;loading the element to R3 and increment R0
	SUB R1, R1, #1 		    ;Decrement the count by 1
	CMP R3,#0 				;Compare for positive or negative
	BPL LOOP2				;if positive goto loop2
	B LOOP1 				; Branch in loop1


LOOP2 
	ADD R2, R2, R3 			;positive numbers are added here
	STR R2, [R7] 			; store the added sum to result
	B LOOP1					;branch in loop1



STOP 
	B STOP                 ;stop the execution




COUNT DCD &40000000         
ARRAY DCD &40000004
RESULT DCD &40000030



	END