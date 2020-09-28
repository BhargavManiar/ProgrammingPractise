#include <iostream>
using namespace std; 

unsigned int swap_odd_even(int num) {
	int mask = 0xAAAAAAAA;
	// A in hexadecimal is equal to 10 in decimal 
	// A in binary is 1010

	unsigned int oddbits = (num&mask);
	// Right shift for even bits

	unsigned int evenbits = num&(mask>>1);
	// Can also use 0x55555555

	return (oddbits>>1) | (evenbits<<1);
}


int main() 
{
	int T; 
	cout << "Enter total number of elements (test cases): ";
	cin >> T; 

	// variable to store the number
	unsigned int N;

	for(int i = 0; i < T; i ++)
	{
		cout << "Enter number: ";
		cin >> N;
		cout << "Original number is : " << N << endl;
		cout << "Converted number is : " << swap_odd_even(N) << endl;
	}
	return 0;
}
