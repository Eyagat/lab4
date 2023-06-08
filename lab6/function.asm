.586
.MODEL FLAT, C
.STACK
.DATA
    
.CODE

findCountOfElements PROC C mass:dword, n:dword, m:dword, coutE:dword 
	mov EBX, [ESP+4] ; отримуємо базу масиву
	mov ECX, [ESP+12] ; отримуємо стовпці (кількість)

	xor ESI, ESI ; обнулюємо ESI
	c1:
		xor EDI, EDI ; обнуляем EDI
		xor EAX, EAX ; обнуляем EAX

		push ECX ; заносимо ECX у стек
		mov ECX, [ESP+12] ; отримуємо рядки (кількість)
			c2:
				push EAX ; заносимо EAX у стек
				push ECX ; заносимо ECX у стек
					mov EAX, [ESP+24] ; отримуємо кількість стовпців
					sal EAX, 2 ; арифм. рушення вліво
					imul EDI ; беззнакове множення
					add EAX,EBX ; підсумовування

					mov ECX, [EAX+ESI*4] ; поміщаємо елемент у регістр
					cmp ECX, 0 ; порівнюємо елемент із 0
	 			pop ECX ; витягуємо значення зі стека в ECX
				pop EAX ; витягуємо значення зі стека в EАX
					jne m1 ; якщо не дорівнює, стрибаємо на мітку m1
					    inc EAX ; інкремент EAX
					m1: ; мітка
				inc EDI ; інкремент EDI
			loop c2 ; цикл

			mov EDX, [ESP+20] ; countElements
			mov [EDX+ESI*4],EAX
		pop ECX
		inc ESI
	loop c1
	
    ret
findCountOfElements ENDP 

findMinEl PROC C zer:dword, m:dword, mnc:dword;
	mov ebx, [esp+4] ; база масиву
	mov ecx, [esp+8] ; m (стовпці)

	; пошук мінімуму
	xor ESI, ESI ; обнулюємо ESI
	xor EDI, EDI ; min
	c1:
		mov EAX, [EBX+ESI*4]
		cmp EAX, [EBX+ESI*4]
		jge m1
			mov EDI, ESI
		m1:
		inc ESI
	loop c1

	; заносимо результат у масив
	mov ECX, [ESP+8] ; m
	mov EDX, [ESP+12] ; база масиву результату
	xor ESI, ESI
	c2:
		mov EAX, [EBX+ESI*4]
		cmp EAX, [EBX+EDI*4]
		push EAX
		mov EAX, 0
		mov [EDX+ESI*4], EAX
		pop EAX
		jne m2
			push EAX
			mov EAX, 1
			mov [EDX+ESI*4], EAX
			pop EAX
		m2:
		inc ESI
	loop c2

	mov EAX, [EBX+EDI*4]
	
    ret
findMinEl ENDP

END
