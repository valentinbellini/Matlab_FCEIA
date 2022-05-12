amin = 20; % Atenuación minima en db
amax = 1;
k = 0.9;
fs = 11025;
ws = 2*pi*(fs/2);
wp = 2*pi*(fs/2*k);

n = cheb1ord(ws,wp,amax,amin,'s');
[numCH, denCH] = cheby1(n,amax,wp,'low','s');
Hch = tf(numCH,denCH);
bode(Hch);

soundsc(simout,11025);

%%
[mag,phase,wout]= bode(Hch,0:100:2*ws);
mag=squeeze(mag);
phase=squeeze(phase);
subplot(211)
plot(wout,mag)
hold on;
grid on;
subplot(212)
plot(wout,phase)
hold on;
grid on;

%%
%%Comparación Cheby y Butter
