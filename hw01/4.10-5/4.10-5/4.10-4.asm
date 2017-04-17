TITLE Assembly Homework 1
; 4104056009 Hung, Hao-You

INCLUDE Irvine32.inc

.code
main PROC 

		mov eax, 0
		mov ebx, 1
		mov ecx, 10

L1:
		add eax, ebx
		xchg eax, ebx
		call DumpRegs
		loop L1
		
		call WaitMsg
		call Crlf
		exit
main ENDP

END main