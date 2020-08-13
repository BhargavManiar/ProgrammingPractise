#include <iostream>
including namespace std; 

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
	
	return 0;
}
