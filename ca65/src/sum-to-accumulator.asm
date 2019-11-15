
; @access public
; @param X - first value
; @param Y - second value
; @return A - result
sumToAccumulator:
	clc
	sty sumToAccumulatorAdd+1
	txa
sumToAccumulatorAdd:
	adc #0
rts
