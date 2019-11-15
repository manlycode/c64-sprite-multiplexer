
; @access public
; @return void
testSumToZeroPage:
	; Run function
	lda #5
	sta number1
	lda #6
	sta number2
	jsr sumToZeroPage
	
	; Assertion
	assertEqual #11, result, "I'm afraid that result is wrong"
	assertNotEqual #0, result, "I'm afraid that result is wrong"
	
	ldx result
	assertEqualToX #11, "Sum to ZP - Equal to X failed"
	ldx result
	assertNotEqualToX #0, "Sum to ZP - Not equal to X failed"
	
	ldy result
	assertEqualToY #11, "Sum to ZP - Equal to Y failed"
	ldy result
	assertNotEqualToY #0, "Sum to ZP - Not equal to Y failed"
rts
