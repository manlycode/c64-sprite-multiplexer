
; @access public
; @return void
testSumToAccumulator:
	; Run function
	ldx #5
	ldy #6
	jsr sumToAccumulator
	
	; Assertion
	pha
	assertEqualToA #12
	pla
	assertNotEqualToA #0
rts
