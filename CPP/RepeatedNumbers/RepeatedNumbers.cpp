#include <bits/stdc++.h>
using namespace std;

void findRepeat(int * a, int n) {
	// Declaratin of the map

	unordered_map<int, int> hash;

	for(int i = 0; i<n; i++) { // creation of the map
		hash[a[i]]++; //for same key increase frequency
	}

	cout << "repeated number 	frequency\n";
	for(auto it=hash.begin(); it!=hash.end();it++)
	if(it->second>1)//frequency>1 means repeating element 
	printf("d\t\t\t%d\n", it->first, it->second);
}

int main()
{
	int n; 

	cout << "enter array length\n";
	cin << n; 
	int* << a=(int*)(malloc(sizeof(int)*n));

	cout << "input array elements...\n";
	for(int i = 0; i < n; i++)
	scanf("%d",&a[i]);

	//function to print repeating elements with their frequencies 
	findRepeat(a,n);

	return 0;
}
