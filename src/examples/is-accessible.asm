
; @access public
; @return X
isAccessible:
	ldx accessible
rts


accessible:
	.byte 0
