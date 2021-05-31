import java.io.*;
import java.math.*;
import java.security.*;
import java.text.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.function.*;
import java.util.regex.*;
import java.util.stream.*;
import static java.util.stream.Collectors.joining;
import static java.util.stream.Collectors.toList;

public class Solution {

    public static void main(String[] args) {

        Scanner input = new Scanner(System.in);
        int tests = input.nextInt(); // Get number of tests
        

		// Iterate over tests
        for (int test = 0; test < tests; test++) { 
            
            int n = input.nextInt(); // Get N value
            int k = input.nextInt(); // Get K value
            int result = 0;			
            
            // Iterate to 
            for(int i=1; i<n;i++){
            
                for(int j=i+1;j<=n;j++){
                
                    int and=i&j;
                    //System.out.println(i + " AND " + j + " = " + and);
                    
                    // Check if the AND operation is less than K and keep the largest value
                    if(and<k && and > result){ 
                        result = and;
                    }
                }
                
            }
            
           System.out.println(result); // Print result after test is complete
        }
          
    	input.close(); 
    }
       
}