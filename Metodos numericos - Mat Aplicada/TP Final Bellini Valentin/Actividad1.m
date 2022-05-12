% Actividad 1

% Si evaluamos f(x) cerca del cero, nos encontramos frente a un error por
% pérdida de cifras significativas dado que estamos dividiendo dos números
% muy similares/cercanos.

% Buscamos entonces una expre   sión equivalente de f(x) de manera tal que no
% exista dicho error

f = @(x) (1-cos(x))./x;

g = @(x) x./2 - (x.^3)/24 + (x.^5)/720; %Aproximación en serie de taylor en x0 = 0;


%Discretizamos x para los diferentes intervalos en los cuales vamos a plotear g(x)

for i = 0:1:2 
  b = 1*(10^(-3-2*i));   %Definimos los extremos del intervalo para la discretizacion de la variable
  a = -1*(10^(-3-2*i));
  h = (b-a)/100;         %Definimos el paso de la discretización 
  x = a:h:b;
 
 subplot(1,3,i+1), plot(x,f(x),'r'), grid on, hold on 
 subplot(1,3,i+1), plot(x,g(x),'b'), grid on, hold on
  title(['Invervalo ',num2str(i+1)]);
  legend('f(x)','g(x)','Location','northwest');
  
end

% Observación: En los primeros dos ploteos, las graficas coinciden y es por
% esto que solo aparece una sola, en cambio para el intervalo del tercer
% ploteo vemos la discrepancia entre ellas dada por un error que es llamada
% 'error de redondeo' presente debido a una limitacion en la computadora en
% la representacion interna de numeros reales. (La misma debe ser finita).
% El error es grande en este caso debido a la division entre numeros muy
% cercanos a cero. 




