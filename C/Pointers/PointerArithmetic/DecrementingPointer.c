#include <stdio.h>

const int MAX = 3; 

int main() 
{
	int array[] = {10,100,200};
	int i, *pointer; 
	
	// Get the array address in the pointer
	pointer = &array[MAX-1]; 
	
	for(i = MAX; i > 0; i--)
	{
		printf("Address of var[%d] = %x\n", i-1, pointer);
		printf("Value of var[%d] = %d\n", i-1, *pointer);
		printf("\n");
		pointer --; // decrement pointer to the next location
	}
}