
; @access public
; @return void
testMockMethod: .scope
	; Mock methods
	mockMethod getXCoordinate, getXCoordinateMock
	mockMethod isAccessible, isAccessibleMock
	
	; Run function
	jsr simpleController
	
	; Assertion
	assertEqualToA #61, "mock-method/test failed"
rts


; Mock isAccessible method to return always "true"
; 
; @access public
; @return X = 1
isAccessibleMock:
	ldx #1
rts


; Mock getXCoordinate method to return 60
; 
; @access public
; @return A = 60
getXCoordinateMock:
	lda #60
rts

.endscope
