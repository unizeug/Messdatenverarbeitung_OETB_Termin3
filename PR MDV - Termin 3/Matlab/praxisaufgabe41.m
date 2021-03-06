%Praxisaufgabe 1 - Termin4
clear;
%% Einlesen der Variablen
% einlesen des Signals
load('messung1');
xt1 = messung1;


f = 50;
fs = 15000;

%alphadetektor2(xt1, f, fs, 600)

 t = 0 :1/fs : 2/f;
 t = t';
 xt = 0.09*Code2Volt(xt1);
 xt = xt';

 N=length(xt);
 %% erstellen der Fenser
 %erstellen eines Hanningfensters
 wn1 = hanning(N);
 %erstellen eines Rechteckfensters
 wn2 = ones(N,1);
 %erstellen eines Blackmanfensters
 wn3 = blackman(N);
 
 %erstellen eines kleineren Hanningfensters als das Signal lang ist
 a=300;
 han = hanning(N-a);
 wn11 = zeros(N,1);
  for j =1:N-a
      wn11(j+a/2) = han(j);
  end;
  
  % erstellen eines kleineren Rechteckfensters
  recht = ones(N-a);
  wn22 = zeros(N,1);
  for k =1:N-a
      wn22(k+a/2) = recht(k);
  end;
  
  % erstellen eines kleineresn Blackmanfensters
  black = blackman(N-a);
  wn33 = zeros(N,1);
  for l =1:N-a
      wn33(l+a/2) = black(l);
  end;
  
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
 
  
  %% Spektren ausgeben lassen
  Spektrum2Filterkorrektur(xt,wn1,fs,h2,0,1);
  Spektrum2Filterkorrektur(xt,wn11,fs,h2,0,11); 
  Spektrum2Filterkorrektur(xt,wn2,fs,h2,0,2);
  Spektrum2Filterkorrektur(xt,wn22,fs,h2,0,22);  
  Spektrum2Filterkorrektur(xt,wn3,fs,h2,0,3);
  Spektrum2Filterkorrektur(xt,wn33,fs,h2,0,33);
