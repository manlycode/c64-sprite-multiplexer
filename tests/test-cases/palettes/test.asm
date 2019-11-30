VIC_SPR_MCOLOR0: .byte 0
VIC_SPR_MCOLOR1: .byte 0

VIC_SPR0_COLOR: .byte 0
VIC_SPR1_COLOR: .byte 0
VIC_SPR2_COLOR: .byte 0
VIC_SPR3_COLOR: .byte 0
VIC_SPR4_COLOR: .byte 0
VIC_SPR5_COLOR: .byte 0
VIC_SPR6_COLOR: .byte 0
VIC_SPR7_COLOR: .byte 0

testLoadPalette: .scope
        pushPointer multiColorPal0
        pushVal #0
        jsr setPaletteForSprite

        assertEqual #1, VIC_SPR0_COLOR
        assertEqual #2, VIC_SPR_MCOLOR0
        assertEqual #3, VIC_SPR_MCOLOR1

        rts


multiColorPal0:
        .byte $01, $02, $03, $00
.endscope
