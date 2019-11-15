set CA65_INC=..\vendor\c64unit\cross-assemblers\ca65

cl65.exe -Oir -t c64 -C c64unit.cfg test-suite.asm -o build\test-suite.prg

@echo off
if %errorlevel% neq 0 (
	exit /b %errorlevel%
)
@echo on

REM Remove unused files
del test-suite.o

REM Run with Vice emulator
x64.exe build\test-suite.prg
