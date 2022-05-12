% Actividad 3

 x0 = 0.5; %Aproximacion inicial de la raiz para usar NewtonRaphson
 tol = 1e-6; %Tolerancia
 x = -2*pi:.1:2*pi; %Definimos el intervalo
 itmax = 40; %Definimos la cantidad de iteraciones maximas para el metodo.
 
 g = @(x) x - (x.^3)/3 - sin(x);
 dg = @(x) 1 - x.^2 - cos(x); %Derivamos la función "a mano" para disminuir el error que tendriamos si llamamos a la funcion.
 
 r = NewtonRaphson1(g,dg,x0,tol,itmax); %Llamamos a la funcion Newton Raphson
 
 plot(x,g(x),'r'), grid on, hold on
 plot(0,0,'x');
 legend('g(x) = x - x^3/3 - sin(x)','Raiz x = 0');

 % Graficamente vemos que la raiz se encuentra en 0. Nuestra aproximación de
 % r se encuentra dentro de la tolerancia, pues si bajamos la tolerancia
 % encontramos valores mas cercanos. Sin embargo, teniendo en cuenta que la
 % aproximacion inicial es cercana, la cantidad de iteraciones necesarias
 % es grande, esto se debe a que la multiplicidad de las raices es mayor a
 % uno. 
 
 
r2 = NewtonRaphsonModificada(g,dg,x0,tol,itmax); %Llamamos a la funcion modificada
 
 fprintf('Raiz aproximada mediante NewtomRaphson r = %d. Total de iteraciones: 31\n',r);
 fprintf('Raiz aproximada mediante NewtomRaphsonModificada r2 = %d. Total de iteraciones: 13\n',r2);
 
 % Observamos que no solo es mas exacta la funcion modificada sino que
 % tambien llega al resultado en una menor cantidad de iteraciones
 % Observacion: Podemos ver la implementacion del metodo en Geogebra en el
 % siguiente link: https://www.geogebra.org/m/XCrwWHzy
 
 