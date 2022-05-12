R = 12;
C = 1e-6;
L = 1e-3;
F = [1000,2000,3000,4000,4500,4700,5000,5050,5300,5500,6000,8000,10000,11000,12000,13000,15000,16000,20000,25000,30000,50000,80000,100000,150000]'; %vector de frecuencias dadas
t = [0:1/(length(F)-1):1]'; %vector de tiempo con tamaño en función del vector de frecuencias.
w = 2*pi*F; %frecuencia angular 
U = sin(w.*t); %definimos la entrada U senoidal de frecuencia w
Uef = 1 / sqrt(2);
Z = R + i*(w*L-(1./(w*C))); %Impedancia
I = Uef ./ Z; %Aplicamos ley de ohm
UL = I .*(w*L); %Tensión en el inductor
H = abs(UL./Uef); %Modulo de la función transferencia
RF = 20* log(H); %Respuesta frecuencia de amplitud en decibeles
semilogx(F,RF,'r'), grid on; %Ploteo en escala logaritmica
xlabel('Frecuencia [Rad/s]'); ylabel('Ganancia [dB]'); title('Respuesta en frecuencia de amplitud');
[fila,columna] = find(RF == max(RF),1); %Buscamos cuando el maximo coincide con RF
fteorica = 1./(2*3.14*sqrt(L*C)) %Frecuencia teórica máxima
fexperimental = F(fila) %frecuencia a la cual se da el maximo segun nuestros cálculos
Comparacion = fteorica / fexperimental; %comparacion


