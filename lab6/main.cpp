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

	cout << "Введіть кількість рядків матриці: ";
	cin >> n;
	while (n <= 0) {
		cout << " Помилка вводу! Введіть ще раз: ";
		cin >> n;
	}
	cout << " Введіть кількість стовпців матриці: ";
	cin >> m;
	while (m <= 0) {
		cout << " Помилка вводу! Введіть ще раз: ";
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

	cout << " Кількість нульових елементiв: " << endl;
	for (int j = 0; j < m; j++) {
		cout << " [" << j << "]=" << countElements[j] << endl;
	}
	int min = findMinEl(zeroCount, m, minCount);
	cout << " Стовпці з мінімальною кількістю нульових елементів: " << endl;
	for (int j = 0; j < m; j++) {
		if (minCount[j] == 1) {
			cout << " [" << j << "]=" << min << endl;
		}
	}
	cout << endl;
	system("pause");
	return 0;
}