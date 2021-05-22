import java.io.*;
import java.util.*;

public class Solution {

    public static void main(String[] args) {
        /* Enter your code here. Read input from STDIN. Print output to STDOUT. Your class should be named Solution. */
        
        // Declare variables
        int numberCounter = 0;
        String even = "";
        String odd = "";
        String[] words = new String[10]; // Max number of elements is 10
        
        Scanner scanner = new Scanner(System.in);
        
        
        // Obtain the inputs
        int occurances = Integer.parseInt(scanner.nextLine());
        
        for(int i = 0; i < occurances; i++) {
            words[i] = (scanner.nextLine());
        }
        
        
        for(int j = 0; j < occurances; j++) {  
        
            for(int i = 0; i < words[j].length(); i++) {
                if(numberCounter%2 == 0) {
                    even += (words[j].substring(i,i+1));            
                } else {
                    odd += (words[j].substring(i,i+1));
                }
                numberCounter ++;
            }
            
            System.out.println(even + " " + odd);
            
            even = odd = ""; 
            numberCounter = 0;

        }
        
        scanner.close();
    }
}
