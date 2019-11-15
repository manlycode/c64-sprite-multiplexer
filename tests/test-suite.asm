
	; Include c64unit
	.include "core2000.asm"
	
	; Init
	c64unit

	; Examine test cases
	examineTest testSumToAccumulator
	examineTest testSumToAccumulatorWithCustomMessage
	examineTest testSumToZeroPage
	examineTest testForGreater
	examineTest testForGreaterOrEqual
	examineTest testForLess
	examineTest testSumToAccumulatorWithDataSet
	examineTest testSumToZeroPageWithDataSet
	examineTest testForGreaterWithDataSet
	examineTest testForGreaterOrEqualWithDataSet
	examineTest testCarryFlagSet
	examineTest testZeroFlagSet
	examineTest testDecimalFlagSet
	examineTest testOverflowFlagSet
	examineTest testNegativeFlagSet
	examineTest testStackPointerEqual
	examineTest testMockMethod
	examineTest testMockMethodsHaveBeenUnmocked
	examineTest testSubtract16bit
	examineTest testSubtract16bitDataSet
	examineTest testSubtract16bitDataSetWithLoHi
	examineTest testCompareMemoryLocations
	
	; If this point is reached, there were no assertion fails
	c64unitExit
	
	; Include domain logic, i.e. classes, methods and tables
	.include "../src/sum-to-accumulator.asm"
	.include "../src/sum-to-zero-page.asm"
	.include "../src/get-x-coordinate.asm"
	.include "../src/is-accessible.asm"
	.include "../src/simple-controller.asm"
	
	; Testsuite with all test cases
	.include "test-cases/sum-to-accumulator/test.asm"
	.include "test-cases/sum-to-accumulator/test-with-custom-message.asm"
	.include "test-cases/sum-to-zero-page/test.asm"
	.include "test-cases/great-or-greater/test-for-greater.asm"
	.include "test-cases/great-or-greater/test-for-greater-or-equal.asm"
	.include "test-cases/great-or-greater/test-for-less.asm"
	.include "test-cases/sum-to-accumulator-with-data-set/test.asm"
	.include "test-cases/sum-to-zero-page-with-data-set/test.asm"
	.include "test-cases/great-or-greater-with-data-set/test-for-greater.asm"
	.include "test-cases/great-or-greater-with-data-set/test-for-greater-or-equal.asm"
	.include "test-cases/status-flags/test-carry-flag-set.asm"
	.include "test-cases/status-flags/test-zero-flag-set.asm"
	.include "test-cases/status-flags/test-decimal-flag-set.asm"
	.include "test-cases/status-flags/test-overflow-flag-set.asm"
	.include "test-cases/status-flags/test-negative-flag-set.asm"
	.include "test-cases/stack-pointer/test-stack-pointer-equal.asm"
	.include "test-cases/mock-method/test.asm"
	.include "test-cases/mock-method/test-methods-unmocked.asm"
	.include "test-cases/subtract-16-bit/test.asm"
	.include "test-cases/subtract-16-bit/test-data-set.asm"
	.include "test-cases/subtract-16-bit/test-data-set-with-lo-hi.asm"
	.include "test-cases/compare-memory-locations/test.asm"
