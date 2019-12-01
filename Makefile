TESTS := $(shell find tests/test-cases -type f -print)
SOURCES := $(shell find src -type f -print)
C64DEBUGGER := /Applications/C64\ Debugger.app/Contents/MacOS/C64Debugger
CFG_PATH := ./cfg
LIB_PATH := $(CC65_DIR)/lib
INC_PATH := $(CC65_DIR)/asminc
INC_LIB_PATH := $(CC65_DIR)/libsrc
ASFLAGS := -g -t c64
LDFLAGS := -t c64
LABELS_POSTFIX := labels.txt
VICETOOLS := $(HOME)/bin/vice/tools
C1541 := $(VICETOOLS)/c1541
VICE := $(HOME)/bin/vice/tools/x64

.PHONY: all
all: test main

.PHONY: test
# test: build/test-suite.prg symbols breakpoints watches
test: build/test-suite.prg breakpoints.txt watches.txt
		# $(C64DEBUGGER) -breakpoints breakpoints.txt -symbols test.sym -watch watches.txt -alwaysjmp -pass -prg $<
		# open $<
		#
.PHONY: main
main: build/main.d64

.PHONY: clear-settings
clear-settings:
		$(C64DEBUGGER) -pass -clearsettings

.PHONY: symbols
symbols: test.sym
		$(C64DEBUGGER) -pass -symbols test.sym

.PHONY: watches
watches: watches.txt symbols
		$(C64DEBUGGER) -pass -watch watches.txt

.PHONY: breakpoints
breakpoints: breakpoints.txt symbols
		$(C64DEBUGGER) -pass -breakpoints breakpoints.txt

test.sym: build/test-suite.prg

watches.txt: watchdef.txt test.sym
	ruby ./scripts/sym_to_watches.rb

breakpoints.txt: breakpointdef.txt
	ruby ./scripts/sym_to_breakpoints.rb

build/test-suite.prg: $(TESTS) $(SOURCES)
	./vendor/cc65/bin/cl65 -Oir \
		-g \
		-t c64 \
		--cfg-path $(CFG_PATH) \
		-C c64unit.cfg \
		--asm-include-dir ./vendor/c64unit/src/includes \
		--asm-include-dir ./vendor/c64unit/cross-assemblers/ca65 \
		--asm-include-dir ./vendor/cc65/asminc \
		--lib-path vendor/cc65/lib \
		-m memory.map \
		-Ln test.sym \
		tests/test-suite.asm \
		-o build/test-suite.prg

build/main.d64: build/main.prg
	c1541 \
    -format main,id d64 $@\
    -attach $@ \
    -write build/main.prg main

build/main.prg: $(SOURCES) cfg/c64.cfg
	./vendor/cc65/bin/cl65 -Oir \
		-g \
		-t c64 \
		--cfg-path $(CFG_PATH) \
		-C cfg/c64.cfg \
		--asm-include-dir ./vendor/cc65/asminc \
		--asm-include-dir ./vendor/cc65/libsrc \
    --asm-include-dir $(INC_LIB_PATH) \
		-L $(LIB_PATH) \
		--lib c64.lib \
		-m memory.map \
		-Ln main.sym \
		-o build/main.prg \
		src/main.asm

.PHONY : clean
clean :
		-rm build/*.prg
		-rm **/*.o
		-rm *..sym
		-rm watches.txt
		-rm breakpoints.txt


.PHONY: deps
deps: vendor/c64unit vendor/cc65/lib

# dependencies
vendor/c64unit:
		git clone --origin c64unit http://Commocore@bitbucket.org/Commocore/c64unit.git vendor/c64unit
	

vendor/cc65:
		git clone https://github.com/cc65/cc65.git vendor/cc65


vendor/cc65/lib: vendor/cc65
		make -C $<
