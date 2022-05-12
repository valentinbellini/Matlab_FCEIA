%Resolución de la ecuación diferencial
[t,x]= ode45('ecuacion',[0 8], [0;0;0;0]);
%Ploteo
subplot(411),plot(t,x(:,1)),grid on;
title('Respuesta de las variables a un pulso de 0.5 Nm')
xlabel('Tiempo [seg]')
ylabel('Angulo 1')
subplot(412),plot(t,x(:,2)),grid on;
xlabel('Tiempo [seg]')
ylabel('Vel. angular 1')
subplot(413),plot(t,x(:,3)),grid on;
xlabel('Tiempo [seg]')
ylabel('Angulo 2')
subplot(414),plot(t,x(:,4)),grid on;
xlabel('Tiempo [seg]')
ylabel('Vel. angular 2')



