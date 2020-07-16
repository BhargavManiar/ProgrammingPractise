#include <iostream>
using namespace std;

// __Function prototypes__

int findLength(char array[]) {
	int length = 0; 
	int i; 
	
	for (int i = 0; array[i]!= '\0'; i++) {
		length += 1; 	
	}
	
	return length;
}

//Recursive Function

void pairStar(char arr[], int start){
	// Base Case: Reached End of String
	if(arr[start] == '\0'){
		return;
	}
	
	//Recursive-call
	pairStar(arr, start+1);
	if(arr[start] == arr[start+1]){
		int stringLength = length(arr); 
		
		//Extending the string
		arr[stringLength+1]
	}
}

int main(){
	// Get user input
	// Get length of the input 
	// Parse through the string adding the '*' in between the same letters
	
	
	return 0;
}