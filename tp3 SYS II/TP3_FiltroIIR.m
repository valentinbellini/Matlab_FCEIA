load('tp3_TCII.mat')
n = 100; %Orden
fs = 11025;
w1 = 600/(fs/2);
w2 = 1500/(fs/2);

niir = 5;

[num1,den1]=butter(niir,w1,'low');
[num2,den2]=butter(niir,[w1,w2]);
[num3,den3]=butter(niir,w2,'high');
fvtool(num1,den1,num2,den2,num3,den3)

musicaLow=filter(butter(niir,w1,'low'),1,simout);
soundsc(musicaLow,11025,nbits);