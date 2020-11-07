#include <stdio.h>


const int MAX = 3;
int main()
{
	int array[] = {100,200,400};
	
	int i; 
	
	for(int i = 0; i < MAX; i++)
	{
		printf("Value of var[%d] = %d\n", i, array[i]);
	}
	return 0;
}