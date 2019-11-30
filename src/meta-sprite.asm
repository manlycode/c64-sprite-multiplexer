.struct Metasprite
        xPos .byte
        yPos .byte
        sprWidth  .byte
        sprHeight .byte
        ptrs .word 8
.endstruct

.struct SpriteData
        xPos .byte
        yPos .byte
.endstruct

C64_SPRITE_WIDTH = 24
C64_SPRITE_HEIGHT = 21

initMetaSprite: .scope
        returnPtr = tempPtr1
        msPtr = tempPtr2
        curSprDataPtr = tempPtr3

        cols = temp1
        rows = temp2
        curCol = temp3
        curRow = temp4
        startX = temp5
        startY = temp6
        curX = temp7
        curY = temp8
        ptrIdx = temp9

        pullAndSavePointer returnPtr
        pullAndSavePointer msPtr

        ldy #Metasprite::sprWidth
        lda (msPtr), y
        sta cols

        ldy #Metasprite::sprHeight
        lda (msPtr), y
        sta rows

        lda #0
        sta curCol
        sta curRow

        ldy #Metasprite::xPos
        lda (msPtr), y
        sta startX
        sta curX

        ldy #Metasprite::yPos
        lda (msPtr), y
        sta startY
        sta curY

        lda #Metasprite::ptrs
        sta ptrIdx
        ldy #Metasprite::ptrs

@loopCols:
        lda (msPtr), y
        sta curSprDataPtr
        iny 
        lda (msPtr), y
        sta curSprDataPtr+1

        ldy #0
        lda curX
        sta (curSprDataPtr), y
        iny
        lda curY
        sta (curSprDataPtr), y

        inc curCol
        lda curCol
        cmp cols
        beq @loopRows

        ; add offset to
        lda curX
        adc #C64_SPRITE_WIDTH
        sta curX

        inc ptrIdx
        inc ptrIdx
        ldy ptrIdx
        jmp @loopCols
        

@loopRows:
        lda curY
        clc
        adc #C64_SPRITE_HEIGHT
        sta curY

        lda #0
        sta curCol
        lda startX
        sta curX

        inc curRow
        lda curRow
        cmp rows
        beq @end
        

        inc ptrIdx
        inc ptrIdx
        ldy ptrIdx
        jmp @loopCols

        ; lda curX
        ; adc C64_SPRITE_WIDTH
        ; sta 
@end:
        pushPointerFrom returnPtr

        rts

.endscope


addToSpriteList: .scope
        returnPtr       = tempPtr8
        listPtr         = tempPtr1
        msPtr           = tempPtr2

        pullAndSavePointer returnPtr
        pullAndSavePointer listPtr
        pullAndSavePointer msPtr

        pushPointerFrom returnPtr
        rts
.endscope
