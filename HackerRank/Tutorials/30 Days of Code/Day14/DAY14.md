# Scope

## Objective 
Today we're discussing scope. Check out the [Tutorial](https://www.hackerrank.com/challenges/30-scope/tutorial) tab for learning materials and an instructional video!

The absolute difference between two integers, ***a*** and ***b***, is written as **|*****a-b*****|**. The maximum absolute difference between two integers in a set of positive integers, ***elements***, is the largest absolute difference between any two integers in ***__elements***.

The Difference class is started for you in the editor. It has a private integer array (***elements***) for storing ***N*** non-negative integers, and a public integer (***maximumDifference***) for storing the maximum absolute difference.

## Task 
Complete the Difference class by writing the following:

* A class constructor that takes an array of integers as a parameter and saves it to the ***__elements*** instance variable.

* A computeDifference method that finds the maximum absolute difference between any **2** numbers in ***__elements*** and stores it in the ***maximumDifference*** instance variable.

## Input Format
You are not responsible for reading any input from stdin. The locked Solution class in the editor reads in **2** lines of input. The first line contains ***N***, the size of the elements array. The second line has ***N*** space-separated integers that describe the ***__elements*** array.

## Constraints
* **1**  ≤ ***N*** ≤ **10**
* **1** ≤ ***__elements***[***i***] ≤ **100**, where **0** ≤ ***i*** ≤ ***N*** - **1**

## Output Format
You are not responsible for printing any output; the Solution class will print the value of the ***maximumDifference*** instance variable.

## Sample Input
<pre>
STDIN   Function
-----   --------
3       __elements[] size N = 3
1 2 5   __elements = [1, 2, 5]
</pre>
## Sample Output
> 4

## Explanation
The scope of the ***__elements*** array and ***maximumDifference*** integer is the entire class instance. The class constructor saves the argument passed to the constructor as the ***__elements*** instance variable (where the computeDifference method can access it).

To find the maximum difference, computeDifference checks each element in the array and finds the maximum difference between any **2** elements: |**1** - **2**| = **1**  

|**1** - **5**| = **4**

|**1** - **5**| = **3**

The maximum of these differences is **4**, so it saves the value **4** as the ***maximumDifference*** instance variable. The locked stub code in the editor then prints the value stored as ***maximumDifference*** , which is **4**.
