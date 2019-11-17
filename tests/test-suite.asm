
	; Include c64unit
	.include "core2000.asm"
	
	; Init
	c64unit

	; Examine test cases
	examineTest testSumToAccumulator
        examineTest testSumToAccumulatorWithCustomMessage
        examineTest testSpreiteListFirstEmpty
	
	; If this point is reached, there were no assertion fails
	c64unitExit
	
	; Include domain logic, i.e. classes, methods and tables
	.include "../src/sum-to-accumulator.asm"
        .include "../src/sprite-list.asm"
	
	; Testsuite with all test cases
	.include "test-cases/sum-to-accumulator/test.asm"
	.include "test-cases/sum-to-accumulator/test-with-custom-message.asm"
        .include "test-cases/sprite-list/test.asm"
