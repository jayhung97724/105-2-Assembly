TITLE Assembly Homework 1
; 4104056009 Hung, Hao-You

INCLUDE Irvine32.inc
.data
source BYTE "This is the source string", 0
target BYTE SIZEOF source DUP('#')

.code
main PROC 

		mov esi, OFFSET source
		mov edi, OFFSET target + LENGTHOF source -1 
		mov ecx, LENGTHOF source

L1:
		mov bl, [esi]
		mov [edi], bl
		inc esi
		dec edi
		loop L1
		
		mov esi, OFFSET target+1
		mov ecx, SIZEOF target-1
		call DumpMem
		call WaitMsg
		call Crlf
		exit
main ENDP

END main