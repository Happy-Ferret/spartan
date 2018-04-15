; Listing generated by Microsoft (R) Optimizing Compiler Version 18.00.40629.0 

	TITLE	C:\Users\cex123\Desktop\XXXXX\osdev\osdev-216\Source\Kernel\BootLoad\Intel\Gdt.c
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB OLDNAMES

PUBLIC	_gdt
EXTRN	_movsd:PROC
EXTRN	_lgdt:PROC
_gdt	DQ	0000000000000000H
	DQ	00cf9a000000ffffH
	DQ	00cf92000000ffffH
	DQ	00dffa000000ffffH
	DQ	00dff2000000ffffH
	DQ	000f98000000ffffH
	DQ	000f92000000ffffH
	DQ	0000e9000000ffffH
PUBLIC	_EnableGdt
PUBLIC	_InstallGdt
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-216\source\kernel\bootload\intel\gdt.c
_TEXT	SEGMENT
_base$ = 8						; size = 4
_size$ = 12						; size = 4
_InstallGdt PROC

; 32   :     u32 tss = (u32)base + size;
; 33   :     gdt[7] |= tss*65536;

	mov	eax, DWORD PTR _size$[esp-4]
	push	esi
	mov	esi, DWORD PTR _base$[esp]
	add	eax, esi

; 34   :     movsd(base, gdt, sizeof(gdt)/4);

	push	16					; 00000010H
	shl	eax, 16					; 00000010H
	or	DWORD PTR _gdt+56, eax
	push	OFFSET _gdt
	push	esi
	call	_movsd
	add	esp, 12					; 0000000cH

; 35   : 
; 36   :     u32 *gdtr = (u32*)&base[sizeof(gdt)];
; 37   :     gdtr[0] = (sizeof(gdt)-1) << 16;

	mov	DWORD PTR [esi+64], 4128768		; 003f0000H

; 38   :     gdtr[1] = (u32)base;
; 39   :     return true;

	xor	eax, eax
	mov	DWORD PTR [esi+68], esi
	inc	eax
	pop	esi

; 40   : }

	ret	0
_InstallGdt ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-216\source\kernel\bootload\intel\gdt.c
_TEXT	SEGMENT
_base$ = 8						; size = 4
_size$ = 12						; size = 4
_EnableGdt PROC

; 43   :     lgdt(&base[sizeof(gdt)+2]);

	mov	eax, DWORD PTR _base$[esp-4]
	add	eax, 66					; 00000042H
	push	eax
	call	_lgdt

; 44   :     return true;

	xor	eax, eax
	pop	ecx
	inc	eax

; 45   : }

	ret	0
_EnableGdt ENDP
_TEXT	ENDS
END
