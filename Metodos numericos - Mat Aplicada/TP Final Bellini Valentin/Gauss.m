function x = Gauss(A,b)

[n n] = size(A);

% Calculo matriz ampliada
Aum = [A b];

for q=1:n-1
    
% Pivoteo parcial con escalonamiento
	S = max(abs(Aum(q:n,q:n))');
   [Y,j] = max(abs(Aum(q:n,q))./S');
   
% Intercambio fila q-esima con fila j-esima
	C = Aum(q,:);
	Aum(q,:) = Aum(j+q-1,:);
	Aum(j+q-1,:) = C;

% Verificacion
	if (Aum(q,q) == 0)
   	  %disp('A no es inversible. No hay solucion o no es unica');
    break
    end
   
% Proceso de eliminacion en columna q-esima
	for k=q+1:n
      m = Aum(k,q)/Aum(q,q);
      Aum(k,q:n+1) = Aum(k,q:n+1) - m*Aum(q,q:n+1);
   end
end

% Sustitucion regresiva (hacia atras)
x(n) = Aum(n,n+1)/Aum(n,n);
for k=n-1:-1:1
   x(k) = (Aum(k,n+1) - Aum(k,k+1:n)*x(k+1:n)') / Aum(k,k);
end

x=x';

end

