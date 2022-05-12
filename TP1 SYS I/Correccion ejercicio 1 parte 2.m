clear
R = 12; C = 1e-6; L = 1e-3; %Valores de L, R y C dados.
x1(1) = 0; %condicion inicial de carga
x2 (1) = 0; % condicion inicial de corriente
t10 = 10e-3; %tiempo pedido
valor = 100; %valor variable para paso de integración
T=(2*pi*sqrt(L*C)/(valor*sqrt(1-R^2*C/4*L))); %paso de integración
Amplitud = 1; %Amplitud del pulso
u = Amplitud * ones(1,round(t10/T)); %Entrada pulso de 10ms
for n = round(t10/T)+1:1:round(2*t10/T) 
u(n)= 0; %definimos 0 el vector desde 10ms a 20ms
end
for n = 1:1:round(2*t10/T)-1 %Método de aproximación de Euler
x2(n+1) = u(n)* T/L + x2(n)*(1-R*T/L) - x1(n)*T/(C*L);
x1(n+1) = T*x2(n) + x1(n);
end
tm = [0:1:round(2*t10/T)-1];
t = tm*T; % Escala del tiempo
uc = x1/C; %Tension en el capacitor
uL = u-uc-x2*R; %Tensión en inductor
subplot(3,1,1), plot(t,u,'r',t,uc,'b'), grid on;
%PLOTEOS
  xlabel('tiempo [seg]'); ylabel('Tension [V]'); title('Evoluciones de u(t) y uc(t)'); legend('u(t)','uc(t)');
subplot(3,1,2), plot(t,u,'r',t,uL,'g'), grid on;
  xlabel('tiempo [seg]'); ylabel('Tension [V]'); title('Evoluciones de u(t) y uL(t)'); legend('u(t)','uL(t)');
subplot(3,1,3), plot(t,x2,'c'), grid on;
  xlabel('tiempo [seg]'); ylabel('Corriente [A]'); title('Evoluciones de i(t)'); legend('i(t)');