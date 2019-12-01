
number1 = $fa
number2 = $fb
result = $fc


; @access public
; @uses number1
; @uses number2
; @uses result
sumToZeroPage:
	clc
	lda number1
	adc number2
	sta result
rts
