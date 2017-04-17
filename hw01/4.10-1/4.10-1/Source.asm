TITLE Assembly Homework

INCLUDE Irvine32.inc
.data
bigEndian BYTE 12h, 34h, 56h, 78h
littleEndian DWORD ?

.code
main PROC 

	mov ecx, 2
	mov esi, 0
	mov edx, 0
	mov eax, 0
	mov ebx, 0
L1:
		mov edx, 3
		sub edx, esi
		mov al, bigEndian[esi]
		mov bl, bigEndian[edx]
		;xchg al, bl
		mov bigEndian[esi], bl
		mov bigEndian[edx], al
		inc esi
		loop L1
	
	mov eax, DWORD PTR  bigEndian
	mov littleEndian, eax

	call WriteHex

exit
main ENDP

END main