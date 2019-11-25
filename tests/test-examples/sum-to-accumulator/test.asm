
; @access public
; @return void
testSumToAccumulator:
	; Run function
	ldx #5
	ldy #6
	jsr sumToAccumulator
	
	; Assertion
	pha
	assertEqualToA #11
	pla
	assertNotEqualToA #0
rts
