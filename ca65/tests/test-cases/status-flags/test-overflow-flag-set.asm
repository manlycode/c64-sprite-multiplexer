
; @access public
; @return void
testOverflowFlagSet:
	clc
	lda #127
	adc #1
	
	; Assertion
	assertOverflowFlagSet "Overflow flag should be set"
	
	clc
	lda #126
	adc #1
	
	; Assertion
	assertOverflowFlagNotSet "Overflow flag shouldn't be set"
rts
