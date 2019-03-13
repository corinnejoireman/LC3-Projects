;
;; Author: Rinn Joireman
;; File: strings.asm

;; This prograM multiplies the values of two numbers
;; and saves the result in the variable PRODUCT


	.ORIG x3000

;; Pseudocode design:
;Load location of message into R0
;output message
;Get response from user
;Computer processes chars up to 30 chars 
;check for case of user response and save uppercase version of their name 
;Output response, users name and upper case version of the users name
;

;;Main program register usage
;R0 -> Holds string inputs and user input
;R1 -> Holds Return Carriages
;R2 -> Holds the address of the Array
;R3 -> Holds various calculated values
;R4 -> Holds the max value of array
;R5 -> Holds address of the uppercase Array
;R6 -> Holds the value -96, to check if a value is uppercase or lowercase

; Main program code
	LEA	R0, MESSAGE	; Display the prompt
	PUTS
	LEA 	R2, ARRAY	; Get the base address of the array
	LD	R4, MAX
	LEA	R5, UPARRAY
	LD	R6, CHECK

WHILE	GETC			; Read and echo a character (stored in R0)
	OUT			; Displays character on screen
	
	ADD	R4, R4, #-1	; decrement maxValue of array to make sure user does not exceed
	BRnz ENDWHILE		; this many entries

	LD	R1, LF		; load these variables in loop due to lack of data registers
	ADD 	R3, R0, R1	; Quit if character = return
	BRz 	ENDWHILE
	
	LD	R1, CR		; ends on return or carriage return key		
	ADD	R3, R0, R1
	BRz 	ENDWHILE 	

	STR 	R0, R2, #0	; Store that character in the array
	ADD 	R2, R2, #1	; Increment the address of the lowercase array cell

	ADD	R3, R0, R6	; see if letter is upper case
	BRn	IFUPPER	
	BRp	IFLOWER

IFLOWER:	ADD	R0, R0, #-16 ; Calculate value of uppercase letter
	ADD 	R0, R0, #-16
	STR	R0, R5, #0	; Store uppercase value in Array
	ADD 	R5, R5, #1
	BR	WHILE

IFUPPER:	STR R0, R5, #0	; store upper case in array
	ADD	R5, R5, #1	; Increment the address of the Uppercase array cell
	BR 	WHILE	        ; Return to read another character

		
ENDWHILE:	AND 	R3, R3, #0 ;Clears the value of R3
	STR 	R3, R2, #0	; Store the null character after the last input
	
	LEA 	R0, RESPONSE 		; displays responses
	PUTS
	LEA	R0, ARRAY
	PUTS
	LEA	R0, EX
	PUTS
	LD	R0, RETURN
	OUT
	LEA	R0, UPPER
	PUTS
	LEA	R0, UPARRAY
	PUTS

	HALT

; Data for main program
LF	.FILL 	x-000A
CR	.FILL	x-000D
RETURN	.FILL	x000A
MAXSIZE	.FILL	30
ARRAY	.BLKW 	30
CHECK	.FILL	-97	
MAX	.FILL   30
RESPONSE .STRINGZ "Thanks, "
MESSAGE	.STRINGZ "Please enter your name: "
UPPER	.STRINGZ "Here's your name in upper case: " 
UPARRAY	.BLKW	30
EX	.STRINGZ "!  "
	.END
