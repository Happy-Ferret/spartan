; Listing generated by Microsoft (R) Optimizing Compiler Version 18.00.40629.0 

	TITLE	C:\Users\cex123\Desktop\XXXXX\osdev\osdev-211\Source\Applications\Fire\Fire.c
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB MSVCRT
INCLUDELIB OLDNAMES

_DATA	SEGMENT
COMM	_lookup:DWORD
COMM	_heatmap:DWORD
COMM	_coolmap:DWORD
_DATA	ENDS
_DATA	SEGMENT
?seed@?1??DemoEffect@@9@9 DD 0bc614eH			; `DemoEffect'::`2'::seed
_DATA	ENDS
PUBLIC	_frand
PUBLIC	_rgb
PUBLIC	_DemoSetup
PUBLIC	_DemoEffect
PUBLIC	??_C@_06NPEBFFAN@Plasma?$AA@			; `string'
PUBLIC	__real@3f800000
PUBLIC	__real@43800000
EXTRN	_stosd:PROC
EXTRN	__imp__Memory:DWORD
EXTRN	__fltused:DWORD
;	COMDAT __real@43800000
CONST	SEGMENT
__real@43800000 DD 043800000r			; 256
CONST	ENDS
;	COMDAT __real@3f800000
CONST	SEGMENT
__real@3f800000 DD 03f800000r			; 1
CONST	ENDS
;	COMDAT ??_C@_06NPEBFFAN@Plasma?$AA@
CONST	SEGMENT
??_C@_06NPEBFFAN@Plasma?$AA@ DB 'Plasma', 00H		; `string'
CONST	ENDS
; Function compile flags: /Ogtpy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-211\source\applications\fire\fire.c
_TEXT	SEGMENT
_wide$1$ = -32						; size = 4
tv1233 = -28						; size = 4
_y$1$ = -28						; size = 4
tv1243 = -24						; size = 4
tv1231 = -24						; size = 4
_resy$1$ = -24						; size = 4
tv1240 = -20						; size = 4
tv1236 = -20						; size = 4
_canvas$1$ = -20					; size = 4
tv1253 = -16						; size = 4
_y$1$ = -16						; size = 4
_res$1 = -16						; size = 4
_res$2 = -16						; size = 4
_high$1$ = -12						; size = 4
tv1242 = -8						; size = 4
tv1250 = -4						; size = 4
_image$1$ = -4						; size = 4
_resx$1$ = 8						; size = 4
_window$ = 8						; size = 4
_t$ = 12						; size = 4
_DemoEffect PROC

; 64   : void DemoEffect(CWindow *window, int t) {

	sub	esp, 32					; 00000020H

; 65   :     CCanvas *canvas = window->Canvas;

	mov	ecx, DWORD PTR _window$[esp+28]
	push	ebx
	push	ebp
	push	esi
	mov	ebx, DWORD PTR [ecx+36]

; 66   :     static int seed = 12345678;
; 67   :     int resx = canvas->ResX/SIZE;
; 68   :     int resy = canvas->ResY/SIZE;
; 69   :     int wide = window->Wide/SIZE;
; 70   :     int high = window->High/SIZE;
; 71   :     char *image = &canvas->Draw[window->PosY*canvas->ScanLine];
; 72   :     image += window->PosX*sizeof(int);
; 73   : 
; 74   :     for (int x = 0; x < resx; x++) {

	xor	esi, esi
	push	edi
	mov	DWORD PTR _canvas$1$[esp+48], ebx
	mov	eax, DWORD PTR [ebx+48]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	DWORD PTR _resx$1$[esp+44], eax
	mov	eax, DWORD PTR [ebx+52]
	cdq
	sub	eax, edx
	mov	edi, eax
	movsx	eax, WORD PTR [ecx+20]
	cdq
	sub	eax, edx
	sar	edi, 1
	sar	eax, 1
	mov	DWORD PTR _wide$1$[esp+48], eax
	movsx	eax, WORD PTR [ecx+22]
	cdq
	sub	eax, edx
	mov	DWORD PTR _resy$1$[esp+48], edi
	movsx	edx, WORD PTR [ecx+18]
	imul	edx, DWORD PTR [ebx+36]
	movsx	ecx, WORD PTR [ecx+16]
	sar	eax, 1
	mov	DWORD PTR _high$1$[esp+48], eax
	lea	ebp, DWORD PTR [edx+ecx*4]
	add	ebp, DWORD PTR [ebx+32]
	mov	DWORD PTR _image$1$[esp+48], ebp
	cmp	DWORD PTR _resx$1$[esp+44], esi
	jle	$LN31@DemoEffect
	mov	ebx, DWORD PTR _resx$1$[esp+44]
	dec	edi
	movss	xmm1, DWORD PTR __real@3f800000
	movss	xmm2, DWORD PTR __real@43800000
	imul	edi, ebx
$LL33@DemoEffect:

; 75   :         int y1 = 0;
; 76   :         int y2 = resy-1;
; 77   :         u8 v1 = (u8)(256*frand(&seed));

	imul	ecx, DWORD PTR ?seed@?1??DemoEffect@@9@9, 65505
	mov	eax, ecx
	shr	eax, 9
	or	eax, 1065353216				; 3f800000H
	mov	DWORD PTR _res$2[esp+48], eax
	movss	xmm0, DWORD PTR _res$2[esp+48]
	subss	xmm0, xmm1

; 78   :         u8 v2 = (u8)(256*frand(&seed));

	imul	eax, ecx, 65505
	mov	DWORD PTR ?seed@?1??DemoEffect@@9@9, eax
	shr	eax, 9
	or	eax, 1065353216				; 3f800000H
	mulss	xmm0, xmm2
	mov	DWORD PTR _res$1[esp+48], eax

; 79   :         heatmap[x + y1*resx] = v1;

	mov	eax, DWORD PTR _heatmap
	cvttss2si edx, xmm0
	movss	xmm0, DWORD PTR _res$1[esp+48]
	mov	BYTE PTR [eax+esi], dl
	subss	xmm0, xmm1

; 80   :         heatmap[x + v1*resx] = v1;

	movzx	eax, dl
	imul	eax, ebx
	mulss	xmm0, xmm2
	add	eax, DWORD PTR _heatmap
	cvttss2si ecx, xmm0
	mov	BYTE PTR [eax+esi], dl

; 81   :         coolmap[x + y2*resx] = v2;

	mov	eax, DWORD PTR _coolmap
	add	eax, edi
	mov	BYTE PTR [eax+esi], cl

; 82   :         coolmap[x + v2*resx] = v2;

	movzx	eax, cl
	imul	eax, ebx
	add	eax, DWORD PTR _coolmap
	mov	BYTE PTR [eax+esi], cl
	inc	esi
	cmp	esi, ebx
	jl	$LL33@DemoEffect
	mov	ebx, DWORD PTR _canvas$1$[esp+48]
	mov	edi, DWORD PTR _resy$1$[esp+48]
$LN31@DemoEffect:

; 83   :     }
; 84   :     for (int y = resy-1; y > 0; y--) {

	lea	esi, DWORD PTR [edi-1]
	mov	DWORD PTR _y$1$[esp+48], esi
	test	esi, esi
	jle	$LN28@DemoEffect
	mov	ebp, DWORD PTR _resx$1$[esp+44]
	mov	ecx, esi
	imul	ecx, ebp
	lea	eax, DWORD PTR [ebp-2]
	mov	DWORD PTR tv1253[esp+48], eax
	lea	ebx, DWORD PTR [ebp-1]
	mov	eax, ebp
	mov	DWORD PTR tv1243[esp+48], ecx
	neg	eax
	mov	DWORD PTR tv1242[esp+48], eax
	jmp	SHORT $LN30@DemoEffect
$LL88@DemoEffect:
	mov	ebp, DWORD PTR _resx$1$[esp+44]
$LN30@DemoEffect:

; 85   :         u8 *heat = &heatmap[y*resx];

	mov	edx, DWORD PTR _heatmap
	add	edx, ecx

; 86   :         for (int x = 1; x < resx-1; x++) {

	cmp	ebx, 1
	jle	SHORT $LN25@DemoEffect
	mov	edi, 1
	sub	edi, ebp
	lea	ebp, DWORD PTR [ebx-1]
	npad	1
$LL27@DemoEffect:

; 87   :             heat[x] = (heat[x-1] + heat[x]*2 + heat[x+1] + heat[x - resx]*4)/8;

	movzx	ecx, BYTE PTR [edi+edx]
	lea	esi, DWORD PTR [edx+1]
	movzx	eax, BYTE PTR [esi]
	lea	ecx, DWORD PTR [eax+ecx*2]
	movzx	eax, BYTE PTR [edx+2]
	lea	eax, DWORD PTR [eax+ecx*2]
	movzx	ecx, BYTE PTR [edx]
	add	eax, ecx
	cdq
	and	edx, 7
	add	eax, edx
	lea	edx, DWORD PTR [esi]
	sar	eax, 3
	mov	BYTE PTR [esi], al
	dec	ebp
	jne	SHORT $LL27@DemoEffect
	mov	ecx, DWORD PTR tv1243[esp+48]
	mov	esi, DWORD PTR _y$1$[esp+48]
$LN25@DemoEffect:

; 88   :         }
; 89   :         u8 *cool = &coolmap[y*resx];

	mov	eax, DWORD PTR _coolmap

; 90   :         for (int x = resx-2; x > 0; x--) {

	mov	edi, DWORD PTR tv1253[esp+48]
	add	eax, ecx
	test	edi, edi
	jle	SHORT $LN29@DemoEffect
	lea	esi, DWORD PTR [edi-1]
	mov	ebp, 1
	add	esi, eax
	sub	ebp, DWORD PTR _resx$1$[esp+44]
	npad	2
$LL24@DemoEffect:

; 91   :             cool[x] = (cool[x-1] + cool[x]*2 + cool[x+1] + cool[x - resx]*4)/8;

	movzx	eax, BYTE PTR [esi+1]
	lea	esi, DWORD PTR [esi-1]
	movzx	ecx, BYTE PTR [esi+ebp+1]
	dec	edi
	lea	ecx, DWORD PTR [eax+ecx*2]
	movzx	eax, BYTE PTR [esi+3]
	lea	eax, DWORD PTR [eax+ecx*2]
	movzx	ecx, BYTE PTR [esi+1]
	add	eax, ecx
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	mov	BYTE PTR [esi+2], al
	test	edi, edi
	jg	SHORT $LL24@DemoEffect
	mov	ecx, DWORD PTR tv1243[esp+48]
	mov	esi, DWORD PTR _y$1$[esp+48]
$LN29@DemoEffect:

; 83   :     }
; 84   :     for (int y = resy-1; y > 0; y--) {

	add	ecx, DWORD PTR tv1242[esp+48]
	dec	esi
	mov	DWORD PTR _y$1$[esp+48], esi
	mov	DWORD PTR tv1243[esp+48], ecx
	test	esi, esi
	jg	$LL88@DemoEffect
	mov	ebx, DWORD PTR _canvas$1$[esp+48]
	mov	ebp, DWORD PTR _image$1$[esp+48]
$LN28@DemoEffect:

; 92   :         }
; 93   :     }
; 94   : 
; 95   :     for (int y = 0; y < high; y++) {

	mov	edi, DWORD PTR _high$1$[esp+48]
	xor	edx, edx
	mov	DWORD PTR _y$1$[esp+48], edx
	test	edi, edi
	jle	$LN19@DemoEffect
	mov	eax, DWORD PTR _resx$1$[esp+44]
	xor	ecx, ecx
	shl	eax, 4
	mov	esi, 16					; 00000010H
	sub	esi, eax
	mov	DWORD PTR tv1233[esp+48], ecx
	mov	DWORD PTR tv1231[esp+48], esi
	npad	4
$LL21@DemoEffect:

; 96   :         if (y < 16 || y >= high-16) {

	cmp	edx, 16					; 00000010H
	jl	$LN17@DemoEffect
	lea	eax, DWORD PTR [edi-16]
	cmp	edx, eax
	jge	$LN17@DemoEffect

; 100  :             }
; 101  :         } else {
; 102  :             for (int v = 0; v < SIZE; v++) {

	mov	edi, ecx
	mov	DWORD PTR tv1240[esp+48], 2
	npad	2
$LL12@DemoEffect:

; 103  :                 int *pixel = (int*)&image[(y*SIZE+v)*canvas->ScanLine];

	mov	esi, DWORD PTR [ebx+36]
	imul	esi, edi

; 104  :                 stosd(pixel, 0x001E1E1E, 16*SIZE);

	push	32					; 00000020H
	push	1973790					; 001e1e1eH
	add	esi, ebp
	push	esi
	call	_stosd

; 105  :                 pixel += wide*SIZE - 16*SIZE;

	mov	eax, DWORD PTR _wide$1$[esp+60]
	add	eax, -16				; fffffff0H

; 106  :                 stosd(pixel, 0x001E1E1E, 16*SIZE);

	push	32					; 00000020H
	push	1973790					; 001e1e1eH
	lea	eax, DWORD PTR [esi+eax*8]
	push	eax
	call	_stosd
	add	esp, 24					; 00000018H
	inc	edi
	dec	DWORD PTR tv1240[esp+48]
	jne	SHORT $LL12@DemoEffect

; 107  :             }
; 108  :             for (int x = 16; x < wide-16; x++) {

	mov	ecx, DWORD PTR _wide$1$[esp+48]
	mov	edx, 16					; 00000010H
	lea	eax, DWORD PTR [ecx-16]
	cmp	eax, edx
	jle	$LN20@DemoEffect
	mov	esi, DWORD PTR tv1231[esp+48]
	mov	DWORD PTR tv1236[esp+48], esi
$LL9@DemoEffect:

; 109  :                 int i = (y-16)*resx + x;
; 110  :                 u8 heat = heatmap[i];
; 111  :                 u8 cool = coolmap[i];
; 112  :                 char fire = heat - cool;

	mov	eax, DWORD PTR _heatmap
	mov	cl, BYTE PTR [esi+eax]
	mov	eax, DWORD PTR _coolmap
	sub	cl, BYTE PTR [esi+eax]

; 113  :                 fire = MIN(MAX(0, fire), 127);

	js	SHORT $LN87@DemoEffect
	cmp	cl, 127					; 0000007fH
	jl	SHORT $LN41@DemoEffect
	mov	cl, 127					; 0000007fH
	jmp	SHORT $LN41@DemoEffect
$LN87@DemoEffect:
	xor	cl, cl
$LN41@DemoEffect:

; 114  :                 u8 c = fire;
; 115  :                 u32 color = lookup[c];

	mov	eax, DWORD PTR _lookup
	mov	edi, 2
	movzx	ecx, cl
	mov	esi, DWORD PTR [eax+ecx*4]
	mov	ecx, DWORD PTR tv1233[esp+48]
$LL6@DemoEffect:

; 116  :                 for (int v = 0; v < SIZE; v++) {
; 117  :                     int *pixel = (int*)&image[(y*SIZE + v)*canvas->ScanLine];

	mov	eax, DWORD PTR [ebx+36]
	imul	eax, ecx
	inc	ecx
	add	eax, ebp

; 118  :                     for (int u = 0; u < SIZE; u++) {
; 119  :                         pixel[x*SIZE + u] = color;

	mov	DWORD PTR [eax+edx*8], esi
	mov	DWORD PTR [eax+edx*8+4], esi
	dec	edi
	jne	SHORT $LL6@DemoEffect

; 107  :             }
; 108  :             for (int x = 16; x < wide-16; x++) {

	mov	ecx, DWORD PTR _wide$1$[esp+48]
	inc	edx
	mov	esi, DWORD PTR tv1236[esp+48]
	inc	esi
	mov	DWORD PTR tv1236[esp+48], esi
	lea	eax, DWORD PTR [ecx-16]
	cmp	edx, eax
	jl	SHORT $LL9@DemoEffect

; 66   :     static int seed = 12345678;
; 67   :     int resx = canvas->ResX/SIZE;
; 68   :     int resy = canvas->ResY/SIZE;
; 69   :     int wide = window->Wide/SIZE;
; 70   :     int high = window->High/SIZE;
; 71   :     char *image = &canvas->Draw[window->PosY*canvas->ScanLine];
; 72   :     image += window->PosX*sizeof(int);
; 73   : 
; 74   :     for (int x = 0; x < resx; x++) {

	jmp	SHORT $LN20@DemoEffect
$LN17@DemoEffect:
	mov	eax, DWORD PTR _wide$1$[esp+48]

; 97   :             for (int v = 0; v < SIZE; v++) {

	mov	esi, ecx
	add	eax, eax
	mov	edi, 2
	mov	DWORD PTR tv1250[esp+48], eax
	npad	2
$LL16@DemoEffect:

; 98   :                 int *pixel = (int*)&image[(y*SIZE+v)*canvas->ScanLine];
; 99   :                 stosd(pixel, 0x001E1E1E, wide*SIZE);

	push	eax
	mov	eax, DWORD PTR [ebx+36]
	imul	eax, esi
	push	1973790					; 001e1e1eH
	add	eax, ebp
	push	eax
	call	_stosd
	mov	eax, DWORD PTR tv1250[esp+60]
	add	esp, 12					; 0000000cH
	inc	esi
	dec	edi
	jne	SHORT $LL16@DemoEffect
$LN20@DemoEffect:

; 92   :         }
; 93   :     }
; 94   : 
; 95   :     for (int y = 0; y < high; y++) {

	mov	edx, DWORD PTR _y$1$[esp+48]
	mov	esi, DWORD PTR tv1231[esp+48]
	inc	edx
	mov	ecx, DWORD PTR tv1233[esp+48]
	add	esi, DWORD PTR _resx$1$[esp+44]
	add	ecx, 2
	mov	edi, DWORD PTR _high$1$[esp+48]
	mov	DWORD PTR _y$1$[esp+48], edx
	mov	DWORD PTR tv1231[esp+48], esi
	mov	DWORD PTR tv1233[esp+48], ecx
	cmp	edx, edi
	jl	$LL21@DemoEffect
$LN19@DemoEffect:
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx

; 120  :                     }
; 121  :                 }
; 122  :             }
; 123  :         }
; 124  :     }
; 125  : }

	add	esp, 32					; 00000020H
	ret	0
_DemoEffect ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-211\source\applications\fire\fire.c
_TEXT	SEGMENT
_window$ = 8						; size = 4
_DemoSetup PROC

; 36   :     CCanvas *canvas = window->Canvas;

	mov	eax, DWORD PTR _window$[esp-4]
	push	esi
	mov	esi, DWORD PTR [eax+36]

; 37   :     CWindow *frame = canvas->BtmMost;
; 38   :     frame->Title = "Plasma";

	mov	ecx, DWORD PTR [esi+12]
	mov	DWORD PTR [ecx+52], OFFSET ??_C@_06NPEBFFAN@Plasma?$AA@

; 39   :     int resx = canvas->ResX/SIZE;

	mov	eax, DWORD PTR [esi+48]
	cdq
	sub	eax, edx
	mov	ecx, eax

; 40   :     int resy = canvas->ResY/SIZE;

	mov	eax, DWORD PTR [esi+52]
	cdq
	sub	eax, edx
	sar	ecx, 1
	mov	esi, eax
	sar	esi, 1

; 41   :     heatmap = Memory->Alloc(resx*resy);

	imul	esi, ecx
	mov	ecx, DWORD PTR __imp__Memory
	mov	ecx, DWORD PTR [ecx]
	push	esi
	mov	ecx, DWORD PTR [ecx]
	call	ecx
	add	esp, 4
	mov	DWORD PTR _heatmap, eax

; 42   :     if (!heatmap) return false;

	test	eax, eax
	jne	SHORT $LN9@DemoSetup
$LN35@DemoSetup:
	xor	eax, eax
	pop	esi

; 62   : }

	ret	0
$LN9@DemoSetup:

; 43   :     coolmap = Memory->Alloc(resx*resy);

	mov	eax, DWORD PTR __imp__Memory
	push	esi
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	call	eax
	add	esp, 4
	mov	DWORD PTR _coolmap, eax

; 44   :     if (!coolmap) return false;

	test	eax, eax
	je	SHORT $LN35@DemoSetup

; 45   :     lookup = Memory->Alloc(4*256);

	mov	eax, DWORD PTR __imp__Memory
	push	1024					; 00000400H
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	call	eax
	mov	edx, eax
	add	esp, 4
	mov	DWORD PTR _lookup, edx

; 46   :     if (!lookup) return false;

	test	edx, edx
	je	SHORT $LN35@DemoSetup

; 47   : 
; 48   :     for (int c = 0; c < 32; c++) {

	push	ebx
	xor	ebx, ebx
	mov	esi, 256				; 00000100H
	npad	11
$LL6@DemoSetup:

; 49   :         u8 cold = 0;
; 50   :         u8 norm = 255;
; 51   :         u8 heat = (31-c)*8;
; 52   :         lookup[c +  0] = rgb(norm, norm, norm);

	mov	DWORD PTR [esi+edx-256], 16777215	; 00ffffffH
	mov	al, bl
	shl	al, 3
	mov	cl, 248					; 000000f8H
	sub	cl, al
	inc	ebx

; 53   :         lookup[c + 32] = rgb(norm, norm, heat);

	mov	eax, DWORD PTR _lookup
	movzx	edx, cl
	mov	ecx, edx
	or	ecx, 16776960				; 00ffff00H
	mov	DWORD PTR [esi+eax-128], ecx

; 54   :         lookup[c + 64] = rgb(norm, heat, cold);

	mov	ecx, edx
	mov	eax, DWORD PTR _lookup
	or	ecx, 65280				; 0000ff00H
	shl	ecx, 8

; 55   :         lookup[c + 96] = rgb(heat, cold, cold);

	shl	edx, 16					; 00000010H
	mov	DWORD PTR [esi+eax], ecx
	mov	eax, DWORD PTR _lookup
	mov	DWORD PTR [esi+eax+128], edx
	add	esi, 4
	cmp	esi, 384				; 00000180H
	jge	SHORT $LN34@DemoSetup

; 47   : 
; 48   :     for (int c = 0; c < 32; c++) {

	mov	edx, DWORD PTR _lookup
	jmp	SHORT $LL6@DemoSetup
$LN34@DemoSetup:

; 56   :     }
; 57   :     for (int c = 0; c < 128; c++) {

	xor	esi, esi
	mov	eax, 1020				; 000003fcH
	pop	ebx
	npad	10
$LL3@DemoSetup:

; 58   :         lookup[255-c] = lookup[c];

	mov	edx, DWORD PTR _lookup
	lea	esi, DWORD PTR [esi+4]
	mov	ecx, DWORD PTR [esi+edx-4]
	mov	DWORD PTR [eax+edx], ecx
	sub	eax, 4
	cmp	eax, 508				; 000001fcH
	jg	SHORT $LL3@DemoSetup

; 59   :     }
; 60   :     lookup[0] = rgb(0, 0, 0);

	mov	eax, DWORD PTR _lookup
	pop	esi
	mov	DWORD PTR [eax], 0

; 61   :     return true;

	mov	eax, 1

; 62   : }

	ret	0
_DemoSetup ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-211\source\applications\fire\fire.c
_TEXT	SEGMENT
_r$ = 8							; size = 1
_g$ = 12						; size = 1
_b$ = 16						; size = 1
_rgb	PROC

; 32   :     return (r<<16) | (g<<8) | (b);

	mov	eax, DWORD PTR _r$[esp-4]
	mov	ecx, DWORD PTR _g$[esp-4]
	movzx	eax, al
	shl	eax, 8
	movzx	ecx, cl
	or	eax, ecx
	mov	ecx, DWORD PTR _b$[esp-4]
	shl	eax, 8
	movzx	ecx, cl
	or	eax, ecx

; 33   : }

	ret	0
_rgb	ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-211\source\applications\fire\fire.c
_TEXT	SEGMENT
_res$ = 8						; size = 4
_seed$ = 8						; size = 4
_frand	PROC

; 25   :     float res;
; 26   :     seed[0] *= 0xFFE1;

	mov	eax, DWORD PTR _seed$[esp-4]
	imul	ecx, DWORD PTR [eax], 65505
	mov	DWORD PTR [eax], ecx

; 27   :     *((u32*)&res) = (((u32)seed[0]) >> 9) | 0x3F800000;

	shr	ecx, 9
	or	ecx, 1065353216				; 3f800000H
	mov	DWORD PTR _res$[esp-4], ecx

; 28   :     return (res - 1.0f);

	fld	DWORD PTR _res$[esp-4]
	fsub	DWORD PTR __real@3f800000

; 29   : }

	ret	0
_frand	ENDP
_TEXT	ENDS
END
