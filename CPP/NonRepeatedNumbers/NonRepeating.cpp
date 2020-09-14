#include <bits/stdc++.h>

using namespace std; 

void findNonRepeat(int * a, int n) {
	unordered_map<int,int> hash;
	
	int i;

	for(i = 0; i < n; i++) {
		hash[a[i]]++;
	}

	cout << "the nonrepeating numbers are: ";
	
	for(auto it=hash.begin(); it!=hash.end();it++)
	if(it->second==1) // If a value only occurs once it means that its non-repeating
	printf("%d ",it->first);
	printf("\n");
}

int main() {

	int n; 
	cout << "enter array length\n";
	cin >> n;
	int* a=(int*) (malloc(sizeof(int)*n));

	cout<<"input array elements...\n";

	for(int i = 0; i<n; i++)
	scanf("%d",&a[i]);

	//call the logic to find the frequencies
	findNonRepeat(a,n);

	return 0;
}
