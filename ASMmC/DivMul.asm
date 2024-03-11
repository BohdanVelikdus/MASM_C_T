.386
.model flat, c

.const
;array
FibVals DWORD 0,1,1,2,3,4,5,8,13,21
		DWORD 34,55,89,144,233,377,610
;size of array
NumFibVals DWORD ($ - FibVals) / sizeof DWORD

public NumFibVals

.code 
MemoryAddressing PROC
	push ebp
	mov ebp, esp
	push ebx
	push esi
	push edi

	xor eax, eax
	mov ecx, [ebp + 8] ; ecx = i
	cmp ecx, 0
	jl InvalidIndex
	cmp ecx, [numFibVals]
	jge InvalidIndex

; Eg1 - base register

	mov ebx, OFFSET FibVals ; ebx = FIBVALS (address of 1 element)
	mov esi, [ebp + 8] ; esi = i
	shl esi, 2 ; esi = i * 4
	add ebx, esi ; ebx = Fibvals + i * 4
	mov eax, [ebx]       ; load table value
	mov edi, [ebp + 12]
	mov [edi], eax

; Eg2 - base register + displacement
	mov esi, [ebp + 8]
	shl esi, 2
	mov eax, [esi + FibVals]
	mov edi, [ebp + 16]
	mov [edi], eax ;

; Eg3 - base register + index register
	mov ebx, OFFSET FibVals
	mov esi, [ebp + 8]
	shl esi, 2
	mov eax, [ebx + esi]
	mov edi, [ebp+ 20]
	mov [edi], eax

; Eg4 - base register + index register * scale factor
	mov ebx, OFFSET FibVals
	mov esi, [ebp + 8]
	mov eax, [ebp + esi * 4]
	mov edi, [ebp + 24]
	mov [edi], eax
	mov eax, 1

InvalidIndex:
	pop edi
	pop esi
	pop ebx
	pop ebp

	ret
MemoryAddressing ENDP
				 END