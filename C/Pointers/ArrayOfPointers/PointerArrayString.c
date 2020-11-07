#include <stdio.h>


const int MAX = 3;

int main()
{
	char *names[] = {"Zara", "Hina", "Nuha", "Sara"}; 

	int i = 0; // Need this for the for loop.	
	for(i = 0; i < MAX; i++)
	{
		printf("Value of names[%d] = %s\n", i, names[i]);
	}
	
	return 0;
}