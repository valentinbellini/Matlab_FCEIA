b = 400;
a1 = 20;
a0 = 200;

num = [b];
den = [1 a1 a0];
G = tf (num,den);

%%
wn = sqrt(a0);
xi = a1/(2*wn);
SV = exp((-pi*xi)/sqrt(1-xi^2));
wa = wn*sqrt(1-xi^2);
T = (2*pi)/wa;
dcgain(G); % Ganancia de la FT

%%
ltiview(G); %Grafica para corroborar settling time

%%
%a0 puede tener un error de hasta el 10%
a0_exceso = a0*1.1;
a0_defecto = a0*0.9;
den_e = [1 a1 a0_exceso];
den_d = [1 a1 a0_defecto];
G_e = tf(num,den_e);
G_d = tf(num,den_d);
dcgain(G_e); % = 1.8182
dcgain(G_d); % = 2.2222