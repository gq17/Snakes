[X, Y] = meshgrid(-5:5, -5:5);
Z = X.^2 + Y.^2;
surf(X,Y,Z);