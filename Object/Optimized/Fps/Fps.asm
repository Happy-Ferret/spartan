; Listing generated by Microsoft (R) Optimizing Compiler Version 18.00.40629.0 

	TITLE	C:\Users\cex123\Desktop\XXXXX\osdev\osdev-211\Source\Applications\Fps\Fps.c
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB MSVCRT
INCLUDELIB OLDNAMES

_DATA	SEGMENT
COMM	_keybrd:BYTE:0100H
_DATA	ENDS
PUBLIC	_OnKeyDown
PUBLIC	_OnKeyUp
PUBLIC	_OnLoad
PUBLIC	_FpsProc
PUBLIC	_main
PUBLIC	_start
PUBLIC	??_C@_03DACHGFGH@Fps?$AA@			; `string'
EXTRN	_Reset:PROC
EXTRN	_Game:PROC
EXTRN	__imp__Thread:DWORD
EXTRN	__imp__Window:DWORD
EXTRN	__imp__Canvas:DWORD
EXTRN	__imp__Event:DWORD
_BSS	SEGMENT
?evt@?3??main@@9@9 DB 080H DUP (?)			; `main'::`4'::evt
_BSS	ENDS
;	COMDAT ??_C@_03DACHGFGH@Fps?$AA@
CONST	SEGMENT
??_C@_03DACHGFGH@Fps?$AA@ DB 'Fps', 00H			; `string'
CONST	ENDS
; Function compile flags: /Ogtpy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-211\source\applications\fps\fps.c
_TEXT	SEGMENT
_start	PROC

; 91   :     Thread->Exit(main());

	mov	eax, DWORD PTR __imp__Thread
	push	esi
	mov	esi, DWORD PTR [eax]
	call	_main
	push	eax
	mov	eax, DWORD PTR [esi+28]
	call	eax
	add	esp, 4
	pop	esi

; 92   : }

	ret	0
_start	ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-211\source\applications\fps\fps.c
_TEXT	SEGMENT
_main	PROC

; 65   : int main(void) {

	push	ebx
	push	esi

; 66   :     if (!Reset(11,13,17)) return -1;

	push	17					; 00000011H
	push	13					; 0000000dH
	push	11					; 0000000bH
	call	_Reset
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	SHORT $LN6@main
	or	eax, -1

; 87   :     return 0;
; 88   : }

	pop	esi
	pop	ebx
	ret	0
$LN6@main:

; 67   :     CWindow *frame = Window->Create(nullptr, FpsProc);

	mov	eax, DWORD PTR __imp__Window
	push	edi
	push	OFFSET _FpsProc
	push	0
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+8]
	call	eax
	mov	edi, eax
	add	esp, 8

; 68   :     if (!frame) return -1;

	test	edi, edi
	jne	SHORT $LN5@main

; 87   :     return 0;
; 88   : }

	pop	edi
	pop	esi
	or	eax, -1
	pop	ebx
	ret	0
$LN5@main:

; 69   : 
; 70   :     CCanvas *canvas = frame->Canvas;
; 71   :     CWindow *parent = frame->Parent;

	mov	eax, DWORD PTR __imp__Window
	mov	esi, DWORD PTR [edi+32]
	mov	ebx, DWORD PTR [edi+36]

; 72   :     Window->Redraw(parent);

	push	esi
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+40]
	call	eax

; 73   :     Canvas->Flip(canvas);

	mov	eax, DWORD PTR __imp__Canvas
	push	ebx
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+60]
	call	eax

; 74   :     Window->Redraw(parent);

	mov	eax, DWORD PTR __imp__Window
	push	esi
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+40]
	call	eax

; 75   :     Canvas->Flip(canvas);

	mov	eax, DWORD PTR __imp__Canvas
	push	ebx
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+60]
	call	eax
	add	esp, 16					; 00000010H

; 76   : 
; 77   :     for (int y = 0;;) {

	xor	esi, esi
	npad	3
$LL4@main:

; 78   :         static CEvent evt;
; 79   :         while (Event->PeekEvent(&evt)) {

	mov	eax, DWORD PTR __imp__Event
	push	OFFSET ?evt@?3??main@@9@9
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+16]
	call	eax
	add	esp, 4
	test	eax, eax
	je	SHORT $LN1@main
	npad	8
$LL2@main:

; 80   :             Event->HandleEvent(&evt);

	mov	eax, DWORD PTR __imp__Event
	push	OFFSET ?evt@?3??main@@9@9
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+20]
	call	eax
	mov	eax, DWORD PTR __imp__Event
	push	OFFSET ?evt@?3??main@@9@9
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+16]
	call	eax
	add	esp, 8
	test	eax, eax
	jne	SHORT $LL2@main
$LN1@main:

; 81   :         }
; 82   : 
; 83   :         y = Game(frame, keybrd, y);

	push	esi
	push	OFFSET _keybrd
	push	edi
	call	_Game

; 84   :         Canvas->Flip(canvas);

	mov	ecx, DWORD PTR __imp__Canvas
	mov	esi, eax
	push	ebx
	mov	ecx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR [ecx+60]
	call	ecx

; 85   :         Thread->Yield();

	mov	ecx, DWORD PTR __imp__Thread
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR [ecx+24]
	call	ecx

; 86   :     }

	jmp	SHORT $LL4@main
_main	ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-211\source\applications\fps\fps.c
_TEXT	SEGMENT
_win$ = 8						; size = 4
_evt$ = 12						; size = 4
_FpsProc PROC

; 57   :     switch (evt->Code) {

	mov	ecx, DWORD PTR _evt$[esp-4]
	mov	eax, DWORD PTR [ecx+16]
	dec	eax
	je	SHORT $LN3@FpsProc
	sub	eax, 9
	je	SHORT $LN1@FpsProc
	dec	eax
	jne	SHORT $LN16@FpsProc

; 59   :     case EVT_ONKEYDOWN: return OnKeyDown(win, evt);

	movzx	eax, BYTE PTR [ecx+22]
	mov	BYTE PTR _keybrd[eax], 1
	mov	eax, 1

; 61   :     }
; 62   :     return true;
; 63   : }

	ret	0
$LN1@FpsProc:

; 60   :     case EVT_ONKEYUP:   return OnKeyUp(win, evt);

	movzx	eax, BYTE PTR [ecx+22]
	mov	BYTE PTR _keybrd[eax], 0
	mov	eax, 1

; 61   :     }
; 62   :     return true;
; 63   : }

	ret	0
$LN3@FpsProc:

; 58   :     case EVT_ONLOAD:    return OnLoad(win, evt);

	mov	eax, DWORD PTR _win$[esp-4]
	mov	eax, DWORD PTR [eax+36]
	test	eax, eax
	jne	SHORT $LN9@FpsProc
$LN17@FpsProc:
	xor	eax, eax

; 61   :     }
; 62   :     return true;
; 63   : }

	ret	0

; 58   :     case EVT_ONLOAD:    return OnLoad(win, evt);

$LN9@FpsProc:
	mov	eax, DWORD PTR [eax+12]
	test	eax, eax
	je	SHORT $LN17@FpsProc
	mov	DWORD PTR [eax+52], OFFSET ??_C@_03DACHGFGH@Fps?$AA@
$LN16@FpsProc:
	mov	eax, 1

; 61   :     }
; 62   :     return true;
; 63   : }

	ret	0
_FpsProc ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-211\source\applications\fps\fps.c
_TEXT	SEGMENT
_win$ = 8						; size = 4
_evt$ = 12						; size = 4
_OnLoad	PROC

; 27   :     CCanvas *canvas = win->Canvas;

	mov	eax, DWORD PTR _win$[esp-4]
	mov	eax, DWORD PTR [eax+36]

; 28   :     if (!canvas) return false;

	test	eax, eax
	jne	SHORT $LN2@OnLoad
$LN5@OnLoad:
	xor	eax, eax

; 54   : }

	ret	0
$LN2@OnLoad:

; 29   :     CWindow *frame = canvas->BtmMost;

	mov	eax, DWORD PTR [eax+12]

; 30   :     if (!frame) return false;

	test	eax, eax
	je	SHORT $LN5@OnLoad

; 31   :     frame->Title = "Fps";

	mov	DWORD PTR [eax+52], OFFSET ??_C@_03DACHGFGH@Fps?$AA@

; 32   : 
; 33   :     /*
; 34   :     if (frame->CallBack) {
; 35   :         win->Wide = 640;
; 36   :         win->High = 480;
; 37   : 
; 38   :         static CEvent blank;
; 39   :         CEvtArea *area = (CEvtArea*)&blank;
; 40   :         stosd(&blank, 0, sizeof(CEvent)/4);
; 41   :         area->Source = win;
; 42   :         area->Target = frame;
; 43   :         area->Code   = EVT_ONSIZE;
; 44   :         area->Wide   = win->Wide + 16;
; 45   :         area->High   = win->High + 40;
; 46   :         area->PosX   = canvas->ResX/2 - area->Wide/2;
; 47   :         area->PosY   = canvas->ResY/2 - area->High/2;
; 48   :         frame->CallBack(frame, area);
; 49   :         area->Code   = EVT_ONMOVE;
; 50   :         frame->CallBack(frame, area);
; 51   :     }
; 52   :     */
; 53   :     return true;

	mov	eax, 1

; 54   : }

	ret	0
_OnLoad	ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-211\source\applications\fps\fps.c
_TEXT	SEGMENT
_win$ = 8						; size = 4
_evt$ = 12						; size = 4
_OnKeyUp PROC

; 21   :     CEvtKey *key = (CEvtKey*)evt;
; 22   :     keybrd[key->Key] = false;

	mov	eax, DWORD PTR _evt$[esp-4]
	movzx	eax, BYTE PTR [eax+22]
	mov	BYTE PTR _keybrd[eax], 0

; 23   :     return true;

	mov	eax, 1

; 24   : }

	ret	0
_OnKeyUp ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-211\source\applications\fps\fps.c
_TEXT	SEGMENT
_win$ = 8						; size = 4
_evt$ = 12						; size = 4
_OnKeyDown PROC

; 15   :     CEvtKey *key = (CEvtKey*)evt;
; 16   :     keybrd[key->Key] = true;

	mov	eax, DWORD PTR _evt$[esp-4]
	movzx	eax, BYTE PTR [eax+22]
	mov	BYTE PTR _keybrd[eax], 1

; 17   :     return true;

	mov	eax, 1

; 18   : }

	ret	0
_OnKeyDown ENDP
_TEXT	ENDS
END
