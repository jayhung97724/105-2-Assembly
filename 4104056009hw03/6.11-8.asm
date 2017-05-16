TITLE Assembly Homework 3
; 4104056009 Hung, Hao-You

INCLUDE Irvine32.inc

.data
		text BYTE "This is Plaintext message",0
		key BYTE "ABXnv#7",0
		string1 BYTE "After encryption: ",0
		string2 BYTE "After decryption: ",0
		line BYTE  0dh, 0ah, 0
.code
main PROC
		mov ecx, LENGTHOF text
		mov esi, 0
		mov edi, 0
		mov edx, OFFSET string1
		call WriteString
		mov edx, OFFSET line
		call WriteString
		call crypt
		call Crlf
		mov ecx, LENGTHOF text
		mov esi, 0
		mov edi, 0
		mov edx, OFFSET line
		call WriteString
		mov edx, OFFSET string2
		call WriteString
		mov edx, OFFSET line
		call WriteString
		call crypt
		call Crlf
		call WaitMsg
exit
main ENDP
crypt PROC
	L1:	
		mov al, text[esi]
		xor al, key[edi]
		call WriteChar
		mov text[esi], al
		inc esi
		inc edi
		cmp edi,LENGTHOF key
		je clear_edi
		dec ecx
		cmp ecx, 0
		jne L1
		je next
	clear_edi:
		mov edi, 0
		dec ecx
		cmp ecx, 0
		jne L1
		je next
	next:
		ret
crypt ENDP
END main
