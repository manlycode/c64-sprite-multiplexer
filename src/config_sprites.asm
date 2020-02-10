SCREEN_RAM := $0400

.ZEROPAGE
animation_frame:
        .byte 0
sprite_ship_current_frame:
        .byte 0

sprite_frames_ship = 16
sprite_pointer_ship = $82
sprite_bg_color = $00
sprite_multicolor_1 = $0b
sprite_multicolor_2 = $01
sprite_shipcolor = $02

.CODE
; -----------
; Init Memory
; -----------
initScreen:
        lda #sprite_frames_ship
        sta sprite_ship_current_frame

        lda #sprite_pointer_ship
        sta animation_frame
        sta SCREEN_RAM+$3f8

; -----------
; Init Vic-II
; -----------
        lda #$01
        sta VIC_SPR_ENA         ; Enable sprite0
        sta VIC_SPR_MCOLOR      ; Enable multicolor

        lda #$00
        sta VIC_SPR_BG_PRIO     ; Sprite0 has priority over background

        lda #sprite_bg_color
        sta VIC_BG_COLOR0
        lda #sprite_multicolor_1
        sta VIC_SPR_MCOLOR0
        lda #sprite_multicolor_2
        sta VIC_SPR_MCOLOR1
        lda #sprite_shipcolor
        sta VIC_SPR0_COLOR

        lda #$00
        sta VIC_SPR_HI_X        ; set x coord hi bit

        lda #$50                ;set x/y coords to bottom border outer right
        sta VIC_SPR0_X
        lda #$60                ;set x/y coord
        sta VIC_SPR0_Y
        rts
