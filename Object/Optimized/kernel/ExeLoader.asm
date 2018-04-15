; Listing generated by Microsoft (R) Optimizing Compiler Version 18.00.40629.0 

	TITLE	C:\Users\cex123\Desktop\XXXXX\osdev\osdev-216\Source\Kernel\Thread\Loader\ExeLoader.c
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB OLDNAMES

PUBLIC	??_C@_07OHILBPAE@System?1?$AA@			; `string'
PUBLIC	??_C@_05FMHPCJKC@Apps?1?$AA@			; `string'
PUBLIC	??_C@_04HHOCAGGL@?9rwx?$AA@			; `string'
PUBLIC	_Loader
EXTRN	__imp__StrCpy:PROC
EXTRN	__imp__StrCat:PROC
;	COMDAT ??_C@_04HHOCAGGL@?9rwx?$AA@
CONST	SEGMENT
??_C@_04HHOCAGGL@?9rwx?$AA@ DB '-rwx', 00H		; `string'
CONST	ENDS
;	COMDAT ??_C@_05FMHPCJKC@Apps?1?$AA@
CONST	SEGMENT
??_C@_05FMHPCJKC@Apps?1?$AA@ DB 'Apps/', 00H		; `string'
CONST	ENDS
;	COMDAT ??_C@_07OHILBPAE@System?1?$AA@
CONST	SEGMENT
??_C@_07OHILBPAE@System?1?$AA@ DB 'System/', 00H	; `string'
	ORG $+2
?dir@?1??ILoader_OpenLib@@9@9 DD FLAT:??_C@_07OHILBPAE@System?1?$AA@ ; `ILoader_OpenLib'::`2'::dir
	DD	FLAT:??_C@_05FMHPCJKC@Apps?1?$AA@
_loader	DD	FLAT:_ILoader_Reloc
	DD	FLAT:_ILoader_Link
	DD	FLAT:_ILoader_GetEntry
	DD	FLAT:_ILoader_CalcFootPrint
_Loader	DD	FLAT:_loader
PUBLIC	_ILoader_CalcFootPrint
PUBLIC	_ILoader_Link
PUBLIC	_ILoader_Reloc
?path@?1??ILoader_OpenLib@@9@9 DB 0400H DUP (?)		; `ILoader_OpenLib'::`2'::path
_BSS	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-216\source\kernel\thread\loader\exeloader.c
_TEXT	SEGMENT
_reloc$1$ = -16						; size = 4
_list$1$ = -12						; size = 4
tv263 = -8						; size = 4
_page$1$ = -8						; size = 4
tv255 = -4						; size = 4
_path$ = 8						; size = 4
_length$1$ = 12						; size = 4
_base$ = 12						; size = 4
_size$ = 16						; size = 4
_ILoader_Reloc PROC

; 13   : bool ILoader_Reloc(char *path, char *base, int size) {

	sub	esp, 16					; 00000010H

; 14   :     char *binary = &RAM[(int)base];
; 15   :     MZHDR *mzhdr = (MZHDR*)binary;
; 16   :     PEHDR *pehdr = (PEHDR*)&binary[mzhdr->e_lfanew];
; 17   :     OPHDR *ophdr = (OPHDR*)&binary[mzhdr->e_lfanew + sizeof(PEHDR)];

	mov	ecx, DWORD PTR _base$[esp+12]
	push	ebx
	push	ebp
	mov	ebx, DWORD PTR [ecx+60]
	mov	DWORD PTR tv255[esp+24], ebx

; 18   : 
; 19   :     PEDIR *dir = (PEDIR*)&binary[mzhdr->e_lfanew + sizeof(PEHDR) + sizeof(OPHDR)];
; 20   :     PERELOC *reloc = (PERELOC*)&binary[dir->RelocAddress];

	mov	edx, DWORD PTR [ebx+ecx+160]

; 21   :     int length = dir->RelocSize;

	mov	ebp, DWORD PTR [ebx+ecx+164]
	add	edx, ecx
	mov	DWORD PTR _reloc$1$[esp+24], edx
	mov	DWORD PTR _length$1$[esp+20], ebp

; 22   :     if (length <= 0) return true;

	test	ebp, ebp
	jle	SHORT $LN18@ILoader_Re

; 23   : 
; 24   :     int target = (int)base;
; 25   :     int source = ophdr->ImageBase;
; 26   :     if (target == source) return true;

	cmp	ecx, DWORD PTR [ebx+ecx+52]
	je	SHORT $LN18@ILoader_Re

; 27   :     int delta = target - source;

	mov	eax, ecx
	sub	eax, DWORD PTR [ebx+ecx+52]
	push	esi
	mov	ebx, eax
	push	edi
$LL5@ILoader_Re:

; 28   : 
; 29   :     while (length > 0) {
; 30   :         char *start = (char*)reloc;
; 31   :         int   count = (reloc->BlockSize-sizeof(PERELOC))/sizeof(u16);

	mov	edi, DWORD PTR [edx+4]

; 32   :         int   page = reloc->Address;

	mov	eax, DWORD PTR [edx]
	sub	edi, 8
	shr	edi, 1
	mov	DWORD PTR _page$1$[esp+32], eax

; 33   :         u16 *list = (u16*)&start[sizeof(PERELOC)];

	lea	eax, DWORD PTR [edx+8]
	mov	DWORD PTR _list$1$[esp+32], eax

; 34   :         while (count) {

	je	SHORT $LN2@ILoader_Re
	mov	edx, DWORD PTR _page$1$[esp+32]
	mov	ebp, eax
$LL3@ILoader_Re:

; 35   :             int *fixup;
; 36   :             count--;
; 37   :             u16 type = (list[0] & 0xF000) >> 12;

	movzx	esi, WORD PTR [ebp]
	dec	edi

; 38   :             u16 offset = list[0] & 0x0FFF;
; 39   :             u32 rva = page + offset;
; 40   :             if (type == 3) {

	mov	eax, esi
	mov	DWORD PTR tv263[esp+32], 12288		; 00003000H
	and	eax, 61440				; 0000f000H
	cmp	ax, WORD PTR tv263[esp+32]
	jne	SHORT $LN1@ILoader_Re

; 41   :                 fixup = (int*)&binary[rva];

	and	esi, 4095				; 00000fffH
	add	esi, edx

; 42   :                 *fixup += delta;

	add	DWORD PTR [esi+ecx], ebx
$LN1@ILoader_Re:

; 43   :             }
; 44   :             list++;

	add	ebp, 2
	test	edi, edi
	jne	SHORT $LL3@ILoader_Re
	mov	edx, DWORD PTR _reloc$1$[esp+32]
	mov	ebp, DWORD PTR _length$1$[esp+28]
$LN2@ILoader_Re:

; 45   :         }
; 46   :         length -= reloc->BlockSize;

	sub	ebp, DWORD PTR [edx+4]

; 47   :         reloc = (PERELOC*)&start[reloc->BlockSize];

	add	edx, DWORD PTR [edx+4]
	mov	DWORD PTR _length$1$[esp+28], ebp
	mov	DWORD PTR _reloc$1$[esp+32], edx
	test	ebp, ebp
	jg	SHORT $LL5@ILoader_Re

; 48   :     }
; 49   : 
; 50   :     ophdr->ImageBase = target;

	mov	ebx, DWORD PTR tv255[esp+32]
	pop	edi
	pop	esi
	mov	DWORD PTR [ebx+ecx+52], ecx
$LN18@ILoader_Re:

; 51   :     #ifdef AUTHOR_RAMDISK
; 52   :     if (StrCmp(path, boot) == 0) {
; 53   :         FileIO.Disk->Entry = ophdr->ImageBase + ophdr->Entry;
; 54   :     }
; 55   :     #endif
; 56   :     return true;

	xor	eax, eax
	pop	ebp
	inc	eax
	pop	ebx

; 57   : }

	add	esp, 16					; 00000010H
	ret	0
_ILoader_Reloc ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-216\source\kernel\thread\loader\exeloader.c
_TEXT	SEGMENT
_names$1$ = -8						; size = 4
_name$1$ = -4						; size = 4
_ILoader_GetProc PROC
; _base$ = ecx
; _name$ = edx

; 59   : static int ILoader_GetProc(char *base, char *name) {

	push	ecx
	push	ecx
	push	ebx
	mov	ebx, ecx
	mov	DWORD PTR _name$1$[esp+12], edx
	push	ebp
	push	esi
	push	edi

; 60   : 	int ptr = ((MZHDR*)base)->e_lfanew + sizeof(PEHDR) + sizeof(OPHDR);
; 61   : 	PEDIR *dir = (PEDIR*)&base[ptr];
; 62   : 	PEEXPORT *exports = (PEEXPORT*)&base[dir->ExportAddress];

	mov	eax, DWORD PTR [ebx+60]

; 63   : 	int *names = (int*)&base[exports->PtrNames];
; 64   : 	int *procs = (int*)&base[exports->PtrFunctions];
; 65   : 	for (u32 count = 0; count < exports->NumFunctions; count++) {

	xor	esi, esi
	mov	edi, DWORD PTR [eax+ebx+120]
	add	edi, ebx
	mov	eax, DWORD PTR [edi+32]
	mov	ebp, DWORD PTR [edi+28]
	add	eax, ebx
	add	ebp, ebx
	mov	DWORD PTR _names$1$[esp+24], eax
	cmp	DWORD PTR [edi+20], esi
	jbe	SHORT $LN2@ILoader_Ge
$LL4@ILoader_Ge:

; 66   :         char *find = name;
; 67   :         char *ascii = &base[names[count]];

	mov	eax, DWORD PTR [eax+esi*4]
	add	eax, ebx

; 68   :         if (StrCmp(find, ascii) == 0) return procs[count];

	push	eax
	push	edx
	call	DWORD PTR __imp__StrCmp
	pop	ecx
	pop	ecx
	test	eax, eax
	je	SHORT $LN8@ILoader_Ge

; 63   : 	int *names = (int*)&base[exports->PtrNames];
; 64   : 	int *procs = (int*)&base[exports->PtrFunctions];
; 65   : 	for (u32 count = 0; count < exports->NumFunctions; count++) {

	mov	eax, DWORD PTR _names$1$[esp+24]
	inc	esi
	mov	edx, DWORD PTR _name$1$[esp+24]
	cmp	esi, DWORD PTR [edi+20]
	jb	SHORT $LL4@ILoader_Ge
$LN2@ILoader_Ge:

; 69   : 	}
; 70   :     return 0;

	xor	eax, eax
$LN5@ILoader_Ge:
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx

; 71   : }

	pop	ecx
	pop	ecx
	ret	0
$LN8@ILoader_Ge:

; 68   :         if (StrCmp(find, ascii) == 0) return procs[count];

	mov	eax, DWORD PTR [ebp+esi*4]
	jmp	SHORT $LN5@ILoader_Ge
_ILoader_GetProc ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-216\source\kernel\thread\loader\exeloader.c
_TEXT	SEGMENT
_ILoader_OpenLib PROC
; _libname$ = ecx
; _mode$dead$ = edx

; 73   : static CFile *ILoader_OpenLib(char *libname, char *mode) {

	push	ebx
	push	esi
	push	edi
	mov	edi, ecx

; 74   :     static char path[1024];
; 75   :     static char *dir[] = { // TODO REPLACE WITH ENVIRONMENT VARIABLES
; 76   :         "System/",
; 77   :         "Apps/"
; 78   :     };
; 79   :     for (int i = 0; i < elementsof(dir); i++) {

	xor	esi, esi
	mov	ebx, OFFSET ?path@?1??ILoader_OpenLib@@9@9
$LL4@ILoader_Op:

; 80   :         StrCpy(path, dir[i]);

	push	DWORD PTR ?dir@?1??ILoader_OpenLib@@9@9[esi]
	push	ebx
	call	DWORD PTR __imp__StrCpy

; 81   :         StrCat(path, libname);

	push	edi
	push	ebx
	call	DWORD PTR __imp__StrCat

; 82   :         CFile *file = FileIO->Open(path, mode);

	mov	eax, DWORD PTR _FileIO
	push	OFFSET ??_C@_04HHOCAGGL@?9rwx?$AA@
	push	ebx
	call	DWORD PTR [eax+12]
	add	esp, 24					; 00000018H

; 83   :         if (file) return file;

	test	eax, eax
	jne	SHORT $LN5@ILoader_Op

; 74   :     static char path[1024];
; 75   :     static char *dir[] = { // TODO REPLACE WITH ENVIRONMENT VARIABLES
; 76   :         "System/",
; 77   :         "Apps/"
; 78   :     };
; 79   :     for (int i = 0; i < elementsof(dir); i++) {

	add	esi, 4
	cmp	esi, 8
	jb	SHORT $LL4@ILoader_Op
$LN5@ILoader_Op:
	pop	edi
	pop	esi
	pop	ebx

; 84   :     }
; 85   :     return 0;
; 86   : }

	ret	0
_ILoader_OpenLib ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-216\source\kernel\thread\loader\exeloader.c
_TEXT	SEGMENT
_path$ = 8						; size = 4
_base$ = 12						; size = 4
_size$ = 16						; size = 4
_ILoader_Link PROC

; 88   : bool ILoader_Link(char *path, char *base, int size) {

	push	ebx

; 89   :     char *binary = &RAM[(int)base];
; 90   :     MZHDR *mzhdr = (MZHDR*)binary;
; 91   :     PEHDR *pehdr = (PEHDR*)&binary[mzhdr->e_lfanew];
; 92   :     OPHDR *ophdr = (OPHDR*)&binary[mzhdr->e_lfanew + sizeof(PEHDR)];
; 93   : 
; 94   :     PEDIR *dir = (PEDIR*)&binary[mzhdr->e_lfanew + sizeof(PEHDR) + sizeof(OPHDR)];

	mov	ebx, DWORD PTR _base$[esp]
	push	ebp
	push	esi
	push	edi
	mov	eax, DWORD PTR [ebx+60]

; 95   :     if (dir->ImportTableSize == 0 || dir->ImportTableSize == 0) return true;

	cmp	DWORD PTR [eax+ebx+220], 0
	je	SHORT $LN7@ILoader_Li

; 96   : 
; 97   :     PEIMPORT *imports = (PEIMPORT*)&binary[dir->ImportAddress];

	mov	edi, DWORD PTR [eax+ebx+128]
	add	edi, 12					; 0000000cH

; 98   :     while (imports->Name) {

	add	edi, ebx
	jmp	SHORT $LN22@ILoader_Li
$LL6@ILoader_Li:

; 99   :         char *library = &binary[imports->Name];

	mov	ecx, DWORD PTR [edi]
	add	ecx, ebx

; 100  : 
; 101  :         static char target[1024];
; 102  :         CFile *file = ILoader_OpenLib(library, "-rwx");

	call	_ILoader_OpenLib

; 103  :         if (!file) return false;

	test	eax, eax
	je	SHORT $LN14@ILoader_Li

; 104  : 
; 105  :         int dll_base = (int)file->Node->FileData;

	mov	ecx, DWORD PTR [eax+12]

; 106  :         char *dll = &RAM[dll_base];
; 107  :         file->Close(file);

	push	eax
	mov	ebp, DWORD PTR [ecx+4]
	call	DWORD PTR [eax+20]

; 108  : 
; 109  :         int *thunk = (int*)&binary[imports->FirstThunk];

	mov	esi, DWORD PTR [edi+4]
	pop	ecx
	add	esi, ebx
	jmp	SHORT $LN23@ILoader_Li
$LL3@ILoader_Li:

; 111  :             PEIMPORTNAME *imp = (PEIMPORTNAME*)&binary[*thunk];

	mov	edx, DWORD PTR [esi]

; 112  :             int proc = ILoader_GetProc(dll, imp->Name);

	mov	ecx, ebp
	add	edx, 2
	add	edx, ebx
	call	_ILoader_GetProc

; 113  :             if (!proc) return false;

	test	eax, eax
	je	SHORT $LN14@ILoader_Li

; 114  :             *thunk++ = dll_base + proc;

	add	eax, ebp
	mov	DWORD PTR [esi], eax
	add	esi, 4
$LN23@ILoader_Li:

; 110  :         while (*thunk) {

	cmp	DWORD PTR [esi], 0
	jne	SHORT $LL3@ILoader_Li

; 115  :         }
; 116  :         imports++;

	add	edi, 20					; 00000014H
$LN22@ILoader_Li:

; 98   :     while (imports->Name) {

	cmp	DWORD PTR [edi], 0
	jne	SHORT $LL6@ILoader_Li
$LN7@ILoader_Li:

; 95   :     if (dir->ImportTableSize == 0 || dir->ImportTableSize == 0) return true;

	xor	eax, eax
	inc	eax
$LN9@ILoader_Li:

; 117  :     }
; 118  :     return true;
; 119  : }

	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	ret	0
$LN14@ILoader_Li:

; 103  :         if (!file) return false;

	xor	eax, eax
	jmp	SHORT $LN9@ILoader_Li
_ILoader_Link ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-216\source\kernel\thread\loader\exeloader.c
_TEXT	SEGMENT
_image$ = 8						; size = 4
_pcb$ = 12						; size = 4
_overhead$ = 16						; size = 4
_alignment$ = 20					; size = 4
_ILoader_CalcFootPrint PROC

; 122  :     MZHDR *mz = (MZHDR*)image;
; 123  :     OPHDR *op = (OPHDR*)&image[mz->e_lfanew + sizeof(PEHDR)];

	mov	edx, DWORD PTR _image$[esp-4]
	push	esi

; 124  : 
; 125  :     int extent = op->SizeHeapCommit + op->SizeStackCommit + op->ImageSize + overhead;
; 126  :     extent = (extent + alignment-1) & ~(alignment-1);
; 127  :     if (!pcb->Extent) pcb->Extent = extent;

	mov	esi, DWORD PTR _pcb$[esp]
	push	edi
	mov	edi, DWORD PTR [edx+60]
	cmp	DWORD PTR [esi+44], 0
	jne	SHORT $LN1@ILoader_Ca
	mov	ecx, DWORD PTR [edi+edx+108]
	mov	eax, DWORD PTR _alignment$[esp+4]
	dec	ecx
	add	ecx, DWORD PTR [edi+edx+100]
	add	ecx, DWORD PTR [edi+edx+80]
	add	ecx, DWORD PTR _overhead$[esp+4]
	add	ecx, eax
	dec	eax
	not	eax
	and	ecx, eax
	mov	DWORD PTR [esi+44], ecx
$LN1@ILoader_Ca:

; 128  :     pcb->Heap    = (op->ImageSize + 4*KB-1) & ~(4*KB-1);

	mov	eax, DWORD PTR [edi+edx+80]

; 129  :     pcb->Stack   = pcb->Extent - pcb->Stack;

	mov	edx, DWORD PTR [esi+44]
	add	eax, 4095				; 00000fffH
	and	eax, -4096				; fffff000H

; 130  :     pcb->Peb     = (CPeb*)(pcb->Extent - (int)pcb->Peb);
; 131  :     pcb->Pipes   = pcb->Extent - pcb->Pipes;
; 132  :     pcb->Events  = pcb->Extent - pcb->Events;
; 133  :     pcb->Windows = pcb->Extent - pcb->Windows;

	mov	ecx, edx
	sub	ecx, DWORD PTR [esi+36]
	mov	DWORD PTR [esi+12], eax
	mov	eax, edx
	sub	eax, DWORD PTR [esi+16]
	mov	DWORD PTR [esi+16], eax
	mov	eax, edx
	sub	eax, DWORD PTR [esi+20]
	mov	DWORD PTR [esi+20], eax
	mov	eax, edx
	sub	eax, DWORD PTR [esi+28]
	mov	DWORD PTR [esi+36], ecx

; 134  :     pcb->Screen  = pcb->Extent - pcb->Screen;

	mov	ecx, edx
	sub	ecx, DWORD PTR [esi+40]
	mov	DWORD PTR [esi+28], eax
	mov	eax, edx
	sub	eax, DWORD PTR [esi+32]
	mov	DWORD PTR [esi+40], ecx

; 135  :     pcb->MemMap  = pcb->Extent - pcb->MemMap;

	mov	ecx, edx
	sub	ecx, DWORD PTR [esi+24]
	mov	DWORD PTR [esi+32], eax

; 136  :     return pcb->Extent;

	mov	eax, edx
	pop	edi
	mov	DWORD PTR [esi+24], ecx
	pop	esi

; 137  : }

	ret	0
_ILoader_CalcFootPrint ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-216\source\kernel\thread\loader\exeloader.c
_TEXT	SEGMENT
_path$ = 8						; size = 4
_ILoader_GetEntry PROC

; 140  :     CFile *file = FileIO->Open(path, "-rwx");

	mov	eax, DWORD PTR _FileIO
	push	edi
	push	OFFSET ??_C@_04HHOCAGGL@?9rwx?$AA@
	push	DWORD PTR _path$[esp+4]
	call	DWORD PTR [eax+12]
	mov	edi, eax
	pop	ecx
	pop	ecx

; 141  :     if (!file) return 0;

	test	edi, edi
	jne	SHORT $LN1@ILoader_Ge
	pop	edi

; 150  : }

	ret	0
$LN1@ILoader_Ge:

; 142  : 
; 143  :     char *image = FileIO->Base(file);

	mov	eax, DWORD PTR _FileIO
	push	esi
	push	edi
	call	DWORD PTR [eax+36]

; 144  :     int size = FileIO->Size(file);

	mov	ecx, DWORD PTR _FileIO
	mov	esi, eax
	push	edi
	call	DWORD PTR [ecx+28]

; 145  :     FileIO->Close(file);

	mov	ecx, DWORD PTR _FileIO
	push	edi
	call	DWORD PTR [ecx+16]

; 146  : 
; 147  :     MZHDR *mz = (MZHDR*)image;
; 148  :     OPHDR *op = (OPHDR*)&image[mz->e_lfanew + sizeof(PEHDR)];
; 149  :     return (void*)&image[op->Entry];

	mov	ecx, DWORD PTR [esi+60]
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR [ecx+esi+40]
	add	eax, esi
	pop	esi
	pop	edi

; 150  : }

	ret	0
_ILoader_GetEntry ENDP
_TEXT	ENDS
END
