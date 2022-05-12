%Ejercicio_4
k = 9.5;
Gp = tf([400],[1 20 200]);
Gs = tf([100],[1 100]);
Tr = 0.1;
s = tf([1 0],1);
Cs = k*(1+1/(Tr*s));
Gla = Gs*Gp*Cs;

%lugar de las raices
figure
rlocus(Gla);
[K,polos]=rlocfind(Gla);

% 4.2 Seleccione tres valores de Kp para los cuales el sistema a lazo cerrado sea estable, y adem´as:
% la respuesta al escalón en lazo cerrado posea un solo polo dominante;
% la respuesta al escalón en lazo cerrado posea un par de polos complejos conjugados
% dominantes;
% la respuesta al escalón en lazo cerrado posea tres polos dominantes con similares partes
% reales.

Glc = feedback(Cs*Gp,Gs);
k1=2 , Cs1 = k1*(1+1/(Tr*s));
k2=1 , Cs2 = k2*(1+1/(Tr*s));
Glc1 = feedback(Cs1*Gp,Gs);
Glc2 = feedback(Cs2*Gp,Gs);
rlocus(Glc1,Glc2)
figure
step(Glc1,Glc2)

%seleccion de k
Glc1 = feedback(k1*Cs*Gp,Gs);
ltiview(Glc1)


%bode
figure
bode(Gla);
%nyquist
figure
nyquist(Gla);
axis('equal')
%4.4 Distinto Kp

figure
bode(k1*Gla);
%nyquist
figure
nyquist(k1*Gla);
axis('equal')