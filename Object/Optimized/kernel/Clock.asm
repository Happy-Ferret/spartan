; Listing generated by Microsoft (R) Optimizing Compiler Version 18.00.40629.0 

	TITLE	C:\Users\cex123\Desktop\FYP\develop\spartan\Source\Kernel\Device\Drivers\Clock.c
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB OLDNAMES

PUBLIC	_clock
PUBLIC	_Clock
EXTRN	_cmpsb:PROC
EXTRN	_movsb:PROC
COMM	_seconds:DWORD
COMM	_hz:DWORD
COMM	_ticks:DWORD
COMM	_timestamp:DWORD
_DATA	ENDS
	ORG $+2
?cmos@?1??IClock_CmosDate@@9@9 DB 00H, 02H, 04H, 07H, 08H, 09H, '2', 0aH, 0bH
	DB	00H						; `IClock_CmosDate'::`2'::cmos
_clock	DD	FLAT:_IClock_Flush
	DD	FLAT:_IClock_CmosDate
	DD	FLAT:_IClock_Now
	DD	FLAT:_IClock_GetTicks
	DD	FLAT:_IClock_GetFreq
_Clock	DD	FLAT:_clock
PUBLIC	_IClock_CmosDate
PUBLIC	_InstallClock
PUBLIC	_EnableClock
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\fyp\develop\spartan\source\kernel\device\drivers\clock.c
_TEXT	SEGMENT
_base$ = 8						; size = 4
_size$ = 12						; size = 4
_EnableClock PROC

; 102  : bool EnableClock(u8 *base, u32 size) {

	push	ebx
	push	esi
	push	edi

; 103  :     outb(CMOS_INDEX, CMOS_MASK+CMOS_RTC_B); // select RTC B

	push	139					; 0000008bH
	push	112					; 00000070H
	call	_outb

; 104  :     u8 b = inb(CMOS_DATA) & 0x0F;           // get register value

	push	113					; 00000071H
	pop	edi
	push	edi
	call	_inb
	and	al, 15					; 0000000fH

; 105  :     outb(CMOS_DATA, b|CMOS_INT);            // enable interrupts

	movzx	eax, al
	or	eax, 64					; 00000040H
	push	eax
	push	edi
	call	_outb

; 106  :     outb(CMOS_INDEX, CMOS_MASK+CMOS_RTC_A); // set index to register A, disable NMI

	lea	esi, DWORD PTR [edi+25]
	push	esi
	push	112					; 00000070H
	call	_outb

; 107  :     char a = inb(CMOS_DATA);                // get initial value of register A

	push	edi
	call	_inb

; 108  :     outb(CMOS_INDEX, CMOS_MASK+CMOS_RTC_A); // reset index to register A, disable NMI

	push	esi
	push	112					; 00000070H
	mov	bl, al
	call	_outb

; 109  :     outb(CMOS_DATA, (a & 0xF0)|RTC_1024HZ); // write only our rate to A. Note, rate is the bottom 4 bits.

	movzx	eax, bl
	and	eax, 240				; 000000f0H
	or	eax, 6
	push	eax
	push	edi
	call	_outb

; 110  :     outb(CMOS_INDEX, CMOS_RTC_C);           // select RTC C

	push	12					; 0000000cH
	push	112					; 00000070H
	call	_outb

; 111  :     inb(CMOS_DATA);                         // flush RTC C

	push	edi
	call	_inb

; 112  :     Device->Latch(IRQ_RTC, ClockIsr);

	mov	eax, DWORD PTR _Device
	push	OFFSET _ClockIsr
	push	40					; 00000028H
	call	DWORD PTR [eax]
	add	esp, 68					; 00000044H

; 113  :     return true;

	xor	eax, eax
	inc	eax
	pop	edi
	pop	esi
	pop	ebx

; 114  : }

	ret	0
_EnableClock ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\fyp\develop\spartan\source\kernel\device\drivers\clock.c
_TEXT	SEGMENT
_base$ = 8						; size = 4
_size$ = 12						; size = 4
_InstallClock PROC

; 96   :     seconds = 0;

	and	DWORD PTR _seconds, 0

; 97   :     ticks = 0;
; 98   :     hz = 1024;
; 99   :     return true;

	xor	eax, eax
	and	DWORD PTR _ticks, 0
	inc	eax
	mov	DWORD PTR _hz, 1024			; 00000400H

; 100  : }

	ret	0
_InstallClock ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\fyp\develop\spartan\source\kernel\device\drivers\clock.c
_TEXT	SEGMENT
_older$ = -32						; size = 16
_newer$ = -16						; size = 16
_datetime$ = 8						; size = 4
_IClock_CmosDate PROC

; 13   : void IClock_CmosDate(u8 *datetime) {

	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H

; 14   :     static u8 cmos[] = "\x00\x02\x04\x07\x08\x09\x32\x0A\x0B";
; 15   :     u8 older[16];
; 16   :     u8 newer[16];
; 17   :     u8 cent = 0;
; 18   : 
; 19   :     // wait for old and new to match in case an update fires
; 20   :     stosd(newer, 0, sizeof(newer)/4);

	lea	eax, DWORD PTR _newer$[ebp]
	push	ebx
	push	esi
	push	edi
	push	4
	xor	edi, edi
	push	edi
	push	eax
	call	_stosd
	add	esp, 12					; 0000000cH
$LL15@IClock_Cmo:

; 21   :     do {
; 22   :         movsd(older, newer, sizeof(newer)/4);

	push	4
	lea	eax, DWORD PTR _newer$[ebp]
	push	eax
	lea	eax, DWORD PTR _older$[ebp]
	push	eax
	call	_movsd
	add	esp, 12					; 0000000cH

; 23   :         for (int i = 0; i < 8; i++) {

	mov	esi, edi
$LL12@IClock_Cmo:

; 24   :             outb(CMOS_INDEX, CMOS_NO_NMI | cmos[i]);

	movzx	eax, BYTE PTR ?cmos@?1??IClock_CmosDate@@9@9[esi]
	or	eax, 128				; 00000080H
	push	eax
	push	112					; 00000070H
	call	_outb

; 25   :             newer[i] = inb(CMOS_DATA);

	push	113					; 00000071H
	call	_inb
	add	esp, 12					; 0000000cH
	mov	BYTE PTR _newer$[ebp+esi], al
	inc	esi
	cmp	esi, 8
	jl	SHORT $LL12@IClock_Cmo

; 26   :         }
; 27   :         outb(CMOS_INDEX, CMOS_NO_NMI | 108);

	push	236					; 000000ecH
	push	112					; 00000070H
	call	_outb

; 28   :         cent = inb(CMOS_DATA);

	push	113					; 00000071H
	call	_inb
	mov	bl, al
	add	esp, 12					; 0000000cH

; 29   :         if (cent == 0) continue;

	test	bl, bl
	je	SHORT $LN14@IClock_Cmo

; 30   :         outb(CMOS_INDEX, CMOS_NO_NMI | cent);

	movzx	ecx, bl
	or	ecx, 128				; 00000080H
	push	ecx
	push	112					; 00000070H
	call	_outb

; 31   :         newer[CMOS_CENTURY] = inb(CMOS_DATA);

	push	113					; 00000071H
	call	_inb
	add	esp, 12					; 0000000cH
	mov	BYTE PTR _newer$[ebp+6], al
$LN14@IClock_Cmo:

; 32   :     } while (cmpsb(older, newer, sizeof(newer)/4));

	push	4
	lea	eax, DWORD PTR _newer$[ebp]
	push	eax
	lea	eax, DWORD PTR _older$[ebp]
	push	eax
	call	_cmpsb
	add	esp, 12					; 0000000cH
	test	eax, eax
	jne	$LL15@IClock_Cmo

; 33   : 
; 34   :     // binary coded decimal
; 35   :     if (!(newer[CMOS_STATUSB] & 0x04)) {

	mov	al, BYTE PTR _newer$[ebp+8]
	test	al, 4
	jne	SHORT $LN5@IClock_Cmo
$LL7@IClock_Cmo:

; 37   :             newer[i] = (newer[i] % 16) + (newer[i]/16)*10;

	mov	al, BYTE PTR _newer$[ebp+edi]
	movzx	ecx, al
	and	ecx, -2147483633			; 8000000fH
	jns	SHORT $LN29@IClock_Cmo
	dec	ecx
	or	ecx, -16				; fffffff0H
	inc	ecx
$LN29@IClock_Cmo:
	shr	al, 4
	mov	dl, 10					; 0000000aH
	imul	dl
	add	cl, al
	mov	BYTE PTR _newer$[ebp+edi], cl
	inc	edi
	cmp	edi, 7
	jl	SHORT $LL7@IClock_Cmo

; 36   :         for (int i = 0; i < 7; i++) {

	mov	al, BYTE PTR _newer$[ebp+8]
$LN5@IClock_Cmo:

; 38   :         }
; 39   :     }
; 40   : 
; 41   :     // 12 hour / 24 hour
; 42   :     if (!(newer[CMOS_STATUSB] & 0x02) && (newer[CMOS_HOUR] & 0x80)) {

	test	al, 2
	jne	SHORT $LN4@IClock_Cmo
	mov	al, BYTE PTR _newer$[ebp+2]
	test	al, al
	jns	SHORT $LN4@IClock_Cmo

; 43   :         newer[CMOS_HOUR] = ((newer[CMOS_HOUR] & 0x7F) + 12) % 24;

	movzx	eax, al
	and	eax, 127				; 0000007fH
	add	eax, 12					; 0000000cH
	push	24					; 00000018H
	cdq
	pop	ecx
	idiv	ecx
	mov	BYTE PTR _newer$[ebp+2], dl
$LN4@IClock_Cmo:

; 44   :     }
; 45   : 
; 46   :     // centuary wrap around 1990-1999 ... 2000-2089
; 47   :     if (cent == 0) {

	pop	edi
	pop	esi
	test	bl, bl
	pop	ebx
	jne	SHORT $LN2@IClock_Cmo

; 48   :         if (newer[CMOS_YEAR] > 90) {

	mov	al, 90					; 0000005aH
	cmp	al, BYTE PTR _newer$[ebp+5]
	sbb	al, al
	add	al, 20					; 00000014H
	mov	BYTE PTR _newer$[ebp+6], al
$LN2@IClock_Cmo:

; 49   :             newer[CMOS_CENTURY] = 19;
; 50   :         } else {
; 51   :             newer[CMOS_CENTURY] = 20;
; 52   :         }
; 53   :     }
; 54   :     movsb(datetime, newer, 7);

	push	7
	lea	eax, DWORD PTR _newer$[ebp]
	push	eax
	push	DWORD PTR _datetime$[ebp]
	call	_movsb
	add	esp, 12					; 0000000cH

; 55   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_IClock_CmosDate ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\fyp\develop\spartan\source\kernel\device\drivers\clock.c
_TEXT	SEGMENT
_IClock_Flush PROC

; 58   :     outb(CMOS_INDEX, CMOS_RTC_C);

	push	12					; 0000000cH
	push	112					; 00000070H
	call	_outb

; 59   :     inb(CMOS_DATA);

	push	113					; 00000071H
	call	_inb
	add	esp, 12					; 0000000cH

; 60   : }

	ret	0
_IClock_Flush ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\fyp\develop\spartan\source\kernel\device\drivers\clock.c
_TEXT	SEGMENT
_cmos$ = -8						; size = 8
_now$ = 8						; size = 4
_IClock_Now PROC

; 62   : static bool IClock_Now(u8 *now) {

	push	ebp
	mov	ebp, esp
	push	ecx
	push	ecx

; 63   :     u8 cmos[8];
; 64   :     IClock_CmosDate(cmos);

	lea	eax, DWORD PTR _cmos$[ebp]
	push	eax
	call	_IClock_CmosDate
	pop	ecx

; 65   : 
; 66   :     now[0] = (hz) ? (ticks*256/hz) : 0;

	mov	ecx, DWORD PTR _hz
	test	ecx, ecx
	je	SHORT $LN3@IClock_Now
	mov	eax, DWORD PTR _ticks
	xor	edx, edx
	shl	eax, 8
	div	ecx
	jmp	SHORT $LN4@IClock_Now
$LN3@IClock_Now:
	xor	eax, eax
$LN4@IClock_Now:
	mov	ecx, DWORD PTR _now$[ebp]
	mov	BYTE PTR [ecx], al

; 67   :     now[1] = cmos[CMOS_SECOND];

	mov	al, BYTE PTR _cmos$[ebp]
	mov	BYTE PTR [ecx+1], al

; 68   :     now[2] = cmos[CMOS_MINUTE];

	mov	al, BYTE PTR _cmos$[ebp+1]
	mov	BYTE PTR [ecx+2], al

; 69   :     now[3] = cmos[CMOS_HOUR];

	mov	al, BYTE PTR _cmos$[ebp+2]
	mov	BYTE PTR [ecx+3], al

; 70   :     now[4] = cmos[CMOS_DAY];

	mov	al, BYTE PTR _cmos$[ebp+3]
	mov	BYTE PTR [ecx+4], al

; 71   :     now[5] = cmos[CMOS_MONTH];

	mov	al, BYTE PTR _cmos$[ebp+4]
	mov	BYTE PTR [ecx+5], al

; 72   :     now[6] = cmos[CMOS_YEAR];

	mov	al, BYTE PTR _cmos$[ebp+5]
	mov	BYTE PTR [ecx+6], al

; 73   :     now[7] = cmos[CMOS_CENTURY];

	mov	al, BYTE PTR _cmos$[ebp+6]
	mov	BYTE PTR [ecx+7], al

; 74   :     return true;

	xor	eax, eax
	inc	eax

; 75   : }

	mov	esp, ebp
	pop	ebp
	ret	0
_IClock_Now ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\fyp\develop\spartan\source\kernel\device\drivers\clock.c
_TEXT	SEGMENT
_IClock_GetTicks PROC

; 78   :     return seconds*hz + ticks;

	mov	eax, DWORD PTR _hz
	imul	eax, DWORD PTR _seconds
	add	eax, DWORD PTR _ticks

; 79   : }

	ret	0
_IClock_GetTicks ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\fyp\develop\spartan\source\kernel\device\drivers\clock.c
_TEXT	SEGMENT
_IClock_GetFreq PROC

; 82   :     return hz;

	mov	eax, DWORD PTR _hz

; 83   : }

	ret	0
_IClock_GetFreq ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\fyp\develop\spartan\source\kernel\device\drivers\clock.c
_TEXT	SEGMENT
_err$ = 8						; size = 4
_esp$ = 12						; size = 4
_ClockIsr PROC

; 86   :     esp = RoundRobin(err, esp);

	mov	edx, DWORD PTR _esp$[esp-4]
	push	esi
	call	_RoundRobin

; 87   :   //if (ticks == 0) Logger(" [TIME] %d sec\n", seconds);
; 88   :     ticks = ++ticks & (hz-1);

	mov	edx, DWORD PTR _hz
	mov	esi, eax
	mov	ecx, DWORD PTR _ticks
	dec	edx
	inc	ecx
	and	edx, ecx
	mov	DWORD PTR _ticks, edx

; 89   :     if (ticks == 0) seconds++;

	jne	SHORT $LN1@ClockIsr
	inc	DWORD PTR _seconds
$LN1@ClockIsr:

; 90   :     outb(CMOS_INDEX, CMOS_RTC_C); // select RTC C

	push	12					; 0000000cH
	push	112					; 00000070H
	call	_outb

; 91   :     inb(CMOS_DATA); // flush RTC C

	push	113					; 00000071H
	call	_inb
	add	esp, 12					; 0000000cH

; 92   :     return esp;

	mov	eax, esi
	pop	esi

; 93   : }

	ret	0
_ClockIsr ENDP
_TEXT	ENDS
END
