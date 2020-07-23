#include <iostream>
using namespace std; 

// Returns the length of the char array
int stringLength(char arr[]) { 

	int length = 0; 

	int i;
	for(i = 0; arr[i] != '\0'; i++) {	// While the element in the array is not and end line value
		length ++; 						// Increment the length value 
	}
	
	return length;
}



// Helper Function
int stringToInt(char input[], int last) {
	// Base case
	if(last == 0) {
		return input[last]-'0'; // Subtract the value of character 0
	}
	
	// Recursive case
	int smallAns = stringToInt(input, last-1);
	int a = input[last] - '0';
	return smallAns * 10 + a;
}

// Recursive Function
int stringToInt(char input[]) { // With redefinition we need to have a change in the amount of arguments
	int length = stringLength(input);
	return stringToInt(input, length-1);
}

int main() {
	char input[50];

	cout<<"Enter an input "<<endl;
	cin >> input; // Save the input
	
	cout << "The output/number is ";
	cout << stringToInt(input) << endl;
	return 0;
}