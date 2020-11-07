#include <stdio.h>

double getAverage(int *array, int size);

int main()
{
	int balance[5] = {1000, 2, 3, 17, 50};
	double average; 
	
	// Pass pointer to the array as an argument
	average = getAverage( balance, 5 );
	
	// Output the return value
	printf("Average value is: %f\n", average);
	
	return 0; 
}

double getAverage(int *array, int size) {
	int i, sum = 0; 
	double average;
	
	for(i = 0; i < size; ++i) 
	{
		sum += array[i];
	}
	
	average = (double) sum / size ;
	
	return average;
}