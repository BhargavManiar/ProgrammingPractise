// The Lucas Series starts with 2,1. Like the fibonacci series it adds up the last two numbers to produce the next number. 


// This program prints up to n terms. 

#include <iostream>

using namespace std;

int main()
{
	int n;	       	   // The amount of terms we want to calculate
	int numberOne = 2; // The first number to add
	int numberTwo = 1; // The second number to add
	int temporary; 	   // To hold a number for reassignment.
	int i;         	   // Counter declared early for compatability
	
	// Get user input
	cout << "Enter a value for n for the Lucas Seres:" << endl;
	cin >> n; 

	if(n <= 0)	   // If the user enters a number equal 0 or a negative number
	{
		cout << "That is ridiculous" << endl;
	}
	else if(n == 1)
	{
		cout << "2" << endl;
	}
	else if(n == 2)
	{
		cout << "1" << endl;
	}
	else // Compute the values greater than 2.
	{
		cout << "Here are the Lucas Series terms for " << n << " values " << endl;
		cout << numberOne << endl;
		cout << numberTwo << endl;

		for(i = 0; i < n-2; i++) // i less than 2 of the series as we print out the first two before, they are already set.
		{
			temporary  = numberTwo + numberOne;
			cout << temporary << endl;
			numberOne = numberTwo; 
			numberTwo = temporary; 
		}
	}

	return 0; 
}
