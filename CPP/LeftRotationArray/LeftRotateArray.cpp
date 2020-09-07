#include <iostream>
using namespace std;

int main() 
{
	int n; // Number of arrays
	int d; // Number of times to rotate

	cout << "Enter the values for n and d" << endl;
	cin >> n >> d; // Get the information from the user

	// Add the elements to the array, based on the length of the array. 
	int a[n]; // Define an array of length 'n'
	for(int i = 0; i < n; i++)
	{
		cin >> a[i];
	}

	cout << "Array of elements after rotation : ";
	for(int i = 0; i < n; i++)
	{
		cout << a[(i+d)%n] << " ";
	}

	return 0; 
}
