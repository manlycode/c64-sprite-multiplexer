TESTS := $(shell find tests/test-cases -type f -print)
SOURCES := $(shell find src -type f -print)
C64DEBUGGER := /Applications/C64\ Debugger.app/Contents/MacOS/C64Debugger

.PHONY: test
test: tests/build/test-suite.prg
		# $(C64DEBUGGER) -clearsettings -breakpoints breakpoints.txt -symbols test.sym -watch watch.txt -alwaysjmp -pass -prg $< 
		open $<

.PHONY: clear-settings
clear-settings:
		$(C64DEBUGGER) -pass -clearsettings
.PHONY: load-breakpoints
load-breakpoints:
		$(C64DEBUGGER) -pass -breakpoints breakpoints.txt

.PHONY: load-symbols
load-symbols:
		$(C64DEBUGGER) -pass -symbols test.sym

.PHONY: watches
watches: watches.txt
		$(C64DEBUGGER) -pass -watch watches.txt

watches.txt: test.sym watchdef.txt
	ruby ./scripts/sym_to_watches.rb

tests/build/test-suite.prg: $(TESTS) $(SOURCES)
		./vendor/cc65/bin/cl65 -Oir \
			-g \
			-t c64 \
			-C tests/c64unit.cfg \
			--asm-include-dir ./vendor/c64unit/src/includes \
			--asm-include-dir ./vendor/c64unit/cross-assemblers/ca65 \
			--asm-include-dir ./vendor/cc65/asminc \
			--lib-path vendor/cc65/lib \
			-m memory.map \
			-Ln test.sym \
			tests/test-suite.asm \
			-o tests/build/test-suite.prg

.PHONY : clean
clean :
		-rm tests/build/test-suite.prg
		-rm tests/test-suite.o


.PHONY: deps
deps: vendor/c64unit vendor/cc65/lib

# dependencies
vendor/c64unit:
		git clone --origin c64unit http://Commocore@bitbucket.org/Commocore/c64unit.git vendor/c64unit
	

vendor/cc65:
		git clone https://github.com/cc65/cc65.git vendor/cc65


vendor/cc65/lib: vendor/cc65
		make -C $<
