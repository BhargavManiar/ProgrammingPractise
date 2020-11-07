#include <stdio.h>

const int MAX = 3; 

int main() 
{
	int array[] = {10,100,200};
	int i, *pointer; 
	
	// Get the array address in the pointer
	pointer = array; 
	
	for(i = 0; i < MAX; i++)
	{
		printf("Address of var[%d] = %x\n", i, pointer);
		printf("Value of var[%d] = %d\n", i, *pointer);
		printf("\n");
		pointer ++; // increment pointer to the next location
	}
}