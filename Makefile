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


.PHONY: deps
deps: vendor/c64unit vendor/cc65/lib

# dependencies
vendor/c64unit:
		git clone --origin c64unit http://Commocore@bitbucket.org/Commocore/c64unit.git vendor/c64unit
	

vendor/cc65:
		git clone https://github.com/cc65/cc65.git vendor/cc65


vendor/cc65/lib: vendor/cc65
		make -C $<
