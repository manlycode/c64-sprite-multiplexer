; @access public
; @returnr void
testMetaSprite: .scope
        pushPointer metasprite2x4
        jsr initMetaSprite

        assertEqual #100, spriteData1, "spritedata1_x"
        assertEqual #100, spriteData1+1, "spriteData1_y"

        assertEqual #124, spriteData2, "spriteData2_x"
        assertEqual #100, spriteData2+1, "spriteData2_y"

        assertEqual #100, spriteData3, "spriteData3_x"
        assertEqual #121, spriteData3+1, "spriteData3_y"

        assertEqual #124, spriteData4, "spriteData4_x"
        assertEqual #121, spriteData4+1, "spriteData4_y"

        assertEqual #100, spriteData5, "spriteData5_x"
        assertEqual #142, spriteData5+1, "spriteData5_y"

        assertEqual #124, spriteData6, "spriteData6_x"
        assertEqual #142, spriteData6+1, "spriteData6_y"

        assertEqual #100, spriteData7, "spriteData7_x"
        assertEqual #163, spriteData7+1, "spriteData7_y"

        assertEqual #124, spriteData8, "spriteData8_x"
        assertEqual #163, spriteData8+1, "spriteData8_y"

        rts

metasprite2x4:
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

.endscope
