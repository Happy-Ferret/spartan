; Listing generated by Microsoft (R) Optimizing Compiler Version 18.00.40629.0 

	TITLE	C:\Users\cex123\Desktop\FYP\develop\spartan\Source\Kernel\Thread\Process\Process.c
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB OLDNAMES

PUBLIC	_Process
PUBLIC	??_C@_0BG@OJFHAGGI@?5pcb?5?5?5?5?5?5?5?5?5?5?5?5?$DN?5?$CFX?6?$AA@ ; `string'
PUBLIC	??_C@_0BG@FOPKLDCM@?5pcb?4ProcessID?5?5?$DN?5?$CFX?6?$AA@ ; `string'
PUBLIC	??_C@_0BG@DADBKMCO@?5pcb?4AppMain?5?5?5?5?$DN?5?$CFX?6?$AA@ ; `string'
PUBLIC	??_C@_0BG@JHJMLMCE@?5pcb?4Binary?5?5?5?5?5?$DN?5?$CFX?6?$AA@ ; `string'
PUBLIC	??_C@_0BG@GFKDEMJF@?5pcb?4Heap?5?5?5?5?5?5?5?$DN?5?$CFX?6?$AA@ ; `string'
PUBLIC	??_C@_0BG@MPKAFJEC@?5pcb?4Stack?5?5?5?5?5?5?$DN?5?$CFX?6?$AA@ ; `string'
PUBLIC	??_C@_0BG@KCJEDLJC@?5pcb?4Peb?5?5?5?5?5?5?5?5?$DN?5?$CFX?6?$AA@ ; `string'
PUBLIC	??_C@_0BG@JELECPDA@?5pcb?4MemMap?5?5?5?5?5?$DN?5?$CFX?6?$AA@ ; `string'
PUBLIC	??_C@_0BG@JIAIAEKH@?5pcb?4Pipes?5?5?5?5?5?5?$DN?5?$CFX?6?$AA@ ; `string'
PUBLIC	??_C@_0BG@BNHBLMHP@?5pcb?4Events?5?5?5?5?5?$DN?5?$CFX?6?$AA@ ; `string'
PUBLIC	??_C@_0BG@LIGAJCH@?5pcb?4Windows?5?5?5?5?$DN?5?$CFX?6?$AA@ ; `string'
PUBLIC	??_C@_0BG@FKBHEJHH@?5pcb?4Screen?5?5?5?5?5?$DN?5?$CFX?6?$AA@ ; `string'
PUBLIC	??_C@_0BG@HFJCBMON@?5pcb?4Extent?5?5?5?5?5?$DN?5?$CFX?6?$AA@ ; `string'
PUBLIC	??_C@_0BB@PDJODFM@?5ImageSize?5?$DN?5?$CFX?6?$AA@ ; `string'
PUBLIC	??_C@_0BB@EIOAOFHG@?5HeapSize?5?5?$DN?5?$CFX?6?$AA@ ; `string'
PUBLIC	??_C@_0BB@GDFFGEG@?5StackSize?5?$DN?5?$CFX?6?$AA@ ; `string'
PUBLIC	??_C@_0BB@GBKGJJKI@?5FootPrint?5?$DN?5?$CFX?6?$AA@ ; `string'
PUBLIC	??_C@_0BC@PPDLBPEM@?5Process?5Created?6?$AA@	; `string'
PUBLIC	_process
COMM	_FromRing0:DWORD
_DATA	ENDS
;	COMDAT ??_C@_0BC@PPDLBPEM@?5Process?5Created?6?$AA@
CONST	SEGMENT
??_C@_0BC@PPDLBPEM@?5Process?5Created?6?$AA@ DB ' Process Created', 0aH, 00H ; `string'
CONST	ENDS
;	COMDAT ??_C@_0BB@GBKGJJKI@?5FootPrint?5?$DN?5?$CFX?6?$AA@
CONST	SEGMENT
??_C@_0BB@GBKGJJKI@?5FootPrint?5?$DN?5?$CFX?6?$AA@ DB ' FootPrint = %X', 0aH
	DB	00H						; `string'
CONST	ENDS
;	COMDAT ??_C@_0BB@GDFFGEG@?5StackSize?5?$DN?5?$CFX?6?$AA@
CONST	SEGMENT
??_C@_0BB@GDFFGEG@?5StackSize?5?$DN?5?$CFX?6?$AA@ DB ' StackSize = %X', 0aH
	DB	00H						; `string'
CONST	ENDS
;	COMDAT ??_C@_0BB@EIOAOFHG@?5HeapSize?5?5?$DN?5?$CFX?6?$AA@
CONST	SEGMENT
??_C@_0BB@EIOAOFHG@?5HeapSize?5?5?$DN?5?$CFX?6?$AA@ DB ' HeapSize  = %X', 0aH
	DB	00H						; `string'
CONST	ENDS
;	COMDAT ??_C@_0BB@PDJODFM@?5ImageSize?5?$DN?5?$CFX?6?$AA@
CONST	SEGMENT
??_C@_0BB@PDJODFM@?5ImageSize?5?$DN?5?$CFX?6?$AA@ DB ' ImageSize = %X', 0aH
	DB	00H						; `string'
CONST	ENDS
;	COMDAT ??_C@_0BG@HFJCBMON@?5pcb?4Extent?5?5?5?5?5?$DN?5?$CFX?6?$AA@
CONST	SEGMENT
??_C@_0BG@HFJCBMON@?5pcb?4Extent?5?5?5?5?5?$DN?5?$CFX?6?$AA@ DB ' pcb.Ext'
	DB	'ent     = %X', 0aH, 00H			; `string'
CONST	ENDS
;	COMDAT ??_C@_0BG@FKBHEJHH@?5pcb?4Screen?5?5?5?5?5?$DN?5?$CFX?6?$AA@
CONST	SEGMENT
??_C@_0BG@FKBHEJHH@?5pcb?4Screen?5?5?5?5?5?$DN?5?$CFX?6?$AA@ DB ' pcb.Scr'
	DB	'een     = %X', 0aH, 00H			; `string'
CONST	ENDS
;	COMDAT ??_C@_0BG@LIGAJCH@?5pcb?4Windows?5?5?5?5?$DN?5?$CFX?6?$AA@
CONST	SEGMENT
??_C@_0BG@LIGAJCH@?5pcb?4Windows?5?5?5?5?$DN?5?$CFX?6?$AA@ DB ' pcb.Windo'
	DB	'ws    = %X', 0aH, 00H			; `string'
CONST	ENDS
;	COMDAT ??_C@_0BG@BNHBLMHP@?5pcb?4Events?5?5?5?5?5?$DN?5?$CFX?6?$AA@
CONST	SEGMENT
??_C@_0BG@BNHBLMHP@?5pcb?4Events?5?5?5?5?5?$DN?5?$CFX?6?$AA@ DB ' pcb.Eve'
	DB	'nts     = %X', 0aH, 00H			; `string'
CONST	ENDS
;	COMDAT ??_C@_0BG@JIAIAEKH@?5pcb?4Pipes?5?5?5?5?5?5?$DN?5?$CFX?6?$AA@
CONST	SEGMENT
??_C@_0BG@JIAIAEKH@?5pcb?4Pipes?5?5?5?5?5?5?$DN?5?$CFX?6?$AA@ DB ' pcb.Pi'
	DB	'pes      = %X', 0aH, 00H			; `string'
CONST	ENDS
;	COMDAT ??_C@_0BG@JELECPDA@?5pcb?4MemMap?5?5?5?5?5?$DN?5?$CFX?6?$AA@
CONST	SEGMENT
??_C@_0BG@JELECPDA@?5pcb?4MemMap?5?5?5?5?5?$DN?5?$CFX?6?$AA@ DB ' pcb.Mem'
	DB	'Map     = %X', 0aH, 00H			; `string'
CONST	ENDS
;	COMDAT ??_C@_0BG@KCJEDLJC@?5pcb?4Peb?5?5?5?5?5?5?5?5?$DN?5?$CFX?6?$AA@
CONST	SEGMENT
??_C@_0BG@KCJEDLJC@?5pcb?4Peb?5?5?5?5?5?5?5?5?$DN?5?$CFX?6?$AA@ DB ' pcb.'
	DB	'Peb        = %X', 0aH, 00H			; `string'
CONST	ENDS
;	COMDAT ??_C@_0BG@MPKAFJEC@?5pcb?4Stack?5?5?5?5?5?5?$DN?5?$CFX?6?$AA@
CONST	SEGMENT
??_C@_0BG@MPKAFJEC@?5pcb?4Stack?5?5?5?5?5?5?$DN?5?$CFX?6?$AA@ DB ' pcb.St'
	DB	'ack      = %X', 0aH, 00H			; `string'
CONST	ENDS
;	COMDAT ??_C@_0BG@GFKDEMJF@?5pcb?4Heap?5?5?5?5?5?5?5?$DN?5?$CFX?6?$AA@
CONST	SEGMENT
??_C@_0BG@GFKDEMJF@?5pcb?4Heap?5?5?5?5?5?5?5?$DN?5?$CFX?6?$AA@ DB ' pcb.H'
	DB	'eap       = %X', 0aH, 00H			; `string'
CONST	ENDS
;	COMDAT ??_C@_0BG@JHJMLMCE@?5pcb?4Binary?5?5?5?5?5?$DN?5?$CFX?6?$AA@
CONST	SEGMENT
??_C@_0BG@JHJMLMCE@?5pcb?4Binary?5?5?5?5?5?$DN?5?$CFX?6?$AA@ DB ' pcb.Bin'
	DB	'ary     = %X', 0aH, 00H			; `string'
CONST	ENDS
;	COMDAT ??_C@_0BG@DADBKMCO@?5pcb?4AppMain?5?5?5?5?$DN?5?$CFX?6?$AA@
CONST	SEGMENT
??_C@_0BG@DADBKMCO@?5pcb?4AppMain?5?5?5?5?$DN?5?$CFX?6?$AA@ DB ' pcb.AppM'
	DB	'ain    = %X', 0aH, 00H			; `string'
CONST	ENDS
;	COMDAT ??_C@_0BG@FOPKLDCM@?5pcb?4ProcessID?5?5?$DN?5?$CFX?6?$AA@
CONST	SEGMENT
??_C@_0BG@FOPKLDCM@?5pcb?4ProcessID?5?5?$DN?5?$CFX?6?$AA@ DB ' pcb.Proces'
	DB	'sID  = %X', 0aH, 00H			; `string'
CONST	ENDS
;	COMDAT ??_C@_0BG@OJFHAGGI@?5pcb?5?5?5?5?5?5?5?5?5?5?5?5?$DN?5?$CFX?6?$AA@
CONST	SEGMENT
??_C@_0BG@OJFHAGGI@?5pcb?5?5?5?5?5?5?5?5?5?5?5?5?$DN?5?$CFX?6?$AA@ DB ' p'
	DB	'cb            = %X', 0aH, 00H		; `string'
?memmap@?1??IProcess_Load@@9@9 DD 0400000H		; `IProcess_Load'::`2'::memmap
	DD	0500000H
	DD	0600000H
	DD	0700000H
	DD	0800000H
	DD	0c00000H
	DD	01400000H
_Process DD	FLAT:_process
_process DD	FLAT:_IProcess_Create
	DD	FLAT:_IProcess_Fork
	DD	FLAT:_IProcess_Spawn
	DD	FLAT:_IProcess_Run
	DD	FLAT:_IProcess_Exit
	DD	FLAT:_IProcess_GetPcb
	DD	FLAT:_IProcess_GetPeb
	DD	FLAT:_IProcess_GetCanvas
	DD	FLAT:_IProcess_Inject
	DD	FLAT:_IProcess_DebugPcb
	DD	FLAT:_IProcess_DebugPeb
PUBLIC	_IProcess_Exit
PUBLIC	_IProcess_Create
PUBLIC	_IProcess_Fork
PUBLIC	_IProcess_Run
PUBLIC	_IProcess_Spawn
PUBLIC	_IProcess_Enqueue
PUBLIC	_IProcess_Load
PUBLIC	_IProcess_GetCanvas
PUBLIC	_IProcess_GetPeb
PUBLIC	_IProcess_GetPcb
PUBLIC	_IProcess_DebugPeb
PUBLIC	_IProcess_DebugPcb
PUBLIC	_IProcess_Inject
PUBLIC	_DoFork
_Canvas	DD	01H DUP (?)
_cursor	DD	01H DUP (?)
_screen	DD	01H DUP (?)
_BSS	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\fyp\develop\spartan\source\kernel\thread\process\process.c
_TEXT	SEGMENT
_path$ = 8						; size = 4
_DoFork	PROC
; _err$dead$ = ecx
; _esp$ = edx

; 193  : u32 DoFork(u32 err, u32 esp, char *path) {

	push	esi

; 194  :     CContext *ctx = (CContext*)esp;
; 195  :     ctx->eax = (u32)IProcess_Fork(path);

	push	DWORD PTR _path$[esp]
	mov	esi, edx
	call	_IProcess_Fork
	mov	DWORD PTR [esi+36], eax

; 196  :     return esp;

	mov	eax, esi
	pop	ecx
	pop	esi

; 197  : }

	ret	0
_DoFork	ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\fyp\develop\spartan\source\kernel\thread\process\process.c
_TEXT	SEGMENT
_canvas$ = 8						; size = 4
_scr$ = 12						; size = 4
_curs$ = 16						; size = 4
_IProcess_Inject PROC

; 22   :     if (screen == nullptr) screen = scr;

	cmp	DWORD PTR _screen, 0
	jne	SHORT $LN3@IProcess_I
	mov	eax, DWORD PTR _scr$[esp-4]
	mov	DWORD PTR _screen, eax
$LN3@IProcess_I:

; 23   :     if (Canvas == nullptr) Canvas = canvas;

	cmp	DWORD PTR _Canvas, 0
	jne	SHORT $LN2@IProcess_I
	mov	eax, DWORD PTR _canvas$[esp-4]
	mov	DWORD PTR _Canvas, eax
$LN2@IProcess_I:

; 24   :     if (cursor == nullptr) cursor = curs;

	cmp	DWORD PTR _cursor, 0
	jne	SHORT $LN1@IProcess_I
	mov	eax, DWORD PTR _curs$[esp-4]
	mov	DWORD PTR _cursor, eax
$LN1@IProcess_I:

; 25   :     return true;

	xor	eax, eax
	inc	eax

; 26   : }

	ret	0
_IProcess_Inject ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\fyp\develop\spartan\source\kernel\thread\process\process.c
_TEXT	SEGMENT
_pcb$ = 8						; size = 4
_IProcess_DebugPcb PROC

; 30   : void IProcess_DebugPcb(CPcb *pcb) {

	push	esi

; 31   :     Debug(" pcb            = %X\n", pcb);

	mov	esi, DWORD PTR _pcb$[esp]
	push	esi
	push	OFFSET ??_C@_0BG@OJFHAGGI@?5pcb?5?5?5?5?5?5?5?5?5?5?5?5?$DN?5?$CFX?6?$AA@
	call	_Debug

; 32   :     Debug(" pcb.ProcessID  = %X\n", pcb->ProcessID);

	push	DWORD PTR [esi]
	push	OFFSET ??_C@_0BG@FOPKLDCM@?5pcb?4ProcessID?5?5?$DN?5?$CFX?6?$AA@
	call	_Debug

; 33   :     Debug(" pcb.AppMain    = %X\n", pcb->AppMain  );

	push	DWORD PTR [esi+4]
	push	OFFSET ??_C@_0BG@DADBKMCO@?5pcb?4AppMain?5?5?5?5?$DN?5?$CFX?6?$AA@
	call	_Debug

; 34   :     Debug(" pcb.Binary     = %X\n", pcb->Binary   );

	push	DWORD PTR [esi+8]
	push	OFFSET ??_C@_0BG@JHJMLMCE@?5pcb?4Binary?5?5?5?5?5?$DN?5?$CFX?6?$AA@
	call	_Debug

; 35   :     Debug(" pcb.Heap       = %X\n", pcb->Heap     );

	push	DWORD PTR [esi+12]
	push	OFFSET ??_C@_0BG@GFKDEMJF@?5pcb?4Heap?5?5?5?5?5?5?5?$DN?5?$CFX?6?$AA@
	call	_Debug

; 36   :     Debug(" pcb.Stack      = %X\n", pcb->Stack    );

	push	DWORD PTR [esi+16]
	push	OFFSET ??_C@_0BG@MPKAFJEC@?5pcb?4Stack?5?5?5?5?5?5?$DN?5?$CFX?6?$AA@
	call	_Debug

; 37   :     Debug(" pcb.Peb        = %X\n", pcb->Peb      );

	push	DWORD PTR [esi+20]
	push	OFFSET ??_C@_0BG@KCJEDLJC@?5pcb?4Peb?5?5?5?5?5?5?5?5?$DN?5?$CFX?6?$AA@
	call	_Debug

; 38   :     Debug(" pcb.MemMap     = %X\n", pcb->MemMap   );

	push	DWORD PTR [esi+24]
	push	OFFSET ??_C@_0BG@JELECPDA@?5pcb?4MemMap?5?5?5?5?5?$DN?5?$CFX?6?$AA@
	call	_Debug
	add	esp, 64					; 00000040H

; 39   :     Debug(" pcb.Pipes      = %X\n", pcb->Pipes    );

	push	DWORD PTR [esi+28]
	push	OFFSET ??_C@_0BG@JIAIAEKH@?5pcb?4Pipes?5?5?5?5?5?5?$DN?5?$CFX?6?$AA@
	call	_Debug

; 40   :     Debug(" pcb.Events     = %X\n", pcb->Events   );

	push	DWORD PTR [esi+32]
	push	OFFSET ??_C@_0BG@BNHBLMHP@?5pcb?4Events?5?5?5?5?5?$DN?5?$CFX?6?$AA@
	call	_Debug

; 41   :     Debug(" pcb.Windows    = %X\n", pcb->Windows  );

	push	DWORD PTR [esi+36]
	push	OFFSET ??_C@_0BG@LIGAJCH@?5pcb?4Windows?5?5?5?5?$DN?5?$CFX?6?$AA@
	call	_Debug

; 42   :     Debug(" pcb.Screen     = %X\n", pcb->Screen   );

	push	DWORD PTR [esi+40]
	push	OFFSET ??_C@_0BG@FKBHEJHH@?5pcb?4Screen?5?5?5?5?5?$DN?5?$CFX?6?$AA@
	call	_Debug

; 43   :     Debug(" pcb.Extent     = %X\n", pcb->Extent   );

	push	DWORD PTR [esi+44]
	push	OFFSET ??_C@_0BG@HFJCBMON@?5pcb?4Extent?5?5?5?5?5?$DN?5?$CFX?6?$AA@
	call	_Debug
	add	esp, 40					; 00000028H
	pop	esi

; 44   : }

	ret	0
_IProcess_DebugPcb ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\fyp\develop\spartan\source\kernel\thread\process\process.c
_TEXT	SEGMENT
_peb$ = 8						; size = 4
_IProcess_DebugPeb PROC

; 47   :     Logger(" peb            = %X\n", peb);
; 48   :     Logger(" pcb.HeapPool   = %X\n", peb->HeapPool  );
; 49   :     Logger(" pcb.PipePool   = %X\n", peb->PipePool  );
; 50   :     Logger(" pcb.EventPool  = %X\n", peb->EventPool );
; 51   :     Logger(" pcb.WindowPool = %X\n", peb->WindowPool);
; 52   :     Logger(" pcb.Canvas     = %X\n", peb->Canvas    );
; 53   :     Logger(" pcb.Context    = %X\n", peb->Context   );
; 54   :     Logger(" pcb.Pages      = %X\n", peb->Pages     );
; 55   :     Logger(" pcb.Stack0     = %X\n", peb->Stack0    );
; 56   : }

	ret	0
_IProcess_DebugPeb ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\fyp\develop\spartan\source\kernel\thread\process\process.c
_TEXT	SEGMENT
_IProcess_GetPcb PROC

; 59   :     int pid = Thread->GetPid();

	mov	eax, DWORD PTR _Thread
	push	esi
	call	DWORD PTR [eax+8]
	mov	esi, eax

; 60   :     if (pid < 0) return 0;

	test	esi, esi
	jns	SHORT $LN1@IProcess_G
	xor	eax, eax
	pop	esi

; 63   : }

	ret	0
$LN1@IProcess_G:

; 61   :     CPcb **pcb = (CPcb**)Monitor->GetBase('PCB ');

	mov	eax, DWORD PTR _Monitor
	push	1346585120				; 50434220H
	call	DWORD PTR [eax+24]
	pop	ecx

; 62   :     return pcb[pid];

	mov	eax, DWORD PTR [eax+esi*4]
	pop	esi

; 63   : }

	ret	0
_IProcess_GetPcb ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\fyp\develop\spartan\source\kernel\thread\process\process.c
_TEXT	SEGMENT
_IProcess_GetPeb PROC

; 66   :     int pid = Thread->GetPid();

	mov	eax, DWORD PTR _Thread
	push	esi
	call	DWORD PTR [eax+8]
	mov	esi, eax

; 67   :     if (pid < 0) return 0;

	test	esi, esi
	jns	SHORT $LN1@IProcess_G
	xor	eax, eax
	pop	esi

; 70   : }

	ret	0
$LN1@IProcess_G:

; 68   :     CPeb **peb = (CPeb**)Monitor->GetBase('PEB ');

	mov	eax, DWORD PTR _Monitor
	push	1346716192				; 50454220H
	call	DWORD PTR [eax+24]
	pop	ecx

; 69   :     return peb[pid];

	mov	eax, DWORD PTR [eax+esi*4]
	pop	esi

; 70   : }

	ret	0
_IProcess_GetPeb ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\fyp\develop\spartan\source\kernel\thread\process\process.c
_TEXT	SEGMENT
_IProcess_GetCanvas PROC

; 73   :     CPeb *peb = IProcess_GetPeb();

	call	_IProcess_GetPeb

; 74   :     if (!peb) return 0;

	test	eax, eax
	jne	SHORT $LN1@IProcess_G

; 76   : }

	ret	0
$LN1@IProcess_G:

; 75   :     return peb->Canvas;

	mov	eax, DWORD PTR [eax+16]

; 76   : }

	ret	0
_IProcess_GetCanvas ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\fyp\develop\spartan\source\kernel\thread\process\process.c
_TEXT	SEGMENT
_size$1$ = -68						; size = 4
tv562 = -64						; size = 4
_base$1$ = -64						; size = 4
_HeapSize$2$ = -64					; size = 4
_StackSize$2$ = -60					; size = 4
_ImageSize$1$ = -60					; size = 4
_ImageSize$2$ = -56					; size = 4
_path$1$ = -52						; size = 4
_mockup$ = -48						; size = 48
_IProcess_Load PROC
; _path$ = ecx

; 78   : CPcb *IProcess_Load(char *path) {

	sub	esp, 68					; 00000044H
	mov	eax, ecx
	push	esi
	push	edi
	mov	DWORD PTR _path$1$[esp+76], eax

; 79   :     extern IMemory Ring0Heap;
; 80   :     CTask *TaskPool = (CTask*)MMAP_TASKPOOL;
; 81   : 
; 82   :     char *args = path;

	mov	edi, eax

; 83   :     while (*args > ' ') args++;

	cmp	BYTE PTR [eax], 32			; 00000020H
	jle	SHORT $LN4@IProcess_L
$LL5@IProcess_L:
	inc	edi
	cmp	BYTE PTR [edi], 32			; 00000020H
	jg	SHORT $LL5@IProcess_L
$LN4@IProcess_L:

; 84   :     *args++ = 0;

	mov	BYTE PTR [edi], 0
	inc	edi

; 85   : 
; 86   :     CFile *file = FileIO->Open(path, "-rwx");

	push	OFFSET ??_C@_04HHOCAGGL@?9rwx?$AA@
	push	eax
	mov	eax, DWORD PTR _FileIO
	call	DWORD PTR [eax+12]
	mov	esi, eax
	pop	ecx
	pop	ecx

; 87   :     if (!file) return 0;

	test	esi, esi
	je	$LN6@IProcess_L
$LN3@IProcess_L:

; 88   :     char *image = FileIO->Base(file);

	mov	eax, DWORD PTR _FileIO
	push	ebx
	push	ebp
	push	esi
	call	DWORD PTR [eax+36]

; 89   :     int size = FileIO->Size(file);

	mov	ecx, DWORD PTR _FileIO
	mov	ebx, eax
	push	esi
	call	DWORD PTR [ecx+28]

; 90   :     FileIO->Close(file);

	mov	ecx, DWORD PTR _FileIO
	push	esi
	mov	DWORD PTR _size$1$[esp+96], eax
	call	DWORD PTR [ecx+16]

; 91   : 
; 92   :     MZHDR *mz = (MZHDR*)image;
; 93   :     OPHDR *op = (OPHDR*)&image[mz->e_lfanew + sizeof(PEHDR)];

	mov	ebp, DWORD PTR [ebx+60]

; 94   :     int ImageSize = MAX(1*MB, op->ImageSize);

	mov	ecx, 1048576				; 00100000H
	add	esp, 12					; 0000000cH
	mov	esi, DWORD PTR [ebx+ebp+80]
	mov	DWORD PTR _ImageSize$1$[esp+84], esi
	cmp	esi, ecx
	jae	SHORT $LN8@IProcess_L
	mov	DWORD PTR _ImageSize$1$[esp+84], ecx
$LN8@IProcess_L:

; 95   :     int HeapSize  = MAX(1*MB, MAX(op->SizeHeapReserve,  op->SizeHeapCommit));

	mov	eax, DWORD PTR [ebx+ebp+104]
	mov	esi, eax
	mov	edx, DWORD PTR [ebx+ebp+108]
	cmp	eax, edx
	ja	SHORT $LN11@IProcess_L
	mov	esi, edx
$LN11@IProcess_L:
	cmp	esi, ecx
	jae	SHORT $LN14@IProcess_L
	mov	eax, ecx
	jmp	SHORT $LN13@IProcess_L
$LN14@IProcess_L:
	cmp	eax, edx
	ja	SHORT $LN13@IProcess_L
	mov	eax, edx
$LN13@IProcess_L:

; 96   :     int StackSize = MAX(1*MB, MAX(op->SizeStackReserve, op->SizeStackCommit));

	mov	edx, DWORD PTR [ebx+ebp+96]
	mov	esi, DWORD PTR [ebx+ebp+100]
	mov	DWORD PTR tv562[esp+84], edx
	cmp	edx, esi
	ja	SHORT $LN17@IProcess_L
	mov	DWORD PTR tv562[esp+84], esi
$LN17@IProcess_L:
	cmp	DWORD PTR tv562[esp+84], ecx
	jb	SHORT $LN19@IProcess_L
	mov	ecx, edx
	cmp	edx, esi
	ja	SHORT $LN19@IProcess_L
	mov	ecx, esi
$LN19@IProcess_L:

; 97   :     ImageSize = align(ImageSize, 1*MB);

	mov	edx, DWORD PTR _ImageSize$1$[esp+84]

; 98   :     HeapSize  = align(HeapSize,  1*MB);

	lea	esi, DWORD PTR [eax+1048575]
	and	esi, -1048576				; fff00000H

; 99   :     StackSize = align(StackSize, 1*MB);

	lea	eax, DWORD PTR [ecx+1048575]
	and	eax, -1048576				; fff00000H
	mov	DWORD PTR _HeapSize$2$[esp+84], esi
	add	edx, 1048575				; 000fffffH
	mov	DWORD PTR _StackSize$2$[esp+84], eax
	and	edx, -1048576				; fff00000H

; 100  :     int FootPrint = ImageSize + HeapSize + StackSize;

	add	esi, eax
	add	esi, edx
	mov	DWORD PTR _ImageSize$2$[esp+84], edx

; 101  :     if (!FromRing0) FootPrint = align(FootPrint, 4*MB);

	cmp	DWORD PTR _FromRing0, 0
	jne	SHORT $LN2@IProcess_L
	add	esi, 4194303				; 003fffffH
	and	esi, -4194304				; ffc00000H
$LN2@IProcess_L:

; 102  :     Debug(" ImageSize = %X\n", ImageSize);

	push	edx
	push	OFFSET ??_C@_0BB@PDJODFM@?5ImageSize?5?$DN?5?$CFX?6?$AA@
	call	_Debug

; 103  :     Debug(" HeapSize  = %X\n", HeapSize);

	push	DWORD PTR _HeapSize$2$[esp+92]
	push	OFFSET ??_C@_0BB@EIOAOFHG@?5HeapSize?5?5?$DN?5?$CFX?6?$AA@
	call	_Debug

; 104  :     Debug(" StackSize = %X\n", StackSize);

	push	DWORD PTR _StackSize$2$[esp+100]
	push	OFFSET ??_C@_0BB@GDFFGEG@?5StackSize?5?$DN?5?$CFX?6?$AA@
	call	_Debug

; 105  :     Debug(" FootPrint = %X\n", FootPrint);

	push	esi
	push	OFFSET ??_C@_0BB@GBKGJJKI@?5FootPrint?5?$DN?5?$CFX?6?$AA@
	call	_Debug

; 106  : 
; 107  :     CPcb mockup;
; 108  :     stosd(&mockup, 0, sizeof(CPcb)/4);

	push	12					; 0000000cH
	lea	eax, DWORD PTR _mockup$[esp+120]
	push	0
	push	eax
	call	_stosd

; 109  :     mockup.AppMain = op->Entry;

	mov	eax, DWORD PTR [ebx+ebp+40]

; 110  :     mockup.Binary  = 0x000000;
; 111  :     mockup.Heap    = ImageSize;
; 112  :     mockup.Stack   = FootPrint - StackSize;
; 113  : 
; 114  :     static int memmap[] = {
; 115  :         0x00400000, // Peb
; 116  :         0x00500000, // MemMap
; 117  :         0x00600000, // Pipes
; 118  :         0x00700000, // Events
; 119  :         0x00800000, // Windows
; 120  :         0x00C00000, // Screen
; 121  :         0x01400000  // Extent
; 122  :     };
; 123  :     mockup.Peb     = (CPeb*)align(FootPrint + memmap[0] - memmap[0], 1*MB);

	mov	ecx, -1048576				; fff00000H
	mov	DWORD PTR _mockup$[esp+132], eax
	add	esp, 44					; 0000002cH
	mov	eax, DWORD PTR _ImageSize$2$[esp+84]
	mov	DWORD PTR _mockup$[esp+96], eax
	mov	eax, esi
	sub	eax, DWORD PTR _StackSize$2$[esp+84]
	mov	DWORD PTR _mockup$[esp+100], eax
	lea	eax, DWORD PTR [esi+1048575]
	and	eax, ecx
	and	DWORD PTR _mockup$[esp+92], 0
	mov	DWORD PTR _mockup$[esp+104], eax

; 124  :     mockup.MemMap  = align(FootPrint + memmap[1] - memmap[0], 1*MB);

	lea	eax, DWORD PTR [esi+2097151]
	and	eax, ecx
	mov	DWORD PTR _mockup$[esp+108], eax

; 125  :     mockup.Pipes   = align(FootPrint + memmap[2] - memmap[0], 1*MB);

	lea	eax, DWORD PTR [esi+3145727]
	and	eax, ecx
	mov	DWORD PTR _mockup$[esp+112], eax

; 126  :     mockup.Events  = align(FootPrint + memmap[3] - memmap[0], 1*MB);

	lea	eax, DWORD PTR [esi+4194303]
	and	eax, ecx
	mov	DWORD PTR _mockup$[esp+116], eax

; 127  :     mockup.Windows = align(FootPrint + memmap[4] - memmap[0], 1*MB);

	lea	eax, DWORD PTR [esi+5242879]
	and	eax, ecx
	mov	DWORD PTR _mockup$[esp+120], eax

; 128  :     mockup.Screen  = align(FootPrint + memmap[5] - memmap[0], 1*MB);

	lea	eax, DWORD PTR [esi+9437183]
	and	eax, ecx
	mov	DWORD PTR _mockup$[esp+124], eax

; 129  :     mockup.Extent  = align(FootPrint + memmap[6] - memmap[0], 4*MB);

	lea	eax, DWORD PTR [esi+20971519]
	and	eax, -4194304				; ffc00000H

; 130  : 
; 131  :     char *base = (FromRing0) ? (char*)(0x0D*MB) : SysMem->Alloc(mockup.Extent);

	cmp	DWORD PTR _FromRing0, 0
	mov	DWORD PTR _mockup$[esp+128], eax
	je	SHORT $LN22@IProcess_L
	mov	esi, 13631488				; 00d00000H
	mov	DWORD PTR _base$1$[esp+84], esi
	jmp	SHORT $LN1@IProcess_L
$LN22@IProcess_L:
	push	eax
	mov	eax, DWORD PTR _SysMem
	call	DWORD PTR [eax]
	mov	esi, eax
	mov	DWORD PTR _base$1$[esp+88], esi
	pop	ecx

; 132  :     if (!base) return 0;

	test	esi, esi
	je	SHORT $LN29@IProcess_L
$LN28@IProcess_L:
	mov	eax, DWORD PTR _mockup$[esp+128]
$LN1@IProcess_L:

; 133  :     stosd(base, 0, (mockup.Extent+3)/4);

	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	push	eax
	push	0
	push	esi
	call	_stosd

; 134  :     movsd(base, image, (size+3)/4);

	mov	eax, DWORD PTR _size$1$[esp+96]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	push	eax
	push	ebx
	push	esi
	call	_movsd

; 135  : 
; 136  :     Loader->Reloc(path, base, size);

	push	DWORD PTR _size$1$[esp+108]
	mov	eax, DWORD PTR _Loader
	push	esi
	mov	esi, DWORD PTR _path$1$[esp+116]
	push	esi
	call	DWORD PTR [eax]

; 137  :     Loader->Link(path, base, size);

	push	DWORD PTR _size$1$[esp+120]
	mov	eax, DWORD PTR _Loader
	push	DWORD PTR _base$1$[esp+124]
	push	esi
	call	DWORD PTR [eax+4]

; 138  :     CPcb *pcb = IEnvironment_SetUp(&mockup, base, path, args);

	mov	edx, DWORD PTR _base$1$[esp+132]
	lea	ecx, DWORD PTR _mockup$[esp+132]
	push	edi
	push	esi
	call	_IEnvironment_SetUp

; 139  :     pcb->AppMain = (u32)&base[op->Entry];

	mov	ecx, DWORD PTR [ebx+ebp+40]
	add	esp, 56					; 00000038H
	add	ecx, DWORD PTR _base$1$[esp+84]
	mov	DWORD PTR [eax+4], ecx
$LN29@IProcess_L:
	pop	ebp
	pop	ebx
$LN6@IProcess_L:
	pop	edi
	pop	esi

; 140  :     return pcb;
; 141  : }

	add	esp, 68					; 00000044H
	ret	0
_IProcess_Load ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\fyp\develop\spartan\source\kernel\thread\process\process.c
_TEXT	SEGMENT
_pcb$1$ = -4						; size = 4
_IProcess_Enqueue PROC
; _pcb$ = ecx

; 143  : CContext *IProcess_Enqueue(CPcb *pcb) {

	push	ecx

; 144  :     u32 esp3 = (u32)pcb->Stack + 1*MB;
; 145  :     u32 esp0 = (u32)pcb->Peb->Stack0;

	mov	eax, DWORD PTR [ecx+20]
	push	ebx
	push	ebp
	mov	ebp, DWORD PTR [ecx+16]

; 146  :     u32 cr3  = (u32)pcb->Peb->Pages;

	mov	ebx, DWORD PTR [eax+24]
	add	ebp, 1048576				; 00100000H
	push	esi

; 147  :     u32 eip  = (u32)pcb->AppMain;

	mov	esi, DWORD PTR [ecx+4]
	push	edi
	mov	edi, DWORD PTR [eax+28]

; 148  : 
; 149  :     Paging->AppPages(pcb);

	mov	eax, DWORD PTR _Paging
	push	ecx
	mov	DWORD PTR _pcb$1$[esp+24], ecx
	call	DWORD PTR [eax]

; 150  :     CContext *ctx = Thread->Spawn(cr3, eip, esp0, esp3);

	mov	eax, DWORD PTR _Thread
	push	ebp
	push	edi
	push	esi
	push	ebx
	call	DWORD PTR [eax+16]
	mov	edi, eax
	add	esp, 20					; 00000014H

; 151  :     if (!ctx) return 0;

	test	edi, edi
	je	SHORT $LN2@IProcess_E
$LN1@IProcess_E:

; 152  : 
; 153  :     CPeb *peb = pcb->Peb;

	mov	esi, DWORD PTR _pcb$1$[esp+20]
	mov	edx, DWORD PTR [esi+20]

; 154  :     peb->Context = ctx;

	mov	DWORD PTR [edx+20], edi

; 155  :     pcb->ProcessID = ctx->pid;

	mov	eax, DWORD PTR [edi+60]
	mov	DWORD PTR [esi], eax

; 156  : 
; 157  :     CTask *TaskPool = (CTask*)MMAP_TASKPOOL;
; 158  :     TaskPool->PcbList[ctx->pid] = (int)pcb;

	mov	ecx, DWORD PTR [edi+60]
	mov	eax, DWORD PTR ds:1696
	mov	DWORD PTR [eax+ecx*4], esi

; 159  :     TaskPool->PebList[ctx->pid] = (int)peb;

	mov	eax, DWORD PTR ds:1700
	mov	ecx, DWORD PTR [edi+60]
	mov	DWORD PTR [eax+ecx*4], edx

; 160  :     return ctx;

	mov	eax, edi
$LN2@IProcess_E:
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx

; 161  : }

	pop	ecx
	ret	0
_IProcess_Enqueue ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\fyp\develop\spartan\source\kernel\thread\process\process.c
_TEXT	SEGMENT
_path$ = 8						; size = 4
_IProcess_Spawn PROC

; 164  :     extern IMemory Ring0Heap;
; 165  : 
; 166  :     CPcb *pcb = IProcess_Load(path);

	mov	ecx, DWORD PTR _path$[esp-4]
	push	esi
	call	_IProcess_Load
	mov	esi, eax

; 167  :     if (pcb) {

	test	esi, esi
	je	SHORT $LN1@IProcess_S

; 168  :         CContext *ctx = IProcess_Enqueue(pcb);

	mov	ecx, esi
	call	_IProcess_Enqueue

; 169  :         if (ctx) {

	test	eax, eax
	je	SHORT $LN2@IProcess_S

; 170  :             Debug(" Process Created\n");

	push	OFFSET ??_C@_0BC@PPDLBPEM@?5Process?5Created?6?$AA@
	call	_Debug

; 171  :             IProcess_DebugPcb(pcb);

	push	esi
	call	_IProcess_DebugPcb
	pop	ecx
	pop	ecx

; 172  :             IProcess_DebugPeb(pcb->Peb);
; 173  :             return pcb;

	mov	eax, esi
	pop	esi

; 178  : }

	ret	0
$LN2@IProcess_S:

; 174  :         }
; 175  :         else Ring0Heap.Free(pcb);

	push	esi
	call	DWORD PTR _Ring0Heap+4
	pop	ecx
$LN1@IProcess_S:

; 176  :     }
; 177  :     return 0;

	xor	eax, eax
	pop	esi

; 178  : }

	ret	0
_IProcess_Spawn ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\fyp\develop\spartan\source\kernel\thread\process\process.c
_TEXT	SEGMENT
_pcb$ = 8						; size = 4
_IProcess_Run PROC

; 181  :     if (!pcb) return false;

	mov	eax, DWORD PTR _pcb$[esp-4]
	test	eax, eax
	jne	SHORT $LN1@IProcess_R

; 184  : }

	ret	0
$LN1@IProcess_R:

; 182  :     Thread->Run(pcb->ProcessID);

	push	DWORD PTR [eax]
	mov	eax, DWORD PTR _Thread
	call	DWORD PTR [eax+20]

; 183  :     return true;

	xor	eax, eax
	pop	ecx
	inc	eax

; 184  : }

	ret	0
_IProcess_Run ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\fyp\develop\spartan\source\kernel\thread\process\process.c
_TEXT	SEGMENT
_path$ = 8						; size = 4
_IProcess_Fork PROC

; 186  : CPcb *IProcess_Fork(char *path) {

	push	esi

; 187  :     CPcb *pcb = IProcess_Spawn(path);

	push	DWORD PTR _path$[esp]
	call	_IProcess_Spawn
	mov	esi, eax
	pop	ecx

; 188  :     if (!pcb) return false;

	test	esi, esi
	jne	SHORT $LN1@IProcess_F
	pop	esi

; 191  : }

	ret	0
$LN1@IProcess_F:

; 189  :     IProcess_Run(pcb);

	push	esi
	call	_IProcess_Run
	pop	ecx

; 190  :     return pcb;

	mov	eax, esi
	pop	esi

; 191  : }

	ret	0
_IProcess_Fork ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\fyp\develop\spartan\source\kernel\thread\process\process.c
_TEXT	SEGMENT
_path$ = 8						; size = 4
_IProcess_Create PROC

; 200  :     return (CPcb*)SysCall(SYS_FORK,(int)path,0,0,0,0,0);

	mov	edx, DWORD PTR _path$[esp-4]
	sub	esp, 20					; 00000014H
	mov	ecx, 32770				; 00008002H
	call	_SysCall
	add	esp, 20					; 00000014H

; 201  : }

	ret	0
_IProcess_Create ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\fyp\develop\spartan\source\kernel\thread\process\process.c
_TEXT	SEGMENT
_code$ = 8						; size = 4
_IProcess_Exit PROC

; 204  :     Thread->Exit(0);

	mov	eax, DWORD PTR _Thread
	push	0
	call	DWORD PTR [eax+28]
	pop	ecx

; 205  : }

	ret	0
_IProcess_Exit ENDP
_TEXT	ENDS
END
