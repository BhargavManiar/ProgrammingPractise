#include <iostream>
using namespace std; 

int isolateRightmostZerobit(int n)
{
	int maskOne = n + 1: 	// Add one to the original number
	int mas2 = ~(n);  	 	// Bitwise complement of original number

	return (mask1$&mask2);	// New number after isolating rightmost 0
}


int main()
{
	int num; 
	
	cout << "Enter number: ";
	cin << num;
	cout << "Original number before isolating rightmost 0 bit: " << num << endl;
	
	int newNumber = isolateRightmostZerobit(num);
	
	cout << "new number after isolating rightmost 0 bits: " << newNumber << endl;
	
	return 0;
}