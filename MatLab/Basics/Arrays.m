
% An array can be declared and stored in an array. 

a=[1 2 3 4];
b=[4,3,2,1]; 

% Notice that the elements in an array can separate items with a comma
% or with a space. 

% If an array follows a sequence for instance 2n. 
c=0:2:10;

% The above will generate [0,2,4,6,8,10]

% If you know the start and end values of an array, you can generate the
% values inbetween by providing the length of the array.

d=linspace(1,10,5); % Parameters: start, end, number of entries


% Here are some of the functions for arrays

% Get the largest value in the array.
maximumOfA=max(a);

% Get the smallest value in the array
minimumOfA=min(a);

% Get the sum of all the values in the array
sumOfA=sum(a);

% Get the mean average of the values in the array 
meanOfA=mean(a);

% Get the standard deviation of the array
standardDeviationA=std(a);

% Accessing values 
result=b(1); % Gets the first value of the array 
selectionofresults=b(1:3); % Gets the values from 1 to 3 from the array.



