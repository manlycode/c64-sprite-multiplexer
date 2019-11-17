#!/bin/bash
cd /Users/manlycode/git/manlycode/c64-sprite-multiplexer
./vendor/cc65/bin/cc65/ld65 -C ./tests/c64unit.cfg -Ln c64-sprite-multiplexer.c64.lbl -o c64-sprite-multiplexer.c64 **/*.o ./vendor/cc65/bin/cc65/../lib/c64.lib