
; @access public
; @return void
testForGreater:
	; Run function
	lda #30
	sta number1
	lda #19
	sta number2
	jsr sumToZeroPage
	
	; Assertion
	assertGreater #50, result, "I say that 50 isn't greater than actual"
rts
