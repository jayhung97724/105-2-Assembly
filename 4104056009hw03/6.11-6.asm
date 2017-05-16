TITLE Assembly Homework 3
; 4104056009 Hung, Hao-You

INCLUDE Irvine32.inc

.data
		CaseTable BYTE 1
							DWORD AND_op
		EntrySize = ($ - CaseTable)
							BYTE 2
							DWORD OR_op
							BYTE 3
							DWORD NOT_op
							BYTE 4
							DWORD XOR_op
							BYTE 5
							DWORD EX
		NumberOfEntries = ($ - CaseTable) / EntrySize

		s1 BYTE "1. AND", 0dh, 0ah, 0
		s2 BYTE "2. OR", 0dh, 0ah, 0
		s3 BYTE "3. NOT", 0dh, 0ah, 0
		s4 BYTE "4. XOR", 0dh, 0ah, 0
		s5 BYTE "5. EXIT", 0dh, 0ah, 0
		line BYTE  0dh, 0ah, 0
		choose BYTE "please choose what you want to do: " , 0
		twoHex BYTE "please enter two hex numbers: ", 0
		oneHex BYTE "please enter one hex number: ", 0
		bye BYTE "Bye bye~", 0dh, 0ah, 0
		result BYTE "Result: ",0
.code
main PROC
		mov ecx, 5
L0:
		mov edx, OFFSET choose
		call WriteString
		call ReadDec

		mov esi, OFFSET CaseTable
		mov ecx, NumberOfEntries
L1:
		cmp al,BYTE PTR [esi]
		jne L2
		call NEAR PTR [esi+1]
L2:	
		add esi, EntrySize
		loop L1
		loop L0
main ENDP
		
AND_op PROC
		mov edx, OFFSET s1
		call WriteString
		call Crlf
		mov edx, OFFSET twoHex
		call WriteString
		mov edx, OFFSET line
		call WriteString
		call ReadHex
		mov ebx, eax
		call ReadHEX
		and eax, ebx
		mov edx, OFFSET line
		call WriteString
		mov edx, OFFSET result
		call WriteString
		call WriteHex
		call Crlf
		ret
AND_op ENDP
OR_op PROC
		mov edx, OFFSET s2
		call WriteString
		call Crlf
		mov edx, OFFSET twoHex
		call WriteString
		mov edx, OFFSET line
		call WriteString
		call ReadHex
		mov ebx,eax
		call WriteString
		call ReadHex
		or eax, ebx
		mov edx, OFFSET line
		call WriteString
		mov edx, OFFSET result
		call WriteString
		call WriteHex
		call Crlf
		ret
OR_op ENDP
NOT_op PROC
		mov edx, OFFSET s3
		call WriteString
		call Crlf
		mov edx, OFFSET oneHex
		call WriteString
		mov edx, OFFSET line
		call WriteString
		call ReadHex
		not eax
		mov edx, OFFSET line
		call WriteString
		mov edx, OFFSET result
		call WriteString
		call Writehex
		call Crlf
		ret
NOT_op ENDP
XOR_op PROC
		mov edx,OFFSET s4
		call WriteString
		call Crlf
		mov edx, OFFSET twoHex
		call WriteString
		mov edx, OFFSET line
		call WriteString
		call ReadHex
		mov ebx,eax
		call WriteString
		call ReadHex
		xor eax, ebx
		mov edx, OFFSET line
		call WriteString
		mov edx, OFFSET result
		call WriteString
		call Writehex
		call Crlf
		ret
XOR_op ENDP
EX PROC
		mov edx, OFFSET s5
		call WriteString
		mov edx, OFFSET bye
		call WriteString
		call Crlf
		call WaitMsg
		exit
EX ENDP
END main