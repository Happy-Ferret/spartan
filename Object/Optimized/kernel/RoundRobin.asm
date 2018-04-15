; Listing generated by Microsoft (R) Optimizing Compiler Version 18.00.40629.0 

	TITLE	C:\Users\cex123\Desktop\XXXXX\osdev\osdev-216\Source\Kernel\Thread\Scheduler\RoundRobin.c
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB OLDNAMES

PUBLIC	_RoundRobin
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-216\source\kernel\thread\scheduler\roundrobin.c
_TEXT	SEGMENT
_RoundRobin PROC
; _err$dead$ = ecx
; _esp$ = edx

; 8    :     CTask *TaskPool = (CTask*)MMAP_TASKPOOL;
; 9    :     int prev = TaskPool->ReadyQ[TaskPool->ReadyHead];

	mov	eax, DWORD PTR ds:1716
	mov	ecx, DWORD PTR ds:1704
	push	esi
	push	edi
	mov	edi, edx
	mov	esi, DWORD PTR [ecx+eax*4]

; 10   :     TaskPool->ReadyHead = (++TaskPool->ReadyHead) % TaskPool->ReadyTail;

	inc	eax
	mov	DWORD PTR ds:1716, eax
	cdq
	idiv	DWORD PTR ds:1720

; 11   :     int next = TaskPool->ReadyQ[TaskPool->ReadyHead];
; 12   :     TaskPool->CtxList[prev] = esp;

	mov	eax, DWORD PTR ds:1692
	mov	DWORD PTR ds:1716, edx
	mov	ecx, DWORD PTR [ecx+edx*4]
	mov	DWORD PTR [eax+esi*4], edi

; 13   :     int ctx = TaskPool->CtxList[next];

	mov	eax, DWORD PTR ds:1692
	pop	edi
	pop	esi
	mov	eax, DWORD PTR [eax+ecx*4]

; 14   :     TaskPool->Tss->esp0 = ctx + 0x3C;

	mov	ecx, DWORD PTR ds:1668
	lea	edx, DWORD PTR [eax+60]
	mov	DWORD PTR [ecx+4], edx

; 15   : 
; 16   :     /*
; 17   :     if (fpu|sse) clts();
; 18   :     if (fpu) {
; 19   :         fnsave ((float*)(esp + 0x0140));
; 20   :         frstor ((float*)(ctx + 0x0140));
; 21   :     }
; 22   :     if (sse) {
; 23   :         fxsave ((float*)(esp + 0x0240));
; 24   :         fxrstor((float*)(ctx + 0x0240));
; 25   :     }
; 26   :     */
; 27   :     return ctx;
; 28   : }

	ret	0
_RoundRobin ENDP
_TEXT	ENDS
END
