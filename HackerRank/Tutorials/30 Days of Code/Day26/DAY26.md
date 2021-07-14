# Day 26: Nested Logic

## Objective 
Today's challenge puts your understanding of nested conditional statements to the test. You already have the knowledge to complete this challenge, but check out the [Tutorial](https://www.hackerrank.com/challenges/30-nested-logic/tutorial) tab for a video on testing.

## Task 
Your local library needs your help! Given the expected and actual return dates for a library book, create a program that calculates the fine (if any). The fee structure is as follows:

1. If the book is returned on or before the expected return date, no fine will be charged (i.e.: ***fine*** **= 0** ).
2. If the book is returned after the expected return day but still within the same calendar month and year as the expected return date, ***fine*** **15 Hackos x (the number of days late)**.
3. If the book is returned after the expected return month but still within the same calendar year as the expected return date, the ***fine*** **500 Hackos x (the number of days late)**.
4. If the book is returned after the calendar year in which it was expected, there is a fixed fine of **10000 Hackos**.

## Example 
***d*****1**,***m*****1**, ***y*****1 = 12312014** returned date 

***d*****2**,***m*****2**, ***y*****2 = 112015** due date

The book is returned on time, so no fine is applied.

***d*****1**,***m*****1**, ***y*****1 = 112015** returned date 

***d*****2**,***m*****2**, ***y*****2 = 12312014** due date

The book is returned in the following year, so the fine is a fixed 10000.

## Input Format
The first line contains **3** space-separated integers denoting the respective ***day***, ***month***, and ***year*** on which the book was actually returned.

The second line contains **3** space-separated integers denoting the respective ***day***, ***month***, and ***year*** on which the book was expected to be returned (due date).

## Constraints
* **1 ≤** ***D*** **≤ 31**
* **1 ≤** ***M*** **≤ 12**
* **1 ≤** ***Y*** **≤ 3000**
* **It is guaranteed that the dates will be valid Gregorian calendar dates**

## Output Format
Print a single integer denoting the library fine for the book received as input.

## Sample Input
<pre>
STDIN       Function
-----       --------
9 6 2015    day = 9, month = 6, year = 2015 (date returned)
6 6 2015    day = 6, month = 6, year = 2015 (date due)
</pre>

## Sample Output
> 45

## Explanation
Given the following return dates: 
Returned: ***D*****<sub>1</sub> = 9**, ***M*****<sub>1</sub> = 6**, ***Y*****<sub>1</sub> = 2015**

Due: ***D*****<sub>2</sub> = 6**, ***M*****<sub>2</sub> = 6**, ***Y*****<sub>2</sub> = 2015**

Because ***Y*****<sub>2</sub>** **≡** ***Y*****<sub>1</sub>**, it is less than a year late.

Because ***M*****<sub>2</sub>** **≡** ***M*****<sub>1</sub>**, it is less than a month late.

Because ***D*****<sub>2</sub>** **<** ***D*****<sub>1</sub>**, it was returned late (but still within the same month and year).

Per the library's fee structure, we know that our fine will be **15 Hackos** x **(# days late)**. We then print the result of **15** x **(*****D*****<sub>1</sub> -** ***D*****<sub>2</sub>****)** **= 15** x **( 9 - 6)** = **45** as our output.
