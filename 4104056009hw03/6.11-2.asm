TITLE Assembly Homework 3
; 4104056009 Hung, Hao-You

INCLUDE Irvine32.inc

.data
		array SDWORD 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 
		ArraySize SDWORD LENGTHOF array
		prompt BYTE "Enter the range (0 ~ 15) :  " , 0dh, 0ah, 0
		line BYTE  0dh, 0ah, 0
		lower DWORD 0
		upper DWORD 0
		currECX DWORD 0
.code
main PROC
		mov ecx, 2
L1:
		mov currECX, ecx
		mov edx, OFFSET prompt
		call WriteString
		call ReadDec
		mov lower, eax
		call ReadDec
		mov upper, eax
		
		call SumArray
		mov ecx, currECX
		call WriteDec
		mov edx, OFFSET line
		call WriteString
		loop L1
		
		call WaitMsg
		call Crlf
		exit
main ENDP
		
SumArray PROC

		mov eax, 0
		mov edx, upper
		mov ebx, lower
		sub edx, ebx
		add edx, 1
		mov ecx, edx

L2:
		add eax, array[ebx]
		add ebx, TYPE array
		loop L2
		ret
SumArray ENDP
END main