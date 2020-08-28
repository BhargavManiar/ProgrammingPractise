#include <iostream>
using namespace std;

int isolateRightMostOneBit(int n)
{
	// to computer -n, toggle all bits and add 1 to it
	int mask = -n;

	cout << "The original number: " << n << endl;
	cout << "The mask created: " << mask << end; 
	cout << "And operation of the orignal and the mask: " << (n&mask) << endl;
	
	// new number after isolating rightmost 1 bit 
	return (n&mask);
}

int main()
{
	int num; 
	
	cout << "Enter number: ";
	cin >> num; 
	cout << "original number before isolating rightmost 1 bit: " << num << endl; 
	
	int newNumber = isolateRightMostOneBit(num);
	
	cout << "new number after isolating rightmost 1 bit: " << newNumber << endl;
	
	return 0;
}



