; Snow is rendered in screen space immediately before the ordinary frame DMA.
; Only the two main overworld frame waits call this wrapper.
DEF SNOW_TILE EQU $fc

DelaySnowFrame::
	push bc
	push de
	push hl
	di ; prevent DMA from observing a partially written shadow OAM entry
	ld a, [wUpdateSpritesEnabled]
	cp 1
	jr nz, .waitFrame
	ld a, [wIsInBattle]
	and a
	jr nz, .waitFrame
	ld a, [wFontLoaded]
	bit BIT_FONT_LOADED, a
	jr nz, .waitFrame
	ld a, [wMovementFlags]
	and (1 << BIT_LEDGE_OR_FISHING) | (1 << BIT_SPINNING)
	jr nz, .waitFrame
	ld a, [wCurMapTileset]
	cp OVERWORLD
	jr z, .outside
	cp PLATEAU
	jr z, .outside
	cp FOREST
	jr z, .outside
	cp SHIP_PORT
	jr nz, .waitFrame
.outside
	ldh a, [hAutoBGTransferEnabled]
	and a
	jr nz, .waitFrame
	ldh a, [hVBlankCopySize]
	and a
	jr nz, .waitFrame
	ldh a, [hVBlankCopyDoubleSize]
	and a
	jr nz, .waitFrame
	farcall DrawOverworldSnow
	; No flakes fit: no need to upload the tile.
	jr nc, .waitFrame
	; ROM0 source is accessible regardless of the currently selected bank.
	ld a, LOW(SnowTile)
	ldh [hVBlankCopySource], a
	ld a, HIGH(SnowTile)
	ldh [hVBlankCopySource + 1], a
	ld a, LOW(vNPCSprites tile SNOW_TILE)
	ldh [hVBlankCopyDest], a
	ld a, HIGH(vNPCSprites tile SNOW_TILE)
	ldh [hVBlankCopyDest + 1], a
	ld a, 1
	ldh [hVBlankCopySize], a
.waitFrame
	xor a
	ld [wSnowCameraDY], a
	pop hl
	pop de
	pop bc
	; Same handshake as DelayFrame, but arm it before enabling interrupts.
	ld a, 1
	ldh [hVBlankOccurred], a
.wait
	ei
	halt
	nop ; harmless following byte for HALT edge cases
	di
	ldh a, [hVBlankOccurred]
	and a
	jr nz, .wait
	ei
	ret

SnowTile:
	db $00, $00
	db $00, $00
	db $10, $10
	db $38, $28
	db $38, $28
	db $10, $10
	db $00, $00
	db $00, $00
SnowTileEnd:
	ASSERT SnowTileEnd - SnowTile == 16

; Horizontal camera compensation: 0 = screen, 1 = half, 2 = world.
; AdvancePlayerSprite supplies a signed, even camera delta in C (+/-2 or 0).
DEF SNOW_CAMERA_ALPHA_X EQU 2
ASSERT SNOW_CAMERA_ALPHA_X >= 0 && SNOW_CAMERA_ALPHA_X <= 2

; Maintain a persistent horizontal offset modulo screen width.
; Preserve BC, DE and HL. A and flags are scratch.
UpdateSnowCameraX::
IF SNOW_CAMERA_ALPHA_X != 0
	push bc
IF SNOW_CAMERA_ALPHA_X == 1
	sra c
ENDC
	ld a, [wSnowXOffset]
	sub c
	; Positive camera delta may underflow. Negative delta may overflow
	; the screen width, but cannot overflow the byte (max 159 + 2).
	bit 7, c
	jr nz, .checkUpper
	jr nc, .store
	add SCREEN_WIDTH_PX
	jr .store
.checkUpper
	cp SCREEN_WIDTH_PX
	jr c, .store
	sub SCREEN_WIDTH_PX
.store
	ld [wSnowXOffset], a
	pop bc
ENDC
	ret
