x = 0:0.1:2*pi;

y = sin(x);
y2 = cos(x);

figure(1);
hold on;
plot(x,y,'-b');
plot(x,y2,'--');
