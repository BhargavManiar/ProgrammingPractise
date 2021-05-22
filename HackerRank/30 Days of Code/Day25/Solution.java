import java.io.*;
import java.util.*;

public class Solution {

    public static void main(String[] args) {
        /* Enter your code here. Read input from STDIN. Print output to STDOUT. Your class should be named Solution. */
        
        // Get user input
        Scanner input = new Scanner(System.in);
        int size = input.nextInt();
        
        // Check if prime
        for(int i = 0; i < size; i++) {
            System.out.println(checkPrime(input.nextInt()) ? "Prime" : "Not prime");
        }
    }
    
    public static boolean checkPrime(int number) {
        if(number <= 1) {             // If 1 or less
            return false; 
        }  else if(number == 2) {     // If 2
            return true;
        } else if (number % 2 == 0) {    // If even 
            return false;
        }
        
        for(int i = 3; i < number; i+=2) {
            if(number % i == 0) {
                return false; // Not prime
            }
        }
        
        return true; // Prime
    }

}