;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.7 #12016 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _font_load
	.globl _font_init
	.globl _set_sprite_data
	.globl _display_off
	.globl _wait_vbl_done
	.globl _disable_interrupts
	.globl _enable_interrupts
	.globl _joypad
	.globl _player
	.globl _spriteSize
	.globl _characterSprites
	.globl _fade
	.globl _placeSprite
	.globl _setupPlayer
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_characterSprites::
	.ds 96
_colour:
	.ds 1
_spriteSize::
	.ds 1
_player::
	.ds 8
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;assets/sprites.c:26: unsigned char characterSprites[] =
	ld	hl, #_characterSprites
	ld	(hl), #0x07
	ld	hl, #(_characterSprites + 0x0001)
	ld	(hl), #0x07
	ld	hl, #(_characterSprites + 0x0002)
	ld	(hl), #0x18
	ld	hl, #(_characterSprites + 0x0003)
	ld	(hl), #0x1f
	ld	hl, #(_characterSprites + 0x0004)
	ld	(hl), #0x30
	ld	hl, #(_characterSprites + 0x0005)
	ld	(hl), #0x2f
	ld	hl, #(_characterSprites + 0x0006)
	ld	(hl), #0x6d
	ld	hl, #(_characterSprites + 0x0007)
	ld	(hl), #0x53
	ld	hl, #(_characterSprites + 0x0008)
	ld	(hl), #0x52
	ld	hl, #(_characterSprites + 0x0009)
	ld	(hl), #0x6f
	ld	hl, #(_characterSprites + 0x000a)
	ld	(hl), #0x2d
	ld	hl, #(_characterSprites + 0x000b)
	ld	(hl), #0x3e
	ld	hl, #(_characterSprites + 0x000c)
	ld	(hl), #0x13
	ld	hl, #(_characterSprites + 0x000d)
	ld	(hl), #0x1c
	ld	hl, #(_characterSprites + 0x000e)
	ld	(hl), #0x1b
	ld	hl, #(_characterSprites + 0x000f)
	ld	(hl), #0x16
	ld	hl, #(_characterSprites + 0x0010)
	ld	(hl), #0xe0
	ld	hl, #(_characterSprites + 0x0011)
	ld	(hl), #0xe0
	ld	hl, #(_characterSprites + 0x0012)
	ld	(hl), #0x18
	ld	hl, #(_characterSprites + 0x0013)
	ld	(hl), #0xf8
	ld	hl, #(_characterSprites + 0x0014)
	ld	(hl), #0x34
	ld	hl, #(_characterSprites + 0x0015)
	ld	(hl), #0xcc
	ld	hl, #(_characterSprites + 0x0016)
	ld	(hl), #0x5a
	ld	hl, #(_characterSprites + 0x0017)
	ld	(hl), #0xa6
	ld	hl, #(_characterSprites + 0x0018)
	ld	(hl), #0xaa
	ld	hl, #(_characterSprites + 0x0019)
	ld	(hl), #0xd6
	ld	hl, #(_characterSprites + 0x001a)
	ld	(hl), #0x44
	ld	hl, #(_characterSprites + 0x001b)
	ld	(hl), #0xfc
	ld	hl, #(_characterSprites + 0x001c)
	ld	(hl), #0xb8
	ld	hl, #(_characterSprites + 0x001d)
	ld	(hl), #0x78
	ld	hl, #(_characterSprites + 0x001e)
	ld	(hl), #0xd8
	ld	hl, #(_characterSprites + 0x001f)
	ld	(hl), #0x68
	ld	hl, #(_characterSprites + 0x0020)
	ld	(hl), #0x1f
	ld	hl, #(_characterSprites + 0x0021)
	ld	(hl), #0x12
	ld	hl, #(_characterSprites + 0x0022)
	ld	(hl), #0x1f
	ld	hl, #(_characterSprites + 0x0023)
	ld	(hl), #0x18
	ld	hl, #(_characterSprites + 0x0024)
	ld	(hl), #0x0e
	ld	hl, #(_characterSprites + 0x0025)
	ld	(hl), #0x0d
	ld	hl, #(_characterSprites + 0x0026)
	ld	(hl), #0x07
	ld	hl, #(_characterSprites + 0x0027)
	ld	(hl), #0x07
	ld	hl, #(_characterSprites + 0x0028)
	ld	(hl), #0x07
	ld	hl, #(_characterSprites + 0x0029)
	ld	(hl), #0x07
	ld	hl, #(_characterSprites + 0x002a)
	ld	(hl), #0x09
	ld	hl, #(_characterSprites + 0x002b)
	ld	(hl), #0x0f
	ld	hl, #(_characterSprites + 0x002c)
	ld	(hl), #0x0d
	ld	hl, #(_characterSprites + 0x002d)
	ld	(hl), #0x0b
	ld	hl, #(_characterSprites + 0x002e)
	ld	(hl), #0x0e
	ld	hl, #(_characterSprites + 0x002f)
	ld	(hl), #0x0e
	ld	hl, #(_characterSprites + 0x0030)
	ld	(hl), #0xf8
	ld	hl, #(_characterSprites + 0x0031)
	ld	(hl), #0x48
	ld	hl, #(_characterSprites + 0x0032)
	ld	(hl), #0xf8
	ld	hl, #(_characterSprites + 0x0033)
	ld	(hl), #0x18
	ld	hl, #(_characterSprites + 0x0034)
	ld	(hl), #0x70
	ld	hl, #(_characterSprites + 0x0035)
	ld	(hl), #0xb0
	ld	hl, #(_characterSprites + 0x0036)
	ld	(hl), #0xf8
	ld	hl, #(_characterSprites + 0x0037)
	ld	(hl), #0xf8
	ld	hl, #(_characterSprites + 0x0038)
	ld	(hl), #0x3c
	ld	hl, #(_characterSprites + 0x0039)
	ld	(hl), #0xe4
	ld	hl, #(_characterSprites + 0x003a)
	ld	(hl), #0xfc
	ld	hl, #(_characterSprites + 0x003b)
	ld	(hl), #0xe4
	ld	hl, #(_characterSprites + 0x003c)
	ld	(hl), #0xf8
	ld	hl, #(_characterSprites + 0x003d)
	ld	(hl), #0xf8
	ld	hl, #(_characterSprites + 0x003e)
	ld	(hl), #0x70
	ld	hl, #(_characterSprites + 0x003f)
	ld	(hl), #0x70
	ld	hl, #(_characterSprites + 0x0040)
	ld	(hl), #0x00
	ld	hl, #(_characterSprites + 0x0041)
	ld	(hl), #0x00
	ld	hl, #(_characterSprites + 0x0042)
	ld	(hl), #0x00
	ld	hl, #(_characterSprites + 0x0043)
	ld	(hl), #0x00
	ld	hl, #(_characterSprites + 0x0044)
	ld	(hl), #0x00
	ld	hl, #(_characterSprites + 0x0045)
	ld	(hl), #0x00
	ld	hl, #(_characterSprites + 0x0046)
	ld	(hl), #0x00
	ld	hl, #(_characterSprites + 0x0047)
	ld	(hl), #0x00
	ld	hl, #(_characterSprites + 0x0048)
	ld	(hl), #0x00
	ld	hl, #(_characterSprites + 0x0049)
	ld	(hl), #0x00
	ld	hl, #(_characterSprites + 0x004a)
	ld	(hl), #0x00
	ld	hl, #(_characterSprites + 0x004b)
	ld	(hl), #0x00
	ld	hl, #(_characterSprites + 0x004c)
	ld	(hl), #0x00
	ld	hl, #(_characterSprites + 0x004d)
	ld	(hl), #0x00
	ld	hl, #(_characterSprites + 0x004e)
	ld	(hl), #0x00
	ld	hl, #(_characterSprites + 0x004f)
	ld	(hl), #0x00
	ld	hl, #(_characterSprites + 0x0050)
	ld	(hl), #0x00
	ld	hl, #(_characterSprites + 0x0051)
	ld	(hl), #0x00
	ld	hl, #(_characterSprites + 0x0052)
	ld	(hl), #0x00
	ld	hl, #(_characterSprites + 0x0053)
	ld	(hl), #0x00
	ld	hl, #(_characterSprites + 0x0054)
	ld	(hl), #0x00
	ld	hl, #(_characterSprites + 0x0055)
	ld	(hl), #0x00
	ld	hl, #(_characterSprites + 0x0056)
	ld	(hl), #0x00
	ld	hl, #(_characterSprites + 0x0057)
	ld	(hl), #0x00
	ld	hl, #(_characterSprites + 0x0058)
	ld	(hl), #0x00
	ld	hl, #(_characterSprites + 0x0059)
	ld	(hl), #0x00
	ld	hl, #(_characterSprites + 0x005a)
	ld	(hl), #0x00
	ld	hl, #(_characterSprites + 0x005b)
	ld	(hl), #0x00
	ld	hl, #(_characterSprites + 0x005c)
	ld	(hl), #0x00
	ld	hl, #(_characterSprites + 0x005d)
	ld	(hl), #0x00
	ld	hl, #(_characterSprites + 0x005e)
	ld	(hl), #0x00
	ld	hl, #(_characterSprites + 0x005f)
	ld	(hl), #0x00
;main.c:12: static UBYTE colour = 0;
	ld	hl, #_colour
	ld	(hl), #0x00
;main.c:13: UBYTE spriteSize = 8;
	ld	hl, #_spriteSize
	ld	(hl), #0x08
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:24: void fade(){
;	---------------------------------
; Function fade
; ---------------------------------
_fade::
;main.c:25: if(colour == 0)
	ld	a, (#_colour)
	or	a, a
;main.c:26: return;
	ret	Z
;main.c:27: switch(colour){
	ld	a, (#_colour)
	sub	a, #0x10
	jr	Z, 00108$
	ld	a, (#_colour)
	sub	a, #0x20
	jr	Z, 00104$
	ld	a, (#_colour)
	sub	a, #0x30
	jr	Z, 00106$
	ld	a, (#_colour)
	sub	a, #0x40
	jr	Z, 00107$
	ld	a, (#_colour)
	sub	a, #0x50
	jr	Z, 00106$
	ld	a, (#_colour)
	sub	a, #0x60
	jr	NZ, 00109$
;main.c:29: case fadeStart-4*fadeStep:
00104$:
;main.c:30: BGP_REG = 0xF9U;
	ld	a, #0xf9
	ldh	(_BGP_REG+0),a
;main.c:31: break;
	jr	00109$
;main.c:33: case fadeStart-3*fadeStep:
00106$:
;main.c:34: BGP_REG = 0xFEU;
	ld	a, #0xfe
	ldh	(_BGP_REG+0),a
;main.c:35: break;
	jr	00109$
;main.c:36: case fadeStart-2*fadeStep:
00107$:
;main.c:37: BGP_REG = 0xFEU;
	ld	a, #0xfe
	ldh	(_BGP_REG+0),a
;main.c:38: break;
	jr	00109$
;main.c:39: case fadeStart-5*fadeStep:
00108$:
;main.c:40: BGP_REG = 0xE4U;
	ld	a, #0xe4
	ldh	(_BGP_REG+0),a
;main.c:42: }
00109$:
;main.c:43: colour--;
	ld	hl, #_colour
	dec	(hl)
;main.c:44: }
	ret
;main.c:47: void placeSprite(struct sSprite* sprite, UINT8 x, UINT8 y){
;	---------------------------------
; Function placeSprite
; ---------------------------------
_placeSprite::
	add	sp, #-3
;main.c:48: move_sprite(sprite->spriteId[0], x, y);
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
;c:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, c
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
	ld	c, l
	ld	b, h
;c:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;main.c:49: move_sprite(sprite->spriteId[1], x + spriteSize, y);
	ld	a, (hl)
	ld	hl, #_spriteSize
	add	a, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	ld	c, (hl)
	ldhl	sp,	#2
	ld	(hl), a
;c:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, c
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
	ld	c, l
	ld	b, h
;c:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	inc	hl
	ld	a, (hl)
	ld	(bc), a
;main.c:50: move_sprite(sprite->spriteId[2], x, y + spriteSize);
	dec	hl
	dec	hl
	ld	a, (hl)
	ld	hl, #_spriteSize
	add	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
;c:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, (hl)
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
	ld	c, l
	ld	b, h
;c:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(bc), a
	inc	bc
	dec	hl
	ld	a, (hl)
	ld	(bc), a
;main.c:51: move_sprite(sprite->spriteId[3], x + spriteSize, y + spriteSize);
	dec	hl
	ld	a, (hl)
	ld	hl, #_spriteSize
	add	a, (hl)
	ld	b, a
	ldhl	sp,	#1
	ld	a, (hl)
	ld	hl, #_spriteSize
	add	a, (hl)
	ld	c, a
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	ld	e, a
;c:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:51: move_sprite(sprite->spriteId[3], x + spriteSize, y + spriteSize);
;main.c:52: }
	add	sp, #3
	ret
;main.c:55: void setupPlayer(){
;	---------------------------------
; Function setupPlayer
; ---------------------------------
_setupPlayer::
;main.c:56: player.x = 80;
	ld	bc, #_player+0
	ld	hl, #(_player + 0x0004)
	ld	(hl), #0x50
;main.c:57: player.y = 120;
	ld	hl, #(_player + 0x0005)
	ld	(hl), #0x78
;main.c:58: player.width = 16;
	ld	hl, #(_player + 0x0006)
	ld	(hl), #0x10
;main.c:59: player.height = 16;
	ld	hl, #(_player + 0x0007)
	ld	(hl), #0x10
;c:/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0002)
	ld	(hl), #0x00
;main.c:62: player.spriteId[0] = 0;
	xor	a, a
	ld	(bc), a
;c:/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0006)
	ld	(hl), #0x01
;main.c:64: player.spriteId[1] = 1;
	ld	hl, #(_player + 0x0001)
	ld	(hl), #0x01
;c:/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x000a)
	ld	(hl), #0x02
;main.c:66: player.spriteId[2] = 2;
	ld	hl, #(_player + 0x0002)
	ld	(hl), #0x02
;c:/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x000e)
	ld	(hl), #0x03
;main.c:68: player.spriteId[3] = 3;
	ld	hl, #(_player + 0x0003)
	ld	(hl), #0x03
;main.c:70: placeSprite(&player, player.x, player.y);
	ld	a, (#(_player + 0x0005) + 0)
	ld	hl, #(_player + 0x0004)
	ld	h, (hl)
	push	af
	inc	sp
	push	hl
	inc	sp
	push	bc
	call	_placeSprite
	add	sp, #4
;main.c:71: }
	ret
;main.c:73: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:76: disable_interrupts();
	call	_disable_interrupts
;main.c:77: DISPLAY_OFF;
	call	_display_off
;main.c:80: BGP_REG = OBP0_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_OBP0_REG+0),a
	ld	a, #0xe4
	ldh	(_BGP_REG+0),a
;main.c:81: OBP1_REG = 0xE0;
	ld	a, #0xe0
	ldh	(_OBP1_REG+0),a
;main.c:91: font_init();
	call	_font_init
;main.c:94: ibm_font = font_load(font_ibm); //96 Tiles
	ld	hl, #_font_ibm
	push	hl
	call	_font_load
	add	sp, #2
;main.c:97: set_sprite_data(0, sizeof(characterSprites) >> 4, characterSprites);
	ld	hl, #_characterSprites
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;main.c:98: setupPlayer();
	call	_setupPlayer
;main.c:100: DISPLAY_ON;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x80
	ldh	(_LCDC_REG+0),a
;main.c:101: enable_interrupts();
	call	_enable_interrupts
;main.c:104: SHOW_BKG; SHOW_SPRITES;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x01
	ldh	(_LCDC_REG+0),a
	ldh	a, (_LCDC_REG+0)
	or	a, #0x02
	ldh	(_LCDC_REG+0),a
;main.c:110: SPRITES_8x8;
	ldh	a, (_LCDC_REG+0)
	and	a, #0xfb
	ldh	(_LCDC_REG+0),a
;main.c:112: fade();
	call	_fade
;main.c:115: while(1) {
00111$:
;main.c:118: if (joypad() & J_UP) {
	call	_joypad
	bit	2, e
	jr	Z, 00102$
;main.c:119: player.y -= 2;
	ld	hl, #_player + 5
	ld	a, (hl)
	dec	a
	dec	a
	ld	(hl), a
;main.c:120: placeSprite(&player, player.x, player.y);
	ld	b, (hl)
	ld	hl, #_player + 4
	ld	c, (hl)
	push	bc
	ld	hl, #_player
	push	hl
	call	_placeSprite
	add	sp, #4
00102$:
;main.c:123: if (joypad() & J_DOWN) {
	call	_joypad
	bit	3, e
	jr	Z, 00104$
;main.c:124: player.y += 2;
	ld	hl, #_player + 5
	ld	a, (hl)
	add	a, #0x02
	ld	(hl), a
;main.c:125: placeSprite(&player, player.x, player.y);
	ld	b, (hl)
	ld	hl, #_player + 4
	ld	c, (hl)
	push	bc
	ld	hl, #_player
	push	hl
	call	_placeSprite
	add	sp, #4
00104$:
;main.c:128: if (joypad() & J_LEFT) {
	call	_joypad
	bit	1, e
	jr	Z, 00106$
;main.c:129: player.x -= 2;
	ld	de, #_player + 4
	ld	a, (de)
	dec	a
	dec	a
	ld	(de), a
;main.c:130: placeSprite(&player, player.x, player.y);
	ld	hl, #_player + 5
	ld	b, (hl)
	ld	a, (de)
	ld	c, a
	push	bc
	ld	hl, #_player
	push	hl
	call	_placeSprite
	add	sp, #4
00106$:
;main.c:133: if (joypad() & J_RIGHT) {
	call	_joypad
	ld	a, e
	rrca
	jr	NC, 00122$
;main.c:134: player.x += 2;
	ld	bc, #_player + 4
	ld	a, (bc)
	add	a, #0x02
	ld	(bc), a
;main.c:135: placeSprite(&player, player.x, player.y);
	ld	hl, #(_player + 0x0005)
	ld	l, (hl)
	ld	a, (bc)
	ld	c, a
	ld	b, l
	push	bc
	ld	hl, #_player
	push	hl
	call	_placeSprite
	add	sp, #4
;main.c:138: for(i = 0; i < 5; i++)
00122$:
	ld	c, #0x05
00115$:
;main.c:139: wait_vbl_done();
	call	_wait_vbl_done
;main.c:138: for(i = 0; i < 5; i++)
	dec	c
	jr	NZ, 00115$
;main.c:141: }
	jp	00111$
	.area _CODE
	.area _CABS (ABS)
