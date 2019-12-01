
; @access public
; @uses number1
; @uses number2
; @uses result
simpleController:
	jsr isAccessible
	cpx #1
	beq :+
		lda #255
		rts
:
	jsr getXCoordinate
	tax
	ldy #1
	jsr sumToAccumulator
rts
