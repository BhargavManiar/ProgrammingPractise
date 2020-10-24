% While Loop

i = round(rand(i) * 10); % Random number between 0 to 10

% initalising guess
guess = -1; 

while guess ~= i 
    guess = input('Input a value from 0 - 10.');
    if(guess==i)
        disp('correct');
    else
        disp('Wrong. try again');
    end    
end


