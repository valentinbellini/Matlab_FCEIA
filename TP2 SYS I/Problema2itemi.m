kp=1000; %Ganancia proporcional
[A,B,C,D] = linmod('TransferenciaP2');
[num,den] = ss2tf(A, B, C, D);
G = tf(num,den);

