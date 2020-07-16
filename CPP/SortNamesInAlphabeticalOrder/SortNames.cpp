#include <bits/stdc++.h>
using namespace std; 

// Function to print the array 
void print(vector<string> names){
	printf("Printing.......\n");
	for(int i = 0; i < names.size(); i++)
	{
		cout<<names[i]<<endl;
	}
	printf("\n");
}

bool mycomp(string a, string b){
	// return 1 if string a is alphabetically
	// less than string b 
	// quite similar to the strcmp operation
	return a<b; // This is effective because characters are just numbers (unicode), thus we can figure out if a string is alphabetically greater or not
}

vector<string> alphabeticallySort(vector<string> a){
	int n = a.size(); 
	//mycomp function is the defined funciton which
	//sorts the strings in alphabetical order
	sort(a.begin(), a.end(), mycomp);
	return a;
		
}

int main() {
	int n; 
	printf("enter number of names to be added: ");
	scanf("%d", &n);
	
	//creating a vector of strings
	//vector to store strings(names)
	vector<string> names; 
	string name; 
	printf("enter names: \n");
	
	//taking input 
	for(int i = 0; i < n; i++){
		cin >> name;
		//insert names into the vector
		names.push_back(name); 
	}
	
	printf("\nbefore sorting\n");
	print(names);
	//function to sort names alphabetically
	names=alphabeticallySort(names);
	
	printf("after alphabetical sorting\n");
	print(names);
		
	return 0;
}