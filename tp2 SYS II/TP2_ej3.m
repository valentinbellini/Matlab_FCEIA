%Ejercicio_3
Gp = tf([400],[1 20 200]);
k = 9.5;
Gs = tf([100],[1 100]);

Glc = feedback(k*Gp,Gs); % This MATLAB function returns a model object sys for the negative feedback
                         % interconnection of model objects sys1 and sys2.</p> <p>
                         % sys = feedback(sys1,sys2)
Gla = Gp*Gs;
figure
ltiview(Glc); %No estable.

polos = pole(Glc);

%3.2
figure
rlocus(Gla);
[K,polos32] = rlocfind(Gla) %%%% Puntos de cruce

%3.3
%Diagrama de Bode
figure
G = Gp*Gs;
bode(G,Gp);
%nyquist
figure
nyquist(G,Gp);


%%sisotool(Gp)