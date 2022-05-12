%Variables
J1=0.009;J2=0.009;
K1=2.7114;K2=2.7113;
b1=0.02; b2=0.02;
%Definición de matrices
A=[0,1,0,0;(-K1/J1),(-b2/J1),(K1/J1),0;0,0,0,1;(K1/J2),0,(-(K1+K2)/J2),(-b1/J2)];
B=[0,(1/J1),0,0]';
C=[1 0 0 0];
D = [0];
%Función transferencia
[num,dem]=ss2tf(A,B,C,D); %state space to transfer function
G = tf(num,dem);
bode(G); %diagrama de bode de la funcion transferencia
raices = roots(dem);
ceros = roots(num);

