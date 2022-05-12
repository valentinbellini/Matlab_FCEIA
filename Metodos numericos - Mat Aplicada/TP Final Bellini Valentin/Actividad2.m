
% Actividad 2
n = 10;
V = [54, 33, 745, 99, 100, 88, 40, 2, 336, 7];
V = V'

% Llamamos a la matriz de Vandermonde mediante la función vander ingresando
% el vector columna v:

format long eng %Escribimos el formato largo para podes apreciar mejor la matriz.
Vn = fliplr(vander(V))

x = ones(10,1);

% Existen 2 metodos directos para hallar la solución del SEL. El metodo de
% eliminación gaussiana y el método de descomposición LU. 

b = Vn*x

xg = Gauss(Vn,b) %Llamamos a la función Gauss


% En el caso de utilizar la eliminacion gaussiana para la resolucion del
% SEL, no habra error de truncamiento debido a que no es un metodo con
% iteraciones, sin embargo si habrá error por redondeo (error debido a la
% representacion de los numeros a traves de una expresion finita). El error
% de redondeo puede reducirse con el pivoteo parcial escalado (linea 10
% Gauss.m).

 CondicionVn = cond(Vn)

% Vemos que la condicion de Vn es muy grande. Esto significa que la matriz
% Vn se encuentra muy mal condicionada. Cuando sucede, puede haber perdida de
% precision en el calculo de la solucion x. Se dice que el SEL puede ser
% "muy dificil" de resolver.
% Por lo tanto, esperamos que si ponemos x == xg, la respuesta sea un cero
% logico.

xg == x; %Devuelve un vector nx1 de valores lógicos cero.

