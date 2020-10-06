#include <iostream>
using namespace std;

int listPrime(int n) {

	int i; 

	if(n<2) {
		cout<< "Summation not possible\n";
	}

	// If n is even we can only express the number as summations of 2s 
	else if(n % 2 == 0) {
		for(i = 0; i < n/2; i++) {
			cout << 2 << " ";
		}

	}

	// If n is odd 
	else {
		n = n - 3; // Make n even from it being odd
		for(i = 0; i < n/2; i++) {
                          cout << 2 << " ";
                }

		cout << 3 << " ";

	}

}


int main() {
	int n;

	cin >> n;

	listPrime(n);
	
	return 0;
}
