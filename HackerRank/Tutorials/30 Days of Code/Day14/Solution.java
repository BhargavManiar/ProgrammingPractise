import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;


class Difference {
  	private int[] elements;
  	public int maximumDifference;

    // Constructor
    Difference(int[] elements) {
        this.elements = elements;
    }
    
	public void computeDifference() {
        int maximum = Arrays.stream(elements).max().getAsInt(); // Obtain maximum value
        int minimum = Arrays.stream(elements).min().getAsInt(); // Obtain minimum value
        this.maximumDifference = Math.abs(maximum - minimum);   // Get the abs difference
    }

} // End of Difference class

public class Solution {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int[] a = new int[n];
        for (int i = 0; i < n; i++) {
            a[i] = sc.nextInt();
        }
        sc.close();

        Difference difference = new Difference(a);

        difference.computeDifference();

        System.out.print(difference.maximumDifference);
    }
}