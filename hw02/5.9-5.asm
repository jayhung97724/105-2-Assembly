TITLE Assembly Homework 2
; 4104056009 Hung, Hao-You

INCLUDE Irvine32.inc

.data
TAB = 9

.code
main PROC 
		mov ecx, 50
L1:
		mov ebx, -300
		mov eax, 100
		call BetterRandomRange
		loop L1

		call WaitMsg
		call Crlf
		exit
main ENDP

BetterRandomRange PROC
		sub eax, ebx
		call RandomRange
		add eax, ebx
		call WriteInt
		mov al, TAB
		call WriteChar
		ret
BetterRandomRange ENDP

END main