; Listing generated by Microsoft (R) Optimizing Compiler Version 18.00.40629.0 

	TITLE	C:\Users\cex123\Desktop\FYP\develop\spartan\Source\Kernel\BootLoad\PcBios\PcBios.c
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB OLDNAMES

PUBLIC	_InstallPcBios
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\fyp\develop\spartan\source\kernel\bootload\pcbios\pcbios.c
_TEXT	SEGMENT
_base$ = 8						; size = 4
_size$ = 12						; size = 4
_InstallPcBios PROC

; 18   :     if (!base || size < 320) return false;

	cmp	DWORD PTR _base$[esp-4], 0
	je	SHORT $LN1@InstallPcB
	cmp	DWORD PTR _size$[esp-4], 320		; 00000140H
	jb	SHORT $LN1@InstallPcB

; 19   :     movsd(base, (char*)0x00100100, 320/4);

	push	80					; 00000050H
	push	1048832					; 00100100H
	push	DWORD PTR _base$[esp+4]
	call	_movsd

; 20   :     return true;

	xor	eax, eax
	add	esp, 12					; 0000000cH
	inc	eax

; 21   : }

	ret	0
$LN1@InstallPcB:

; 18   :     if (!base || size < 320) return false;

	xor	eax, eax

; 21   : }

	ret	0
_InstallPcBios ENDP
_TEXT	ENDS
END