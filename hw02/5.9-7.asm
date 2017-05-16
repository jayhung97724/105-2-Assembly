TITLE Assembly Homework 2
; 4104056009 Hung, Hao-You

INCLUDE Irvine32.inc

.data
cols  BYTE  ?
rows  BYTE  ?

.code
main PROC 
		call GetMaxXY
		mov rows, al
		mov cols, dl

		mov ecx, 100
L1:
		call RandomXY
		mov eax, 100
		loop L1

		call WaitMsg
		call Crlf
		exit
main ENDP

RandomXY PROC
		mov al, rows
		call RandomRange
		mov dh, al

		mov al, cols
		call RandomRange
		mov dl, al
		call Gotoxy

		call WriteChar
		ret
RandomXY ENDP

END main