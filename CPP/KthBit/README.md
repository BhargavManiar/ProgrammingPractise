Problem Statement: To write a C++ program to toggle Kth bit of a number.

Constraints: 1<=n<=100

Example:

    
    Input:
    Enter number: 5
    Enter k: 2

    Output:
    original number before toggling: 5
    new number after toggling: 7
Problem Explanation:

Suppose the given number is 5 and the bit to be toggled is 2nd bit that is 1 left to the LSB.

Now the binary representation of 5 is:

    n = 00000101
    mask = 00000010 (left shift 1, one time (2-1) as k=2)
    Binary representation of number after toggling= n ^ mask
    n ^ mask = 00000111 
    Hence decimal representation of new number is 7.
This can be explained as follows:

Let Kth bit be X. Performing XOR with the mask toggles Kth bit only because:

If X is 0: 0^1 gives 1

If X is 1: 1^1 gives 0

For remaining bits of original number, XOR with 0 gives the bit itself.
