%Variables
g = 9.8; m = 0.2;
k = 2; R = 20;
b = 0.5; L = 0.01;
e = eps;
%Valores de equilibrio
ieq = 0.5;
yeq = 0.2551;
Fmeq = k*(ieq^2)/yeq;
ki = (2*k*ieq)/yeq;
ky = -k*(ieq^2)/(yeq^2);
kp=1000; %Ganancia proporcional
[A,B,C,D] = linmod('FuncionTransferencia');
[num,den] = ss2tf(A, B, C, D);
G = tf(num,den);
bode(G);