#include <iostream>
using namespace std; 

int staircase(int n){
	// Two base cases.
	if(n<0){ // Return 0 if a negative number
		return 0;
	}

	if(n==0){ // Return 1 if we get to 0
		return 1; 
	}

	int count = 0; // Declration of counter value. 

	// Recursive calls
	count += staircase(n-1); // number of stairs - 1 
	count += staircase(n-2); // number of stairs - 2
	count += staircase(n-3); // number of stairs - 3

	return count; // Return count value
}

int main() {
	int n; 

	// Get user input
	cout << "Enter number of stairs" << endl;
	cin >> n;
	
	// Show the output to the user
	cout << "No of ways to climb stairs are ";
	cout << staircase(n) << endl;

	return 0;
}
