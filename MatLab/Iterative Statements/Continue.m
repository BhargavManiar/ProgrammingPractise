% Continue Statement

total = 0;

for i = 1:10
    n = input('Enter a number ');
    if(n < 0)
        disp('Ingoring entry.');
        continue;
    else
        total = total + n;
    end
end

disp(['Total = ' num2str(total)]);
