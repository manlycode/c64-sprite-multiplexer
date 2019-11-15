#!/usr/bin/env bash
if [ -d vendor/c64unit ];
then
    cd vendor/c64unit
    git pull http://Commocore@bitbucket.org/Commocore/c64unit.git master
    cd ../../
else
    git clone --origin c64unit http://Commocore@bitbucket.org/Commocore/c64unit.git vendor/c64unit
fi

