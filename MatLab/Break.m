% Break Statement

total = 0;

for i = 1:10
    n = input('Enter a number ');
    if(n < 0)
        disp('Ingoring, stopping.');
        break;
    else
        total = total + n;
    end
end

disp(['Total = ' num2str(total)]);