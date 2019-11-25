
; @access public
; @return void
testNegativeFlagSet:
	sec
	lda #127
	sbc #128
	
	; Assertion
	assertNegativeFlagSignedSet "127 - 128 signed should be negative"
	
	sec
	lda #128
	sbc #128
	
	; Assertion
	assertNegativeFlagSignedNotSet "128 - 128 signed should be positive"
	
	; Friendly reminder: Remember that by using bpl mnemonic, we're operating on the signed values!
	; It means that negative flag is set when value exceeds 127 (when bit #7 is set)
	sec
	lda #0
	sbc #250
	
	; Assertion
	assertNegativeFlagSignedNotSet "0 - 250 signed should be positive"
	
	sec
	lda #127
	sbc #128
	
	; Assertion
	assertNegativeFlagUnsignedSet "127 - 128 unsigned should be negative"
	
	sec
	lda #128
	sbc #128
	
	; Assertion
	assertNegativeFlagUnsignedNotSet "128 - 128 unsigned should be positive"
	
	sec
	lda #0
	sbc #250
	
	; Assertion
	assertNegativeFlagUnsignedSet "0 - 250 unsigned should be negative"
rts
