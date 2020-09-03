Given a number and we have to check whether it is power of 2 or not.

An obvious approach is to divide the number by 2 until the number will not get 0 or 1. But This Algorithm has the problem of Time complexity. This algorithm takes the O(log(n)) complexity to solve such a simple problem.

So how can we improve this?, Can this be solved in order of O(1) complexity?

The answer to this is "yes", with the help of the bitwise operator.

But, before this, we have to know about a simple property of binary number which is "the power of 2 having only one set bit in their Binary representation".
