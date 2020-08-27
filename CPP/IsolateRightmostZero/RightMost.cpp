#include <iostream>
using namespace std; 

int isolateRightmostZerobit(int n)
{
	int maskOne = n + 1;	 	// Add one to the original number
	int maskTwo = ~(n);  	 	// Bitwise complement of original number

	return (maskOne&maskTwo);	// New number after isolating rightmost 0
}


int main()
{
	int num; 
	
	cout << "Enter number: ";
	cin >> num; // Get user input and store it into num
	cout << "Original number before isolating rightmost 0 bit: " << num << endl;
	
	int newNumber = isolateRightmostZerobit(num);
	
	cout << "new number after isolating rightmost 0 bits: " << newNumber << endl;
	
	return 0;
}