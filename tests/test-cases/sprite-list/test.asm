; @access public
; @return void
spriteList: .tag PointerTable

testSpriteListFirstEmpty:
        initTable spriteList
        assertEqual spriteList, #1

        pushPointer sprite1
        pushPointer spriteList
        jsr addSprite

        assertEqual #3, spriteList, "wrong nextIdx 1"
        assertEqual #<sprite1, spriteList+PointerTable::data, "wrong le pointer in spriteList::data"
        assertEqual #>sprite1, spriteList+PointerTable::data+1, "wrong le pointer in spriteList::data+1"

        pushPointer sprite2
        pushPointer spriteList
        jsr addSprite

        assertEqual #5, spriteList, "wrong nextIdx"
        assertEqual #<sprite2, spriteList+PointerTable::data+2, "wrong le pointer in spriteList::data+2"
        assertEqual #>sprite2, spriteList+PointerTable::data+3, "wrong le pointer in spriteList::data+3"
        rts

testSpriteListRemove:
        initTable spriteList
        assertEqual #1, spriteList, "spriteList::nextIdx 1"

        pushPointer sprite3
        pushPointer spriteList
        jsr addSprite
        assertEqual #3, spriteList, "spriteList::nextIdx 3"

        pushPointer sprite4
        pushPointer spriteList
        jsr addSprite
        assertEqual #5, spriteList, "spriteList::nextIdx 5"
        
        pushPointer sprite5
        pushPointer spriteList
        jsr addSprite
        assertEqual #7, spriteList, "spriteList::nextIdx 7"

        pushPointer sprite3
        pushPointer spriteList
        jsr removeSprite
        assertEqual #1, spriteList, "remove spriteList::nextIdx 1"


        pushPointer sprite5
        pushPointer spriteList
        jsr removeSprite
        assertEqual #1, spriteList, "remove spriteList::nextIdx 1-2"
        rts

testSpriteListRemove2:
        pushPointer sprite6
        pushPointer spriteList
        jsr addSprite

        assertEqual #5, spriteList, "remove spriteList::nextIdx 1-2"
        assertEqual #<sprite6, spriteList+PointerTable::data,   "remove: 7" 
        assertEqual #>sprite6, spriteList+PointerTable::data+1, "remove: 8"
        assertEqual #<sprite4, spriteList+PointerTable::data+2, "remove: 9"
        assertEqual #>sprite4, spriteList+PointerTable::data+3, "remove: 10"
        assertEqual #0, spriteList+PointerTable::data+4, "remove: 11"
        assertEqual #0, spriteList+PointerTable::data+5, "remove: 12"
        
        rts

sprite1:
        .byte 1, 2, 3, 4
sprite2:
        .byte 0, 0, 0, 0
sprite3:
        .byte 1, 2, 3, 4
sprite4:
        .byte 0, 0, 0, 0
sprite5:
        .byte 4, 3, 2, 0
sprite6:
        .byte 6, 8, 9, 0
