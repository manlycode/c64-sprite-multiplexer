testAddMetaSpriteToList: .scope
        initTable spriteList3

        pushPointer metasprite3x3
        jsr initMetaSprite

        pushPointer metasprite3x3
        pushPointer spriteList3
        jsr addMetaSpriteToSpriteList

        assertDataSetEqual expectedResult, spriteList3, "Sum test to ZP with data set failed."
        rts

expectedResult:
        .byte 10
        .byte #<spriteData1, #>spriteData1
        .byte #<spriteData2, #>spriteData2
        .byte #<spriteData3, #>spriteData3
        .byte #<spriteData4, #>spriteData4
        .byte #<spriteData5, #>spriteData5
        .byte #<spriteData6, #>spriteData6
        .byte #<spriteData7, #>spriteData7
        .byte #<spriteData8, #>spriteData8
        .byte #<spriteData9, #>spriteData9

metasprite3x3:
        .byte 100, 100  ; position
        .byte 2,4
        .addr spriteData1
        .addr spriteData2
        .addr spriteData3
        .addr spriteData4
        .addr spriteData5
        .addr spriteData6
        .addr spriteData7
        .addr spriteData8
        .addr spriteData9

; 24x21
spriteData1:
        .byte 0, 0
spriteData2:
        .byte 0, 0
spriteData3:
        .byte 0, 0
spriteData4:
        .byte 0, 0
spriteData5:
        .byte 0, 0
spriteData6:
        .byte 0, 0
spriteData7:
        .byte 0, 0
spriteData8:
        .byte 0, 0
spriteData9:
        .byte 0, 0

spriteList3: .tag PointerTable


.endscope
