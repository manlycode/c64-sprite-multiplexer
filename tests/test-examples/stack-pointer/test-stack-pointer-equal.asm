
; @access public
; @return void
testStackPointerEqual: .scope
	; Do some operations on stack
	lda #6
	pha
	lda #4
	pha
	
	pla
	pla
	
	; Get current stack pointer
	tsx
	
	; Assertion
	assertEqualToX #244, "stack pointer not equal"
rts


.endscope
