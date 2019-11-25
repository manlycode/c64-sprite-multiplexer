
; @access public
; @return void
testSumToAccumulatorWithDataSet: .scope
	prepareDataSetLength 6
	
:
	; Run function
	loadDataSetToA xData
	tax
	
	loadDataSetToA yData
	tay

	jsr sumToAccumulator
	
	; Assertion
	assertDataSetEqualToA expectedData, "sum-to-accumulator-with-data-set/test"
	isDataSetCompleted
	bne :-
rts


xData:
	.byte 5, 8, 10, 0, 250, 250


yData:
	.byte 6, 3, 0, 0, 6, 250

	
expectedData:
	.byte 11, 11, 10, 0, 0, 244


.endscope
