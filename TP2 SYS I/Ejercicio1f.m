%Resoluci鏮 de la ecuaci鏮 diferencial
[t,x]= ode45('ecuacion',[0 14], [0;0;0;0]);
%Ploteos
subplot(211) %Subplot 嫕gulo 1
plot(t,x(:,1),'r'),hold on
plot(leTime,osEncoder1P/2544); %1 rad = 2544 cuentas
title('Respuesta a un pulso de amplitud 0.5 Nm y duracion 4 seg')
xlabel('Tiempo [seg]')
ylabel('聲gulo 1 [rad]')
legend('聲gulo 1 anal癃ico','聲gulo 1 experimental')
subplot(212) %Subplot 嫕gulo 2
plot(t,x(:,3),'r'),hold on
plot(leTime,osEncoder2P/2544);
xlabel('Tiempo [seg]')
ylabel('聲gulo 2 [rad]')
legend('聲gulo 2 anal癃ico','聲gulo 2 experimental')

