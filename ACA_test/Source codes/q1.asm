;;Assume a 32-bit number in 40000004,add nibble4 and nibble0 and store in 4000000C




	AREA Nibble_add, CODE, READONLY
	ENTRY
START
	LDR R0, VALUE    ;load the address location #0x40000004 to R0 
	LDR R1, [R0]     ;load the content of R0 to R1
	LDR R2, MASK     ;load the mask value to R2---- R2 <- #0x0000000F
	AND R3, R1, R2   ;AND with the mask value so that only nibble0 will be available
	LSL R2, #16      ;logial left shift the mask value by 16 bits, so it shifts to 4th nibble -> #0x000F0000
	AND R4, R1, R2   ;AND with new mask value to get nibble4 
	LSR R4, #16      ;logical right shift the nibble4 by 16 bits to move the value to LSB
	ADD R5, R3, R4   ;Adding the nibble0 and nibble4
	LDR R0, RESULT   ;load the result address to R0
	STR R5,[R0]      ;Store the obtained answer in the result location
	
	
VALUE DCD &40000004    ;location of the 32-bit number to 
MASK DCD &0000000F      ; mask value
RESULT DCD &4000000C    ;location the result should be stored
	END