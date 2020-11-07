#include <stdio.h>

const int MAX = 3; 

int main()
{
	int array[] = {10,20,200};

	int	i; // For the for loop
	int *ptr[MAX]; // A pointer array
	
	for(i = 0; i < MAX; i++)
	{
		ptr[i] = &array[i]; //Assign the address of the elements in the array to the pointer array
	}
	
	for(i = 0; i < MAX; i++) 
	{
		printf("Value of array[%d] = %d\n", i,*ptr[i]);
	}
	
	return 0;
}