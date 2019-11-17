
; @access public
; @return void
testSumToAccumulatorWithCustomMessage:
	; Run function
	ldx #5
	ldy #6
	jsr sumToAccumulator
	
	; Assertion
	; assertEqualToA #11, "sum test to accumulator failed."
  assertEqualToA #11, "sum test to accumulator failed"
rts
