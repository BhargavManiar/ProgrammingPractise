import java.io.*;
import java.util.*;
class Node{
	int data;
	Node next;
	Node(int d){
        data=d;
        next=null;
    }
	
}
class Solution
{

    public static Node removeDuplicates(Node head) {
		
		Set<Integer> set = new HashSet<Integer>(); // Set to hold data

		if(head == null) { // If the element has no data, return
			return head;
		}

		set.add(head.data); // Add the head data to the set
		Node current = head; 	// New node called current holds copy of head 
		
		while(current.next != null) { // While there is data in the next node
			
			if(set.contains(current.next.data)) { // Check if the next node's data is in the set
				current.next = current.next.next; // Remove the next element by chaining the next element on 
			} else {	// If the data isn't in the set add the next node value to the set
				set.add(current.next.data);
				current = current.next; // Go to the next node
			}
			
		} 	
		
		return head; // Return data
		
    }

	 public static  Node insert(Node head,int data)
     {
        Node p=new Node(data);			
        if(head==null)
            head=p;
        else if(head.next==null)
            head.next=p;
        else
        {
            Node start=head;
            while(start.next!=null)
                start=start.next;
            start.next=p;

        }
        return head;
    }
    
    public static void display(Node head)
	{
		  Node start=head;
		  while(start!=null)
		  {
			  System.out.print(start.data+" ");
			  start=start.next;
		  }
	}
	
	public static void main(String args[])
	{
		  Scanner sc=new Scanner(System.in);
		  Node head=null;
		  int T=sc.nextInt();
		  while(T-->0){
			  int ele=sc.nextInt();
			  head=insert(head,ele);
		  }
		  head=removeDuplicates(head);
		  display(head);

   }
}
