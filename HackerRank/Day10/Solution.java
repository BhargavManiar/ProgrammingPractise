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
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));

        int n = Integer.parseInt(bufferedReader.readLine().trim());
        System.out.println("The input value is: " + n);
        String binaryValue = Integer.toBinaryString(n);
        System.out.println("The binary string value is " + binaryValue);
        
        String[] splitArray = binaryValue.split("0");
		int length = 0;
		int maxLength = 0;

	
		for(String value : splitArray) {
			if(value.length() > maxLength) {
				maxLength = value.length();
			}
		}
		
		System.out.println(maxLength);


        bufferedReader.close();
    }
}

