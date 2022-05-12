%Dividir señal en:
% 0 a 600Hz
% 600Hz a 1500Hz
% 1500Hz en adelante
load('tp3_TCII.mat')
n = 100; %Orden
fs = 11025;
wpb = 600/(fs/2);
wpa = 1500/(fs/2);

%% 
%%PASABAJO

Pasabajo = fir1(n,wpb,'low',window(@hamming,n+1));
[Hpb,Wbajo] = freqz(Pasabajo);
%plot(Wbajo,abs(Hpb));

%%
%%PASABANDA

wpbn = [wpb,wpa];
Pasabanda = fir1(n,[wpb,wpa],'bandpass',window(@hamming,n+1));
[Hpbn,Wbanda] = freqz(Pasabanda);
%plot(Wbanda,abs(Hpbn));

%%
%%PASAALTO

Pasaalto = fir1(n,wpa,'high',window(@hamming,n+1));
[Hpa,Walto] = freqz(Pasaalto);
%plot(Walto,abs(Hpa));  

%%
%fvtool(Pasabajo,[1,zeros(1,n)],Pasabanda,[1,zeros(1,n)],Pasaalto,[1,zeros(1,n)])
fvtool(Pasabajo,1,Pasabanda,1,Pasaalto,1)

%%
musicaLow=filter(Pasabajo,1,simout);
soundsc(musicaLow,11025,nbits);