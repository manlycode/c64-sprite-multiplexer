; @access public
; @returnVoid
.export addSprite
.export removeSprite

.CODE
.macro pushPointer addr
        lda #>addr
        pha
        lda #<addr
        pha
.endmacro

.macro pushVal val 
        lda val
        pha
.endmacro

.macro pullAndSavePointer label
        pla
        sta label; hi byte
        pla
        sta label+1 ; lo byte
.endmacro

.macro pullAndSaveVal label
        pla
        sta label; hi byte
.endmacro

.macro pushPointerFrom label
        lda label+1 ; lo byte
        pha
        lda label
        pha
.endmacro

.macro savePointer addr, zpTarget
        lda #<addr
        sta zpTarget
        lda #>addr
        sta zpTarget+1
.endmacro


.struct PointerTable
        nextEmptyIdx.byte
        data .word 64
.endstruct


.macro initTable addr
        lda #<addr
        sta tempPtr1
        lda #>addr
        sta tempPtr1+1

        ; Set the nextEmptyIdx
        ldy #0
        lda #1
        sta (tempPtr1), y

        ; Set the rest of the data
        lda #0
:       iny
        cpy .sizeof(PointerTable)
        bpl :+
        sta (tempPtr1), y

        jmp :-


:       ;end


.endmacro

; Stack Args:
;  - spritePtr
;  - tablePtr
;  - returnPtr (from jsr)
addSprite: .scope
        returnPtr = tempPtr1
        tablePtr = tempPtr2
        spritePtr = tempPtr3

        ; Save return address
        pullAndSavePointer returnPtr    ; returnPtr
        pullAndSavePointer tablePtr     ; tablePtr
        pullAndSavePointer spritePtr    ; spritePtr

        ldy #PointerTable::nextEmptyIdx
        lda (tablePtr), y
        tay

        lda spritePtr
        sta (tablePtr), y
        iny
        lda spritePtr+1
        sta (tablePtr), y
        iny

:       lda (tablePtr), y
        cmp #0
        beq :+
        iny
        iny

        cpy .sizeof(PointerTable)
        bpl :++
        jmp :-

:       tya
        ldy #PointerTable::nextEmptyIdx
        sta (tablePtr), y

        ; Reload return address
:       pushPointerFrom tempPtr1
        rts
.endscope

removeSprite: .scope
        returnPtr = tempPtr1
        tablePtr = tempPtr2
        spritePtr = tempPtr3
        currentIdx = temp1

        ; Save return address
        pullAndSavePointer returnPtr    
        pullAndSavePointer tablePtr     
        pullAndSavePointer spritePtr    
        
        pushPointerFrom returnPtr

        ; scan the table find a match, zero it out 
        ldy #PointerTable::nextEmptyIdx
        lda (tablePtr), y
        sta currentIdx

        ldy #PointerTable::data
        lda (tablePtr), y
@loop:
        cpy #64
        bpl @end
        lda (tablePtr), y
        cmp spritePtr
        bne :+
        iny
        lda (tablePtr), y
        cmp spritePtr+1
        beq @clear
:       iny     
        iny
        jmp @loop

@clear:
        dey
        tya
        cmp currentIdx
        bpl :+
        ldy #PointerTable::nextEmptyIdx
        sta (tablePtr), y

:       tay
        lda #0
        sta (tablePtr), y
        iny
        sta (tablePtr), y
        jmp @end

        ; didn't match
@end:
        pushPointerFrom returnPtr
        rts
.endscope
