.struct MulticolorPalette
        sprCol    .byte
        multiCol1 .byte
        multiCol2 .byte
        bgCol     .byte
.endstruct


setPaletteForSprite: .scope
        returnPtr = tempPtr1
        palPtr = tempPtr2
        sprIdx  = temp1

        pullAndSavePointer returnPtr
        pullAndSaveVal sprIdx
        pullAndSavePointer palPtr


        ldx sprIdx
        ldy #0

        lda (palPtr), y
        sta VIC_SPR0_COLOR, x

        iny
        lda (palPtr), y
        sta VIC_SPR_MCOLOR0
        
        iny
        lda (palPtr), y
        sta VIC_SPR_MCOLOR1


        pushPointerFrom returnPtr
        rts

.endscope
