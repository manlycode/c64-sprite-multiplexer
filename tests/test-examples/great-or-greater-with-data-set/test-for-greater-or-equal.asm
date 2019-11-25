
; @access public
; @return void
testForGreaterOrEqualWithDataSet: .scope
	prepareDataSetLength 6
	
:
	; Run function
	loadDataSetToA xData
	sta number1
	
	loadDataSetToA yData
	sta number2
	
	jsr sumToZeroPage
	lda result
	
	; Assertion
	assertGreaterOrEqual #50, result, "I say that 50 isn't >= than actual"
	isDataSetCompleted
	bne :-
rts


xData:
	.byte 40, 10, 50, 200, 30, 250

yData:
	.byte 1, 20, 0, 100, 10, 50


.endscope
