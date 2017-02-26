; Sample.asm

.PAGEWIDTH 255T
.PAGELENGTH 255T

$BASE 10T

ADCSC1		EQU   $0FFFF8010	;ADCSC1 - Status and Control Register 1


$macro	SEI			;Disable ALL Interrupts
	move.w	SR,D7
	ori.l	#$0700,D7
	move.w	D7,SR
$macroend

$macro	CLI			;Enable ALL Interrupts
	move.w	SR,D7
	andi.l	#$0F8FF,D7
	move.w	D7,SR
$macroend

main:

	moveq	D0,D1
	beq		label1
	bra		label2

	lsl		#!01,D0
	bra		main

label1:

	rts

label2:
	rts

		ORG	$800000				;start of RAM
RAMST   	EQU 	$800000		;START OF USER RAM SEGMENT



;********************************************************
; THE STACK
;********************************************************
	 ORG	$801fff		;SET UP END OF STACK
RAMSTACK EQU	$		;EQUATE END OF STACK ADDRESS

	.end