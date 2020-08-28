Problem Statement: To write a C++ program to isolate rightmost one bit of a number.

Constraints: 1<=n<=100

Example:

    Input:
    Enter number: 18

    Output:
    original number before isolating rightmost 1 bit: 18
    new number after isolating rightmost 1 bit: 2
Problem Explanation:

Suppose the given number is 18. Let’s denote rightmost one bit by ROB.

Now the binary representation of 18 is:

    n = 00010010
    mask = -n = 11101110 (toggle all bits and 1 to it)
    Binary representation of number after isolating ROB = n & mask
    n & mask = 00000010
    Hence decimal representation of new number is 2.
