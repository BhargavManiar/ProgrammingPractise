#include <iostream>
using namespace std;

int main() 
{
	// Numbers to work perform the operation 
	int x = 10;
	int y = 20; 
	
	// Print the numbers
	cout << "x : " << x << endl;
	cout << "y : " << y << endl;
	
	// calculation 
	int result = x -(-y);
	
	// printing the result 
	cout << "result : " << result << endl; 
	cout << endl;
	
	// assigning the other values 
	x = -10; 
	y = 20;
	
	// printing the numbers
	cout << "x : " << x << endl;
	cout << "y : " << y << endl;
	
	// calculation
	result = x - (-y);
	
	// print the result
	cout << "result : " << result << endl;
	cout << endl;
	
	// assigning the other values
	x = -10; 
	y = -20;
	
	// printing the numbers
	cout << "x : " << x << endl;
	cout << "y : " << y << endl;
	
	// calculation
	result = x- (-y);
	
	// print the result 
	cout << "result : " << result << endl;
	
	return 0;
}