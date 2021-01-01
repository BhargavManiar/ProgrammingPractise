#include <stdio.h>

double findMedianSortedArrays(int* nums1, int nums1Size, int* nums2, int nums2Size);
void test(int* nums1, int* nums2, int sizeOne, int sizeTwo);
void printoutArray(int* numbers, int maxLen);
void swap(int *a, int *b);
void bubbleSort(int array[], int size);

int main()
{
	// Example 1
	int nums1[2] = {1,3};
	int nums2[1] = {2};
	test(nums1, nums2, 2, 1);
	
	// Example 2
	int nums3[2] = {1,2};
	int nums4[2] = {3,4};
	test(nums3, nums4, 2, 2);
	
	// Example 3
	int nums5[2] = {0,0};
	int nums6[2] = {0,0};
	test(nums5, nums6, 2,2);
	
	// Example 4
	int	nums7[0] = {};
	int nums8 [1] = {1};
	test(nums7,nums8,0,1);
	
	// Example 5
	int nums9[1] = {2};
	int nums10[0] = {};
	test(nums9,nums10,1,0);

	return 0;
}

double findMedianSortedArrays(int* nums1, int nums1Size, int* nums2, int nums2Size)
{
	double medianValue; 
	int maxArrayLength = nums1Size + nums2Size; 
	int concateArray[maxArrayLength];
	int i, numberOne, numberTwo; 
	int counter = 0; 
	
	//printf("The max array length is: %d\n", maxArrayLength);
	// Concatenate both arrays
	for (i = 0; i < nums1Size; i++)
	{
		concateArray[counter] = nums1[i];
		counter ++;
	}
	
	for (i = 0; i < nums2Size; i++)
	{
		concateArray[counter] = nums2[i];
		counter ++;
	}
	
	//printoutArray(concateArray, maxArrayLength); // Part of testing

	// Sort the arrays
	bubbleSort(concateArray, maxArrayLength);
	//printoutArray(concateArray, maxArrayLength); // Part of testing
	
	// Get median

	if(maxArrayLength % 2 == 0.0)
	{
		int middle = maxArrayLength / 2;
		//printf("Middle Value %d\n",middle);
		numberOne = middle-1; 
		numberTwo = middle; 
		medianValue = (concateArray[numberOne] + concateArray[numberTwo])/2.0;
	}
	else
	{
		double middle = maxArrayLength / 2;
		//printf("Middle Value %f\n",middle);
		int mid = middle + 0.5;
		//printf("Mid value %d\n", mid);
		medianValue = concateArray[mid];
	}
	
	return medianValue;
}

void test(int* nums1, int* nums2, int sizeOne, int sizeTwo)
{
	double median = findMedianSortedArrays(nums1,sizeOne,nums2,sizeTwo);
	printf("The value of the median is %f\n", median);
	return; 
}

void printoutArray(int* numbers, int maxLen)
{
	// Print out the contented arrays
	int i;
	for(i = 0; i < maxLen; i++)
	{
		printf("%d ",numbers[i]);
	}
	printf("\n");
}

// Bubble Sort Functions

void swap(int *a, int *b)
{
	int temp = *a; 
	*a = *b; 
	*b = temp; 
}

void bubbleSort(int array[], int size)
{
	int i, j;
	
	for(i = 0; i < size - 1; i++)
	{
		for(j = 0; j < size-i-1; j++)
		{
			if(array[j] > array[j+1])
			{
				swap(&array[j], &array[j+1]);
			}
		}
	}

}