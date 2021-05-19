import java.util.*;
import java.io.*;
class Node{
    Node left,right;
    int data;
    Node(int data){
        this.data=data;
        left=right=null;
    }
}
class Solution{

static LinkedList<Integer> queue = new LinkedList();
static void levelOrder(Node root){
      LinkedList<Node> tree = new LinkedList();
      tree.add(root);
      
      while(tree.peek() != null) {
          Node current = tree.remove();
          
          System.out.print(current.data + " ");
          
          if(current.left != null) {    // Add left node to the queue
              tree.add(current.left);
          }
          
          if(current.right != null) {   // Add right node to the queue
              tree.add(current.right);
          }
             
      }
      
}

public static Node insert(Node root,int data){
        if(root==null){
            return new Node(data);
        }
        else{
            Node cur;
            if(data<=root.data){
                cur=insert(root.left,data);
                root.left=cur;
            }
            else{
                cur=insert(root.right,data);
                root.right=cur;
            }
            return root;
        }
    }
    public static void main(String args[]){
            Scanner sc=new Scanner(System.in);
            int T=sc.nextInt();
            Node root=null;
            while(T-->0){
                int data=sc.nextInt();
                root=insert(root,data);
            }
            levelOrder(root);
        }	
}