#include <stdio.h>

int main()
{
	int a = 10;
	
	int *p; // Pointer 1 for a
	
	int **q; // Pointer for p
	
	p = &a; // p -> a
	
	q = &p; // q -> p
	
	printf("Value of a = %d\n", a);
	printf("value of a using single pointer = %d\n", *p);
	printf("value of a using double pointer = %d\n", **q);
	return 0;
}
