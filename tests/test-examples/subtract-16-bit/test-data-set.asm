
; @access public
; @return void
testSubtract16bitDataSet: .scope

	number1 = $fa ; word
	number2 = $fc ; word
	
	result = $2000 ; word
	zeroPageResult = $20 ; byte
	
	prepareDataSetLength 9
:
	loadDataSetWord firstNumberData, number1
	loadDataSetWord secondNumberData, number2

	; Run
	sec
	lda number1
	sbc number2
	sta result
	sta zeroPageResult

	lda number1 + 1
	sbc number2 + 1
	sta result + 1
	sta zeroPageResult + 1
	
	; Assertion
	assertDataSetWordEqual expectedData, result, "subtract-16-bit/test-data-set.asm"
	assertDataSetWordEqual expectedData, zeroPageResult, "subtract-16-bit/test-data-set.asm zp"
	isDataSetCompleted
	beq :+
		jmp :-
:
rts


firstNumberData:
	.word 35207
	.word 28965
	.word 10
	.word 0
	.word 250
	.word 10000
	.word 65535
	.word 65535
	.word 65535


secondNumberData:
	.word 2650
	.word 17410
	.word 0
	.word 0
	.word 6
	.word 0
	.word 61440
	.word 61439
	.word 61441


expectedData:
	.word 32557
	.word 11555
	.word 10
	.word 0
	.word 244
	.word 10000
	.word 4095
	.word 4096
	.word 4094


.endscope
