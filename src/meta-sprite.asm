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

        ldy #Metasprite::ptrs
        lda (msPtr), y
        sta curSprDataPtr
        iny 
        lda (msPtr), y
        sta curSprDataPtr+1

        ldy #0
        lda startX
        sta (curSprDataPtr), y
        iny
        lda startY
        sta (curSprDataPtr), y

        pushPointerFrom tempPtr1

        rts

.endscope
