.586
.MODEL FLAT, C
.STACK
.DATA
    
.CODE

findCountOfElements PROC C mass:dword, n:dword, m:dword, coutE:dword 
	mov EBX, [ESP+4] ; �������� ���� ������
	mov ECX, [ESP+12] ; �������� ������� (�������)

	xor ESI, ESI ; ��������� ESI
	c1:
		xor EDI, EDI ; �������� EDI
		xor EAX, EAX ; �������� EAX

		push ECX ; �������� ECX � ����
		mov ECX, [ESP+12] ; �������� ����� (�������)
			c2:
				push EAX ; �������� EAX � ����
				push ECX ; �������� ECX � ����
					mov EAX, [ESP+24] ; �������� ������� ��������
					sal EAX, 2 ; �����. ������� ����
					imul EDI ; ���������� ��������
					add EAX,EBX ; �������������

					mov ECX, [EAX+ESI*4] ; ������� ������� � ������
					cmp ECX, 0 ; ��������� ������� �� 0
	 			pop ECX ; �������� �������� � ����� � ECX
				pop EAX ; �������� �������� � ����� � E�X
					jne m1 ; ���� �� �������, �������� �� ���� m1
					    inc EAX ; ��������� EAX
					m1: ; ����
				inc EDI ; ��������� EDI
			loop c2 ; ����

			mov EDX, [ESP+20] ; countElements
			mov [EDX+ESI*4],EAX
		pop ECX
		inc ESI
	loop c1
	
    ret
findCountOfElements ENDP 

findMinEl PROC C zer:dword, m:dword, mnc:dword;
	mov ebx, [esp+4] ; ���� ������
	mov ecx, [esp+8] ; m (�������)

	; ����� ������
	xor ESI, ESI ; ��������� ESI
	xor EDI, EDI ; min
	c1:
		mov EAX, [EBX+ESI*4]
		cmp EAX, [EBX+ESI*4]
		jge m1
			mov EDI, ESI
		m1:
		inc ESI
	loop c1

	; �������� ��������� � �����
	mov ECX, [ESP+8] ; m
	mov EDX, [ESP+12] ; ���� ������ ����������
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
