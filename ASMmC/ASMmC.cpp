#include <iostream>
#include "pch.h"
#include <stdlib.h>

extern "C" int IntegerMulDiv(int a, int b, int* quo, int* res, int* rem);

int main()
{
	int a = 12;
	int b = 5;
	int* quo = new int();
	int* res = new int();
	int* rem = new int();

	IntegerMulDiv(a, b, quo, res, rem);

	std::cout << "quo: " << *quo << std::endl;
	std::cout << "res: " << *res << std::endl;
	std::cout << "rem: " << *rem << std::endl;

	delete quo;
	delete res;
	delete rem;
}

