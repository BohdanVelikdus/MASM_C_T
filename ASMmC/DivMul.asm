.386 
.model flat, c

extern GlChar:byte 
extern GlShort:word
extern GlInt:dword
extern GlLongLong:qword

.code

IntegerAddition PROC
	push ebp
	mov ebp, esp

; Compute GlChar += a
	mov al, [ebp + 8]
	add [GlChar], al

; Compute Short
	mov ax, [ebp + 12]
	add [GlShort], ax

; Compute GlInt
	mov eax, [ebp + 16]
	mov [GlInt], eax

; Compute GlLongLong
	mov eax, [ebp + 20]
	mov edx, [ebp + 24]
	add dword ptr[GlLongLong], eax
	adc dword ptr[GlLongLong+4], edx

	pop ebp
	ret

IntegerAddition ENDP
				END