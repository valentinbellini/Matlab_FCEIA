function x = NewtonRaphson1(fnom,fpnom,x0,tol,itmax)

%fprintf(' Metodo iterativo de Newton-Raphson\n\n')
%fprintf(' Iter      x     f(x)      Error\n')

iter= 1;

while 1
   fx = fnom(x0);
   fpx = fpnom(x0);
   x = x0 - fx/fpx;
      
     %fprintf('%3.0f  %10.6f  %10.6f  %10.6f \n', iter, x, fnom(x),abs(x-x0))
     
   if abs(x-x0) <= tol & abs(fnom(x)) <= tol 
	  	%fprintf(' Se alcanzo³ la tolerancia. \n\n')
		%fprintf(' Resultado final:\n Raiz aproximada = %12.6f \n',x)
      return
   end
   
   x0 = x;
   iter = iter +1;
   
   if iter > itmax 
	    %fprintf(' Numero de iteraciones maximo alcanzado. \n\n')
		%fprintf(' Resultado parcial:\n Raiz aproximada = %12.6f \n',x)
   	break
   end
end

end 

