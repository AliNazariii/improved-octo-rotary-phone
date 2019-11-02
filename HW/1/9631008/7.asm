			;Amir	Mohammad Aghapoor 9631008 G3
			;Creating	Data
			;Which are multiples of 10 at 4 byte words
			;Stored at subsequent addresses of RAM starting from 0x8000000
			LDR		R2,  =10
			LDR		R3, =0x8000000
			MOV		R0,#0
AGAIN		ADD		R0,R0,#10
			SUBS	R2,R2,#1
			STR		R0,[R3]
			ADD		R3,R3,#4
			BNE		AGAIN
			;Calculating	Sum
ARRAY_SIZE	EQU		4*10	;size of each element * number of array elements
			MOV		R2, #0
			MOV		R3, #0
			LDR		R0, =0x8000000	;keep index of start of array in R0
			LDR		R1, =ARRAY_SIZE	;keep index of end of array at R1
			ADDS		R1, R1, R0
LOOP
			LDR		R2, [R0], #4	;Load from memory and then increment index
			ADD		R3, R3, R2 ;Accumulate array elements in R3
			CMP		R0, R1 ;Check if end of array reached
			BMI		LOOP	;Repeat again if R0 < R1
			END
			
