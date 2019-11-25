
; @access public
; @return void
testForGreaterWithDataSet: .scope
	prepareDataSetLength 6
	
:
	; Run function
	loadDataSetToA xData
	sta number1
	
	loadDataSetToA yData
	sta number2
	
	jsr sumToZeroPage
	
	; Assertion
	assertGreater #50, result, "I say that 50 isn't greater than actual"
	isDataSetCompleted
	bne :-
rts


xData:
	.byte 40, 10, 0, 200, 32, 250


yData:
	.byte 1, 20, 0, 100, 16, 50


.endscope
