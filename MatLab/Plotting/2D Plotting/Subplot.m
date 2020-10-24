x = 0:0.1:2*pi;

y = sin(x);
y2 = cos(x);

subplot(2,1,1);
plot(x,y,'-b');
title('Sin');
xlabel('x');

subplot(2,1,2);
plot(x,y2,'--r');
title('cos');
xlabel('x');