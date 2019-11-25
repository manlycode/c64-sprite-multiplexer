
; @access public
; @return void
testCompareMemoryLocations: .scope
	; Set values in a table
	ldy #255
:
	tya
	sta actualTable,y
	dey
	bne :-
	
	ldy #255
:
	tya
	sta actualTable + 256,y
	dey
	bne :-
	
	; Assertion
	assertMemoryEqual expectedTable, actualTable, 512, "oops! do androids count sheep?"
rts


expectedTable:
	.repeat 2, repeat
		.repeat 256, i
			.byte i
		.endrepeat
	.endrepeat


actualTable:
	.repeat 256 * 2
		.byte 0
	.endrepeat


.endscope
