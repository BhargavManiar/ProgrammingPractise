#include <iostream>
using namespace std;

int main() 
{
	cout << "Enter the number of variables in the equation: ";
	int n; 
	
	cin >> n; 			  // User input
	char var = 'x';
	int a[n][n], b[n][1]; // Declared 2D and 1D array
	
	for(int i = 0; i < n; i++) // Iterate for n before going to the next line
	{
		for(int j = 0; j < n; j++) // Iterate for n before taking the constant value
		{
			cin >> a[i][j]; // Get the Matrix values, user input.
		}
		cin >> b[i][0]; // Get the constant values, user input.
	}
	
	cout << "\nLinear Equations in Matrix representation is: \n";
	for(int i = 0; i < n; i++)
	{
		for(int j = 0; j < n; j++)
		{
			cout << " " <<a[i][j]; //print the matrix values 
		}
		//print the variable and constant values 
		cout << " " << static_cast<char>(var) << " = " << b[i][0] << "\n";
		var ++; 
	}
	
	return 0;
		
}