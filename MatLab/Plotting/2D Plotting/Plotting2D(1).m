x = 0:0.1:2*pi;
y = sin(x);

y2 = cos(x); 

plot(x, y, '-b', x, y2, '-r');
legend('Sin(x)', 'Cos(x)');