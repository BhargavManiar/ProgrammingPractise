import java.util.*;

class Solution {
    public String convert(String s, int numRows) {

		// If only one character
        if (numRows == 1) {
         return s; 
        }

		// Create an Array List
        List<StringBuilder> rows = new ArrayList<>();


		// Generate entries in array list based minimum rows required
        for (int i = 0; i < Math.min(numRows, s.length()); i++){
            rows.add(new StringBuilder());        
        }

        int currentRow = 0; // Counter for which row we are looking at
        boolean goingDown = false; // Boolean to indicate if we are going up or down on the zig zag

		// For every character
        for (char c : s.toCharArray()) {
            rows.get(currentRow).append(c); // Append character to row
            
            // If at the top or bottom of the zig zag
            if (currentRow == 0 || currentRow == numRows - 1) {
            	goingDown = !goingDown; // Toggle the boolean
            }
            
            // If going up add 1. If going down subtract 1
            currentRow += goingDown ? 1 : -1;
        }

        StringBuilder finalString = new StringBuilder();
        
        // For each row in rows
        for (StringBuilder row : rows)  {
        	finalString.append(row);
        }
        
        // Return a string value of finalString
        return finalString.toString();
    }
    
    public static void main(String[] args) {
		Solution solution = new Solution();
		
    	// Test 1
    	System.out.println(solution.convert("PAYPALISHIRING", 3));
    	
    	// Test 2
    	System.out.println(solution.convert("PAYPALISHIRING", 4));
    	
    	// Test 3
    	System.out.println(solution.convert("A",1));
    }
}
