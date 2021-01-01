#include <stdio.h>
#include <string.h>

int lengthOfLongestSubstring(char * s);
void test(char* example);

int main()
{
	char exampleOne[] =  "abcabcbb";
	char exampleTwo[] =  "bbbbb";
	char exampleThree[] = "pwwkew";
	char exampleFour[] = "";
	char exampleFive[] = "b";
	char exampleSix[] = "bhargav";

	test(exampleOne);
	test(exampleTwo);
	test(exampleThree);
	test(exampleFour);
	test(exampleFive);
	test(exampleSix);
	
	return 0;
}

int lengthOfLongestSubstring(char* s) 
{
	int maximumCount = 1; 
	int count = 1;
	int jCounter = 0;
	int i; 
	int j; 
	
	// Short String Return
	
	if(!s[0]) // Empty first value
	{
		//printf("%d\n", !s[0]);
		return 0;
	}
	else if(!s[1]) // Empty second value i.e only one letter
	{
		//printf("%d\n", !s[1]);
		return 1;
	}
	
	// Longer String check
	
	// Starting from the second letter
	for(i = 1; s[i]; i++) // Iterate through all letters in the string
	{
		for(j = jCounter; j < i; j++)
		{
			if(s[i] != s[j])
			{
				count ++;
			}
			else
			{
				jCounter = j + 1;
			}
		}
		
		if(maximumCount < count) // If this count was larger than maximumCount update it.
		{
			maximumCount = count; 
		}
		
		count = 1; // Reset count for the next set
	}	
	
	
	return maximumCount;
}

void test(char* example) 
{
	printf("The input %s\n", example);
	int length = lengthOfLongestSubstring(example);
	printf("The output %i\n", length);
}