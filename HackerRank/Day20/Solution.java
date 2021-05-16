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
    public static void main(String[] args) throws IOException {
		int swapCounter = 0;
		
		// Get input
		Scanner scanner = new Scanner(System.in);
		int n = scanner.nextInt();
		int[] inputArray = new int[n];
		for(int i = 0; i < n; i++) {
			inputArray[i] = scanner.nextInt();
		}
		scanner.close();
		
		// Perform Bubble Sort
		int temp = 0;
		for(int i = 0; i < n; i++) {
			for(int j = 1; j < (n-i); j++) {
				if(inputArray[j-1] > inputArray[j]) {
					temp = inputArray[j-1];
					inputArray[j-1] = inputArray[j];
					inputArray[j] = temp;
					swapCounter ++;
				}
			}
		} // End of Bubble Sort
		
		// Print output
		System.out.println("Array is sorted in " + swapCounter + " swaps.");
		System.out.println("First Element: " + inputArray[0]);
		System.out.println("Last Element: " + inputArray[n-1]);
    }
}
