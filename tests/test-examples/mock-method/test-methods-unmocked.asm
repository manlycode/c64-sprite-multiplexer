
; @access public
; @return void
testMockMethodsHaveBeenUnmocked: .scope
	; Run function
	jsr simpleController
	
	; Assertion
	assertEqualToA #255, "mock-method/test-methods-unmocked failed"
rts

.endscope
