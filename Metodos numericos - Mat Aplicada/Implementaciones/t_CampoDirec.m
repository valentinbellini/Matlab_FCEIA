clc, clear

xmin =0;
xmax =5;
ymin =0;
ymax =4;

fpvi = @(t,y) (t-y)/2;
%fpvi = @(t,y) 1-exp(-t);

c=[ 2 3 4 5];

fsol = @(c,x) c*exp(-x/2)-2+x;
%fsol=@(c,x) exp(-x)+x+c;

CampoDirec(xmin,xmax,ymin,ymax,fpvi,c,fsol)