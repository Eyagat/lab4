.586 ;Вказуемо покоління процесора;
.model flat, stdcall	;
.stack
.data
; Оголошуемо змінні, які будуть брати участь в обчисленні;
a dd 5  ; a дорівнює 5;
b dd 10 ; b дорівнює 10;

.code

Begin:
xor eax,eax ;Очищуемо регистр eax;
xor ebx,ebx ;Очищуемо регистр ebx;
xor edx,edx ;Очищуемо регистр edx;

Mov edx,2
Mov eax,a ;eax[a] ; Відправляємо змінну а у регістр eax;
Mov ebx,b ;ebx[b] ; Відправляємо змінну b у регістр ebx;

mul edx
CMP eax,ebx ;eax = ebx ; Виконуємо операцію порівняння;	

je M1  ; Перехід за міткою М1, якщо eax = ebx;
jmp M2 ; Перехід за міткою М2, якщо eax ? ebx;

M1:
Idiv edx
Add eax,ebx ; [10 + 5] ; Виконуємо операцію додавання eax + edx;
jmp M3      ; Перехід за міткою М3;

M2: 
Idiv edx 
Sub eax,ebx ; [10 -5] ; Виконуємо операцію віднімання eax - ebx;

M3:

end Begin
