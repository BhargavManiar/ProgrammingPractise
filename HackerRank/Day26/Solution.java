import java.io.*;
import java.util.*;

public class Solution {

    public static void main(String[] args) {
        
        // User input
        Scanner input = new Scanner(System.in);
        int[] inputData = new int[6];
        for(int i = 0; i < 6; i++) {
            inputData[i] = input.nextInt();
        }
        
        int fine = 0; // Accumulated fine
        
        // Returned date
        int returnedDay = inputData[0];
        int returnedMonth = inputData[1];
        int returnedYear = inputData[2];
        
        // Due date
        int dueDay = inputData[3];
        int dueMonth = inputData[4];
        int dueYear = inputData[5];
        
        // Check if returned on time
        if(returnedDay <= dueDay && returnedMonth <= dueMonth && returnedYear <= dueYear) {
            fine = 0;
        } else if(returnedDay > dueDay && returnedMonth <= dueMonth && returnedYear <= dueYear) {
            fine = 15*(returnedDay - dueDay);
        } else if(returnedMonth > dueMonth && dueYear == returnedYear) {
            fine = 500*(returnedMonth - dueMonth);
        } else if(returnedYear > dueYear) {
            fine = 10000;
        }
        
        // Output fine
        System.out.println(fine);
    }
}
