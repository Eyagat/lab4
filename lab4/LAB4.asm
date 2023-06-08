.586 

.model flat, stdcall
Option casemap:none 

; Replace the first element of the array with the sum of even elements, 
;and the last - the sum of non-even elements of the array.


find_sum_par proto :dword, :dword, :dword ; passing parameters on the stack
find_sum_nepar proto :dword, :dword, :dword 

zamena_elem_na_maxmin proto ; through registers


.stack
.data
    mas dd 5, -2, -3,4, 8, 7, 7, 17, -2
    nx=($-mas)/type mas

    sumpar dd 0
    sumnepar dd 0
    
.code 
start: 
;_____________________________________________________________
    ;call a function that calculates the sum of paired elements
    push offset sumpar
    push nx
    push offset mas
    call find_sum_par
    ;;call a function that calculates the sum of unpaired elements
    push offset sumnepar
    push nx
    push offset mas
    call find_sum_nepar
    ;;we call a function that puts the sum of paired and non-paired elements at the end and beginning
    ;across stack
    mov eax, sumpar
    mov edx, sumnepar
    lea ebx, mas
    mov ecx, nx
    call zamena_elem_na_maxmin
     
 jmp end_pr
 
 ;_____________________________________________________________
;_____________________________________________________________
;number of paired elements
find_sum_par proc uses eax ebx ecx edx esi, mas1:dword, nx1:dword, par:dword        
     mov ecx, nx1
     xor esi, esi
     mov ebx, mas1
cyclepar:
        mov eax, [ebx + esi*4]
        test eax, 00000001h ; first bit check
        jnz nextpar
            push ebx
            mov ebx, par
            add [ebx], eax
            pop ebx
        nextpar:
        inc esi
    loop cyclepar
   
ret 12
find_sum_par endp

;_____________________________________________________________
 ;_____________________________________________________________
 ;sum of unpaired elements
find_sum_nepar proc uses eax ebx ecx edx esi, mas1:dword, nx1:dword, nepar:dword
     mov ecx, nx1
     xor esi, esi
     mov ebx, mas1
cyclenepar:
        mov eax, [ebx + esi*4]
        test eax, 00000001h
        jz nextnepar
            push ebx
            mov ebx, nepar
            add [ebx], eax
            pop ebx
        nextnepar:
        inc esi
    loop cyclenepar
    
 ret 12
find_sum_nepar endp

 ;_____________________________________________________________
 ;_____________________________________________________________
 ; substitution of sums
 zamena_elem_na_maxmin proc
    dec ecx
    mov [ebx + ecx*4], edx
    mov [ebx], eax  
 ret 
 zamena_elem_na_maxmin endp
;_____________________________________________________________
 ;_____________________________________________________________

final:
end_pr:

end start 