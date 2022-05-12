
%% (1) Obtencion de G3
% sim('coloquio_17_12_21_EJ1a.slx');
% plot(y2.time,y2.signals.values), grid on  -> para ver grafica
% G3 = b1*s + b0)/ (s +a0)
tau3 = 33; a0_3 = 1/tau3; %A partir de la gráfica
b1_3 = 0; %Grado relativo 1
b0_3 = 0.455*a0_3 % TVF: h(inf) = G3(0) = 0.455 -> b0 = 0.455*a0
G3 = tf([b1_3 b0_3],[1 a0_3]);
[g3.data,g3.time] = step(G3);
plot(y2.time,y2.signals.values,g3.time,g3.data), grid
axis([0 250 0 0.5])

%% Obtener funcion transferencia G1
% plot(y1b.time,y1b.signals.values)
tau1 = 16.3; a0_1 = 1/tau1; %A partir de la grafica
b1_1 = 0; %Grado relativo 1
b0_1 = 0.043*a0_1; % TVF: h(inf) = G1(0) = 0.043 -> b0 = 0.043*a0
G1 = tf([b1_1 b0_1],[1 a0_1]);
[g1.data,g1.time] = step(G1);
plot(y1b.time,y1b.signals.values,g1.time,g1.data), grid
axis([0 150 0 0.045])

%% Obtencion funcion transferencia G2
% plot(y2b.time,y2b.signals.values), grid  
tau2 = 33; a0_2 = 1/tau2; 
b1_2 = 0; %Grado relativo 1
b0_2 = -3.04e-3*a0_2; 
G2 = tf([b1_2 b0_2],[1 a0_2]);
[g2.data,g2.time] = step(G2);
plot(y2b.time,y2b.signals.values,g2.time,g2.data)
axis([0 230 -3.5e-3 0])

%Verificamos polos de G2 Y G3 -> Es el mismo por el mismo tau elegido
pole(G2)
pole(G3)

%% (1c) Obtenemos G = Y2/U1 = G2 +G3*G1;
G = minreal(G2 + G3*G1); %Orden 2
[Gdata,Gt] = step(G);
plot(Gt,Gdata,y2c.time,y2c.signals.values)
% axis([0 200 0 18e-3])

%% Control proporcional sobre G
Gd = c2d(G,1);
% La FTD de lazo cerrado será entonces Glcd = K*Gd / (1+K*Gd)
rlocus(Gd); %Vemos que deja de ser estable para K = 843
nyquist(Gd); %Al ampliar el nyquist vemos que si K crece, el diagrama encierra al punto critico 2 veces en sentido horario
K = 853;
[gm,pm,wgm,wpm] = margin(Gd); %gm = 854
Glcd = feedback(K*Gd,1); step(Glcd)

%% Estimar error de seguimiento
% R - Y(0) < error -> R = 1 -> 1 - error < KG(1) / 1+KG(1)
error = 1 - (gm*dcgain(Gd) / (1 + gm*dcgain(Gd))); % 6.6%
step(feedback(K*Gd,1)), hold
plot([0 6e4],[1-error 1-error],'k')
plot([0 6e4],[1+error 1+error],'k')

%% Controlador proporcional integral
% Se propone un nuevo controlador para mejorar el resultado anterior
z = tf('z');
%Polo rápido -> Mas lejos de la circunferencia unitaria
pole(Gd);
p1 = 0.9405;
C = (z-p1)/(z-1);
GLAd = C*Gd;

nyquist(GLAd) %Al hacer zoom se ve un cruce por cero, por lo tanto habra un valor de K para el cual el sistema se vuelva inestable
              % debido a que el nyquist daria 2 vueltas alrededor del punto
              % critico en sentid horario.-
[GM,PM,WGM,WPM] = margin(GLAd); %GM = 291
rlocus(GLAd); K1 = 7.32; K1b = 10; K1c = 50; K1d = 200; %rlocfind(GLAd)
%Donde se juntan los dos polos estaran mas lejos de la circunferencia
% unitaria siendo ahi polos rapidos.
GLC2 = feedback(K1*GLAd,1); GLC2b = feedback(K1b*GLAd,1); GLC2c = feedback(K1c*GLAd,1); GLC2d = feedback(K1d*GLAd,1);
step(GLC2,GLC2b,GLC2c,GLC2d)
legend(["K1=7.32","K2=10","K3=50","K4=200"]);

%% Ejercicio 6. Verificacion sobre el modelo brindado
step(GLC2/100), hold on;
plot(y2_6.time,y2_6.signals.values,'r');
legend(["Aproximado","Original"]);

%% Retrato de fase
plot(y1_7.signals.values,y2_7.signals.values), hold on;
plot(y1_8a.signals.values,y2_8a.signals.values);
plot(y1_8b.signals.values,y2_8b.signals.values);
plot(y1_8c.signals.values,y2_8c.signals.values);
legend("7","8a","8b","8c");
% axis([-0.005 0.045 -0.005 18e-3]);

% u1 : flujo de entrada de cierto reactivo
% u2 : concentracion adicional del primer producto de la reacción
% y1;y2 : concentraciones de los productos

% 7: El sistema parte del equilibrio para el pulso dado, en forma de nodo
% inestable y luego cuando se cancela el aporte de la entrada vuelve a ser
% un nodo estable, tendiendo al valor de equilibrio. Los autovalores pasan
% de ser reales positivos distintos a reales negativos distintos. (Por la
% cantidad que recorren pareceria que el polo de y1 se encuentra mas a la
% izquierda a la vuelta)


