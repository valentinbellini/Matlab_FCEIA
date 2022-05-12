%Resoluci�n de la ecuaci�n diferencial
[t,x]= ode45('ecuacion',[0 14], [0;0;0;0]);
%Ploteos
subplot(211) %Subplot �ngulo 1
plot(t,x(:,1),'r'),hold on
plot(leTime,osEncoder1P/2544); %1 rad = 2544 cuentas
title('Respuesta a un pulso de amplitud 0.5 Nm y duracion 4 seg')
xlabel('Tiempo [seg]')
ylabel('�ngulo 1 [rad]')
legend('�ngulo 1 anal�tico','�ngulo 1 experimental')
subplot(212) %Subplot �ngulo 2
plot(t,x(:,3),'r'),hold on
plot(leTime,osEncoder2P/2544);
xlabel('Tiempo [seg]')
ylabel('�ngulo 2 [rad]')
legend('�ngulo 2 anal�tico','�ngulo 2 experimental')

