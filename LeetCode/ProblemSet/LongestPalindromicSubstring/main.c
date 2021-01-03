#include <stdio.h>
#include <string.h>
#include <stdlib.h>

char* longestPalindrome(char* s);
void test(char* s);

int main()
{
	char example1 [] = {"babad"};
	char example2 [] = {"cbbd"};
	char example3 [] = {"a"};
	char example4 [] = {"ac"};
	
	test(example1);
	test(example2);
	test(example3);
	test(example4);
	
	return 0;
}

char* longestPalindrome(char* s)
{
	char *start;
	char *end;
	char *p = s;
	char *subStart = s;
	int maxLen = 1;

	while(*p)
	{
		start = p;
		end = p;

		while(*(end+1) && *(end+1) == *end)
		{
			end++;
		}
		p = end + 1;

		while(*(end+1) && (start > s) && *(end + 1) == *(start -1))
		{
			start --;
			end ++;
		}

		if(end - start + 1 > maxLen)
		{
			maxLen = end - start + 1;
			subStart = start;
		}
	}

	char *rst = (char *) calloc(maxLen + 1, sizeof(char));
	strncpy(rst, subStart, maxLen);
	return rst;
}

void test(char* s) {
	printf("%s\n",longestPalindrome(s));
}
