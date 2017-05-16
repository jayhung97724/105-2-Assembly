TITLE Assembly Homework 4
; 4104056009 Hung, Hao-You

INCLUDE Irvine32.inc
.data
		array1 SDWORD -9, -5, -3, -1, 1, -4, 5, 2
		array2 SDWORD 6, 3, 0, -3, 2, -3, 0, 3
		diff SDWORD 3
		string1 BYTE "array1: -9, -5, -3, -1, 1, -4, 5, 2", 0dh, 0ah, 0
		string2 BYTE "array2: 6, 3, 0, -3, 2, -3, 0, 3", 0dh, 0ah, 0
		string3 BYTE "diff: ",0
		result BYTE "result: ",0
		line BYTE  0dh, 0ah, 0
.code
main PROC
		mov edx,OFFSET string1
		call WriteString
		call Crlf
		mov edx,OFFSET string2
		call WriteString
		call Crlf
		mov edx,OFFSET string3
		call WriteString
		mov eax, diff
		call WriteDec
		call Crlf
		mov edx, OFFSET line
		call WriteString

		push LENGTHOF array1
		push OFFSET array1
		push OFFSET array2
		call CountNearMatches

		mov edx, OFFSET result
		call WriteString
		call WriteDec
		call Crlf
		call WaitMsg
exit
main ENDP

CountNearMatches PROTO,
		pointer2:DWORD,
		pointer1:DWORD,
		sz:PTR DWORD
		mov ebx,0

CountNearMatches PROC,
		pointer2:DWORD,
		pointer1:DWORD,
		sz:PTR DWORD
		mov ebx,0
		mov ecx,sz
		mov esi,pointer1
		mov edi,pointer2

L1:	mov eax, [esi]
		sub eax, [edi]
		add esi, 4
		add edi, 4
		cmp eax, 0
		jge L4
		jmp L3

L2:	inc ebx
		cmp ecx,0
		loopnz L1
		jmp next

L3:	neg eax
L4:	cmp eax, diff
		jle L2
		loop L1
next:
		mov eax, ebx
		ret
CountNearMatches ENDP
END main