#include <iostream>
using namespace std; 

int main()
{
	int n, r; // Variables for amount of values and teh rotation amount respectively
	cout << "Enter the amount of numbers and the rotation value: " << endl;
	cin >> n >> r; 

	// Get the numbers from the user and store them in an array 
	int a[n]; // Create an array of size n

	cout << "Enter the numbers: ";
	for(int i = 0; i < n; i++)
	{
		cin >> a[i];
	}

	cout << "Array of elements after rotation: ";
	for(int i = 0; i < n; i++)
	{
		cout << a[(i+r)%n] << " ";
	}

	return 0;
}
