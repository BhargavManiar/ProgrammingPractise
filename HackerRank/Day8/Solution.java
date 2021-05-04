//Complete this code or write your own from scratch
import java.util.*;
import java.io.*;

class Solution{
    public static void main(String []argh){
        Scanner in = new Scanner(System.in);
        HashMap<String,Integer> phoneBook = new HashMap<String,Integer>();// The phone book
        int n = in.nextInt(); // Get the number of entries to add
        
        for(int i = 0; i < n; i++){ // Get the name and number
            String name = in.next();
            int phone = in.nextInt();
            // Write code here
            phoneBook.put(name, phone); // Add to address book
        }
        while(in.hasNext()){
            String s = in.next();
            
            // Write code here
            if(phoneBook.get(s) == null) {                  // Check if there is an entry
                System.out.println("Not found");                    
            } else {
                System.out.println(s+"="+phoneBook.get(s)); // Print out the entry
            }
        }
        in.close();
    }
}