TITLE Assembly Homework 2
; 4104056009 Hung, Hao-You

INCLUDE Irvine32.inc

.data
start DWORD 1
links DWORD 0, 4, 5, 6, 2, 3, 7, 0
chars BYTE "HACEBDFG", 0   
newArray BYTE 8 DUP(?)

.code
main PROC 
		mov esi, start
		mov ecx, LENGTHOF chars
		mov edi, OFFSET newArray

L1:	mov al, chars[esi]
		mov [edi], al
		mov esi, links[esi*4]
		add edi,1
		loop L1

		mov esi, OFFSET newArray
		mov ecx, LENGTHOF newArray
		mov eax, 0
L2:
		mov al, [esi]
		call WriteChar
		inc esi
		loop L2

		call WaitMsg
		call Crlf
		exit
main ENDP

END main