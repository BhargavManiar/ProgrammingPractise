# 2D Arrays

## Objective 
Today, we are building on our knowledge of arrays by adding another dimension. Check out the [Tutorial](https://www.hackerrank.com/challenges/30-2d-arrays/tutorial) tab for learning materials and an instructional video.

## Context 
Given a **6** x **6**  2D Array, ***A***:
> <pre>
1 1 1 0 0 0
0 1 0 0 0 0
1 1 1 0 0 0
0 0 0 0 0 0
0 0 0 0 0 0
0 0 0 0 0 0
</pre>

We define an hourglass in ***A*** to be a subset of values with indices falling in this pattern in ***A***'s graphical representation:

> <pre>
a b c
  d
e f g
</pre>

There are **16** hourglasses in ***A***, and an hourglass sum is the sum of an hourglass' values.

## Task 
Calculate the hourglass sum for every hourglass in ***A***, then print the maximum hourglass sum.

## Example
In the array shown above, the maximum hourglass sum is **7** for the hourglass in the top left corner.

## Input Format
There are **6** lines of input, where each line contains **6** space-separated integers that describe the 2D Array ***A***.

## Constraints
* -**9** <= ***A***[***i***][***j***]  <= **9**
* **0** <= ***i***, ***j*** <= **5**

## Output Format
Print the maximum hourglass sum in ***A***.

## Sample Input
 > <pre>
 1 1 1 0 0 0
 0 1 0 0 0 0
 1 1 1 0 0 0
 0 0 2 4 4 0
 0 0 0 2 0 0
 0 0 1 2 4 0
</pre>

## Sample Output
> 19

## Explanation
***A*** contains the following hourglasses:
> <pre>
1 1 1   1 1 0   1 0 0   0 0 0
  1       0       0       0
1 1 1   1 1 0   1 0 0   0 0 0
> </pre>

> <pre>
0 1 0   1 0 0   0 0 0   0 0 0
  1       1       0       0
0 0 2   0 2 4   2 4 4   4 4 0
> </pre>

> <pre>
1 1 1   1 1 0   1 0 0   0 0 0
  0       2       4       4
0 0 0   0 0 2   0 2 0   2 0 0
> </pre>

> <pre>
0 0 2   0 2 4   2 4 4   4 4 0
  0       0       2       0
0 0 1   0 1 2   1 2 4   2 4 0
> </pre>

The hourglass with the maximum sum (**19**) is:

> <pre>
2 4 4
  2
1 2 4
</pre>
