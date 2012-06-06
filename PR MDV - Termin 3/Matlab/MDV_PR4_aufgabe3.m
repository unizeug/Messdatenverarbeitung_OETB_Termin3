%MDV PR4 Aufgabe 3

clear;
fs = 15000;
x = 0: 0.01: 2*pi;
x = x';
f = 50;
t = 0: 1/fs: 1/f;
t = t';
%xt = sin(2*pi*f.*t);

 load ('messung3');
 
 xt = messung3;
 xt = Code2Volt(xt);
 xt = xt';

 N = length(xt);
  %% Amplitudengang
%idealer Amplitudengang
b = mkfilter(3100/(2*pi),2,'butterw');
b = b^4;
w = (0:N-1/2)*fs/(N/2);


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
  
  h2=1-h1;
 %% 

N = length(xt);

wn1 = hanning(N);
wn2 = ones(N,1);
wn3 = blackman(N);

%Betragsspektrum1 = Spektrum(xt, wn1, fs, 0, 1);
%Spektrum(xt, wn2, fs, 0, 2);

Betragsspektrum2 = Spektrum2Filterkorrektur(xt,wn2,fs,h2,0,2);
%Betragsspektrum2 = Spektrum(xt, wn3, fs, 0, 3);

%n = length(Be

%Gesamtoberschwingungsgehalt (THD-Wert)
THD = (sqrt(sum(Betragsspektrum2.^2) - Betragsspektrum2(303)^2 - Betragsspektrum2(299)^2))/(Betragsspektrum2(303)^2 + Betragsspektrum2(299)^2);
