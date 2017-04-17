TITLE Assembly Homework 1
; 4104056009 Hung, Hao-You

INCLUDE Irvine32.inc

.data
array BYTE 1, 2, 3, 4 

.code
main PROC 

		mov esi, OFFSET array
		mov ecx, LENGTHOF array-1
		mov al, [esi]

L1:
		mov bl, [esi+1]
		mov [esi+1], al
		xchg bl, al
		inc esi
		loop L1
		
		mov array[0], al
		mov esi, OFFSET array
		mov ecx, LENGTHOF array
		mov eax, 0
L2:
		mov al, [esi]
		call WriteDec
		inc esi
		loop L2

		call WaitMsg
		call Crlf
		exit
main ENDP

END main