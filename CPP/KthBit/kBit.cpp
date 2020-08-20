#include <iostream>
using namespace std;

// K starts from 1
// left shift 1 K-1 times and xor with number n 
// 1<<K-1 generates a mask in which only Kth bit is set. 

int ToggleKthBit(int n, int K)
{
	cout << "" << endl;
	int output = (K-1);
	cout << "The value of K is subtracted by one, " << K << "-1, to get: " << output << endl;
	
	output = (1 << (K-1));
	cout << "After the shift of 1 to the left the value is: " << output << endl;
	
	output = n ^ output;
	cout << "The XOR value is: " << output << endl;  
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


	int new_number = ToggleKthBit(num, k); 
	cout << "" << endl;
	cout << "Original number before toggle: " << num << endl;
	cout << "New number after toggling: " << new_number << endl;

	return 0;
}
