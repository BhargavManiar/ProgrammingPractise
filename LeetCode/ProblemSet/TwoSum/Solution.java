class Solution {
	public int[] twoSum(int[] nums, int target) {
		// Iterate through the array with the first element performing addition.
		// We are assuming that there is only one possible answer. 

		int[] indexPositions = new int[2];
		int additionValue; // Holds the same value for addition with other numbers
		int comparisonValue;
		int summation;
		for(int i = 0; i < nums.length; i++) {  // This is the outer loop
			
			additionValue = nums[i];
			for(int j = 0; j < nums.length; j++) { // This is the inner loop
				if(i != j) { // If the index postion is the same then we can check
					comparisonValue = nums[j];
					summation = (additionValue + comparisonValue);
					
					if(summation == target) {
						// Assumption: there is only one answer
						indexPositions[0] = i;
						indexPositions[1] = j; 
						break; // Break out of loops
					}
				
				} // End of outer if 
			} 
		} // End outer for-loop
		
		return indexPositions; // Return the two index positions.
		
	} // End function
	
} // End Class