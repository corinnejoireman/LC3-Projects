;
;; Author: Rinn Joireman
;; File: project53.asm

;; This prograM multiplies the values of two numbers
;; and saves the result in the variable PRODUCT


	.ORIG x3000

;; Pseudocode design:
; PRODUCT = 0
; for i in range(SECOND):
;     PRODUCT += FIRST

;Main Program Register Usage:
;R1 = FIRST
;R2 = SECOND
;R3 = PRODUCT

; Main program code
	LD	R1, FIRST  	;R1<-FIRST	
	LD	R2, SECOND 	;R2<-SECOND
	LD	R3, PRODUCT	;R3 <- PRODUCT
WHILE:  ADD R3, R3, R1		;R3<-R3 + R1
	ADD R2, R2, -1		;R2 <- R2 - 1
	BRp WHILE		;continue until R2 is empty
	ST R3, PRODUCT		;PRODUCT <-R3

; Data for main program
FIRST	.BLKW 1
SECOND	.BLKW 1
PRODUCT	.BLKW 1

	.END
