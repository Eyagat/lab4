.586 ;Вказуемо покоління процесора;
.model flat, stdcall	
.stack
.data

Number_Mod dd 5  ; Довільне число;
Masive_Size dd 5 ; Розмір масиву;
Masive dd 1, 2, 3, 4, 5 ; Масив чисел;
.code

Begin:

xor eax, eax ; Очищуємо регистр eax; 
xor ebx, ebx ; Очищуємо регистр ebx;
xor ecx, ecx ; Очищуємо регистр ecx;
xor edx, edx ; Очищуємо регистр edx;
xor esi, esi ; Очищуємо регистр esi;

mov ecx, Masive_Size ; ; Присвоюємо регістру значення змінної "Masive_Size" - розмір масиву;
mov eax, Number_Mod;
Find_Number:		
			cmp Masive[esi], eax ; Пошук числа. Порівняння елементу з 4 ; 
			jne If_A_Number_is_not_found ; Якщо єлемент масиву не є 4 ;
			
			jmp If_A_Number_is_found ; Якщо елемент масиву є 4 ;
If_A_Number_is_not_found:			
			add esi, 4 ; Ітерація (esi = esi + 4) ;
			loop Find_Number ; Кінець циклу If_A_Number_is_not_found ;
If_A_Number_is_found:
			mov ebx, Masive_Size
			mov Masive[esi+4],ebx
			mov Masive[esi],eax ; Додаемо до масиву довільне число ;
		end Begin
