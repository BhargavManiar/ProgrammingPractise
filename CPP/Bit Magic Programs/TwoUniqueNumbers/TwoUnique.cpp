#include <iostream> 
using namespace std;

int findRightMostBit(int x) {
	int i = 0; 		// Counter to find the bit position 
	while (x > 0) {		
		if(x&1){	// If x and 1 are true, we can return the position
			return i; 
		}
		i++;
	}
	return i; 
}

void findUnique(int arr[], int size) {
	int res = 0; 		// Result 

	for(int i = 0; i < size; i++){
		res = res ^ arr[i]; // XOR Operation
//		cout << "Value of result is: " << res << endl;
	}	

	cout << "Final value of res is: " << res << endl; 
	
	int bitPos = findRightMostBit(res); // Get the right most bit

	cout << "Right most bit position " << bitPos << endl;

	int mask = (1 << bitPos); 	    // Produce a bit mask by shifting the mask down by one
	
	cout << "Mask : " << mask << endl; 

	int firstNo = 0; 		    // First number initialisation

	for(int i = 0; i < size; i++) {
		if((mask & arr[i]) != 0) {  // If the mask with an array item is 1
			firstNo = firstNo ^ arr[i]; // XOR the numbers
		}
	}

	int secondNo = firstNo ^ res;	    // XOR Operation
	cout << "Two Unique Numbers : " << firstNo << " , " << secondNo; 
}

int main() {
	int n; 

	cout << "Enter size of array : ";
	cin >> n; 
	
	int arr[n];
	
	cout << "Enter elements of array  : \n";

	for(int i = 0; i < n; i++) // Get all of the values from the user.
	{
		cin >> arr[i];
	}

	findUnique(arr, n);	   // Perform the primary logic

	return 0;
}
