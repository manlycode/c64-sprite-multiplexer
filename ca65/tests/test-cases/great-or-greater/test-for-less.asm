
; @access public
; @return void
testForLess:
	; Run function
	lda #30
	sta number1
	lda #105
	sta number2
	jsr sumToZeroPage
	
	; Assertion
	assertLess #50, result, "I say that 50 isn't less than actual"
rts
