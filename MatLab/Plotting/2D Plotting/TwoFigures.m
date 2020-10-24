x = 0:0.1:2*pi;

y = sin(x);
y2 = cos(x);

figure(1);
plot(x,y,'-b');

figure(2);
plot(x,y2,'--');