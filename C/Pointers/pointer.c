#include <stdio.h>

int main() 
{
	int a = 10; //Here is a normal variable declaration 
	int *p = //Pointer variable denoted with astrix
	p = &a; // assigning address of a to the pointer p, denoted with &a for the address

	printf("a = %d, p=%x, &a=%x, *p =%d\n", a,p,&a,*p);

	return 0;
}
