%Helix

% Z data for Z axis
z = 0:0.05:10*pi;

% X data for X axis
x = sin(z);

% Y data for y axis
y = cos(z);

figure(1);
plot3(x,y,z,'.b'); % This is the 3d plot function
title('helix');
xlabel('X');
ylabel('Y');
zlabel('Z');