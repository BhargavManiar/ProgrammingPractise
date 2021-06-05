# Bitwise Operators

## Objective
Today, we're practicing bitwise operations. Check the attached tutorial for more details.

## Task
We define ***S*** to be a sequence of distinct sequential integers from **1** to ***n***; in other words, ***S*** **= {1, 2, 3,...,***n***}**. We want to know the maximum bitwise AND value of any two integers, ***a*** and ***b*** (where ***a*** **<** ***b*** ), in sequence ***S*** that is also less than a given integer, ***k***.

Complete the function in the editor so that given ***n*** and ***k***, it returns the maximum ***a & b*** < ***k***.

**Note**: The  symbol represents the [bitwise AND](https://en.wikipedia.org/wiki/Bitwise_operation#AND) operator.

## Input Format
The first line contains an integer, ***q***, denoting the number of function calls. 
Each of the ***q*** subsequent lines defines a dataset for a function call in the form of two space-separated integers describing the respective values of ***n*** and ***k***.

## Constraints
*  **1 ≤** ***q*** **≤ 10<sup>3</sup>**
*  **2 ≤** ***n*** **≤ 10<sup>3</sup>**
*  **2 ≤** ***k*** **≤** ***n***

## Output Format
Return the maximum possible value of ***a*** **&** ***b*** **<**  ***k*** for any  in sequence ***S***.

## Sample Input 0
> 3
>
> 5 2
>
> 8 5
>
> 2 2


## Sample Output 0
> 1
>
> 4
>
> 0

## Explanation 0
We perform the following ***q*** = **3**  function calls:
1. When ***n*** **= 5** and ***k*** **= 2**, we have the following possible ***a*** and ***b*** values in set ***S*** **={1, 2, 3, 4, 5}**:


| ***a*** | ***b*** | ***a*** **&** ***b*** |
|--------|--------|--------|
| 1 | 2 | **001 & 010 = (000)<sub>2</sub> ⇒ (0)<sub>10</sub> |
| 1 | 3 | **001 & 011 = (001)<sub>2</sub> ⇒ (1)<sub>10</sub> |
| 1 | 4 | **001 & 100 = (000)<sub>2</sub> ⇒ (0)<sub>10</sub> |
| 1 | 5 |  **001 & 101 = (001)<sub>2</sub> ⇒ (1)<sub>10</sub> |
| 2 | 3 | **010 & 011 = (010)<sub>2</sub> ⇒ (2)<sub>10</sub> |
| 2 | 4 | **010 & 100 = (000)<sub>2</sub> ⇒ (0)<sub>10</sub> |
| 2 | 5 | **011 & 101 = (000)<sub>2</sub> ⇒ (0)<sub>10</sub> |
| 3 | 4 | **011 & 100 = (000)<sub>2</sub> ⇒ (0)<sub>10</sub> |
| 3 | 5 | **011 & 101 = (001)<sub>2</sub> ⇒ (1)<sub>10</sub> |
| 4 | 5 | **100 & 101 = (100)<sub>2</sub> ⇒ (4)<sub>10</sub> |

The maximum of any ***a*** **&** ***b*** that is also **<** ***k*** is **1**, so we return **1**.

2. When ***n*** **= 8** and ***k*** **= 5**, the maximum of any ***a*** **&** ***b*** **<** ***k*** in set ***S*** **= {1, 2, 3, 4, 5, 6, 7, 8}** is **4** (see table above), so we return **4**.

3. When ***n*** **= 2** and ***k*** **= 2**, the maximum of any ***a*** **&** ***b*** **<** ***k*** in set ***S*** **= {1, 2}** is **0** (see table above), so we return **0**.

## Sample Input 1
> 2
>
> 9 2
>
> 8 3

## Sample Output 1
> 1
> 2

We perform the following ***q*** **= 2** function calls:

1. When ***n*** **= 9** and ***k*** **= 2**, the maximum of any ***a*** **&** ***b*** **<** ***k*** in set ***S*** **= {1, 2, 3, 4, 5, 6, 7, 8, 9}** is **1** (see table above), so we return **1**.

2. When ***n*** **= 8** and ***k*** **= 3**, the maximum of any ***a*** **&** ***b*** **<** ***k*** in set ***S*** **= {1, 2, 3, 4, 5, 6, 7, 8}** is **2** (see table above), so we return **2**.
