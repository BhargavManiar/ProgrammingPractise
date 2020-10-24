% Graphs in MatLab

% Generate some values for the x and y axis.
x=0:0.1:2*pi;
y=sin(x);

% Plot the graphs like so, x,y arguments in that order, then the line
% format we want to use.
plot(x,y,'-b'); % This uses a straight line 
plot(x,y,'--r'); % This is a dashed line

% Adding titles and labels to the graph
title("Sine Wave Plot"); 
xlabel("0 to 2Pi");
ylabel("Sin Value");

x=1:2:10;
y=[12 22 30 8 10];
plot(x,y,"*g"); % An example of non-line graph.