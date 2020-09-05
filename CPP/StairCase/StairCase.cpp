#include <iostream>
using namespace std; 

int staircase(int n){
	if(n<0){
		return 0;
	}

	if(n==0){
		return 1; 
	}

	int count = 0; 
	count += staircase(n-1);
	count += staircase(n-2); 
	count += staircase(n-3); 

	return count;
}

int main() {
	int n; 
	cout << "Enter number of stairs" << endl;
	cin >> n;

	cout << "No of ways to climb stairs are ";
	cout << staircase(n) << endl;

	return 0;
}
