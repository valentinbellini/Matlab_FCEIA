k = 9.5; 
num = [k*400];
den = [1 20 200+k*400];
Glc = tf(num,den);
Gp = tf([400],[1 20 200]);
Glc1 = feedback(k*Gp,1);
Glc2 = feedback(k*G_e,1);
Glc3 = feedback(k*G_d,1);

%%
% Apartado c
ltiview(Glc);

%%
% Apartado d
figure
rlocus(Gp);
[K,Poles] = rlocfind(Gp)

%%
% Apartado e
% Diagrama de Bode
figure
bode(Gp,k*Gp);
% Nyquist
figure
nyquist(Gp,k*Gp);
[Gm, Pm, Wgm, Wpm] = margin(Gp); %Gm = gain margin ; %Pm = phase margin ; Wcg y Wcp = associated frequencies

%%
%Apartado f
%Diagrama de Bode
Gla = k*Gp;
bode(Gla);%Pm=19.5
%nyquist
figure
nyquist(Gla);%Pm=19.5
[Gm2, Pm2, Wgm2, Wpm2]=margin(Gla);
