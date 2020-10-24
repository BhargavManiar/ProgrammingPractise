% Sinc Function

[X,Y] = meshgrid(-10:0.05:10, -10:0.05:10);

% Define our sinc function
R = sqrt(X.^2 + Y.^2);
Z = sin(R)./R;

% Plot the mesh data
mesh(X,Y,Z);

title("Sinc Function");
xlabel('X');
ylabel('Y');