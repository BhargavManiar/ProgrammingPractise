#include <iostream>
using namespace std;


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
		int stringLength = findLength(arr); 
		
		//Extending the string
		arr[stringLength+1] = '\0';

		int i; 
		for(i = stringLength - 1; i>= (start+1); i--){
			arr[i+1] = arr[i];
		}
		
		// Entering the '*'
		arr[start+1] = '*';
	}
}

int main(){
	char input[50]; 			// Get user input
	cout<<"Enter Input"<<endl; // Get length of the input 
	cin >> input;			   // Parse through the string adding the '*' in between the same letters
	
	pairStar(input,0);
	
	cout<<"Modified Output"<<endl;
	cout<<input<<endl;
	
	return 0;
}