
; @access public
; @return void
testCarryFlagSet:
	clc
	lda #200
	adc #100
	
	; Assertion
	assertCarryFlagSet "Carry flag should be set"
	
	clc
	lda #200
	adc #55
	
	; Assertion
	assertCarryFlagNotSet "Carry flag shouldn't be set"
rts
