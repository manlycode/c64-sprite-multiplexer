; @access public
; @return void

testPointerListFirstEmpty: .scope
        initTable spriteList1
        assertEqual spriteList1, #1

        pushPointer sprite1
        pushPointer spriteList1
        jsr addSprite

        assertEqual #3, spriteList1, "wrong nextIdx 1"
        assertEqual #<sprite1, spriteList1+PointerTable::data, "wrong le pointer in spriteList1::data"
        assertEqual #>sprite1, spriteList1+PointerTable::data+1, "wrong le pointer in spriteList1::data+1"

        pushPointer sprite2
        pushPointer spriteList1
        jsr addSprite

        assertEqual #5, spriteList1, "wrong nextIdx"
        assertEqual #<sprite2, spriteList1+PointerTable::data+2, "wrong le pointer in spriteList1::data+2"
        assertEqual #>sprite2, spriteList1+PointerTable::data+3, "wrong le pointer in spriteList1::data+3"
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
spriteList1: .tag PointerTable
.endscope

testPointerListRemove: .scope
        initTable spriteList2
        assertEqual #1, spriteList2, "spriteList2::nextIdx 1"

        pushPointer sprite3
        pushPointer spriteList2
        jsr addSprite
        assertEqual #3, spriteList2, "spriteList2::nextIdx 3"

        pushPointer sprite4
        pushPointer spriteList2
        jsr addSprite
        assertEqual #5, spriteList2, "spriteList2::nextIdx 5"
        
        pushPointer sprite5
        pushPointer spriteList2
        jsr addSprite
        assertEqual #7, spriteList2, "spriteList2::nextIdx 7"

        pushPointer sprite3
        pushPointer spriteList2
        jsr removeSprite
        assertEqual #1, spriteList2, "remove spriteList2::nextIdx 1"


        pushPointer sprite5
        pushPointer spriteList2
        jsr removeSprite
        assertEqual #1, spriteList2, "remove spriteList2::nextIdx 1-2"
        rts

        pushPointer sprite6
        pushPointer spriteList2
        jsr addSprite

        assertEqual #5, spriteList2, "remove spriteList2::nextIdx 1-3"
        assertEqual #<sprite6, spriteList2+PointerTable::data,   "remove: 7" 
        assertEqual #>sprite6, spriteList2+PointerTable::data+1, "remove: 8"
        assertEqual #<sprite4, spriteList2+PointerTable::data+2, "remove: 9"
        assertEqual #>sprite4, spriteList2+PointerTable::data+3, "remove: 10"
        assertEqual #0, spriteList2+PointerTable::data+4, "remove: 11"
        assertEqual #0, spriteList2+PointerTable::data+5, "remove: 12"
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
spriteList2: .tag PointerTable
.endscope

