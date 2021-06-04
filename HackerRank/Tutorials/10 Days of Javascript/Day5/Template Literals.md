# Template Literals

## Objective
In this challenge, we practice using JavaScript Template Literals. Check the attached tutorial for more details.

## Task
The code in the editor has a tagged template literal that passes the area and perimeter of a rectangle to a tag function named sides. Recall that the first argument of a tag function is an array of string literals from the template, and the subsequent values are the template's respective expression values.

Complete the function in the editor so that it does the following:

1. Finds the initial values of ***s*****<sub>1</sub>** and ***s*****<sub>2</sub>** by plugging the area and perimeter values into the formula:

    ***s*** **=** **(** ***P*** ± **(*****P*****<sup>2</sup>** - **16 ·** ***A*****)****<sup>1/2</sup>** **)** **/ 4**

    where ***A*** is the rectangle's area and ***P*** is its perimeter.    

2. Creates an array consisting of ***s*****<sub>1</sub>** and ***s*****<sub>2</sub>** and sorts it in ascending order.
3. Returns the sorted array.

## Input Format
The first line contains an integer denoting ***s*****<sub>1</sub>**. 

The second line contains an integer denoting ***s*****<sub>2</sub>**.

## Constraints
* **1** ≤ ***s*****<sub>1</sub>**, ***s*****<sub>2</sub>** ≤ **100**

## Output Format
Return an array consisting of ***s*****<sub>1</sub>** and ***s*****<sub>2</sub>**, sorted in ascending order.

## Sample Input 0
> 10
>
> 14

## Sample Output 0
> 10
>
> 14

## Explanation 0
The locked code in the editor passes the following arrays to the tag function:

* The value of ***literals*** is [ `'The area is: ', '.\nThe perimeter is: ', '.'` ].

* The value of ***expressions*** is [ `140, 48` ], where the first value denotes the rectangle's area, ***A***, and the second value denotes its perimeter, ***P***.

When we plug those values into our formula, we get the following:

// Equations

***s*****<sub>1</sub>** **=** **(** ***P*** **+** **(*****P*****<sup>2</sup>** - **16 ·** ***A*****)****<sup>1/2</sup>** **)** **/ 4** **=**  **(** **48** ± **(****48****<sup>2</sup>** - **16 ·** **140****)****<sup>1/2</sup>** **)** **=** **48 + 8 / 4 = 14**

***s*****<sub>1</sub>** **=** **(** ***P*** **-** **(*****P*****<sup>2</sup>** - **16 ·** ***A*****)****<sup>1/2</sup>** **)** **/ 4** **=**  **(** **48** ± **(****48****<sup>2</sup>** - **16 ·** **140****)****<sup>1/2</sup>** **)** **=** **48 - 8 / 4 = 10**

We then store these values in an array, [`14, 10`], sort the array, and return the sorted array, [`10, 14`], as our answer.
