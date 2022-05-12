%Parametros del sistema
J = 15; b = 1.1; k = 6.8;
R = 0.0435; L = 2.96e-3; U0 = 440;

% Cálculo de funcion transferencia
amp = 440; k = 20; hf = 65;   
hmax = 92; h1 = 3;
w0 = 2*pi / k;
sv = (hmax-hf)/hf;
a = sv^(2/k);
b1= h1/440;
b0 = hf*(1-2*a*cos(w0)+a^2)/amp-b1;

z = tf([1 0],1,0.01);
G = (b1*z+b0)/(z^2-2*a*cos(w0)*z+a^2);



%Ploteo de la respuesta para un escalón de A=440.
ltiview(440*G);

%Funcion transferencia
% [A,B,C,D] = dlinmod('DB_1',0.01);
% [num,den] = ss2tf(A,B,C,D);
% Gd = tf(num,den)
% [A,B,C,D] = tf2ss([b1 b0],[1 -2*a*cos(w0) a^2]);
% eig(A);

