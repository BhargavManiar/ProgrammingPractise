#include <iostream>
using namespace std;

int isolateRightMostOneBit(int n)
{
	// to computer -n, toggle all bits and add 1 to it
	int mask = -n;
	// new number after isolating rightmost 1 bit 
	
	return (n&mask);
}