; Listing generated by Microsoft (R) Optimizing Compiler Version 18.00.40629.0 

	TITLE	C:\Users\cex123\Desktop\XXXXX\osdev\osdev-216\source\Kernel\Monitor\SysCall.c
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB OLDNAMES

EXTRN	_int386:PROC
PUBLIC	_DoSysCall
PUBLIC	_SysCall
PUBLIC	_EnableSysCalls
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-216\source\kernel\monitor\syscall.c
_TEXT	SEGMENT
_EnableSysCalls PROC

; 40   :     Device->Latch(0x80, DoSysCall);

	mov	eax, DWORD PTR _Device
	push	OFFSET _DoSysCall
	push	128					; 00000080H
	call	DWORD PTR [eax]
	pop	ecx

; 41   :     return true;

	xor	eax, eax
	pop	ecx
	inc	eax

; 42   : }

	ret	0
_EnableSysCalls ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-216\source\kernel\monitor\syscall.c
_TEXT	SEGMENT
_reg$ = -32						; size = 32
_ecx$dead$ = 8						; size = 4
_edx$dead$ = 12						; size = 4
_ebp$dead$ = 16						; size = 4
_esi$dead$ = 20						; size = 4
_edi$dead$ = 24						; size = 4
_SysCall PROC
; _eax$ = ecx
; _ebx$ = edx

; 14   : int SysCall(int eax, int ebx, int ecx, int edx, int ebp, int esi, int edi) {

	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H

; 15   :     REG32 reg;
; 16   :     reg.eax = eax;
; 17   :     reg.ebx = ebx;
; 18   :     reg.ecx = ecx;

	xor	eax, eax
	mov	DWORD PTR _reg$[ebp], ecx
	mov	DWORD PTR _reg$[ebp+4], eax

; 19   :     reg.edx = edx;

	mov	DWORD PTR _reg$[ebp+8], eax

; 20   :     reg.ebp = ebp;

	mov	DWORD PTR _reg$[ebp+20], eax

; 21   :     reg.esi = esi;

	mov	DWORD PTR _reg$[ebp+24], eax

; 22   :     reg.edi = edi;

	mov	DWORD PTR _reg$[ebp+28], eax

; 23   :     return int386(0x80, &reg);

	lea	eax, DWORD PTR _reg$[ebp]
	push	eax
	push	128					; 00000080H
	mov	DWORD PTR _reg$[ebp+12], edx
	call	_int386
	pop	ecx
	pop	ecx

; 24   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_SysCall ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-216\source\kernel\monitor\syscall.c
_TEXT	SEGMENT
_x$ = -4						; size = 4
_err$ = 8						; size = 4
_esp$ = 12						; size = 4
_DoSysCall PROC

; 26   : u32 DoSysCall(u32 err, u32 esp) {

	push	ebp
	mov	ebp, esp
	push	ecx

; 27   :     REG32 *x;
; 28   :     _asm mov [x], eax

	mov	DWORD PTR _x$[ebp], eax

; 29   : 
; 30   :     switch (x->eax) {

	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx]
	sub	eax, 32768				; 00008000H
	je	SHORT $LN4@DoSysCall
	dec	eax
	je	SHORT $LN3@DoSysCall
	dec	eax
	je	SHORT $LN2@DoSysCall
	dec	eax
	jne	SHORT $LN13@DoSysCall

; 34   :     case SYS_BLIT:        SysCall_Blit((int*)x->ebx);      break;

	mov	ecx, DWORD PTR [ecx+12]
	call	_SysCall_Blit
$LN13@DoSysCall:
	mov	ecx, DWORD PTR _esp$[ebp]
	jmp	SHORT $LN5@DoSysCall
$LN2@DoSysCall:

; 33   :     case SYS_FORK:  esp = DoFork(err, esp, (char*)x->ebx); break;

	push	DWORD PTR [ecx+12]
	call	_IProcess_Fork
	pop	ecx
	mov	ecx, DWORD PTR _esp$[ebp]
	mov	DWORD PTR [ecx+36], eax
	jmp	SHORT $LN5@DoSysCall
$LN3@DoSysCall:

; 32   :     case SYS_KILL:  esp = DoKill(err, esp);                break;

	mov	edx, DWORD PTR _esp$[ebp]
	call	_DoKill
	jmp	SHORT $LN14@DoSysCall
$LN4@DoSysCall:

; 31   :     case SYS_YIELD: esp = DoYield(err, esp);               break;

	mov	edx, DWORD PTR _esp$[ebp]
	call	_RoundRobin
$LN14@DoSysCall:
	mov	ecx, eax
$LN5@DoSysCall:

; 35   :     }
; 36   :     return esp;

	mov	eax, ecx

; 37   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_DoSysCall ENDP
_TEXT	ENDS
END
