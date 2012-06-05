%Aufgabe 3.3
clear;close all;
%load('Anschnitt_pi_2.mat');
%xt1 = Anschnitt_pi_2;
load('messung1');
xt1 = messung1;
recht = ones(length(xt1),1);
wn=recht;
fs=15000;
%FFTplot(xt1,0.03,5000,1,'b',1)
%Spektrum(xt1,wn,fs,0,12);

N = length(xt1);
w = (0:N-1/2)*fs/(N/2);
%% Amplitudengang
%idealer Amplitudengang
b = mkfilter(3100/(2*pi),2,'butterw');
b = b^4;


% kehrwert des Amplitudenganges
[mag, phase,wout]=bode(b,w);
magdb= (20*log(mag));
h1=zeros(N,1);
i=1;
while i<(N+1)/2
    h1(i)=magdb(1,1,i);
    h1(N-i)=magdb(1,1,i);
    i = i+1;
end

% figure(5)
% semilogx(wout,h1);
% 
% figure(6)
 h2=1-h1;
% semilogx(wout, h2);
 
 %figure(7);
 %bode(b,w);


Spektrum2Filterkorrektur(xt1,wn,fs,h2,0,11); 




 

