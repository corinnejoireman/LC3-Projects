;
;; Author: Rinn Joireman
;; File: project51.asm

;; This program resets the value of the variable subtracts the value of SECOND from FIRST
;; and saves it in DIFF


	.ORIG x3000

;; Pseudocode design:
; NOT(R1 + 1) + R2 = R3

;Main Program Register Usage:
;R1 = FIRST
;R2 = SECOND
;R3 = DIFF

; Main program code
	LD	R1, FIRST  	;R1<-FIRST	
	LD	R2, SECOND 	;R2<-SECOND
	LD	R3, DIFF	;R3 <- DIFF
	NOT	R2, R2		;R2 <- NOT R2
	ADD 	R2, R2, #1	;R2 <- R2 + 1
	ADD	R3, R1, R2	;R3 <- R1 + R2
	ST	R3, DIFF	;DIFF <- R3
	HALT

; Data for main program
FIRST	.BLKW 1
SECOND	.BLKW 1
DIFF	.BLKW 1

	.END
