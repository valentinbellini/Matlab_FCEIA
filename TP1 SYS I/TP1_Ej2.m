L = 0.2; %distancia entre microfonos
velocidad_sonido = 342.2; %velocidad del sonido dada
n = [0:88199.9:10]; 
%Leemos los datos de cada audio y los almacenamos en una matriz
[y1, Fs1] = audioread('datos_1.wav'); 
[y2, Fs2] = audioread('datos_2.wav');
[y3, Fs3] = audioread('datos_3.wav');
[y4, Fs4] = audioread('datos_4.wav');
[y5, Fs5] = audioread('datos_5.wav');
[y6, Fs6] = audioread('datos_6.wav');
[y7, Fs7] = audioread('datos_7.wav');
[y8, Fs8] = audioread('datos_8.wav');
[y9, Fs9] = audioread('datos_9.wav');
y = [y1,y2,y3,y4,y5,y6,y7,y8,y9];
Fs = [Fs1, Fs2, Fs3, Fs4, Fs5, Fs6, Fs7, Fs8, Fs9]; %vector frec de muesteo
for i = 1:1:9 
rxy = xcorr(y(:,2*i-1),y(:,2*i)); %correlacion cruzada
muestra = find(rxy == max(rxy)); %Busca cuando la correlacion cruzada sea m�xima.
delta_t(i) = (muestra-length(y(:,2*i-1))) / Fs(i); %determina el delta_t para cada se�al.
angrad(i) = asin (((velocidad_sonido)*(delta_t(i)))/(L)); %vector de angulos para cada se�al.
ang(i) = (angrad(i) *180) / pi; %expresion de el angulo en grados.
if (ang(i)<0) 
    orientacion = 'derecha';
end
if (ang(i)>0)
    orientacion = 'izquierda'; %Condiciones para determinar la orientacion del �ngulo.
end
if (ang(i)==0)
    orientacion = 'nula';
end
fprintf ('paquete %d: angulo en grados sexagesimales: %f, con orientaci�n: %s \n',i,abs(ang(i)),orientacion)

end
%El �ngulo m�nimo (resoluci�n) corresponde a una muestra y se
% encuentra cuando: [muestra-length(y(:,2*i-1)] = 1 y as�
% �ngulo = asin(velocidad_sonido/L*Fs)
angmin = asin(velocidad_sonido/(L*Fs(1))); %angulo m�nimo en radianes
angminsec = (angmin * 180) / pi;
% La resolucion es constante debido a que depende de par�metros invariantes
% con el desplazamiento angular.
