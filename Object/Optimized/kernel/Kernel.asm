; Listing generated by Microsoft (R) Optimizing Compiler Version 18.00.40629.0 

	TITLE	C:\Users\cex123\Desktop\FYP\develop\spartan\source\Kernel\Kernel.c
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB OLDNAMES

PUBLIC	??_C@_0BD@MGDBMFGD@System?1Desktop?4dll?$AA@	; `string'
;	COMDAT ??_C@_0BD@MGDBMFGD@System?1Desktop?4dll?$AA@
CONST	SEGMENT
??_C@_0BD@MGDBMFGD@System?1Desktop?4dll?$AA@ DB 'System/Desktop.dll', 00H ; `string'
PUBLIC	_start@12
PUBLIC	_main
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\fyp\develop\spartan\source\kernel\kernel.c
_TEXT	SEGMENT
_main	PROC
; _grub$ = ecx

; 10   :     if (!BootStrap(grub)) for (;;);

	mov	eax, DWORD PTR _BootLoad
	push	ecx
	call	DWORD PTR [eax]
	pop	ecx
	test	eax, eax
	je	SHORT $LL4@main
	call	_BootStrap
	test	eax, eax
	je	SHORT $LL4@main
$LL2@main:

; 11   :     for (;;) JumpToRing3("System/Desktop.dll");

	call	_JumpToRing3
	jmp	SHORT $LL2@main
$LL4@main:

; 10   :     if (!BootStrap(grub)) for (;;);

	jmp	SHORT $LL4@main
_main	ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\fyp\develop\spartan\source\kernel\kernel.c
_TEXT	SEGMENT
_magic$ = 8						; size = 4
_grub$ = 12						; size = 4
_boot$ = 16						; size = 4
_start@12 PROC

; 15   :     if (magic == 0x2BADB002) main(grub);

	cmp	DWORD PTR _magic$[esp-4], 732803074	; 2badb002H
	je	SHORT $LN5@start

; 16   :     return 1;

	xor	eax, eax
	inc	eax

; 17   : }

	ret	12					; 0000000cH
$LN5@start:

; 15   :     if (magic == 0x2BADB002) main(grub);

	mov	ecx, DWORD PTR _grub$[esp-4]
	call	_main
$LN7@start:
$LN4@start:
	int	3
_start@12 ENDP
_TEXT	ENDS
END
