% Matrices

% This is an example of a matrix declaration
a = [1,2,3; 4,5,6; 7,8,9];

% Accessing data from a matrix
matrixValueAns = a(2,3); % Row then column, in this case the answer should be 6.

% Here a matrix with values of 0 can be declared (3 x 3 as per the argument)
emptyMatrix=zeros(3);

% A matrix can also be set to 1s as well.
emptyMatrix=ones(3,2); % Here we declare are 3x2 matrix

% The typical n*n matrix format can be made with the following function 
emptyMatrix=eye(3);

% This command will show the matrix in the commandline with the matrix
% format.
disp(emptyMatrix);
