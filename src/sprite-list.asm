; @access public
; @returnVoid
.ZEROPAGE
tempPtr1: .word 0
tempPtr2: .word 0
tempPtr3: .word 0
tempPtr4: .word 0

.CODE
.export tempPtr1
.export tempPtr2
.export tempPtr3
.export tempPtr4

.macro pushPointer addr
        lda #>addr
        pha
        lda #<addr
        pha
.endmacro

.macro pullAndSavePointer label
        pla
        sta label; hi byte
        pla
        sta label+1 ; lo byte
.endmacro

.macro pushPointerFrom label
        lda label+1 ; lo byte
        pha
        lda label
        pha
.endmacro

.struct PointerTable
        nextEmptyIdx.byte
        data .word 64
.endstruct


.macro initTable label
        lda #1
        sta label+PointerTable::nextEmptyIdx
.endmacro

; Stack Args:
;  - spritePtr
;  - tablePtr
;  - returnPtr (from jsr)
addSprite: .scope
        ; Save return address
        pullAndSavePointer tempPtr1     ; returnPtr
        pullAndSavePointer tempPtr2     ; tablePtr
        pullAndSavePointer tempPtr3     ; spritePtr

        ldy #PointerTable::nextEmptyIdx
        lda (tempPtr2), y
        tay

        lda tempPtr3
        sta (tempPtr2), y
        iny
        lda tempPtr3+1
        sta (tempPtr2), y
        iny
        tya
        ldy #PointerTable::nextEmptyIdx
        sta (tempPtr2), y

        ; Reload return address
        pushPointerFrom tempPtr1
        rts
        
returnPtr:
        .word 0
tablePtr:
        .word 0
.endscope
tempPtr:
        .word 0
