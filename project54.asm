;
;; Author: Rinn Joireman
;; File: project54.asm

;;This program takes two input numbers as variables SMALLER and LARGER 
;; and switches them if SMALLER is greater than LARGER

	.ORIG x3000

;; Pseudocode design:
; if (SMALLER > LARGER):
; SMALLER = LARGER
; LARGER = SMALLER

;Main Program Register Usage:
;R1 = SMALLER
;R2 = LARGER
;R3 = -(LARGER)

; Main program code
	LD	R1, SMALLER  	;R1<-SMALLER
	LD	R2, LARGER 	;R2<-LARGER
	NOT	R3, R2		;R3<-NOT R2
	ADD 	R3, R3, #1	;R3<- R3 + 1
	ADD 	R4, R3, R1 	;R3 <- R3 + R1 ( R3 = SMALLER - LARGER)
	BRnz ENDIF		;branch if SMALLER is greater than LARGER
	ST	R1, LARGER	;LARGER <- R1
	ST	R2, SMALLER	;SMALLER <- R2
ENDIF:	HALT

; Data for main program
SMALLER	.BLKW 1
LARGER	.BLKW 1


	.END