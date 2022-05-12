%Variables
g = 9.8; m = 0.2;
k = 2; R = 20;
b = 0.5; L = 0.01;
e = eps;
ieq = 0.5;
yeq = 0.2551;
Fmeq = k*(ieq^2)/yeq;
ki = (2*k*ieq)/yeq;
ky = -k*(ieq^2)/(yeq^2);
%Llamado a las salidas
t = yout{1}.Values.Time;
y1 = yout{1}.Values.Data;
i1 = yout{2}.Values.Data;
u1 = yout{3}.Values.Data;
%Ploteos
subplot(313), plot(t,y),grid on;
subplot(312), plot(t,i),grid on;
subplot(311), plot(t,u),grid on;
