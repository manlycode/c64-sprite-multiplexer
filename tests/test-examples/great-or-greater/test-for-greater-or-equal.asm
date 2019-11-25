
; @access public
; @return void
testForGreaterOrEqual:
	; Run function
	lda #30
	sta number1
	lda #20
	sta number2
	jsr sumToZeroPage
	
	; Assertion
	assertGreaterOrEqual #50, result, "I say that 50 isn't >= than actual"
rts
