; Listing generated by Microsoft (R) Optimizing Compiler Version 18.00.40629.0 

	TITLE	C:\Users\cex123\Desktop\FYP\develop\spartan\Source\Kernel\BootLoad\BootStrap.c
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB OLDNAMES

PUBLIC	_prepare
PUBLIC	_enable
_prepare DD	049565420H
	DD	FLAT:_StubInstaller
	DD	042494f53H
	DD	FLAT:_InstallPcBios
	DD	047445420H
	DD	FLAT:_InstallGdt
	DD	054535320H
	DD	FLAT:_InstallTss
	DD	049525120H
	DD	FLAT:_InstallIrq
	DD	049535220H
	DD	FLAT:_InstallIsr
	DD	049445420H
	DD	FLAT:_InstallIdt
	DD	050414745H
	DD	FLAT:_InstallPaging
	DD	043545820H
	DD	FLAT:_InstallScheduler
	DD	052445951H
	DD	FLAT:_StubInstaller
	DD	0424c4b51H
	DD	FLAT:_StubInstaller
	DD	052544320H
	DD	FLAT:_InstallClock
	DD	04b444220H
	DD	FLAT:_InstallKeyboard
	DD	0434f4d31H
	DD	FLAT:_InstallCom1
	DD	0434f4d32H
	DD	FLAT:_InstallCom2
	DD	04d4f5553H
	DD	FLAT:_InstallMouse
	DD	0534e4420H
	DD	FLAT:_InstallSpeaker
_enable	DD	049565420H
	DD	FLAT:_StubInstaller
	DD	042494f53H
	DD	FLAT:_StubInstaller
	DD	047445420H
	DD	FLAT:_EnableGdt
	DD	054535320H
	DD	FLAT:_EnableTss
	DD	049525120H
	DD	FLAT:_StubInstaller
	DD	049535220H
	DD	FLAT:_StubInstaller
	DD	049445420H
	DD	FLAT:_EnableIdt
	DD	050414745H
	DD	FLAT:_EnablePaging
	DD	052445951H
	DD	FLAT:_StubInstaller
	DD	0424c4b51H
	DD	FLAT:_StubInstaller
	DD	056455341H
	DD	FLAT:_EnableVesa
	DD	0534e4420H
	DD	FLAT:_EnableSpeaker
	DD	0434f4d31H
	DD	FLAT:_StubInstaller
	DD	0434f4d32H
	DD	FLAT:_EnableSerial
	DD	052544320H
	DD	FLAT:_EnableClock
	DD	04b444220H
	DD	FLAT:_EnableKeyboard
	DD	04d4f5553H
	DD	FLAT:_EnableMouse
PUBLIC	_BootStrap
PUBLIC	_StubInstaller
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\fyp\develop\spartan\source\kernel\bootload\bootstrap.c
_TEXT	SEGMENT
_base$ = 8						; size = 4
_size$ = 12						; size = 4
_StubInstaller PROC

; 35   :     return true;

	xor	eax, eax
	inc	eax

; 36   : }

	ret	0
_StubInstaller ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
; File c:\users\cex123\desktop\fyp\develop\spartan\source\kernel\bootload\bootstrap.c
_TEXT	SEGMENT
_BootStrap PROC

; 66   :     if (!BootLoad->Grub(grub)) return false;
; 67   :     if (!EnableRamDisk(Monitor->GetBase('DISK'), Monitor->GetSize('DISK'))) return false;

	mov	eax, DWORD PTR _Monitor
	push	esi
	mov	esi, 1145656139				; 4449534bH
	push	esi
	call	DWORD PTR [eax+28]
	mov	eax, DWORD PTR _Monitor
	push	esi
	call	DWORD PTR [eax+24]
	pop	ecx
	pop	ecx
	mov	ecx, eax
	call	_EnableRamDisk
	pop	esi
	test	eax, eax
	jne	SHORT $LN4@BootStrap
$LN11@BootStrap:
	xor	eax, eax

; 72   :     return true;
; 73   : }

	ret	0
$LN4@BootStrap:

; 68   :     if (!BootLoad->Prepare(prepare, elementsof(prepare))) return false;

	mov	eax, DWORD PTR _BootLoad
	push	17					; 00000011H
	push	OFFSET _prepare
	call	DWORD PTR [eax+8]
	pop	ecx
	pop	ecx
	test	eax, eax
	je	SHORT $LN11@BootStrap

; 69   :     if (!BootLoad->Enable(enable, elementsof(enable))) return false;

	mov	eax, DWORD PTR _BootLoad
	push	17					; 00000011H
	push	OFFSET _enable
	call	DWORD PTR [eax+12]
	pop	ecx
	pop	ecx
	test	eax, eax
	je	SHORT $LN11@BootStrap

; 70   : 
; 71   :     if (!BootLoad->Activate()) return false;

	mov	eax, DWORD PTR _BootLoad
	call	DWORD PTR [eax+16]
	neg	eax
	sbb	eax, eax
	neg	eax

; 72   :     return true;
; 73   : }

	ret	0
_BootStrap ENDP
_TEXT	ENDS
END
