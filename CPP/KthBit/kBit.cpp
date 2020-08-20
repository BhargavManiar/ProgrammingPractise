#include <iostream>
using namespace std;

// K starts from 1
// left shift 1 K-1 times and xor with number n 
// 1<<K-1 generates a mask in which only Kth bit is set. 

int ToggleKthBit(int n, int K)
{
	return n ^ (1 << (K-1)); // n xor (left shift of K), this is the toggled number
}

int main()
{
	int num, k;
	
	// Get the integer from the user
	cout << "Enter number: ";
	cin >> num;

	// Get the bit position to toggle
	cout << "Enter bit to toggle (value of k): ";
	cin >> k; 

	cout << "Original number before toggl" << num << endl;

	int new_number = ToggleKthBit(num, k); 

	cout << "New number after toggling: " << new_number << endl;

	return 0;
}
