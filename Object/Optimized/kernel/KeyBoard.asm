; Listing generated by Microsoft (R) Optimizing Compiler Version 18.00.40629.0 

	TITLE	C:\Users\cex123\Desktop\XXXXX\osdev\osdev-216\Source\Kernel\Device\Drivers\KeyBoard.c
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB OLDNAMES

PUBLIC	??_C@_06MMPHGNOC@Qwerty?$AA@			; `string'
PUBLIC	??_C@_06BKOEAEMH@Dvorak?$AA@			; `string'
PUBLIC	??_C@_07FGLBLJOD@Not?5Set?$AA@			; `string'
PUBLIC	??_C@_04NBAFAEBM@?9r?9?9?$AA@			; `string'
PUBLIC	??_C@_0BK@KIEHNOFM@Config?1KeyMaps?1Filter?4bin?$AA@ ; `string'
PUBLIC	??_C@_0BK@DOELONIE@Config?1KeyMaps?1LookUp?4bin?$AA@ ; `string'
PUBLIC	??_C@_0BK@NHEPGGCK@Config?1KeyMaps?1Qwerty?4bin?$AA@ ; `string'
PUBLIC	??_C@_0BK@JPKPPPK@Config?1KeyMaps?1Dvorak?4bin?$AA@ ; `string'
PUBLIC	_KEYMAP
PUBLIC	_Keyboard
EXTRN	__imp__StrCmp:PROC
;	COMDAT ??_C@_0BK@JPKPPPK@Config?1KeyMaps?1Dvorak?4bin?$AA@
CONST	SEGMENT
??_C@_0BK@JPKPPPK@Config?1KeyMaps?1Dvorak?4bin?$AA@ DB 'Config/KeyMaps/Dv'
	DB	'orak.bin', 00H				; `string'
CONST	ENDS
;	COMDAT ??_C@_0BK@NHEPGGCK@Config?1KeyMaps?1Qwerty?4bin?$AA@
CONST	SEGMENT
??_C@_0BK@NHEPGGCK@Config?1KeyMaps?1Qwerty?4bin?$AA@ DB 'Config/KeyMaps/Q'
	DB	'werty.bin', 00H				; `string'
CONST	ENDS
;	COMDAT ??_C@_0BK@DOELONIE@Config?1KeyMaps?1LookUp?4bin?$AA@
CONST	SEGMENT
??_C@_0BK@DOELONIE@Config?1KeyMaps?1LookUp?4bin?$AA@ DB 'Config/KeyMaps/L'
	DB	'ookUp.bin', 00H				; `string'
CONST	ENDS
;	COMDAT ??_C@_0BK@KIEHNOFM@Config?1KeyMaps?1Filter?4bin?$AA@
CONST	SEGMENT
??_C@_0BK@KIEHNOFM@Config?1KeyMaps?1Filter?4bin?$AA@ DB 'Config/KeyMaps/F'
	DB	'ilter.bin', 00H				; `string'
CONST	ENDS
;	COMDAT ??_C@_04NBAFAEBM@?9r?9?9?$AA@
CONST	SEGMENT
??_C@_04NBAFAEBM@?9r?9?9?$AA@ DB '-r--', 00H		; `string'
CONST	ENDS
;	COMDAT ??_C@_07FGLBLJOD@Not?5Set?$AA@
CONST	SEGMENT
??_C@_07FGLBLJOD@Not?5Set?$AA@ DB 'Not Set', 00H	; `string'
CONST	ENDS
;	COMDAT ??_C@_06BKOEAEMH@Dvorak?$AA@
CONST	SEGMENT
??_C@_06BKOEAEMH@Dvorak?$AA@ DB 'Dvorak', 00H		; `string'
CONST	ENDS
;	COMDAT ??_C@_06MMPHGNOC@Qwerty?$AA@
CONST	SEGMENT
??_C@_06MMPHGNOC@Qwerty?$AA@ DB 'Qwerty', 00H		; `string'
_KEYMAP	DD	01H
_keyboard DD	FLAT:_IKeyboard_Flush
	DD	FLAT:_IKeyboard_KeyDown
	DD	FLAT:_IKeyboard_GetLed
	DD	FLAT:_IKeyboard_SetLed
	DD	FLAT:_IKeyboard_GetKeyMap
	DD	FLAT:_IKeyboard_SetKeyMap
_Keyboard DD	FLAT:_keyboard
PUBLIC	_IKeyboard_SetKeyMap
PUBLIC	_IKeyboard_GetKeyMap
PUBLIC	_IKeyboard_GetLed
PUBLIC	_IKeyboard_KeyDown
PUBLIC	_IKeyboard_Flush
PUBLIC	_IKeyboard_SetLed
PUBLIC	_InstallKeyboard
PUBLIC	_EnableKeyboard
	ALIGN	4

_lookup	DD	01H DUP (?)
_prnt	DB	01H DUP (?)
	ALIGN	4

_alt	DB	01H DUP (?)
	ALIGN	4

_pipe	DD	01H DUP (?)
_caplock DB	01H DUP (?)
	ALIGN	4

_filter	DD	01H DUP (?)
?buf@?1??KeyboardIsr@@9@9 DB 04H DUP (?)		; `KeyboardIsr'::`2'::buf
_scrlock DB	01H DUP (?)
	ALIGN	4

_shift	DB	01H DUP (?)
	ALIGN	4

_dvorak	DD	01H DUP (?)
_numlock DB	01H DUP (?)
	ALIGN	4

_qwerty	DD	01H DUP (?)
_keybrd	DB	0100H DUP (?)
_led	DB	01H DUP (?)
	ALIGN	4

_ctrl	DB	01H DUP (?)
	ALIGN	4

_win	DB	01H DUP (?)
_BSS	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-216\source\kernel\device\drivers\keyboard.c
_TEXT	SEGMENT
_base$ = 8						; size = 4
_size$ = 12						; size = 4
_EnableKeyboard PROC

; 179  :     Device->Latch(IRQ_KBD, KeyboardIsr);

	mov	eax, DWORD PTR _Device
	push	OFFSET _KeyboardIsr
	push	33					; 00000021H
	call	DWORD PTR [eax]
	pop	ecx

; 180  :     return true;

	xor	eax, eax
	pop	ecx
	inc	eax

; 181  : }

	ret	0
_EnableKeyboard ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-216\source\kernel\device\drivers\keyboard.c
_TEXT	SEGMENT
_base$ = 8						; size = 4
_size$ = 12						; size = 4
_InstallKeyboard PROC

; 136  :     pipe = (CPipeAsync*)base;

	mov	eax, DWORD PTR _base$[esp-4]
	push	esi
	push	edi

; 137  :     Pipe->CreateAsync(pipe, null, null);

	xor	esi, esi
	mov	DWORD PTR _pipe, eax
	push	esi
	push	esi
	push	eax
	mov	eax, DWORD PTR _Pipe
	call	DWORD PTR [eax+4]

; 138  : 
; 139  :     stosd(keybrd, 0, 256/4);

	push	64					; 00000040H
	push	esi
	push	OFFSET _keybrd
	call	_stosd

; 140  :     pipe->Capacity -= 256;

	mov	eax, DWORD PTR _pipe

; 141  :     pipe->Pointer += 256;
; 142  : 
; 143  :     CFile *file = 0;
; 144  :     file = FileIO->Open("Config/KeyMaps/Filter.bin", "-r--");

	mov	edi, OFFSET ??_C@_04NBAFAEBM@?9r?9?9?$AA@
	push	edi
	push	OFFSET ??_C@_0BK@KIEHNOFM@Config?1KeyMaps?1Filter?4bin?$AA@
	add	DWORD PTR [eax+8], -256			; ffffff00H
	add	DWORD PTR [eax], 256			; 00000100H
	mov	eax, DWORD PTR _FileIO
	call	DWORD PTR [eax+12]
	mov	esi, eax
	add	esp, 32					; 00000020H

; 145  :     if (!file) {

	test	esi, esi
	jne	SHORT $LN16@InstallKey
$LN19@InstallKey:

; 146  :         Logger(" [FAIL] FileIO->Open(Config/KeyMaps/Filter.bin, -r--);");
; 147  :         return false;

	xor	eax, eax
	jmp	$LN17@InstallKey
$LN16@InstallKey:

; 148  :     }
; 149  :     filter = FileIO->Base(file);

	mov	eax, DWORD PTR _FileIO
	push	esi
	call	DWORD PTR [eax+36]
	mov	DWORD PTR _filter, eax

; 150  :     FileIO->Close(file);

	mov	eax, DWORD PTR _FileIO
	push	esi
	call	DWORD PTR [eax+16]

; 151  : 
; 152  :     file = FileIO->Open("Config/KeyMaps/LookUp.bin", "-r--");

	mov	eax, DWORD PTR _FileIO
	push	edi
	push	OFFSET ??_C@_0BK@DOELONIE@Config?1KeyMaps?1LookUp?4bin?$AA@
	call	DWORD PTR [eax+12]
	mov	esi, eax
	add	esp, 16					; 00000010H

; 153  :     if (!file) {

	test	esi, esi
	je	SHORT $LN19@InstallKey

; 154  :         Logger(" [FAIL] FileIO->Open(Config/KeyMaps/LookUp.bin, -r--);");
; 155  :         return false;
; 156  :     }
; 157  :     lookup = FileIO->Base(file);

	mov	eax, DWORD PTR _FileIO
	push	esi
	call	DWORD PTR [eax+36]
	mov	DWORD PTR _lookup, eax

; 158  :     FileIO->Close(file);

	mov	eax, DWORD PTR _FileIO
	push	esi
	call	DWORD PTR [eax+16]

; 159  : 
; 160  :     file = FileIO->Open("Config/KeyMaps/Qwerty.bin", "-r--");

	mov	eax, DWORD PTR _FileIO
	push	edi
	push	OFFSET ??_C@_0BK@NHEPGGCK@Config?1KeyMaps?1Qwerty?4bin?$AA@
	call	DWORD PTR [eax+12]
	mov	esi, eax
	add	esp, 16					; 00000010H

; 161  :     if (!file) {

	test	esi, esi
	je	SHORT $LN19@InstallKey

; 162  :         Logger(" [FAIL] FileIO->Open(Config/KeyMaps/Qwerty.bin, -r--);");
; 163  :         return false;
; 164  :     }
; 165  :     qwerty = FileIO->Base(file);

	mov	eax, DWORD PTR _FileIO
	push	esi
	call	DWORD PTR [eax+36]
	mov	DWORD PTR _qwerty, eax

; 166  :     FileIO->Close(file);

	mov	eax, DWORD PTR _FileIO
	push	esi
	call	DWORD PTR [eax+16]

; 167  : 
; 168  :     file = FileIO->Open("Config/KeyMaps/Dvorak.bin", "-r--");

	mov	eax, DWORD PTR _FileIO
	push	edi
	push	OFFSET ??_C@_0BK@JPKPPPK@Config?1KeyMaps?1Dvorak?4bin?$AA@
	call	DWORD PTR [eax+12]
	mov	esi, eax
	add	esp, 16					; 00000010H

; 169  :     if (!file) {

	test	esi, esi
	je	$LN19@InstallKey

; 170  :         Logger(" [FAIL] FileIO->Open(Config/KeyMaps/Dvorak.bin, -r--);");
; 171  :         return false;
; 172  :     }
; 173  :     dvorak = FileIO->Base(file);

	mov	eax, DWORD PTR _FileIO
	push	esi
	call	DWORD PTR [eax+36]
	mov	DWORD PTR _dvorak, eax

; 174  :     FileIO->Close(file);

	mov	eax, DWORD PTR _FileIO
	push	esi
	call	DWORD PTR [eax+16]
	pop	ecx

; 175  :     return true;

	xor	eax, eax
	pop	ecx
	inc	eax
$LN17@InstallKey:

; 176  : }

	pop	edi
	pop	esi
	ret	0
_InstallKeyboard ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-216\source\kernel\device\drivers\keyboard.c
_TEXT	SEGMENT
_toggle$ = 8						; size = 4
_IKeyboard_SetLed PROC

; 38   :     Ps2Command(0xED, led = toggle & 7);

	mov	eax, DWORD PTR _toggle$[esp-4]
	and	al, 7
	mov	BYTE PTR _led, al
	call	_Ps2Command

; 39   :     return true;

	xor	eax, eax
	inc	eax

; 40   : }

	ret	0
_IKeyboard_SetLed ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-216\source\kernel\device\drivers\keyboard.c
_TEXT	SEGMENT
_IKeyboard_Flush PROC

; 43   :     if (~inb(PS2_STATUS) & PS2_DATA_FULL) return;

	push	100					; 00000064H
	call	_inb
	not	eax
	pop	ecx
	test	al, 1
	jne	SHORT $LN14@IKeyboard_

; 44   :     char scan = inb(PS2_DATA);

	push	edi
	push	96					; 00000060H
	call	_inb

; 45   :     if (scan != 0xE0) return;

	movsx	eax, al
	mov	edi, 224				; 000000e0H
	pop	ecx
	cmp	eax, edi
	jne	SHORT $LN15@IKeyboard_

; 46   :     for (int i = 0; i < 1*KHz; i++) {

	push	esi
	xor	esi, esi
$LL4@IKeyboard_:

; 47   :         if (inb(PS2_DATA) != 0xE0) break;

	push	96					; 00000060H
	call	_inb
	pop	ecx
	cmp	eax, edi
	jne	SHORT $LN16@IKeyboard_

; 46   :     for (int i = 0; i < 1*KHz; i++) {

	inc	esi
	cmp	esi, 1000				; 000003e8H
	jl	SHORT $LL4@IKeyboard_
$LN16@IKeyboard_:
	pop	esi
$LN15@IKeyboard_:
	pop	edi
$LN14@IKeyboard_:

; 48   :     }
; 49   : }

	ret	0
_IKeyboard_Flush ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-216\source\kernel\device\drivers\keyboard.c
_TEXT	SEGMENT
_scancode$ = 8						; size = 4
_IKeyboard_KeyDown PROC

; 52   :     return true;

	xor	eax, eax
	inc	eax

; 53   : }

	ret	0
_IKeyboard_KeyDown ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-216\source\kernel\device\drivers\keyboard.c
_TEXT	SEGMENT
_IKeyboard_GetLed PROC

; 56   :     return led;

	movzx	eax, BYTE PTR _led

; 57   : }

	ret	0
_IKeyboard_GetLed ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-216\source\kernel\device\drivers\keyboard.c
_TEXT	SEGMENT
_IKeyboard_GetKeyMap PROC

; 61   :     if (KEYMAP == 0x01) return "Qwerty";

	mov	eax, DWORD PTR _KEYMAP
	cmp	eax, 1
	jne	SHORT $LN2@IKeyboard_
	mov	eax, OFFSET ??_C@_06MMPHGNOC@Qwerty?$AA@

; 64   : }

	ret	0
$LN2@IKeyboard_:

; 62   :     if (KEYMAP == 0x02) return "Dvorak";

	cmp	eax, 2
	mov	eax, OFFSET ??_C@_06BKOEAEMH@Dvorak?$AA@
	je	SHORT $LN3@IKeyboard_

; 63   :     return "Not Set";

	mov	eax, OFFSET ??_C@_07FGLBLJOD@Not?5Set?$AA@
$LN3@IKeyboard_:

; 64   : }

	ret	0
_IKeyboard_GetKeyMap ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-216\source\kernel\device\drivers\keyboard.c
_TEXT	SEGMENT
_layout$ = 8						; size = 4
_IKeyboard_SetKeyMap PROC

; 67   :     if (StrCmp(layout, "Qwerty") == 0) KEYMAP = 0x01;

	push	OFFSET ??_C@_06MMPHGNOC@Qwerty?$AA@
	push	DWORD PTR _layout$[esp]
	call	DWORD PTR __imp__StrCmp
	pop	ecx
	pop	ecx
	test	eax, eax
	jne	SHORT $LN2@IKeyboard_
	mov	DWORD PTR _KEYMAP, 1
$LN2@IKeyboard_:

; 68   :     if (StrCmp(layout, "Dvorak") == 0) KEYMAP = 0x02;

	push	OFFSET ??_C@_06BKOEAEMH@Dvorak?$AA@
	push	DWORD PTR _layout$[esp]
	call	DWORD PTR __imp__StrCmp
	pop	ecx
	pop	ecx
	test	eax, eax
	jne	SHORT $LN1@IKeyboard_
	mov	DWORD PTR _KEYMAP, 2
$LN1@IKeyboard_:

; 69   :     return true;

	xor	eax, eax
	inc	eax

; 70   : }

	ret	0
_IKeyboard_SetKeyMap ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\xxxxx\osdev\osdev-216\source\kernel\device\drivers\keyboard.c
_TEXT	SEGMENT
_ctrl$1$ = -13						; size = 1
_down$1$ = -13						; size = 1
_scan$1$ = -12						; size = 1
_key$2$ = -11						; size = 1
_shift$1$ = -10						; size = 1
_alt$1$ = -9						; size = 1
_packet$ = -8						; size = 8
_err$ = 8						; size = 4
_esp$ = 12						; size = 4
_KeyboardIsr PROC

; 72   : static u32 KeyboardIsr(u32 err, u32 esp) {

	sub	esp, 16					; 00000010H

; 73   :     static u8 buf[4];
; 74   :     buf[3] = buf[2];

	mov	al, BYTE PTR ?buf@?1??KeyboardIsr@@9@9+2
	mov	BYTE PTR ?buf@?1??KeyboardIsr@@9@9+3, al

; 75   :     buf[2] = buf[1];

	mov	al, BYTE PTR ?buf@?1??KeyboardIsr@@9@9+1
	mov	BYTE PTR ?buf@?1??KeyboardIsr@@9@9+2, al

; 76   :     buf[1] = buf[0];

	mov	al, BYTE PTR ?buf@?1??KeyboardIsr@@9@9

; 77   :     buf[0] = inb(PS2_DATA);

	push	96					; 00000060H
	mov	BYTE PTR ?buf@?1??KeyboardIsr@@9@9+1, al
	call	_inb
	pop	ecx
	mov	cl, al
	mov	BYTE PTR _scan$1$[esp+16], cl
	mov	BYTE PTR ?buf@?1??KeyboardIsr@@9@9, cl

; 78   : 
; 79   :     switch (buf[0]) {

	cmp	cl, 224					; 000000e0H
	jb	SHORT $LN12@KeyboardIs
	cmp	cl, 225					; 000000e1H
	jbe	$LN10@KeyboardIs
	cmp	cl, 250					; 000000faH
	jne	SHORT $LN12@KeyboardIs

; 80   :     case 0xFA: outb(PS2_DATA, 0xFA);

	push	250					; 000000faH
	push	96					; 00000060H
	call	_outb
	pop	ecx
	pop	ecx

; 81   :     case 0xE0:
; 82   :     case 0xE1: return esp;

	jmp	$LN10@KeyboardIs
$LN12@KeyboardIs:

; 83   :     }
; 84   :     if (buf[1] == 0xE1) return esp;

	mov	dl, BYTE PTR ?buf@?1??KeyboardIsr@@9@9+1
	cmp	dl, 225					; 000000e1H
	je	$LN10@KeyboardIs

; 85   : 
; 86   :     u8 scan  = buf[0];
; 87   :     u8 down  = (scan & 0x80) ? 0 : 1;

	push	ebx
	mov	al, cl

; 88   :     u8 key   = (scan & 0x7F);

	mov	bh, cl
	shr	al, 7
	and	bh, 127					; 0000007fH
	push	ebp
	not	al
	and	al, 1
	mov	BYTE PTR _down$1$[esp+24], al
	push	esi
	push	edi

; 89   :     if (buf[1] == 0xE0) key += 0x80;

	cmp	dl, 224					; 000000e0H
	jne	SHORT $LN8@KeyboardIs
	sub	bh, -128				; ffffff80H
$LN8@KeyboardIs:

; 90   :     if (buf[2] == 0xE1) key  = 0xC0;

	cmp	BYTE PTR ?buf@?1??KeyboardIsr@@9@9+2, 225 ; 000000e1H
	jne	SHORT $LN7@KeyboardIs
	mov	bh, 192					; 000000c0H
$LN7@KeyboardIs:

; 91   : 
; 92   :     u8 toggle = led;

	mov	cl, BYTE PTR _led
	mov	bl, cl

; 93   :     if (down) {

	test	al, al
	je	SHORT $LN2@KeyboardIs

; 94   :         if (key == 0x3A) toggle ^= PS2_CAPLOCK;

	cmp	bh, 58					; 0000003aH
	jne	SHORT $LN5@KeyboardIs
	xor	bl, 4
$LN5@KeyboardIs:

; 95   :         if (key == 0x45) toggle ^= PS2_NUMLOCK;

	cmp	bh, 69					; 00000045H
	jne	SHORT $LN4@KeyboardIs
	xor	bl, 2
$LN4@KeyboardIs:

; 96   :         if (key == 0x46) toggle ^= PS2_SCRLOCK;

	cmp	bh, 70					; 00000046H
	jne	SHORT $LN3@KeyboardIs
	xor	bl, 1
$LN3@KeyboardIs:

; 97   :         if (led != toggle) IKeyboard_SetLed(led = toggle);

	cmp	cl, bl
	je	SHORT $LN2@KeyboardIs
	movzx	eax, bl
	push	eax
	mov	BYTE PTR _led, bl
	call	_IKeyboard_SetLed
	pop	ecx
$LN2@KeyboardIs:

; 98   :     }
; 99   :     key = filter[key];

	mov	eax, DWORD PTR _filter

; 100  :     keybrd[key] = down;
; 101  : 
; 102  :     keybrd[KEY_NUMLOCK]  = (toggle & PS2_NUMLOCK) ? 1 : 0;

	xor	edx, edx
	movzx	ecx, bh
	inc	edx
	mov	bh, BYTE PTR _down$1$[esp+32]

; 103  :     keybrd[KEY_CAPSLOCK] = (toggle & PS2_CAPLOCK) ? 1 : 0;
; 104  :     keybrd[KEY_SCRLLOCK] = (toggle & PS2_SCRLOCK) ? 1 : 0;
; 105  : 
; 106  : 	numlock = keybrd[KEY_NUMLOCK ];
; 107  : 	caplock = keybrd[KEY_CAPSLOCK];
; 108  : 	scrlock = keybrd[KEY_SCRLLOCK];
; 109  : 	ctrl    = keybrd[KEY_LCTRL ] | keybrd[KEY_RCTRL ];
; 110  : 	shift   = keybrd[KEY_LSHIFT] | keybrd[KEY_RSHIFT];
; 111  : 	alt     = keybrd[KEY_LALT  ] | keybrd[KEY_RALT  ];
; 112  : 	win     = keybrd[KEY_LWIN  ] | keybrd[KEY_RWIN  ];
; 113  : 	prnt    = keybrd[KEY_PRINT ];
; 114  : 
; 115  :     u8 *keymap = (KEYMAP == 0x01) ? qwerty : dvorak;

	mov	esi, DWORD PTR _qwerty
	mov	al, BYTE PTR [ecx+eax]
	mov	cl, bl
	movzx	ebp, al
	mov	ch, bl
	mov	BYTE PTR _key$2$[esp+32], al
	and	bl, dl
	mov	BYTE PTR _scrlock, bl
	shr	cl, 1
	mov	BYTE PTR _keybrd[ebp], bh
	and	cl, dl
	mov	al, BYTE PTR _keybrd+79
	or	al, BYTE PTR _keybrd+78
	mov	BYTE PTR _ctrl$1$[esp+32], al
	mov	BYTE PTR _ctrl, al
	mov	al, BYTE PTR _keybrd+75
	or	al, BYTE PTR _keybrd+74
	mov	BYTE PTR _alt$1$[esp+32], al
	mov	BYTE PTR _alt, al
	mov	al, BYTE PTR _keybrd+73
	or	al, BYTE PTR _keybrd+72
	mov	BYTE PTR _keybrd+83, bl
	mov	bl, BYTE PTR _keybrd+77
	or	bl, BYTE PTR _keybrd+76
	shr	ch, 2
	and	ch, dl
	mov	BYTE PTR _win, al
	mov	al, BYTE PTR _keybrd+80
	mov	BYTE PTR _keybrd+82, cl
	mov	BYTE PTR _keybrd+81, ch
	mov	BYTE PTR _numlock, cl
	mov	BYTE PTR _caplock, ch
	mov	BYTE PTR _shift$1$[esp+32], bl
	mov	BYTE PTR _shift, bl
	mov	BYTE PTR _prnt, al
	cmp	DWORD PTR _KEYMAP, edx
	je	SHORT $LN17@KeyboardIs
	mov	esi, DWORD PTR _dvorak
$LN17@KeyboardIs:

; 116  :     char ascii = keymap[key + shift*128 + numlock*256];

	movzx	edx, cl
	add	edx, edx
	movzx	edi, bl
	lea	eax, DWORD PTR [edx+edi]
	shl	eax, 7
	add	eax, ebp
	mov	bl, BYTE PTR [eax+esi]

; 117  :     if (caplock && (lookup[ascii] & (UPPER|LOWER))) {

	test	ch, ch
	je	SHORT $LN1@KeyboardIs
	mov	eax, DWORD PTR _lookup
	movsx	ecx, bl
	test	BYTE PTR [ecx+eax], 6
	je	SHORT $LN1@KeyboardIs

; 118  :         ascii = keymap[key + (1-shift)*128 + numlock*256];

	sub	edx, edi
	inc	edx
	shl	edx, 7
	add	edx, ebp
	mov	bl, BYTE PTR [edx+esi]
$LN1@KeyboardIs:

; 119  :     }
; 120  : 
; 121  :     //Debug(" [KBD] S=%X K=%X A=%X (%c)\n", scan, key, ascii, ascii);
; 122  :     u8 packet[8];
; 123  :     packet[0] = scan;

	mov	al, BYTE PTR _scan$1$[esp+32]
	mov	BYTE PTR _packet$[esp+32], al

; 124  :     packet[1] = down;
; 125  :     packet[2] = key;

	mov	al, BYTE PTR _key$2$[esp+32]
	mov	BYTE PTR _packet$[esp+34], al

; 126  :     packet[3] = ascii;
; 127  :     packet[4] = ctrl;

	mov	al, BYTE PTR _ctrl$1$[esp+32]
	mov	BYTE PTR _packet$[esp+36], al

; 128  :     packet[5] = shift;

	mov	al, BYTE PTR _shift$1$[esp+32]
	mov	BYTE PTR _packet$[esp+37], al

; 129  :     packet[6] = alt;

	mov	al, BYTE PTR _alt$1$[esp+32]
	mov	BYTE PTR _packet$[esp+38], al

; 130  :     packet[7] = led;

	mov	al, BYTE PTR _led
	mov	BYTE PTR _packet$[esp+39], al

; 131  :     Pipe->WriteAsync(pipe, packet, 8);

	lea	eax, DWORD PTR _packet$[esp+32]
	push	8
	push	eax
	mov	eax, DWORD PTR _Pipe
	push	DWORD PTR _pipe
	mov	BYTE PTR _packet$[esp+45], bh
	mov	BYTE PTR _packet$[esp+47], bl
	call	DWORD PTR [eax+32]
	add	esp, 12					; 0000000cH
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
$LN10@KeyboardIs:

; 132  :     return esp;

	mov	eax, DWORD PTR _esp$[esp+12]

; 133  : }

	add	esp, 16					; 00000010H
	ret	0
_KeyboardIsr ENDP
_TEXT	ENDS
END
