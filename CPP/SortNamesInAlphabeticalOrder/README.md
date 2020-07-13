#Program to Sort Names in an Alphabetical Order


Problem statement: Write a C++ program to sort N names in alphabetical order.

Example & explanation:

Let user inputs 5 names as following:

    rahul
    virat
    vijay
    bumrah
    rahane
Alphabetical sorting means to sort names according to alphabet order starting from the rightmost character. (Rightmost character->'r' for 'rahul').

That means, in the 'rahul' precedes 'vijay' in alphabetical order since rightmost character of 'rahul' is 'r' where as rightmost character of 'vijay' is 'v' & 'r' precedes 'v' in alphabetical order.

The next concern is what about 'rahul' & 'rahane' since both of them has same rightmost character. In such cases compare corresponding elements from right to left direction.

Thus 'rahane' precedes 'rahul' since 'a' precedes 'u' in alphabetical order. (Both have 'rah' part common).

One more thing is 'abdul' will precedes 'abdulla' as both have 'abdul' as common part & 'abdul' has nothing left where 'abdulla' has.

So using the above facts the names will appear after sorting:

    bumrah
    rahane
    rahul
    vijay
    virat
