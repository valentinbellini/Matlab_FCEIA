function dx = ecuacion(t,x)
%Variables
J1=0.009;J2=0.009;
K1=2.7114; K2=2.7113;
b1=0.02; b2=0.02;
%Características de entrada
if t<4
torque=0.5;
else
torque=0;
end
%Ecuaciones
dx = [x(2);
     (torque./J1)-(b2.*x(2)./J1)-(K1.*(x(1)-x(3))./J1);
      x(4);
     (1/J2).*(-b1.*x(4)-K1.*(x(3)-x(1))-K2.*x(3))];
end

 
 
