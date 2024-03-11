.386
.model flat, c 

.code




CalculateSum PROC
;Prologue
	push ebp
	mov ebp, esp
	sub esp, 12 ; allocate local storage space
	push ebx
	push esi
	push edi

; load arguments
	mov eax, [ebp + 8] ; eax = a
	mov ebx, [ebp + 12] ; ebx = b
	mov ecx, [ebp + 16] ; ecx = c
	; pointers 
	mov edx, [ebp + 20] ; edx = s1
	mov esi, [ebp + 24] ; esi = s2
	mov edi, [ebp + 28] ; edi = s3

; compute the sum s1 = ab + b + c
	mov [ebp - 12], eax
	add [ebp - 12], ebx
	add [ebp - 12], ecx
; compute s2 = a * a + b * b + c * c
	imul eax, eax
	imul ebx, ebx
	imul ecx, ecx
	mov [ebp - 8], eax
	add [ebp - 8], ebx
	add [ebp - 8], ecx
; compute s3 = a * a * a + b * b * b + c * c * c
	imul eax, [ebp + 8]
	imul ebx, [ebp + 12]
	imul ecx, [ebp + 16]

	mov [ebp - 4], eax
	add [ebp - 4], ebx
	add [ebp - 4], ecx
; save s1, s2, s3
	mov eax, [ebp - 12] 
	mov [edx], eax

	mov eax, [ebp - 8]
	mov [esi], eax

	mov eax, [ebp - 4]
	mov [edi], eax


; epilogue function`s
	pop edi
	pop esi
	pop ebx
	mov esp, ebp
	pop ebp

	ret

CalculateSum ENDP
			 END