@echo off
IF EXIST vendor\c64unit (
    cd vendor\c64unit
    git pull https://Commocore@bitbucket.org/Commocore/c64unit.git master
    cd ..\..\
) ELSE (
    git clone --origin c64unit git@bitbucket.org:Commocore/c64unit vendor\c64unit
)
@echo on
