%Parametros del sistema
J = 15;
b = 1.1;
k = 6.8;
R = 0.0435;
L = 2.96e-3;
U0 = 440;

%Funcion transferencia analitica
% s = tf([1 0],1);
% G1 = (k/(L*J))/(s^2+((R/L)+b/J)*s+(R*b+k^2)/(L*J));


% Funciones Transferencia Simulink
% [A,B,C,D] = linmod('DB_1'); 
% [num_u, den_u] = ss2tf(A,B,C,D,1); 
% [num_t, den_t] = ss2tf(A,B,C,D,2);
% Guw = tf(num_u,den_u); 
% Gtw = tf(num_t,den_t);

% Respuesta a un escalón de amplitud 440 V
% step(U0*Guw,'k');

% Ploteo de i(t) vs. w(t) 
%plot(Pulsacion.signals.values,Corriente.signals.values);
%plot(w,i);


%7.Controlador PI
[A,B,C,D] = linmod ('DB_PI_1');
[num,den] = ss2tf(A,B,C,D);
Gmc = tf(num,den)
pole(Gmc);
ltiview(60*Gmc);







