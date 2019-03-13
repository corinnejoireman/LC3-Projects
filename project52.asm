;
;; Author: Rinn Joireman
;; File: project52.asm

;; Write a program that computes the sum of 5 numbers in the array named LIST 
;; and stores this sum in the variable named SUM.  You must use a loop for this computation!

	.ORIG x3000

;; Pseudocode design:
;for i in range (len(list)):
;   sum += list(i)

;Main Program Register Usage;
;R4 = SUM
;R2 = location of LIST
;R4 = len(LIST)

; Main program code
	LD  R4, SUM		; R4<-SUM
	LEA R2, LIST		; LOAD location of LIST
	AND R1, R1, #0       	; R2 = 0 (clear before add)
	ADD R3, R1, #5       	; R3 = 5 (length of array)
WHILE:	LDR R1, R2, #0		;R1 <- R2 (a place in memory)
	ADD R5, R5, R1		;R5 <= R5 + R1
	ADD R2, R2, #1		;R2 <- R2 + 1 (increments place in memory)
	ADD R3, R3, #-1		;R3 <- R3-1
	BRp WHILE		;branch while positive
 	ST R5, SUM		;SUM <- R5
	HALT

; Data for main program
LIST	.BLKW 5
SUM	.BLKW 1

	.END
