; crt0.s for Colecovision cart
; this one has no interrupts, not even NMI, enabled

	.module crt0
	.globl _main
	.globl _vdpinit
	.globl _vdpLimi
	.globl _spinnerInt

	.area _HEADER(ABS)
	.org 0x8000

	.db 0x55, 0xaa			; Title screen and 12 second delay - swap 0x55 and 0xaa not to skip it.
	.dw 0								; sprite table stuff? - rarely used by the BIOS as a pointer
	.dw 0								; unknown - rarely used as a pointer to a single byte of RAM by the BIOS.
	.dw 0								; unknown - frequently used in BIOS routines as a pointer to a memory location (data is both written to and read from there, at least 124 bytes are used - maybe this is where the bios routines store most of their data, though with the common value of 0 this would be in the BIOS ROM itself - strange).
	.dw 0								; unknown - rarely used as a pointer to a single byte of RAM by the BIOS.
	.dw start						; where to start execution of program.
	ei		; RST 0x08
	reti					
	ei		; RST 0x10
	reti
	ei		; RST 0x18
	reti
	ei		; RST 0x20
	reti
	ei		; RST 0x28
	reti
	ei		; RST 0x30
	reti

	ei		; RST 0x38 - spinner interrupt
	reti
;	jp spinner	; RST 0x38 - spinner interrupt (one or the other - padding is important)
;	nop
	
	jp nmi		; NMI
	.ascii " / / NOT"

start:
	; clear interrupt flag right off
	ld hl,#_vdpLimi
	ld (hl),#0
	; clear RAM before starting
	ld hl,#0x7000			; set copy source
	ld de,#0x7001			; set copy dest
	ld bc,#0x03ff			; set bytes to copy (1 less than size)
	ld (hl),#0				; set initial value (this gets copied through)
	ldir					; do it
	
	ld  sp, #0x7400			; Set stack pointer directly above top of memory.
	ld	bc,#0xFFFE			; switch in code bank
   	ld	a,(bc)				; note that this does NOT set the local pBank variable, user code still must do that!
	call gsinit				; Initialize global variables. (always at end of code bank, so need above bank switch)
	call _vdpinit			; Initialize something or other ;)
	call _main
	rst 0x0					; Restart when main() returns.

	;; Ordering of segments for the linker - copied from sdcc crt0.s
	.area _HOME
	.area _CODE
	.area _INITIALIZER
	.area   _GSINIT
	.area   _GSFINAL
        
	.area _DATA
	.area _BSS
	.area _HEAP

	.area _BSS
_vdpLimi:		; 0x80 - interrupt set, other bits used by library
	.ds 1

    .area _CODE
nmi:
; this one does nothing but return
	retn
	
spinner:
; Spinner handler - return
	reti

; soft function to be overridden if that's possible
_spinnerInt:
	ret

	.area _GSINIT
gsinit::
	.area _GSFINAL
	ret

