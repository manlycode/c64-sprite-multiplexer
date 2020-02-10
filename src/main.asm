.include "c64.inc"
.include "c64/clrscr.s"
.include "temp-vars.asm"
.include "pointer-list.asm"

.segment "ZEROPAGE"

.org $0801
.segment "CODE"
        sei
        jsr _clrscr
        jsr initScreen
        jsr init_metasprite
        
        ldy #$7f    ; $7f = %01111111
        sty $dc0d   ; Turn off CIAs Timer interrupts
        sty $dd0d   ; Turn off CIAs Timer interrupts
        lda $dc0d   ; cancel all CIA-IRQs in queue/unprocessed
        lda $dd0d   ; cancel all CIA-IRQs in queue/unprocessed

        lda #$01    ; Set Interrupt Request Mask...
        sta $d01a   ; ...we want IRQ by Rasterbeam

        lda #<irq   ; point IRQ Vector to our custom irq routine
        ldx #>irq 
        sta $314    ; store in $314/$315
        stx $315

        lda #$00    ; trigger first interrupt at row zero
        sta $d012

        lda $d011   ; Bit#0 of $d011 is basically...
        and #$7f    ; ...the 9th Bit for $d012
        sta $d011   ; we need to make sure it is set to zero 

        cli
        jmp *

irq:
        dec $d019        ; acknowledge IRQ

        lda #0
        sta VIC_BORDERCOLOR
        sta VIC_BG_COLOR0


        jmp $ea81        ; return to kernel interrupt routine

        .include "config_sprites.asm"


init_metasprite:
        
        rts

.segment "SIDDATA"
.segment "SPRITEDATA"

sprites:
        .incbin "../resources/sprites.spr", 3,1024
.segment "CHARDATA"

