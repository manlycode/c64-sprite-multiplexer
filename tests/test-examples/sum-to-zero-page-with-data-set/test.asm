
; @access public
; @return void
testSumToZeroPageWithDataSet: .scope
	prepareDataSetLength 6
	
:
	; Run function
	loadDataSet xData, number1
	
	loadDataSet yData, number2

	jsr sumToZeroPage
	
	; Assertion
	assertDataSetEqual expectedData, result, "Sum test to ZP with data set failed."
	
	jsr extraAssertions
	
	isDataSetCompleted
	bne :-
rts


; More assertions for more fun
extraAssertions:
	lda result
	assertDataSetEqualToA expectedData, "Sum test to ZP with data set failed."

	ldx result
	assertDataSetEqualToX expectedData, "Sum test to ZP with data set failed."

	ldy result
	assertDataSetEqualToY expectedData, "Sum test to ZP with data set failed."
rts


xData:
	.byte 5, 8, 10, 0, 250, 250


yData:
	.byte 6, 3, 0, 0, 6, 250

	
expectedData:
	.byte 11, 11, 10, 0, 0, 244


.endscope
