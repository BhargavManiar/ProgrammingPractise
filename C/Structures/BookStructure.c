#include <stdio.h>
#include <string.h>

struct Books {
	char title[50];
	char author[50];
	char subject[100];
	int book_id;
};

int main(){
	struct Books Book1; 
	struct Books Book2; 

	// Book one
	strcpy(Book1.title, "C Programming");
	strcpy(Book1.author, "Nuha Ali");
	strcpy(Book1.subject, "C Programming Tutorial");
	Book1.book_id = 6495407;

	// Book two
	strcpy(Book2.title, "Telecom Billing");
	strcpy(Book2.author, "Zara ALi");
	strcpy(Book2.subject, "Tlecom Billing Tutorial");
	Book2.book_id = 6495700;

	// Print book one information
	printf("Book 1 title   : %s\n", Book1.title);
	printf("Book 1 author  : %s\n", Book1.author);
	printf("Book 1 subject : %s\n", Book1.subject);
	printf("Book 1 book_id : %d\n", Book1.book_id);

	printf("\n");

	// Print book two information 
	printf("Book 2 title  : %s\n", Book2.title);
	printf("Book 2 author : %s\n", Book2.author);
	printf("Book 2 subject: %s\n", Book2.subject);
	printf("Book 2 book_id: %d\n", Book2.book_id);
	
	return 0; 
}
