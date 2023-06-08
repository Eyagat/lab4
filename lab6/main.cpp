#include <windows.h>
#include <stdio.h>
#include <iostream> 
#include <ctime>
#include <iomanip>

extern "C" void findCountOfElements(int*, int, int, int*);
extern "C" int findMinEl(int*, int, int*);


using namespace std;

int main() {
	setlocale(LC_ALL, "Ukrainian");

	int* mass;
	int* countElements;
	int* minCount;
	int n, m;

	cout << "������ ������� ����� �������: ";
	cin >> n;
	while (n <= 0) {
		cout << " ������� �����! ������ �� ���: ";
		cin >> n;
	}
	cout << " ������ ������� �������� �������: ";
	cin >> m;
	while (m <= 0) {
		cout << " ������� �����! ������ �� ���: ";
		cin >> m;
	}
	mass = new int[n * m];
	countElements = new int[m];
	minCount = new int[m];

	srand(time(NULL));
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < m; j++) {
			mass[i * m + j] = rand() % 21 - rand()%21;
			cout << setw(4) << mass[i * m + j];
		}
		cout << endl;
	}

	findCountOfElements(mass, n, m, countElements);

	cout << " ʳ������ �������� �������i�: " << endl;
	for (int j = 0; j < m; j++) {
		cout << " [" << j << "]=" << countElements[j] << endl;
	}
	int min = findMinEl(zeroCount, m, minCount);
	cout << " ������� � ��������� ������� �������� ��������: " << endl;
	for (int j = 0; j < m; j++) {
		if (minCount[j] == 1) {
			cout << " [" << j << "]=" << min << endl;
		}
	}
	cout << endl;
	system("pause");
	return 0;
}