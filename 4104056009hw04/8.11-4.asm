TITLE Assembly Homework 4
; 4104056009 Hung, Hao-You

INCLUDE Irvine32.inc

.data
		array1 DWORD 1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6
		array2 DWORD 1, 2, 3, 4, 5, 66666, 7, 8
		string1 BYTE "array1: 1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6", 0dh, 0ah, 0
		string2 BYTE "array2: 1, 2, 3, 4, 5, 66666, 7, 8", 0dh, 0ah, 0
		string3 BYTE "result: ",0
		line BYTE  0dh, 0ah, 0
.code
main PROC
		mov edx, OFFSET string1
		call WriteString
		call Crlf
		push OFFSET array1
		mov eax, SIZEOF array1
		push eax
		call FindThrees
		mov edx, OFFSET string3
		call WriteString
		call WriteDec
		mov edx, OFFSET line
		call WriteString
		call Crlf

		mov edx, OFFSET string2
		call WriteString
		call Crlf
		push OFFSET array2
		mov eax, SIZEOF array2
		push eax
		call FindThrees
		mov edx, OFFSET string3
		call WriteString
		call WriteDec
		mov edx, OFFSET line
		call WriteString
		call Crlf
		call WaitMsg
exit
main ENDP

FindThrees PROC,
				sz:DWORD, 
				pointer:DWORD
		mov esi, pointer
		mov ecx, sz
		shr ecx, 2
		mov ebx, 0
		jmp L1
L0:	mov eax, 1
		jmp next

L1:	mov eax, [esi]
		add esi, 4
		cmp eax, 3
		je L2
		mov ebx, 0
		loop L1

L2:	inc ebx
		cmp ebx, 3
		je L0
		test ecx, 0ffffffffh
		loopnz L1

		mov eax, 0
next:
		ret
FindThrees ENDP
END main