.586 ;�������� �������� ���������;
.model flat, stdcall	;
.stack
.data
; ���������� ����, �� ������ ����� ������ � ���������;
a dd 5  ; a ������� 5;
b dd 10 ; b ������� 10;

.code

Begin:
xor eax,eax ;�������� ������� eax;
xor ebx,ebx ;�������� ������� ebx;
xor edx,edx ;�������� ������� edx;

Mov edx,2
Mov eax,a ;eax[a] ; ³���������� ����� � � ������ eax;
Mov ebx,b ;ebx[b] ; ³���������� ����� b � ������ ebx;

mul edx
CMP eax,ebx ;eax = ebx ; �������� �������� ���������;	

je M1  ; ������� �� ����� �1, ���� eax = ebx;
jmp M2 ; ������� �� ����� �2, ���� eax ? ebx;

M1:
Idiv edx
Add eax,ebx ; [10 + 5] ; �������� �������� ��������� eax + edx;
jmp M3      ; ������� �� ����� �3;

M2: 
Idiv edx 
Sub eax,ebx ; [10 -5] ; �������� �������� �������� eax - ebx;

M3:

end Begin
