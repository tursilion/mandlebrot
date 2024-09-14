;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.0 #12072 (MINGW64)
;--------------------------------------------------------
	.module mandlegpu
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _vdpinit
	.globl _main
	.globl _vdpmemcpy
	.globl _MANGPU
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_VDPWA	=	0x00bf
_VDPWD	=	0x00be
_SOUND	=	0x00ff
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
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
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;mandlegpu.c:91: void vdpmemcpy(int pAddr, const unsigned char *pSrc, int cnt) {
;	---------------------------------
; Function vdpmemcpy
; ---------------------------------
_vdpmemcpy::
	push	ix
	ld	ix,#0
	add	ix,sp
;mandlegpu.c:92: VDP_SET_ADDRESS_WRITE(pAddr);
;mandlegpu.c:88: inline void VDP_SET_ADDRESS_WRITE(unsigned int x)					{	VDPWA=((x)&0xff); VDPWA=(((x)>>8)|0x40); }
	ld	a, 4 (ix)
	ld	c, 5 (ix)
	out	(_VDPWA), a
	ld	a, c
	or	a, #0x40
	out	(_VDPWA), a
;mandlegpu.c:93: while (cnt--) {
	ld	c, 6 (ix)
	ld	b, 7 (ix)
	ld	e, 8 (ix)
	ld	d, 9 (ix)
00101$:
	ld	l, e
	ld	h, d
	dec	de
	ld	a, h
	or	a, l
	jr	Z, 00105$
;mandlegpu.c:94: VDPWD=*(pSrc++);
	ld	a, (bc)
	out	(_VDPWD), a
	inc	bc
	jr	00101$
00105$:
;mandlegpu.c:96: }
	pop	ix
	ret
_MANGPU:
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0x00	; 0
	.db #0xc8	; 200
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x2a	; 42
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x1b	; 27
	.db #0x66	; 102	'f'
	.db #0x06	; 6
	.db #0xa0	; 160
	.db #0x1b	; 27
	.db #0x72	; 114	'r'
	.db #0x06	; 6
	.db #0xa0	; 160
	.db #0x1b	; 27
	.db #0x20	; 32
	.db #0x06	; 6
	.db #0xa0	; 160
	.db #0x1b	; 27
	.db #0x54	; 84	'T'
	.db #0x06	; 6
	.db #0xa0	; 160
	.db #0x1b	; 27
	.db #0x9e	; 158
	.db #0x03	; 3
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0xcb	; 203
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0xc1	; 193
	.db #0xdc	; 220
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x21	; 33
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0xfc	; 252
	.db #0x06	; 6
	.db #0x02	; 2
	.db #0x16	; 22
	.db #0xf9	; 249
	.db #0x04	; 4
	.db #0xc0	; 192
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0xf0	; 240
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x16	; 22
	.db #0xfd	; 253
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0xf0	; 240
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x16	; 22
	.db #0xfd	; 253
	.db #0x04	; 4
	.db #0x53	; 83	'S'
	.db #0x02	; 2
	.db #0x0c	; 12
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x0d	; 13
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x0e	; 14
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x0f	; 15
	.db #0xb0	; 176
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x5b	; 91
	.db #0x02	; 2
	.db #0xe2	; 226
	.db #0x06	; 6
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0x36	; 54	'6'
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x5b	; 91
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0xdc	; 220
	.db #0xf1	; 241
	.db #0x16	; 22
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0xd0	; 208
	.db #0x00	; 0
	.db #0xd8	; 216
	.db #0x01	; 1
	.db #0x1b	; 27
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x5b	; 91
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x40	; 64
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x02	; 2
	.db #0x42	; 66	'B'
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x04	; 4
	.db #0x09	; 9
	.db #0xd1	; 209
	.db #0x0a	; 10
	.db #0x30	; 48	'0'
	.db #0xe0	; 224
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x5b	; 91
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x5b	; 91
	.db #0xc8	; 200
	.db #0x0b	; 11
	.db #0x1e	; 30
	.db #0x28	; 40
	.db #0xc8	; 200
	.db #0x0c	; 12
	.db #0x1e	; 30
	.db #0x20	; 32
	.db #0xc8	; 200
	.db #0x0d	; 13
	.db #0x1e	; 30
	.db #0x22	; 34
	.db #0xc8	; 200
	.db #0x0e	; 14
	.db #0x1e	; 30
	.db #0x24	; 36
	.db #0xc8	; 200
	.db #0x0f	; 15
	.db #0x1e	; 30
	.db #0x26	; 38
	.db #0x08	; 8
	.db #0x8e	; 142
	.db #0x04	; 4
	.db #0xc3	; 195
	.db #0xc0	; 192
	.db #0x4f	; 79	'O'
	.db #0x15	; 21
	.db #0x03	; 3
	.db #0x13	; 19
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x41	; 65	'A'
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0xc0	; 192
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x3c	; 60
	.db #0x02	; 2
	.db #0xc3	; 195
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc3	; 195
	.db #0x13	; 19
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x0f	; 15
	.db #0x04	; 4
	.db #0xca	; 202
	.db #0xc3	; 195
	.db #0x20	; 32
	.db #0x1e	; 30
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0xc9	; 201
	.db #0x04	; 4
	.db #0xc6	; 198
	.db #0x04	; 4
	.db #0xc7	; 199
	.db #0x02	; 2
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0xc0	; 192
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0xa0	; 160
	.db #0x1b	; 27
	.db #0x86	; 134
	.db #0x02	; 2
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x13	; 19
	.db #0x2d	; 45
	.db #0xc1	; 193
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0xa0	; 160
	.db #0x1b	; 27
	.db #0x86	; 134
	.db #0x02	; 2
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x13	; 19
	.db #0x26	; 38
	.db #0xc1	; 193
	.db #0x40	; 64
	.db #0x09	; 9
	.db #0x50	; 80	'P'
	.db #0xc0	; 192
	.db #0x44	; 68	'D'
	.db #0x09	; 9
	.db #0x51	; 81	'Q'
	.db #0xa0	; 160
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x80	; 128
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x1e	; 30
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0x13	; 19
	.db #0x1c	; 28
	.db #0xc0	; 192
	.db #0x04	; 4
	.db #0x60	; 96
	.db #0x05	; 5
	.db #0xa0	; 160
	.db #0x0c	; 12
	.db #0x04	; 4
	.db #0xc5	; 197
	.db #0xc0	; 192
	.db #0x46	; 70	'F'
	.db #0x20	; 32
	.db #0x60	; 96
	.db #0x1b	; 27
	.db #0x84	; 132
	.db #0x16	; 22
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x45	; 69	'E'
	.db #0x07	; 7
	.db #0x41	; 65	'A'
	.db #0xc0	; 192
	.db #0x87	; 135
	.db #0x20	; 32
	.db #0xa0	; 160
	.db #0x1b	; 27
	.db #0x84	; 132
	.db #0x16	; 22
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x45	; 69	'E'
	.db #0x07	; 7
	.db #0x42	; 66	'B'
	.db #0x38	; 56	'8'
	.db #0x42	; 66	'B'
	.db #0x09	; 9
	.db #0xd2	; 210
	.db #0x0a	; 10
	.db #0x31	; 49	'1'
	.db #0xe0	; 224
	.db #0x42	; 66	'B'
	.db #0x0a	; 10
	.db #0x11	; 17
	.db #0xc1	; 193
	.db #0x45	; 69	'E'
	.db #0x13	; 19
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0xa0	; 160
	.db #0x4d	; 77	'M'
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0xcd	; 205
	.db #0x06	; 6
	.db #0xa0	; 160
	.db #0x1c	; 28
	.db #0x7c	; 124
	.db #0xa3	; 163
	.db #0x0e	; 14
	.db #0x05	; 5
	.db #0x89	; 137
	.db #0x02	; 2
	.db #0x89	; 137
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0xc2	; 194
	.db #0xa3	; 163
	.db #0x4f	; 79	'O'
	.db #0x05	; 5
	.db #0x8a	; 138
	.db #0x02	; 2
	.db #0x8a	; 138
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x16	; 22
	.db #0xba	; 186
	.db #0xc2	; 194
	.db #0xe0	; 224
	.db #0x1e	; 30
	.db #0x28	; 40
	.db #0xc3	; 195
	.db #0x20	; 32
	.db #0x1e	; 30
	.db #0x20	; 32
	.db #0xc3	; 195
	.db #0x60	; 96
	.db #0x1e	; 30
	.db #0x22	; 34
	.db #0xc3	; 195
	.db #0xa0	; 160
	.db #0x1e	; 30
	.db #0x24	; 36
	.db #0xc3	; 195
	.db #0xe0	; 224
	.db #0x1e	; 30
	.db #0x26	; 38
	.db #0x04	; 4
	.db #0x5b	; 91
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0xc2	; 194
	.db #0x08	; 8
	.db #0x13	; 19
	.db #0x22	; 34
	.db #0x05	; 5
	.db #0x88	; 136
	.db #0x0a	; 10
	.db #0xc8	; 200
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0x1e	; 30
	.db #0x2a	; 42
	.db #0xc0	; 192
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x40	; 64
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x80	; 128
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x13	; 19
	.db #0x0b	; 11
	.db #0x82	; 130
	.db #0x00	; 0
	.db #0x13	; 19
	.db #0x09	; 9
	.db #0xc0	; 192
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x40	; 64
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x13	; 19
	.db #0x05	; 5
	.db #0x09	; 9
	.db #0x48	; 72	'H'
	.db #0x02	; 2
	.db #0x43	; 67	'C'
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0xc8	; 200
	.db #0x10	; 16
	.db #0x21	; 33
	.db #0x02	; 2
	.db #0x43	; 67	'C'
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0xc8	; 200
	.db #0xc0	; 192
	.db #0x89	; 137
	.db #0x02	; 2
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xd0	; 208
	.db #0xa2	; 162
	.db #0x1c	; 28
	.db #0x74	; 116	't'
	.db #0x06	; 6
	.db #0xc2	; 194
	.db #0xd0	; 208
	.db #0xa0	; 160
	.db #0x1b	; 27
	.db #0x85	; 133
	.db #0xe0	; 224
	.db #0xc2	; 194
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0x1e	; 30
	.db #0x2a	; 42
	.db #0xc0	; 192
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x40	; 64
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x13	; 19
	.db #0x0e	; 14
	.db #0x02	; 2
	.db #0x43	; 67	'C'
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x0a	; 10
	.db #0x40	; 64
	.db #0xf0	; 240
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x49	; 73	'I'
	.db #0x02	; 2
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x13	; 19
	.db #0x06	; 6
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xe0	; 224
	.db #0xc2	; 194
	.db #0x09	; 9
	.db #0x12	; 18
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x16	; 22
	.db #0xfc	; 252
	.db #0xc0	; 192
	.db #0x09	; 9
	.db #0x02	; 2
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x16	; 22
	.db #0x14	; 20
	.db #0x06	; 6
	.db #0xc3	; 195
	.db #0xc0	; 192
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x50	; 80	'P'
	.db #0xe0	; 224
	.db #0x0a	; 10
	.db #0x02	; 2
	.db #0x40	; 64
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xc0	; 192
	.db #0x89	; 137
	.db #0x02	; 2
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xa0	; 160
	.db #0x09	; 9
	.db #0x60	; 96
	.db #0x02	; 2
	.db #0xc0	; 192
	.db #0x8b	; 139
	.db #0xd4	; 212
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0xc3	; 195
	.db #0xd4	; 212
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x11	; 17
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0xc2	; 194
	.db #0xc8	; 200
	.db #0x03	; 3
	.db #0x1e	; 30
	.db #0x2a	; 42
	.db #0x04	; 4
	.db #0x5b	; 91
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
;mandlegpu.c:98: int main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;mandlegpu.c:100: vdpmemcpy(0x1b02, MANGPU, sizeof(MANGPU));
	ld	hl, #0x0230
	push	hl
	ld	hl, #_MANGPU
	push	hl
	ld	hl, #0x1b02
	push	hl
	call	_vdpmemcpy
	ld	hl, #6
	add	hl, sp
;mandlegpu.c:89: inline void VDP_SET_REGISTER(unsigned char r, unsigned char v)		{	VDPWA=(v); VDPWA=(0x80|(r)); }
	ld	a, #0x1c
	out	(_VDPWA), a
	ld	a, #0xb9
	out	(_VDPWA), a
	ld	a, #0x1c
	out	(_VDPWA), a
	ld	a, #0xb9
	out	(_VDPWA), a
	ld	a, #0x1b
	out	(_VDPWA), a
	ld	a, #0xb6
	out	(_VDPWA), a
	ld	a, #0x02
	out	(_VDPWA), a
	ld	a, #0xb7
	out	(_VDPWA), a
;mandlegpu.c:111: VDP_SET_REGISTER(55, 0x02);     // LSB - now it starts
00107$:
;mandlegpu.c:118: return 0;
;mandlegpu.c:119: }
	jr	00107$
;mandlegpu.c:122: void vdpinit() {
;	---------------------------------
; Function vdpinit
; ---------------------------------
_vdpinit::
	push	af
;mandlegpu.c:126: SOUND = 0x9f;
	ld	a, #0x9f
	out	(_SOUND), a
;mandlegpu.c:127: SOUND = 0xbf;
	ld	a, #0xbf
	out	(_SOUND), a
;mandlegpu.c:128: SOUND = 0xdf;
	ld	a, #0xdf
	out	(_SOUND), a
;mandlegpu.c:129: SOUND = 0xff;
	ld	a, #0xff
	out	(_SOUND), a
;mandlegpu.c:134: x=60000;
	ld	hl, #0xea60
	ex	(sp), hl
;mandlegpu.c:135: while (++x != 0) { }		// counts till we loop at 65536
00101$:
	pop	bc
	push	bc
	inc	bc
	inc	sp
	inc	sp
	push	bc
	ld	a, b
	or	a, c
	jr	NZ, 00101$
;mandlegpu.c:136: }
	pop	af
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
