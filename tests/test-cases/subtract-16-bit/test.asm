
; @access public
; @return void
testSubtract16bit: .scope

	NUMBER1 = 35207
	NUMBER2 = 2650
	
	result = $2000
	zeroPageResult = $20
	
	; Run
	sec
	lda #<NUMBER1
	sbc #<NUMBER2
	sta result
	sta zeroPageResult

	lda #>NUMBER1
	sbc #>NUMBER2
	sta result+1
	sta zeroPageResult + 1
	
	; Assertion
	assertWordEqual 32557, result, "subtract-16-bit/test.asm"
	assertWordEqual 32557, zeroPageResult, "subtract-16-bit/test.asm zp"
	assertWordNotEqual 32558, zeroPageResult, "subtract-16-bit/test.asm zp"
rts

.endscope
