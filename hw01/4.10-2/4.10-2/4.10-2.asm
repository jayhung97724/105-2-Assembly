TITLE Assembly Homework 1

INCLUDE Irvine32.inc
.data
array BYTE 01h, 02h, 03h, 04h, 05h, 06h, 07h, 08h

.code
main PROC 

	mov ecx, LENGTHOF array
	SAR ecx, 1
	mov esi, 0
	mov eax, 0
	mov ebx, 0
	mov edx, 0

L1:
		mov al, array[esi]
		mov bl, array[esi + 1]
		mov array[esi], bl
		mov array[esi + 1], al
		add esi, 2
		loop L1
	
	mov eax, DWORD PTR  array
	call WriteHex

exit
main ENDP

END main