class Main {
	public static void main(String args[])
	{
		Solution attemptOne = new Solution(); 
		
		int[] output = new int[2];
		int[] input = {2, 7, 11, 15};
		int target = 9;
		
		output = attemptOne.twoSum(input, target);
		
		System.out.println(output[0]);
		System.out.println(output[1]);
		
		System.exit(0); // Exit with code 0.
	}
}