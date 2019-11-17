; @access public
; @return void
testSpreiteListFirstEmpty: .scope
        .export spriteList
        .export sprite1

        initTable spriteList
        assertEqual spriteList, #1

        pushPointer sprite1
        pushPointer spriteList
        jsr addSprite

        assertEqual #<sprite1, spriteList+PointerTable::data, "wrong le pointer in spriteList::data"
        assertEqual #>sprite1, spriteList+PointerTable::data+1, "wrong le pointer in spriteList::data+1"

        pushPointer sprite2
        pushPointer spriteList
        jsr addSprite

        assertEqual #<sprite2, spriteList+PointerTable::data+2, "wrong le pointer in spriteList::data+2"
        assertEqual #>sprite2, spriteList+PointerTable::data+3, "wrong le pointer in spriteList::data+3"
        ; assertEqual #>sprite1, tempPtr+1
        rts
sprite1:
        .byte 1, 2, 3, 4
sprite2:
        .byte 0, 0, 0, 0

.endscope

spriteList: .tag PointerTable
