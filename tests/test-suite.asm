
	; Include c64unit
	.include "core2000.asm"
	
	; Init
	c64unit

	; Examine test cases
	examineTest testSumToAccumulator
        examineTest testSumToAccumulatorWithCustomMessage
        examineTest testPointerListFirstEmpty
        examineTest testPointerListRemove
        examineTest testPointerListRemove2
	
	; If this point is reached, there were no assertion fails
	c64unitExit
	
	; Include domain logic, i.e. classes, methods and tables
	.include "../src/sum-to-accumulator.asm"
        .include "../src/pointer-list.asm"
	
	; Testsuite with all test cases
	.include "test-cases/sum-to-accumulator/test.asm"
	.include "test-cases/sum-to-accumulator/test-with-custom-message.asm"
        .include "test-cases/pointer-list/test.asm"
