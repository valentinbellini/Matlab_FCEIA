% III. Muestreo inteligente 1. Filtro de Butterworth.
% a. Dise�ar un filtro de Butterworth para minimizar el aliasing muestreando a fs = 11.025 Hz. 
% Tomar como punto de partida del dise�o que a la frecuencia fs/2 se desea una
% atenuaci�n m�nima de 20 dB. Elegir la atenuaci�n m�xima en la banda de paso y la
% frecuencia de paso. Identificar ventajas y desventajas de un filtro anti-aliasing con mayor
% o menor selectividad. 
% Funciones �tiles: buttord, butter.
% b. Configurar el bloque �Transfer Function� del modelo Simulink para que implemente el
% filtro de Butterworth dise�ado.
% c. Simular el sistema de filtrado y muestreo. Escuchar el resultado. Evaluar las diferencias
% con el muestreo en crudo. En caso de no ser satisfactorio el resultado, redise�ar el filtro
% para lograr un mejor resultado.

amin = 20; % Atenuaci�n minima en db
amax = 1;
k = 0.9;
fs = 11025;
ws = fs/2;
wp = fs/2*k;

[n,wn]=buttord(wp,ws,amax,amin,'s');
[numB,denB] = butter(n,wn,'low','s');
Hbut = tf(numB,denB);
bode(Hbut);

%soundsc(simout,11025);