TITLE Assembly Homework 1
; 4104056009 Hung, Hao-You

INCLUDE Irvine32.inc
.data
array DWORD 0, 2, 5, 9, 10
gap DWORD 0
.code
main PROC 

	mov ecx, LENGTHOF array
	sub ecx, 1
	mov esi, 0
	mov eax, 0
	mov ebx, 0
	mov edx, 0

L1:
		mov edx, array[esi]
		mov ebx, array[esi + 4]
		add gap, ebx
		sub gap, edx
		add esi, 4
		loop L1
	
	mov eax, gap
	call WriteDec
	call Crlf
exit
main ENDP

END main