.586 ;�������� �������� ���������;
.model flat, stdcall	
.stack
.data

Number_Mod dd 5  ; ������� �����;
Masive_Size dd 5 ; ����� ������;
Masive dd 1, 2, 3, 4, 5 ; ����� �����;
.code

Begin:

xor eax, eax ; ������� ������� eax; 
xor ebx, ebx ; ������� ������� ebx;
xor ecx, ecx ; ������� ������� ecx;
xor edx, edx ; ������� ������� edx;
xor esi, esi ; ������� ������� esi;

mov ecx, Masive_Size ; ; ���������� ������� �������� ����� "Masive_Size" - ����� ������;
mov eax, Number_Mod;
Find_Number:		
			cmp Masive[esi], eax ; ����� �����. ��������� �������� � 4 ; 
			jne If_A_Number_is_not_found ; ���� ������� ������ �� � 4 ;
			
			jmp If_A_Number_is_found ; ���� ������� ������ � 4 ;
If_A_Number_is_not_found:			
			add esi, 4 ; �������� (esi = esi + 4) ;
			loop Find_Number ; ʳ���� ����� If_A_Number_is_not_found ;
If_A_Number_is_found:
			mov ebx, Masive_Size
			mov Masive[esi+4],ebx
			mov Masive[esi],eax ; ������� �� ������ ������� ����� ;
		end Begin
