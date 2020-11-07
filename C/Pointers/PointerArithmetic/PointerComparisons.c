#include <stdio.h>

const int MAX = 3; 

int main() 
{
	int array[] = {10,100,200};
	int i, *pointer; 
	
	pointer = array;
	i = 0;
	
	while(pointer <= &array[MAX-1]) // The pointer comparison is being performed here
	{
		printf("Address of array[%d] = %x\n", i, pointer);
		printf("Values of var[%d] = %d\n",i,*pointer);
		printf("\n");
		pointer ++;
		i++;
	}
	
	return 0;
}