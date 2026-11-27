; The ordinary PrepareOAMData clears unused entries after each DMA.
; Called from DelaySnowFrame with interrupts disabled. Returns carry if drawn.
; Do not use hOAMBufferOffset here: it aliases collision scratch HRAM.
DEF SNOW_OBJ_TILE EQU $fc
DEF NUM_SNOWFLAKES EQU 8
DEF SNOW_Y_PERIOD EQU 160
; 0 = screen space, 4 = world space. Units of 1/4.
DEF SNOW_CAMERA_ALPHA EQU 2
DEF SNOW_COLLISION EQU 1
ASSERT SNOW_CAMERA_ALPHA >= 0 && SNOW_CAMERA_ALPHA <= 4

DrawOverworldSnow_NoSnow:
	xor a ; carry clear: no flakes drawn
	ret

DrawOverworldSnow::
	ld a, [wUpdateSpritesEnabled]
	cp 1
	jr nz, DrawOverworldSnow_NoSnow
	ld a, [wIsInBattle]
	and a
	jr nz, DrawOverworldSnow_NoSnow
	ld a, [wFontLoaded]
	bit BIT_FONT_LOADED, a
	jr nz, DrawOverworldSnow_NoSnow
	ld a, [wMovementFlags]
	and (1 << BIT_LEDGE_OR_FISHING) | (1 << BIT_SPINNING)
	jr nz, DrawOverworldSnow_NoSnow
	ld a, [wCurMapTileset]
	cp OVERWORLD
	jr z, .outside
	cp PLATEAU
	jr z, .outside
	cp FOREST
	jr z, .outside
	cp SHIP_PORT
	jr nz, DrawOverworldSnow_NoSnow
.outside
	call AdvanceSnowPhase
	ld c, a
	ld b, NUM_SNOWFLAKES
	ld de, .seeds
	; Start at the lowest-priority hardware sprite. Stop at an occupied slot.
	ld hl, wShadowOAMSprite39
.loop
	ld a, [hl]
	and a
	jr z, .free
	cp SCREEN_HEIGHT_PX + OAM_Y_OFS
	jr c, .done
.free
	ld a, [de] ; initial OAM Y phase
	inc de
	add c
	jr c, .wrapY
	cp SNOW_Y_PERIOD
	jr c, .yOK
.wrapY
	sub SNOW_Y_PERIOD
.yOK
	ld [hli], a
	; Slight rightward drift, reset when a flake wraps at the bottom.
	srl a
	srl a
	push bc
	ld b, a
	ld a, [de] ; base X, 0..159
	inc de
	add b
	cp SCREEN_WIDTH_PX
	jr c, .xOK
	sub SCREEN_WIDTH_PX
.xOK
	; A = existing wind-adjusted X in [0,159]. Add camera offset
	; modulo 160, accounting for a possible 8-bit carry.
	ld b, a
	ld a, [wSnowXOffset]
	add b
	jr c, .wrapCameraX
	cp SCREEN_WIDTH_PX
	jr c, .cameraXOK
.wrapCameraX
	sub SCREEN_WIDTH_PX
.cameraXOK
	add OAM_X_OFS
	ld [hli], a
	pop bc
	ld a, [de] ; one-hot particle mask
	inc de
IF SNOW_COLLISION
	push bc
	push de
	push hl
	ld b, a
	dec hl
	dec hl ; candidate OAM Y
	call SnowCheckCollision
	pop hl
	pop de
	pop bc
	jr nc, .alive
	dec hl
	dec hl
	xor a
	ld [hli], a ; hide this hardware sprite
	inc hl
.alive
ENDC
	ld a, SNOW_OBJ_TILE
	ld [hli], a
	xor a ; OBP0, no flipping, in front of the background
	ld [hli], a
	ld a, l
	sub 2 * OBJ_SIZE
	ld l, a
	dec b
	jr nz, .loop
.done
	ld a, b
	cp NUM_SNOWFLAKES
	ret ; carry set iff at least one OAM entry was written
.seeds
	db   3,  12, $01
	db  24,  91, $02
	db  43,  47, $04
	db  64, 135, $08
	db  82,  25, $10
	db 104, 108, $20
	db 123,  69, $40
	db 143, 151, $80

; Integrate phase in quarter pixels, using signed actual camera displacement.
; Limit abnormal scroll accumulation to +/-4 pixels per update.
; Returns integer phase in A. Clobbers B,C.
AdvanceSnowPhase:
	ld a, [wSnowCameraDY]
	bit 7, a
	jr nz, .negativeCamera
	cp 5
	jr c, .cameraOK
	ld a, 4
	jr .cameraOK
.negativeCamera
	cp $fc
	jr nc, .cameraOK
	ld a, -4
.cameraOK
	ld b, a
	ld a, 4 ; base speed = 1 pixel per update
REPT SNOW_CAMERA_ALPHA
	sub b
ENDR
	ld b, a
	ld a, [wSnowFraction]
	add b
	ld b, a
	and 3
	ld [wSnowFraction], a
	ld a, b
	sra a
	sra a ; signed whole pixel displacement
	ld b, a
	ld a, [wSnowPhase]
	bit 7, b
	jr nz, .backwards
	add b
	cp SNOW_Y_PERIOD
	jr c, .store
	sub SNOW_Y_PERIOD
	jr .store
.backwards
	add b
	jr c, .store
	add SNOW_Y_PERIOD ; underflow: wrap modulo 160
.store
	ld [wSnowPhase], a
	ret

IF SNOW_COLLISION
; HL = candidate OAM Y, B = particle bit mask.
; Carry means suppressed until the flake reaches the top again.
; Check the opaque 3x4 snow bounds against each 8x8 character tile.
; Earlier OAM slots contain the normal sprites, not the new snow.
SnowCheckCollision:
	ld a, [hli]
	ld d, a ; flake Y
	ld e, [hl] ; flake X
	dec hl
	ld c, l ; stop at candidate slot (OAM buffer is page aligned)
	cp 8
	jr nc, .checkDead
	ld a, b
	cpl
	ld hl, wSnowDeadMask
	and [hl]
	ld [hl], a
.checkDead
	ld a, [wSnowDeadMask]
	and b
	jr nz, .dead
	ld hl, wShadowOAM
.scan
	ld a, l
	cp c
	jr z, .clear
	ld a, [hli] ; character OAM Y
	and a
	jr z, .next
	cp SCREEN_HEIGHT_PX + OAM_Y_OFS
	jr nc, .next
	dec hl
	ld a, d
	sub [hl]
	inc hl
	add 5
	cp 11
	jr nc, .next
	ld a, [hl] ; character X
	and a
	jr z, .next
	cp SCREEN_WIDTH_PX + OAM_X_OFS
	jr nc, .next
	ld a, e
	sub [hl]
	add 4
	cp 10
	jr c, .hit
.next
	inc hl
	inc hl
	inc hl
	jr .scan
.hit
	ld hl, wSnowDeadMask
	ld a, [hl]
	or b
	ld [hl], a
.dead
	scf
	ret
.clear
	and a
	ret
ENDC

