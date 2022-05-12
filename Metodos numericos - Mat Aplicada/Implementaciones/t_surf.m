% Script para plotear un campo escalar usando surf
% Luciano Ponzellini Marinelli (2017)

x = -4:0.05:4;
y = -1:0.1:1;
[X,Y] = meshgrid(x,y);
Z = X.^4.*exp(-X.^2-Y.^2);
surf(X,Y,Z), colorbar