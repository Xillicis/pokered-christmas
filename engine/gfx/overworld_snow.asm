; The ordinary PrepareOAMData clears unused entries after each DMA.
; Called from DelaySnowFrame with interrupts disabled. Returns carry if drawn.
; Do not use hOAMBufferOffset here: it aliases collision scratch HRAM.
DEF SNOW_OBJ_TILE EQU $fc
DEF NUM_SNOWFLAKES EQU 8
DEF SNOW_Y_PERIOD EQU 160

DrawOverworldSnow::
	ld a, [wSnowPhase]
	inc a
	cp SNOW_Y_PERIOD
	jr c, .phaseOK
	xor a
.phaseOK
	ld [wSnowPhase], a
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
	add OAM_X_OFS
	ld [hli], a
	pop bc
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
	db   3,  12
	db  24,  91
	db  43,  47
	db  64, 135
	db  82,  25
	db 104, 108
	db 123,  69
	db 143, 151
