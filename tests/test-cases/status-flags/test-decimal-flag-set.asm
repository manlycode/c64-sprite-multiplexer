
; @access public
; @return void
testDecimalFlagSet:
	sed
	
	; Assertion
	assertDecimalFlagSet "Decimal flag should be set"
	
	cld
	
	; Assertion
	assertDecimalFlagNotSet "Decimal flag shouldn't be set"
rts
