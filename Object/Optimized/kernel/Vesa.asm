; Listing generated by Microsoft (R) Optimizing Compiler Version 18.00.40629.0 

	TITLE	C:\Users\cex123\Desktop\XXXXX\osdev\osdev-216\Source\Kernel\Device\Drivers\Vesa.c
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB OLDNAMES

PUBLIC	_Vesa
PUBLIC	_ivesa
_Vesa	DD	FLAT:_ivesa
_ivesa	DD	FLAT:_IVesa_ResX
	DD	FLAT:_IVesa_ResY
	DD	FLAT:_IVesa_Bits
	DD	FLAT:_IVesa_ScanLine
	DD	FLAT:_IVesa_Pixels
	DD	FLAT:_IVesa_Blit
	DD	FLAT:_IVesa_Sync
PUBLIC	_IVesa_Pixels
PUBLIC	_IVesa_ScanLine
PUBLIC	_IVesa_Bits
PUBLIC	_IVesa_ResY
PUBLIC	_IVesa_ResX
PUBLIC	_IVesa_Blit
PUBLIC	_SysCall_Blit
PUBLIC	_IVesa_Sync
PUBLIC	_EnableVesa
	ALIGN	4

_vesa	DD	01H DUP (?)
_BSS	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-216\source\kernel\device\drivers\vesa.c
_TEXT	SEGMENT
_base$ = 8						; size = 4
_size$ = 12						; size = 4
_EnableVesa PROC

; 74   :     if (!base) return false;

	mov	eax, DWORD PTR _base$[esp-4]
	test	eax, eax
	jne	SHORT $LN1@EnableVesa

; 77   : }

	ret	0
$LN1@EnableVesa:

; 75   :     vesa = (CVesa*)&base[sizeof(VESA_INFO)+sizeof(MODE_INFO)];

	add	eax, 768				; 00000300H
	mov	DWORD PTR _vesa, eax

; 76   :     return true;

	xor	eax, eax
	inc	eax

; 77   : }

	ret	0
_EnableVesa ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-216\source\kernel\device\drivers\vesa.c
_TEXT	SEGMENT
_IVesa_Sync PROC

; 10   : void IVesa_Sync(void) {

$LL2@IVesa_Sync:

; 11   :     while ((inb(CGA_STATUS) & CGA_VSYNC) == 0);

	push	986					; 000003daH
	call	_inb
	pop	ecx
	test	al, 8
	je	SHORT $LL2@IVesa_Sync

; 12   : }

	ret	0
_IVesa_Sync ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-216\source\kernel\device\drivers\vesa.c
_TEXT	SEGMENT
_count$1$ = -24						; size = 4
_x1$1$ = -20						; size = 4
_v1$1$ = -16						; size = 4
_u1$1$ = -12						; size = 4
_sn$1$ = -8						; size = 4
_tn$1$ = -4						; size = 4
_SysCall_Blit PROC
; _params$ = ecx

; 14   : void SysCall_Blit(int params[]) {

	sub	esp, 24					; 00000018H

; 15   :     if (!params) return;

	test	ecx, ecx
	je	$LN1@SysCall_Bl

; 16   :     int x1 = params[0];
; 17   :     int y1 = params[1];
; 18   :     int x2 = params[2];
; 19   :     int y2 = params[3];
; 20   :     int u1 = params[4];

	mov	eax, DWORD PTR [ecx+16]

; 21   :     int v1 = params[5];
; 22   :     int u2 = params[6];
; 23   :     int v2 = params[7];
; 24   :     int sn = params[8];
; 25   :     int tn = vesa->ScanLine;

	mov	edx, DWORD PTR _vesa
	push	ebx
	mov	ebx, DWORD PTR [ecx+8]
	mov	DWORD PTR _u1$1$[esp+28], eax
	mov	eax, DWORD PTR [ecx+20]
	push	ebp
	mov	ebp, DWORD PTR [ecx+4]
	mov	DWORD PTR _v1$1$[esp+32], eax
	mov	eax, DWORD PTR [ecx+32]
	push	esi
	mov	esi, DWORD PTR [ecx]
	mov	DWORD PTR _sn$1$[esp+36], eax
	movzx	eax, WORD PTR [edx+8]
	mov	DWORD PTR _x1$1$[esp+36], esi
	mov	DWORD PTR _count$1$[esp+36], ebx
	mov	DWORD PTR _tn$1$[esp+36], eax
	push	edi
	mov	edi, DWORD PTR [ecx+12]

; 26   : 
; 27   :     x1 = MIN(MAX(0, x1), vesa->ResX);

	test	esi, esi
	jns	SHORT $LN7@SysCall_Bl
	xor	eax, eax
	jmp	SHORT $LN8@SysCall_Bl
$LN7@SysCall_Bl:
	mov	eax, esi
$LN8@SysCall_Bl:
	movzx	edx, WORD PTR [edx+2]
	cmp	eax, edx
	jge	SHORT $LN11@SysCall_Bl
	test	esi, esi
	jns	SHORT $LN12@SysCall_Bl
	and	DWORD PTR _x1$1$[esp+40], 0
	jmp	SHORT $LN12@SysCall_Bl
$LN11@SysCall_Bl:
	mov	DWORD PTR _x1$1$[esp+40], edx
$LN12@SysCall_Bl:

; 28   :     y1 = MIN(MAX(0, y1), vesa->ResY);

	test	ebp, ebp
	jns	SHORT $LN13@SysCall_Bl
	xor	eax, eax
	jmp	SHORT $LN14@SysCall_Bl
$LN13@SysCall_Bl:
	mov	eax, ebp
$LN14@SysCall_Bl:
	mov	esi, DWORD PTR _vesa
	movzx	esi, WORD PTR [esi+4]
	cmp	eax, esi
	jge	SHORT $LN17@SysCall_Bl
	test	ebp, ebp
	jns	SHORT $LN18@SysCall_Bl
	xor	ebp, ebp
	jmp	SHORT $LN18@SysCall_Bl
$LN17@SysCall_Bl:
	mov	ebp, esi
$LN18@SysCall_Bl:

; 29   :     x2 = MIN(MAX(0, x2), vesa->ResX);

	test	ebx, ebx
	jns	SHORT $LN19@SysCall_Bl
	xor	eax, eax
	jmp	SHORT $LN20@SysCall_Bl
$LN19@SysCall_Bl:
	mov	eax, ebx
$LN20@SysCall_Bl:
	cmp	eax, edx
	jge	SHORT $LN23@SysCall_Bl
	test	ebx, ebx
	jns	SHORT $LN24@SysCall_Bl
	xor	eax, eax
	mov	DWORD PTR _count$1$[esp+40], eax
	jmp	SHORT $LN24@SysCall_Bl
$LN23@SysCall_Bl:
	mov	DWORD PTR _count$1$[esp+40], edx
$LN24@SysCall_Bl:

; 30   :     y2 = MIN(MAX(0, y2), vesa->ResY);

	test	edi, edi
	jns	SHORT $LN25@SysCall_Bl
	xor	eax, eax
	jmp	SHORT $LN26@SysCall_Bl
$LN25@SysCall_Bl:
	mov	eax, edi
$LN26@SysCall_Bl:
	cmp	eax, esi
	jge	SHORT $LN29@SysCall_Bl
	test	edi, edi
	jns	SHORT $LN30@SysCall_Bl
	xor	edi, edi
	jmp	SHORT $LN30@SysCall_Bl
$LN29@SysCall_Bl:
	mov	edi, esi
$LN30@SysCall_Bl:

; 31   :     u1 = MIN(MAX(0, u1), vesa->ResX);

	mov	ebx, DWORD PTR [ecx+16]
	test	ebx, ebx
	jns	SHORT $LN31@SysCall_Bl
	xor	eax, eax
	jmp	SHORT $LN32@SysCall_Bl
$LN31@SysCall_Bl:
	mov	eax, ebx
$LN32@SysCall_Bl:
	cmp	eax, edx
	jge	SHORT $LN35@SysCall_Bl
	test	ebx, ebx
	jns	SHORT $LN36@SysCall_Bl
	and	DWORD PTR _u1$1$[esp+40], 0
	jmp	SHORT $LN36@SysCall_Bl
$LN35@SysCall_Bl:
	mov	DWORD PTR _u1$1$[esp+40], edx
$LN36@SysCall_Bl:

; 32   :     v1 = MIN(MAX(0, v1), vesa->ResY);

	mov	edx, DWORD PTR [ecx+20]
	test	edx, edx
	jns	SHORT $LN37@SysCall_Bl
	xor	eax, eax
	jmp	SHORT $LN38@SysCall_Bl
$LN37@SysCall_Bl:
	mov	eax, edx
$LN38@SysCall_Bl:
	cmp	eax, esi
	jge	SHORT $LN41@SysCall_Bl
	test	edx, edx
	jns	SHORT $LN42@SysCall_Bl
	and	DWORD PTR _v1$1$[esp+40], 0
	jmp	SHORT $LN42@SysCall_Bl
$LN41@SysCall_Bl:
	mov	DWORD PTR _v1$1$[esp+40], esi
$LN42@SysCall_Bl:

; 33   :     u2 = MIN(MAX(0, u2), vesa->ResX);
; 34   :     v2 = MIN(MAX(0, v2), vesa->ResY);
; 35   : 
; 36   :     char *source = (char*)params[9];
; 37   :     char *target = vesa->Pixels;
; 38   :     target += y1*tn + x1*4;

	mov	eax, DWORD PTR _tn$1$[esp+40]
	mov	edx, DWORD PTR _vesa

; 39   :     source += v1*sn + u1*4;

	mov	esi, DWORD PTR _u1$1$[esp+40]
	imul	eax, ebp
	add	eax, DWORD PTR [edx+12]
	mov	edx, DWORD PTR _x1$1$[esp+40]
	lea	ebx, DWORD PTR [eax+edx*4]
	mov	eax, DWORD PTR _sn$1$[esp+40]
	imul	eax, DWORD PTR _v1$1$[esp+40]
	lea	esi, DWORD PTR [eax+esi*4]

; 40   :     int count = x2 - x1;

	mov	eax, DWORD PTR _count$1$[esp+40]
	add	esi, DWORD PTR [ecx+36]
	sub	eax, edx
	mov	DWORD PTR _count$1$[esp+40], eax

; 41   : 
; 42   :     for (int y = y1; y < y2; y++) {

	cmp	ebp, edi
	jge	SHORT $LN59@SysCall_Bl

; 33   :     u2 = MIN(MAX(0, u2), vesa->ResX);
; 34   :     v2 = MIN(MAX(0, v2), vesa->ResY);
; 35   : 
; 36   :     char *source = (char*)params[9];
; 37   :     char *target = vesa->Pixels;
; 38   :     target += y1*tn + x1*4;

	sub	edi, ebp
$LL3@SysCall_Bl:

; 43   :         movsd(target, source, count);

	push	eax
	push	esi
	push	ebx
	call	_movsd

; 44   :         source += sn;

	add	esi, DWORD PTR _sn$1$[esp+52]
	add	esp, 12					; 0000000cH

; 45   :         target += tn;

	add	ebx, DWORD PTR _tn$1$[esp+40]
	mov	eax, DWORD PTR _count$1$[esp+40]
	dec	edi
	jne	SHORT $LL3@SysCall_Bl
$LN59@SysCall_Bl:
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
$LN1@SysCall_Bl:

; 46   :     }
; 47   : }

	add	esp, 24					; 00000018H
	ret	0
_SysCall_Blit ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-216\source\kernel\device\drivers\vesa.c
_TEXT	SEGMENT
_params$ = 8						; size = 4
_IVesa_Blit PROC

; 50   :     SysCall(SYS_BLIT,(int)params,0,0,0,0,0);

	mov	edx, DWORD PTR _params$[esp-4]
	sub	esp, 20					; 00000014H
	mov	ecx, 32771				; 00008003H
	call	_SysCall
	add	esp, 20					; 00000014H

; 51   : }

	ret	0
_IVesa_Blit ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-216\source\kernel\device\drivers\vesa.c
_TEXT	SEGMENT
_IVesa_ResX PROC

; 54   :     return vesa->ResX;

	mov	eax, DWORD PTR _vesa
	mov	ax, WORD PTR [eax+2]

; 55   : }

	ret	0
_IVesa_ResX ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-216\source\kernel\device\drivers\vesa.c
_TEXT	SEGMENT
_IVesa_ResY PROC

; 58   :     return vesa->ResY;

	mov	eax, DWORD PTR _vesa
	mov	ax, WORD PTR [eax+4]

; 59   : }

	ret	0
_IVesa_ResY ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-216\source\kernel\device\drivers\vesa.c
_TEXT	SEGMENT
_IVesa_Bits PROC

; 62   :     return vesa->Bits;

	mov	eax, DWORD PTR _vesa
	mov	ax, WORD PTR [eax+6]

; 63   : }

	ret	0
_IVesa_Bits ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-216\source\kernel\device\drivers\vesa.c
_TEXT	SEGMENT
_IVesa_ScanLine PROC

; 66   :     return vesa->ScanLine;

	mov	eax, DWORD PTR _vesa
	mov	ax, WORD PTR [eax+8]

; 67   : }

	ret	0
_IVesa_ScanLine ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-216\source\kernel\device\drivers\vesa.c
_TEXT	SEGMENT
_IVesa_Pixels PROC

; 70   :     return vesa->Pixels;

	mov	eax, DWORD PTR _vesa
	mov	eax, DWORD PTR [eax+12]

; 71   : }

	ret	0
_IVesa_Pixels ENDP
_TEXT	ENDS
END
