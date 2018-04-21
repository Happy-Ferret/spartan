; Listing generated by Microsoft (R) Optimizing Compiler Version 18.00.40629.0 

	TITLE	C:\Users\cex123\Desktop\FYP\develop\spartan\Source\Kernel\Memory\Heap\Pool.c
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB OLDNAMES

PUBLIC	_Pool
PUBLIC	??_C@_0BC@DJNCIINJ@pool?5?5?5?5?5?5?5?5?$DN?5?$CFX?6?$AA@ ; `string'
PUBLIC	??_C@_0BC@NLPJAHIB@pool?9?$DOGran?5?5?$DN?5?$CFX?6?$AA@ ; `string'
PUBLIC	??_C@_0BC@ECLEGJJM@pool?9?$DOCount?5?$DN?5?$CFX?6?$AA@ ; `string'
PUBLIC	??_C@_0BC@CDMIIOJF@pool?9?$DONext?5?5?$DN?5?$CFX?6?$AA@ ; `string'
PUBLIC	??_C@_0BC@EHEOOBEF@pool?9?$DONode?5?5?$DN?5?$CFX?6?$AA@ ; `string'
PUBLIC	??_C@_0BC@IFENPCMG@pool?9?$DOData?5?5?$DN?5?$CFX?6?$AA@ ; `string'
PUBLIC	??_C@_01EEMJAFIK@?6?$AA@			; `string'
;	COMDAT ??_C@_01EEMJAFIK@?6?$AA@
CONST	SEGMENT
??_C@_01EEMJAFIK@?6?$AA@ DB 0aH, 00H			; `string'
CONST	ENDS
;	COMDAT ??_C@_0BC@IFENPCMG@pool?9?$DOData?5?5?$DN?5?$CFX?6?$AA@
CONST	SEGMENT
??_C@_0BC@IFENPCMG@pool?9?$DOData?5?5?$DN?5?$CFX?6?$AA@ DB 'pool->Data  ='
	DB	' %X', 0aH, 00H				; `string'
CONST	ENDS
;	COMDAT ??_C@_0BC@EHEOOBEF@pool?9?$DONode?5?5?$DN?5?$CFX?6?$AA@
CONST	SEGMENT
??_C@_0BC@EHEOOBEF@pool?9?$DONode?5?5?$DN?5?$CFX?6?$AA@ DB 'pool->Node  ='
	DB	' %X', 0aH, 00H				; `string'
CONST	ENDS
;	COMDAT ??_C@_0BC@CDMIIOJF@pool?9?$DONext?5?5?$DN?5?$CFX?6?$AA@
CONST	SEGMENT
??_C@_0BC@CDMIIOJF@pool?9?$DONext?5?5?$DN?5?$CFX?6?$AA@ DB 'pool->Next  ='
	DB	' %X', 0aH, 00H				; `string'
CONST	ENDS
;	COMDAT ??_C@_0BC@ECLEGJJM@pool?9?$DOCount?5?$DN?5?$CFX?6?$AA@
CONST	SEGMENT
??_C@_0BC@ECLEGJJM@pool?9?$DOCount?5?$DN?5?$CFX?6?$AA@ DB 'pool->Count = '
	DB	'%X', 0aH, 00H				; `string'
CONST	ENDS
;	COMDAT ??_C@_0BC@NLPJAHIB@pool?9?$DOGran?5?5?$DN?5?$CFX?6?$AA@
CONST	SEGMENT
??_C@_0BC@NLPJAHIB@pool?9?$DOGran?5?5?$DN?5?$CFX?6?$AA@ DB 'pool->Gran  ='
	DB	' %X', 0aH, 00H				; `string'
CONST	ENDS
;	COMDAT ??_C@_0BC@DJNCIINJ@pool?5?5?5?5?5?5?5?5?$DN?5?$CFX?6?$AA@
CONST	SEGMENT
??_C@_0BC@DJNCIINJ@pool?5?5?5?5?5?5?5?5?$DN?5?$CFX?6?$AA@ DB 'pool       '
	DB	' = %X', 0aH, 00H				; `string'
_Pool	DD	FLAT:_pool
_pool	DD	FLAT:_IPool_CreateMeta
	DD	FLAT:_IPool_Create
	DD	FLAT:_IPool_Alloc
	DD	FLAT:_IPool_Release
	DD	FLAT:_IPool_Insert
	DD	FLAT:_IPool_Remove
	DD	FLAT:_IPool_Debug
PUBLIC	_IPool_Remove
PUBLIC	_IPool_Insert
PUBLIC	_IPool_Release
PUBLIC	_IPool_Alloc
PUBLIC	_IPool_Create
PUBLIC	_IPool_CreateMeta
PUBLIC	_IPool_Debug
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\fyp\develop\spartan\source\kernel\memory\heap\pool.c
_TEXT	SEGMENT
_pool$ = 8						; size = 4
_IPool_Debug PROC

; 4    : bool IPool_Debug(CPool *pool) {

	push	esi

; 5    :     if (!pool) return false;

	mov	esi, DWORD PTR _pool$[esp]
	test	esi, esi
	jne	SHORT $LN1@IPool_Debu
	xor	eax, eax
	pop	esi

; 14   : }

	ret	0
$LN1@IPool_Debu:

; 6    :     Debug("pool        = %X\n", pool);

	push	esi
	push	OFFSET ??_C@_0BC@DJNCIINJ@pool?5?5?5?5?5?5?5?5?$DN?5?$CFX?6?$AA@
	call	_Debug

; 7    :     Debug("pool->Gran  = %X\n", pool->Gran);

	push	DWORD PTR [esi+16]
	push	OFFSET ??_C@_0BC@NLPJAHIB@pool?9?$DOGran?5?5?$DN?5?$CFX?6?$AA@
	call	_Debug

; 8    :     Debug("pool->Count = %X\n", pool->Count);

	push	DWORD PTR [esi+20]
	push	OFFSET ??_C@_0BC@ECLEGJJM@pool?9?$DOCount?5?$DN?5?$CFX?6?$AA@
	call	_Debug

; 9    :     Debug("pool->Next  = %X\n", pool->Next);

	push	DWORD PTR [esi+24]
	push	OFFSET ??_C@_0BC@CDMIIOJF@pool?9?$DONext?5?5?$DN?5?$CFX?6?$AA@
	call	_Debug

; 10   :     Debug("pool->Node  = %X\n", pool->Node);

	push	DWORD PTR [esi+8]
	push	OFFSET ??_C@_0BC@EHEOOBEF@pool?9?$DONode?5?5?$DN?5?$CFX?6?$AA@
	call	_Debug

; 11   :     Debug("pool->Data  = %X\n", pool->Data);

	push	DWORD PTR [esi+12]
	push	OFFSET ??_C@_0BC@IFENPCMG@pool?9?$DOData?5?5?$DN?5?$CFX?6?$AA@
	call	_Debug

; 12   :     Debug("\n");

	push	OFFSET ??_C@_01EEMJAFIK@?6?$AA@
	call	_Debug
	add	esp, 52					; 00000034H

; 13   :     return true;

	xor	eax, eax
	inc	eax
	pop	esi

; 14   : }

	ret	0
_IPool_Debug ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\fyp\develop\spartan\source\kernel\memory\heap\pool.c
_TEXT	SEGMENT
_pool$ = 8						; size = 4
_count$ = 12						; size = 4
_granularity$ = 16					; size = 4
_nodes$ = 20						; size = 4
_data$ = 24						; size = 4
_name$ = 28						; size = 4
_IPool_CreateMeta PROC

; 16   : bool IPool_CreateMeta(CPool *pool, int count, int granularity, char *nodes, char *data, char *name) {

	push	ebp
	mov	ebp, esp
	push	esi

; 17   :     if (!pool) return false;

	mov	esi, DWORD PTR _pool$[ebp]
	test	esi, esi
	jne	SHORT $LN3@IPool_Crea
	xor	eax, eax
	jmp	SHORT $LN4@IPool_Crea
$LN3@IPool_Crea:

; 18   :     pool->Gran  = granularity;

	mov	eax, DWORD PTR _granularity$[ebp]

; 19   :     pool->Count = count;
; 20   :     pool->Next = 0;
; 21   :     pool->Node = nodes;

	mov	ecx, DWORD PTR _nodes$[ebp]
	and	DWORD PTR [esi+24], 0
	mov	edx, DWORD PTR _count$[ebp]
	mov	DWORD PTR [esi+16], eax

; 22   :     pool->Data = data;

	mov	eax, DWORD PTR _data$[ebp]
	mov	DWORD PTR [esi+20], edx
	mov	DWORD PTR [esi+8], ecx
	mov	DWORD PTR [esi+12], eax

; 23   :     if (pool->Node) stosd(pool->Node, 'oooo', (pool->Count+3)/4);

	test	ecx, ecx
	je	SHORT $LN2@IPool_Crea
	lea	eax, DWORD PTR [edx+3]
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	push	eax
	push	1869573999				; 6f6f6f6fH
	push	ecx
	call	_stosd
	add	esp, 12					; 0000000cH
$LN2@IPool_Crea:

; 24   :     if (name) movsb(pool->Name, name, 4);

	cmp	DWORD PTR _name$[ebp], 0
	je	SHORT $LN1@IPool_Crea
	push	4
	push	DWORD PTR _name$[ebp]
	push	esi
	call	_movsb
	add	esp, 12					; 0000000cH
$LN1@IPool_Crea:

; 25   :     return true;

	xor	eax, eax
	inc	eax
$LN4@IPool_Crea:
	pop	esi

; 26   : }

	pop	ebp
	ret	0
_IPool_CreateMeta ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\fyp\develop\spartan\source\kernel\memory\heap\pool.c
_TEXT	SEGMENT
_pool$ = 8						; size = 4
_size$ = 12						; size = 4
_granularity$ = 16					; size = 4
_IPool_Create PROC

; 28   : bool IPool_Create(CPool *pool, int size, int granularity) {

	push	ebx

; 29   :     if (!pool) return false;

	mov	ebx, DWORD PTR _pool$[esp]
	test	ebx, ebx
	jne	SHORT $LN2@IPool_Crea
	xor	eax, eax
	pop	ebx

; 45   : }

	ret	0
$LN2@IPool_Crea:
	push	esi

; 30   :     pool->Gran  = (granularity + 3) & ~(3);

	mov	esi, DWORD PTR _granularity$[esp+4]
	add	esi, 3
	and	esi, -4					; fffffffcH
	mov	DWORD PTR [ebx+16], esi

; 31   :     if (pool->Gran <= 0) return false;

	jg	SHORT $LN1@IPool_Crea
	xor	eax, eax
	jmp	SHORT $LN5@IPool_Crea
$LN1@IPool_Crea:

; 32   :     pool->Count = align((size - align(sizeof(CPool), 64))/pool->Gran, pool->Gran);

	mov	eax, DWORD PTR _size$[esp+4]

; 33   :     pool->Next  = 0;
; 34   : 
; 35   :     char *data = (char*)pool;
; 36   :     pool->Data  = &data[(pool->Count + 63) & ~(63)];
; 37   :     pool->Node  = &data[(sizeof(CPool) + 63) & ~(63)];

	lea	ecx, DWORD PTR [ebx+64]
	add	eax, -64				; ffffffc0H
	and	DWORD PTR [ebx+24], 0
	xor	edx, edx
	mov	DWORD PTR [ebx+8], ecx
	div	esi
	push	edi
	lea	edi, DWORD PTR [esi-1]
	add	edi, eax
	lea	eax, DWORD PTR [esi-1]
	not	eax
	and	edi, eax
	mov	DWORD PTR [ebx+20], edi
	lea	eax, DWORD PTR [edi+63]
	and	eax, -64				; ffffffc0H
	add	eax, ebx
	mov	DWORD PTR [ebx+12], eax

; 38   : 
; 39   :     int delta = (int)pool->Data - (int)data;

	sub	eax, ebx

; 40   :     int overhead = (delta/pool->Gran + 63) & ~(63);

	cdq
	idiv	esi
	lea	esi, DWORD PTR [eax+63]

; 41   :     stosd(pool->Node, 'oooo', (pool->Count+3)/4);

	lea	eax, DWORD PTR [edi+3]
	and	esi, -64				; ffffffc0H
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	push	eax
	push	1869573999				; 6f6f6f6fH
	push	ecx
	call	_stosd

; 42   :     stosb(pool->Node, 'x', overhead);

	push	esi
	push	120					; 00000078H
	push	DWORD PTR [ebx+8]
	call	_stosb

; 43   :     IPool_Debug(pool);

	push	ebx
	call	_IPool_Debug
	add	esp, 28					; 0000001cH

; 44   :     return true;

	xor	eax, eax
	inc	eax
	pop	edi
$LN5@IPool_Crea:

; 45   : }

	pop	esi
	pop	ebx
	ret	0
_IPool_Create ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\fyp\develop\spartan\source\kernel\memory\heap\pool.c
_TEXT	SEGMENT
_pool$ = 8						; size = 4
_IPool_Alloc PROC

; 48   :     if (!pool) return 0;

	mov	ecx, DWORD PTR _pool$[esp-4]
	test	ecx, ecx
	jne	SHORT $LN5@IPool_Allo
	xor	eax, eax

; 57   : }

	ret	0
$LN5@IPool_Allo:
	push	esi

; 49   :     for (int i = pool->Next; (i+1) % pool->Count != pool->Next; i = ++i % pool->Count) {

	mov	esi, DWORD PTR [ecx+24]
	push	edi
	lea	eax, DWORD PTR [esi+1]
	cdq
	idiv	DWORD PTR [ecx+20]
	cmp	edx, esi
	je	SHORT $LN2@IPool_Allo

; 50   :         if (pool->Node[i] != 'x') {

	mov	edi, DWORD PTR [ecx+8]
$LL4@IPool_Allo:
	cmp	BYTE PTR [edi+esi], 120			; 00000078H
	jne	SHORT $LN9@IPool_Allo

; 49   :     for (int i = pool->Next; (i+1) % pool->Count != pool->Next; i = ++i % pool->Count) {

	mov	esi, edx
	lea	eax, DWORD PTR [esi+1]
	cdq
	idiv	DWORD PTR [ecx+20]
	cmp	edx, DWORD PTR [ecx+24]
	jne	SHORT $LL4@IPool_Allo
$LN2@IPool_Allo:

; 54   :         }
; 55   :     }
; 56   :     return -1;

	or	eax, -1
$LN13@IPool_Allo:
	pop	edi
	pop	esi

; 57   : }

	ret	0
$LN9@IPool_Allo:

; 51   :             pool->Node[i] = 'x';

	lea	eax, DWORD PTR [esi+1]
	mov	BYTE PTR [edi+esi], 120			; 00000078H

; 52   :             pool->Next = (i+1) % pool->Gran;

	cdq
	idiv	DWORD PTR [ecx+16]

; 53   :             return i;

	mov	eax, esi
	mov	DWORD PTR [ecx+24], edx
	jmp	SHORT $LN13@IPool_Allo
_IPool_Alloc ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\fyp\develop\spartan\source\kernel\memory\heap\pool.c
_TEXT	SEGMENT
_pool$ = 8						; size = 4
_index$ = 12						; size = 4
_IPool_Release PROC

; 60   :     if (!pool) return false;

	mov	eax, DWORD PTR _pool$[esp-4]
	test	eax, eax
	je	SHORT $LN6@IPool_Rele

; 61   :     if (index < 0 || index > pool->Count) return false;

	mov	ecx, DWORD PTR _index$[esp-4]
	test	ecx, ecx
	js	SHORT $LN6@IPool_Rele
	cmp	ecx, DWORD PTR [eax+20]
	jg	SHORT $LN6@IPool_Rele

; 62   :     if (pool->Node[index] != 'x') return false;

	mov	edx, DWORD PTR [eax+8]
	cmp	BYTE PTR [edx+ecx], 120			; 00000078H
	jne	SHORT $LN6@IPool_Rele

; 63   :     pool->Node[index] = 'o';

	mov	BYTE PTR [edx+ecx], 111			; 0000006fH

; 64   :     for (int i = pool->Next; i >= 0; i--) {

	mov	ecx, DWORD PTR [eax+24]
	test	ecx, ecx
	js	SHORT $LN12@IPool_Rele

; 65   :         if (pool->Node[i] == 'x') break;

	mov	edx, DWORD PTR [eax+8]
$LL4@IPool_Rele:
	cmp	BYTE PTR [edx+ecx], 120			; 00000078H
	je	SHORT $LN12@IPool_Rele

; 66   :         pool->Next = i;

	mov	DWORD PTR [eax+24], ecx
	dec	ecx
	jns	SHORT $LL4@IPool_Rele
$LN12@IPool_Rele:

; 67   :     }
; 68   :     return true;

	xor	eax, eax
	inc	eax

; 69   : }

	ret	0
$LN6@IPool_Rele:

; 61   :     if (index < 0 || index > pool->Count) return false;

	xor	eax, eax

; 69   : }

	ret	0
_IPool_Release ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\fyp\develop\spartan\source\kernel\memory\heap\pool.c
_TEXT	SEGMENT
_pool$ = 8						; size = 4
_item$ = 12						; size = 4
_IPool_Insert PROC

; 71   : void *IPool_Insert(CPool *pool, void *item) {

	push	edi

; 72   :     if (!pool) return 0;

	mov	edi, DWORD PTR _pool$[esp]
	test	edi, edi
	jne	SHORT $LN3@IPool_Inse
$LN6@IPool_Inse:
	xor	eax, eax
	pop	edi

; 80   : }

	ret	0
$LN3@IPool_Inse:

; 73   : 
; 74   :     int index = IPool_Alloc(pool);

	push	edi
	call	_IPool_Alloc
	pop	ecx

; 75   :     if (index < 0) return 0;

	test	eax, eax
	js	SHORT $LN6@IPool_Inse

; 76   : 
; 77   :     char *data = &pool->Data[index*pool->Gran];

	push	esi
	mov	esi, DWORD PTR [edi+16]
	imul	esi, eax
	add	esi, DWORD PTR [edi+12]

; 78   :     if (item) movsd(data, item, pool->Gran/4);

	cmp	DWORD PTR _item$[esp+4], 0
	je	SHORT $LN1@IPool_Inse
	mov	eax, DWORD PTR [edi+16]
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	push	eax
	push	DWORD PTR _item$[esp+8]
	push	esi
	call	_movsd
	add	esp, 12					; 0000000cH
$LN1@IPool_Inse:

; 79   :     return data;

	mov	eax, esi
	pop	esi
	pop	edi

; 80   : }

	ret	0
_IPool_Insert ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\fyp\develop\spartan\source\kernel\memory\heap\pool.c
_TEXT	SEGMENT
_pool$ = 8						; size = 4
_item$ = 12						; size = 4
_IPool_Remove PROC

; 83   :     if (!pool || !item) return false;

	mov	ecx, DWORD PTR _pool$[esp-4]
	test	ecx, ecx
	je	SHORT $LN1@IPool_Remo
	mov	eax, DWORD PTR _item$[esp-4]
	test	eax, eax
	je	SHORT $LN1@IPool_Remo

; 84   :     int index = ((int)item - (int)pool->Data) / pool->Gran;

	sub	eax, DWORD PTR [ecx+12]
	cdq
	idiv	DWORD PTR [ecx+16]

; 85   :     return IPool_Release(pool, index);

	push	eax
	push	ecx
	call	_IPool_Release
	pop	ecx
	pop	ecx

; 86   : }

	ret	0
$LN1@IPool_Remo:

; 83   :     if (!pool || !item) return false;

	xor	eax, eax

; 86   : }

	ret	0
_IPool_Remove ENDP
_TEXT	ENDS
END
