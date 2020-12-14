/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
void push(struct ListNode** head, int newData){
    struct ListNode* newNode = (struct ListNode*) malloc(sizeof(struct ListNode));
    newNode->val=newData;
    newNode->next = (*head);
    (*head)=newNode;
    return;
}

struct ListNode* addTwoNumbers(struct ListNode* l1, struct ListNode* l2){
    struct ListNode* output = NULL;
    struct ListNode* finalOutput = NULL;
    
    int sum = 0; 
    
    while(l1 != NULL || l2 != NULL){
        if(l1 != NULL){
            sum += l1->val; 
            l1 = l1->next;
        }
        if(l2 != NULL){
            sum += l2->val;
            l2 = l2->next;
        }
        push(&output, sum%10);
        sum = sum / 10;
    }
    
    if(sum > 0){
        push(&output, sum);
    }
    
    while(output != NULL){
        push(&finalOutput, output->val);
        output = output->next;
    }
    return finalOutput;
}
