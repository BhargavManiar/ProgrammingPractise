% CaseSwitch

number = input('Please input a value from 1-7 ');

if(number >= 1 && number <= 7)
    switch number
        case 1
            disp('mon');
        case 2
            disp('tue');
        case 3
            disp('wed');
        case 4
            disp('thur');
        case 5
            disp('fri');
        case 6
            disp('sat');
        case 7
            disp('sun');
    end
else
    disp('Error');
end
