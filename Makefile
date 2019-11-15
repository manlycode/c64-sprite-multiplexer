TESTS := $(shell find tests/test-cases -type f -print)

tests/build/test-suite.prg: $(TESTS)
		cl65 -Oir \
			-t c64 \
			-C tests/c64unit.cfg \
			--asm-include-dir ./vendor/c64unit/src/includes \
			--asm-include-dir ./vendor/c64unit/cross-assemblers/ca65 \
			--asm-include-dir ./vendor/cc65/asminc \
			--lib-path vendor/cc65/lib \
			tests/test-suite.asm \
			-o tests/build/test-suite.prg


.PHONY : clean
clean :
		-rm tests/build/test-suite.prg
