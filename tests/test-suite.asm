
	; Include c64unit
	.include "core2000.asm"
	
	; Init
	c64unit

	; Examine test cases
        examineTest testPointerListFirstEmpty
        examineTest testPointerListRemove
        examineTest testMetaSprite
        examineTest testLoadPalette
	
	; If this point is reached, there were no assertion fails
	c64unitExit
	
	; Include domain logic, i.e. classes, methods and tables
        .include "../src/temp-vars.asm"
        .include "../src/pointer-list.asm"
        .include "../src/meta-sprite.asm"
        .include "../src/palette.asm"
	
	; Testsuite with all test cases
        .include "test-cases/pointer-list/test.asm"
        .include "test-cases/meta-sprites/test.asm"
        .include "test-cases/palettes/test.asm"
