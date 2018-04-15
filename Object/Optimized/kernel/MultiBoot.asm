; Listing generated by Microsoft (R) Optimizing Compiler Version 18.00.40629.0 

	TITLE	C:\Users\cex123\Desktop\XXXXX\osdev\osdev-216\Source\Kernel\BootLoad\MultiBoot\MultiBoot.c
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB OLDNAMES

PUBLIC	??_C@_04DGHHAJMG@HEAP?$AA@			; `string'
;	COMDAT ??_C@_04DGHHAJMG@HEAP?$AA@
CONST	SEGMENT
??_C@_04DGHHAJMG@HEAP?$AA@ DB 'HEAP', 00H		; `string'
	ORG $+3
?lookup@?3??IMultiBoot_MemMap@@9@9 DB 02dH		; `IMultiBoot_MemMap'::`4'::lookup
	DB	06fH
	DB	058H
	DB	058H
	DB	02dH
	DB	02dH
PUBLIC	_IMultiBoot_Vesa
PUBLIC	_IMultiBoot_MemMap
PUBLIC	_MultiBoot
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-216\source\kernel\bootload\multiboot\multiboot.c
_TEXT	SEGMENT
_MultiBoot PROC
; _info$ = ecx

; 88   :     Monitor->EnableErrorRecovery();

	mov	eax, DWORD PTR _Monitor
	push	esi
	mov	esi, ecx
	call	DWORD PTR [eax]

; 89   :     if (!IMultiBoot_MemMap(info)) return false;

	mov	ecx, esi
	call	_IMultiBoot_MemMap
	test	eax, eax
	jne	SHORT $LN2@MultiBoot
	pop	esi

; 91   :   //Monitor->ClearMemory();
; 92   :     return true;
; 93   : }

	ret	0
$LN2@MultiBoot:

; 90   :     if (!IMultiBoot_Vesa(info)) return false;

	mov	ecx, esi
	call	_IMultiBoot_Vesa
	neg	eax
	pop	esi
	sbb	eax, eax
	neg	eax

; 91   :   //Monitor->ClearMemory();
; 92   :     return true;
; 93   : }

	ret	0
_MultiBoot ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-216\source\kernel\bootload\multiboot\multiboot.c
_TEXT	SEGMENT
_buf$1$ = -20						; size = 4
_end$1$ = -16						; size = 4
_mem$1$ = -12						; size = 4
_end$1 = -12						; size = 8
_buf$2 = -12						; size = 8
_pos$1$ = -4						; size = 4
_IMultiBoot_MemMap PROC
; _grub$ = ecx

; 12   : bool IMultiBoot_MemMap(MB_INFO *grub) {

	sub	esp, 20					; 00000014H
	push	ebp
	mov	ebp, ecx

; 13   :     if (!(grub->Flags & MBI_MEM_MAP)) return false;

	test	BYTE PTR [ebp], 64			; 00000040H
	jne	SHORT $LN4@IMultiBoot
	xor	eax, eax
	jmp	$LN5@IMultiBoot
$LN4@IMultiBoot:

; 14   : 
; 15   :     CPool *Heap = (CPool*)MMAP_HEAPPOOL;
; 16   :     Pool->CreateMeta(Heap, 1*MB, 4*KB, 0, 0, "HEAP");

	mov	eax, DWORD PTR _Pool
	push	esi
	push	OFFSET ??_C@_04DGHHAJMG@HEAP?$AA@
	xor	esi, esi
	push	esi
	push	esi
	push	4096					; 00001000H
	push	1048576					; 00100000H
	push	1536					; 00000600H
	call	DWORD PTR [eax]

; 17   :     Heap->Node = Monitor->GetBase('HEAP');

	mov	eax, DWORD PTR _Monitor
	push	1212498256				; 48454150H
	call	DWORD PTR [eax+24]
	add	esp, 28					; 0000001cH
	mov	DWORD PTR ds:1544, eax

; 18   :     if (!Heap->Node) return false;

	test	eax, eax
	je	$LN19@IMultiBoot
$LN3@IMultiBoot:

; 19   : 
; 20   :     // memory is non existent unless discovered
; 21   :     Heap->Count = 0;
; 22   :     stosd(Heap->Node, '----', 1*MB/4);

	push	262144					; 00040000H
	push	757935405				; 2d2d2d2dH
	push	eax
	mov	DWORD PTR ds:1556, esi
	call	_stosd
	add	esp, 12					; 0000000cH

; 23   :     for (u32 pos = 0; pos  < grub->MmapLength;) {

	mov	ecx, esi
	cmp	DWORD PTR [ebp+44], esi
	jbe	$LN1@IMultiBoot

; 35   :         u32 len = (((u32)(end - buf) + Heap->Gran-1) & ~(Heap->Gran-1)) / Heap->Gran;

	push	ebx
	push	edi
	mov	edi, 1552				; 00000610H
$LL2@IMultiBoot:

; 24   :         // parse the E820 memory map entry
; 25   :         u8 *memmap = (u8*)grub->MmapAddr;
; 26   :         E820 *e820 = (E820*)&memmap[pos];

	mov	ebx, DWORD PTR [ebp+48]
	add	ebx, ecx

; 27   :         pos += e820->Next + sizeof(u32);

	add	ecx, 4
	add	ecx, DWORD PTR [ebx]

; 28   : 
; 29   :         // boundary checks 4 GB - 1 is maximum 32-bit addressable byte
; 30   :         u64 buf = MIN((u64)4*GB-1, e820->Base);

	mov	edx, DWORD PTR [ebx+8]
	mov	DWORD PTR _pos$1$[esp+36], ecx
	cmp	edx, esi
	jb	SHORT $LN7@IMultiBoot
	ja	SHORT $LN17@IMultiBoot
	cmp	DWORD PTR [ebx+4], -1
	jbe	SHORT $LN7@IMultiBoot
$LN17@IMultiBoot:
	or	DWORD PTR _buf$1$[esp+36], -1
	mov	DWORD PTR _buf$2[esp+40], esi
	jmp	SHORT $LN8@IMultiBoot
$LN7@IMultiBoot:
	mov	eax, DWORD PTR [ebx+4]
	mov	DWORD PTR _buf$1$[esp+36], eax
	mov	DWORD PTR _buf$2[esp+40], edx
$LN8@IMultiBoot:

; 31   :         u64 end = MIN((u64)4*GB-1, e820->Base + e820->Size);

	mov	eax, DWORD PTR [ebx+12]
	add	eax, DWORD PTR [ebx+4]
	mov	ecx, DWORD PTR [ebx+16]
	adc	ecx, edx
	mov	DWORD PTR _end$1$[esp+36], eax
	cmp	ecx, esi
	jb	SHORT $LN9@IMultiBoot
	ja	SHORT $LN18@IMultiBoot
	cmp	eax, -1
	jbe	SHORT $LN9@IMultiBoot
$LN18@IMultiBoot:
	or	DWORD PTR _end$1$[esp+36], -1
	mov	DWORD PTR _end$1[esp+40], esi
	jmp	SHORT $LN10@IMultiBoot
$LN9@IMultiBoot:
	mov	DWORD PTR _end$1[esp+40], ecx
$LN10@IMultiBoot:

; 32   : 
; 33   :         // convert address to heap entry (each entry maps 4 KB)
; 34   :         u32 mem = (((u32)buf + Heap->Gran-1) & ~(Heap->Gran-1)) / Heap->Gran;

	mov	edi, DWORD PTR [edi]
	xor	edx, edx
	mov	eax, DWORD PTR _buf$1$[esp+36]

; 35   :         u32 len = (((u32)(end - buf) + Heap->Gran-1) & ~(Heap->Gran-1)) / Heap->Gran;

	mov	ecx, edi
	dec	eax
	sub	ecx, DWORD PTR _buf$1$[esp+36]
	add	eax, edi
	lea	esi, DWORD PTR [edi-1]
	not	esi
	and	eax, esi
	div	edi
	xor	edx, edx
	mov	DWORD PTR _mem$1$[esp+36], eax
	mov	eax, DWORD PTR _end$1$[esp+36]
	dec	eax
	add	eax, ecx
	and	eax, esi
	div	edi

; 36   : 
; 37   :         // mark pages as necessary
; 38   :         static u8 lookup[] = { '-', 'o', 'X', 'X', '-', '-' };
; 39   :         u8 flag = MIN(e820->Type, elementsof(lookup)-1);

	cmp	DWORD PTR [ebx+20], 5
	mov	esi, eax
	jae	SHORT $LN11@IMultiBoot
	mov	cl, BYTE PTR [ebx+20]
	jmp	SHORT $LN12@IMultiBoot
$LN11@IMultiBoot:
	mov	cl, 5
$LN12@IMultiBoot:

; 40   :         stosb(&Heap->Node[mem], lookup[flag], len);

	movzx	eax, cl
	push	esi
	movzx	eax, BYTE PTR ?lookup@?3??IMultiBoot_MemMap@@9@9[eax]
	push	eax
	mov	eax, 1544				; 00000608H
	mov	eax, DWORD PTR [eax]
	add	eax, DWORD PTR _mem$1$[esp+44]
	push	eax
	call	_stosb
	mov	ecx, DWORD PTR _pos$1$[esp+48]
	add	esp, 12					; 0000000cH

; 41   :         Heap->Count += len;

	mov	edi, 1556				; 00000614H
	push	0
	add	DWORD PTR [edi], esi
	mov	edi, 1552				; 00000610H
	pop	esi
	cmp	ecx, DWORD PTR [ebp+44]
	jb	$LL2@IMultiBoot
	pop	edi
	pop	ebx
$LN1@IMultiBoot:

; 42   :     }
; 43   : 
; 44   :     // reserve kernel and shell memory
; 45   :     Heap->Next = (u32)MMAP_USER / Heap->Gran;

	xor	edx, edx
	mov	eax, 33554432				; 02000000H
	div	DWORD PTR ds:1552
	mov	DWORD PTR ds:1560, eax

; 46   :     stosd(Heap->Node, 'XXXX', Heap->Next/4);

	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	push	eax
	push	1482184792				; 58585858H
	push	DWORD PTR ds:1544
	call	_stosd

; 47   :     Monitor->Protect('IVT ');

	mov	eax, DWORD PTR _Monitor
	push	1230394400				; 49565420H
	call	DWORD PTR [eax+20]

; 48   :     return true;

	xor	eax, eax
	add	esp, 16					; 00000010H
	inc	eax
$LN19@IMultiBoot:
	pop	esi
$LN5@IMultiBoot:
	pop	ebp

; 49   : }

	add	esp, 20					; 00000014H
	ret	0
_IMultiBoot_MemMap ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-216\source\kernel\bootload\multiboot\multiboot.c
_TEXT	SEGMENT
_IMultiBoot_Vesa PROC
; _grub$ = ecx

; 51   : bool IMultiBoot_Vesa(MB_INFO *grub) {

	push	esi
	mov	esi, ecx

; 52   :     if (!(grub->Flags & MBI_VBE_INFO)) return false;

	test	DWORD PTR [esi], 2048			; 00000800H
	jne	SHORT $LN34@IMultiBoot
	xor	eax, eax
	pop	esi

; 85   : }

	ret	0
$LN34@IMultiBoot:
	push	ebx

; 53   : 
; 54   :     MODE_INFO *mod = (MODE_INFO*)grub->ModeInfo;

	mov	ebx, DWORD PTR [esi+76]

; 55   :     if (!mod) return false;

	test	ebx, ebx
	jne	SHORT $LN33@IMultiBoot
	xor	eax, eax
	jmp	$LN37@IMultiBoot
$LN33@IMultiBoot:
	push	ebp

; 56   :     
; 57   :     VESA_INFO *vbe = (VESA_INFO*)grub->VesaInfo;

	mov	ebp, DWORD PTR [esi+72]

; 58   :     if (!vbe) return false;

	test	ebp, ebp
	jne	SHORT $LN32@IMultiBoot
	xor	eax, eax
	jmp	$LN38@IMultiBoot
$LN32@IMultiBoot:

; 59   : 
; 60   :     char *base = Monitor->GetBase('VESA');

	mov	eax, DWORD PTR _Monitor
	push	edi
	push	1447383873				; 56455341H
	call	DWORD PTR [eax+24]
	mov	edi, eax
	pop	ecx

; 61   :     if (!base) return false;

	test	edi, edi
	je	SHORT $LN39@IMultiBoot
$LN31@IMultiBoot:

; 62   :     stosd(base, 'xxxx', 4*KB/4);

	push	1024					; 00000400H
	push	2021161080				; 78787878H
	push	edi
	call	_stosd

; 63   :     movsd(base, vbe, sizeof(VESA_INFO)/4);

	push	128					; 00000080H
	push	ebp
	push	edi
	call	_movsd

; 64   :     movsd(&base[sizeof(VESA_INFO)], mod, sizeof(MODE_INFO)/4);

	push	64					; 00000040H
	lea	eax, DWORD PTR [edi+512]
	push	ebx
	push	eax
	call	_movsd

; 65   : 
; 66   :     CVesa *vesa = (CVesa*)&base[sizeof(VESA_INFO)+sizeof(MODE_INFO)];
; 67   :     vesa->Mode     = grub->VbeMode;

	mov	ax, WORD PTR [esi+80]
	mov	WORD PTR [edi+768], ax

; 68   :     vesa->ResX     = mod->ResX;

	mov	ax, WORD PTR [ebx+18]
	mov	WORD PTR [edi+770], ax

; 69   :     vesa->ResY     = mod->ResY;

	mov	ax, WORD PTR [ebx+20]
	mov	WORD PTR [edi+772], ax

; 70   :     vesa->Bits     = mod->Bits;

	movzx	eax, BYTE PTR [ebx+25]
	mov	WORD PTR [edi+774], ax

; 71   :     vesa->ScanLine = mod->BytesPerScanline;

	mov	ax, WORD PTR [ebx+16]
	mov	WORD PTR [edi+776], ax

; 72   :     vesa->Pixels   = mod->PhysBasePtr;

	mov	eax, DWORD PTR [ebx+40]
	mov	DWORD PTR [edi+780], eax

; 73   :     Logger(" Vesa.ResX     = %X\n", vesa->ResX);
; 74   :     Logger(" Vesa.ResY     = %X\n", vesa->ResY);
; 75   :     Logger(" Vesa.Bits     = %X\n", vesa->Bits);
; 76   :     Logger(" Vesa.ScanLine = %X\n", vesa->ScanLine);
; 77   :     Logger(" Vesa.Pixels   = %X\n", vesa->Pixels);
; 78   :     Monitor->Protect('VESA');

	mov	eax, DWORD PTR _Monitor
	push	1447383873				; 56455341H
	call	DWORD PTR [eax+20]

; 79   :     Logger(" Vesa.ResX     = %X\n", vesa->ResX);
; 80   :     Logger(" Vesa.ResY     = %X\n", vesa->ResY);
; 81   :     Logger(" Vesa.Bits     = %X\n", vesa->Bits);
; 82   :     Logger(" Vesa.ScanLine = %X\n", vesa->ScanLine);
; 83   :     Logger(" Vesa.Pixels   = %X\n", vesa->Pixels);
; 84   :     return true;

	xor	eax, eax
	add	esp, 40					; 00000028H
	inc	eax
$LN39@IMultiBoot:
	pop	edi
$LN38@IMultiBoot:
	pop	ebp
$LN37@IMultiBoot:
	pop	ebx
	pop	esi

; 85   : }

	ret	0
_IMultiBoot_Vesa ENDP
_TEXT	ENDS
END
