import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution {
      
    public static void main(String[] args) {
        
        // Get user input
        Scanner in = new Scanner(System.in);
        int arr[][] = new int[6][6];
        for(int i=0; i < 6; i++){
            for(int j=0; j < 6; j++){
                arr[i][j] = in.nextInt();
            }
        }
        
        // Check the matrix 
        int ans = 0;
        int tempAns = -100000;
        for(int i=0; i < 4; i++) {
            for(int j=0; j < 4; j++) {
                ans = arr[i][j] + arr[i][j+1] + arr[i][j+2] + arr[i+1][j+1]
        + arr[i+2][j] + arr[i+2][j+1] + arr[i+2][j+2]; 
                if(ans>tempAns){ // Only store the largest value
                    tempAns = ans;
                }
            }
        }
        
        // Print out the largest value
        if(ans>=tempAns){
            System.out.println(ans);
        } else{
            System.out.println(tempAns);
        }
    }
}