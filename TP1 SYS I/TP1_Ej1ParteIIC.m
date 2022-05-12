i = 1;
R = 12; C = 1e-6; L = 1e-3; %Valores de L, R y C dados.
x1(1) = 0; %condicion inicial de carga
x2 (1) = 0; % condicion inicial de corriente
Tau = 2*L/R;
valor = 100; %valor variable para paso de integración
T=(2*pi*sqrt(L*C)/(valor*sqrt(1-R^2*C/4*L))); %paso de integración
F = [1000,2000,3000,4000,4500,4700,5000,5050,5300,5500,6000,8000,10000]; %Vector de frecuencias dadas
for n = 1:1:length(F)
 t = [0:T:20e-3];
 A = 1; %Amplitud del pulso
 u = A*sin(2*pi*F(n).*t); %Entrada senoidal definida
 for n = 2:length(t) %Método de aproximación de Euler
 x1(n) = x1(n-1) + T*x2(n-1);
 x2(n) = (1-T*R/L)*x2(n-1) - (T/(L*C))*x1(n-1) + (T/L)*u(n-1);
 end
 uL = u-(x1/C)-x2*R; %Tensión en inductor
 [fila, columna] = find(uL == max(uL(round(5*Tau/T):end)),1); 
 Amp(i) = uL(columna);
 i = i+1;
end
RF = 20*log10(Amp); %Respuesta en frecuencia en db
semilogx(F,RF), grid on;
xlabel('Frecuencia [Rad/s]'); ylabel('Ganancia [dB]'); title('Respuesta en frecuencia de amplitud');
[f,c] = find(RF == max(RF),1); %Buscamos cuando el maximo coincide con RF
fteorica = 1./(2*3.14*sqrt(L*C)); %Frecuencia teórica máxima
fexperimental = F(c); %frecuencia a la cual se da el maximo segun nuestros cálculos
Comparacion = fteorica / fexperimental; %comparacion



