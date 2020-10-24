function [ArrMean ArrMax] = my_function(in) % The name of the function is the same as the file name
    SizeIn = size(in);
    
    if SizeIn(2) > 2
        ArrMean = mean(in);
        ArrMax = max(in);
        
        disp(['The Mean is: ' num2str(ArrMean) ' The Max is: ' num2str(ArrMax)]);
    else
        disp('Error: not enough values');
    end
end
