#include <iostream>
#include "pch.h"
#include <stdlib.h>

extern "C" int CalculateSum(int a, int b, int c, int* s1, int* s2, int* s3);

int main()
{
	int a = 2, b = 3, c = 4;
	int s1, s2, s3;

	CalculateSum(a, b, c, &s1, &s2, &s3);
	std::cout << a << " " << b << " " << c << "\n";
	std::cout << s1 << " " << s2 << " " << s3 << "\n";
}

