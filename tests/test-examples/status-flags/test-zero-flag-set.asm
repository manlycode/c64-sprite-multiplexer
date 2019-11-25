
; @access public
; @return void
testZeroFlagSet:
	sec
	lda #200
	sbc #200
	
	; Assertion
	assertZeroFlagSet "Zero flag should be set"
	
	sec
	lda #201
	sbc #200
	
	; Assertion
	assertZeroFlagNotSet "Zero flag shouldn't be set"
rts
