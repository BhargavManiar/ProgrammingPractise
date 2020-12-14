#include <stdio.h>
#include <stdlib.h>

struct node {
	int number; 
	struct node *next;
};


void push(struct node** head_ref, int new_data);
void printList(struct node *node);
struct node* addNumbers(struct node *one, struct node *two);

int main() {
	
	struct node* listOne = NULL;
	//push(&listOne, 3);
	//push(&listOne, 4);
	//push(&listOne, 2);
	push(&listOne, 9);
	push(&listOne, 9);
	push(&listOne, 9);
	push(&listOne, 9);
	push(&listOne, 9);
	push(&listOne, 9);
	push(&listOne, 9);

	
	struct node* listTwo = NULL;
	push(&listTwo, 9);
	push(&listTwo, 9);
	push(&listTwo, 9);
	push(&listTwo, 9);
	//push(&listTwo, 4);
	//push(&listTwo, 6);
	//push(&listTwo, 5);
	

	struct node* result = addNumbers(listOne, listTwo);
	printList(result);
	
	return 0;
}

void push(struct node** head_ref, int new_data){
	struct node* new_node = (struct node*) malloc(sizeof(struct node));
	
	new_node->number = new_data;
	new_node->next = (*head_ref);
	(*head_ref) = new_node;
	return;
}

void printList(struct node *node){
	while(node != NULL){
		printf(" %d ", node->number);
		node = node->next;
	}
}

struct node* addNumbers(struct node *one, struct node *two)
{
	struct node* output = NULL;
	struct node* finalOutput = NULL;
	
	int sum = 0;
	
	while(one != NULL || two != NULL){
		if(one != NULL){
			sum += one->number;
			one = one->next;
		}
		
		if(two != NULL){
			sum += two->number;
			two = two->next;
		}

		push(&output,sum%10);
		sum = sum / 10;
	}
	
	if(sum > 0){
		push(&output, sum);
	}
	
	while(output != NULL) {
		push(&finalOutput, output->number);
		output = output->next;
	}
		
	return finalOutput;
}