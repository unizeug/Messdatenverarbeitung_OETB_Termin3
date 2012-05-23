%Testprogramm für Spektrum.m

%erstellen eines Sinussignals
x = 0:0.01:2*pi;
x = x';
f = 100;
fs = 15000;

t = 0 :1/fs : 2/f;
t = t';
xt = sin(2*pi*f.*t);
    
% load ('Alpha5');
% xt = alpha0;
N=length(xt);

%erstellen eines Hanningfensters
wn1 = hanning(N);
%erstellen eines Rechteckfensters
wn2 = ones(N,1);
%erstellen eines Blackmanfensters
wn3 = blackman(N);

%erstellen eines kleineren Hanningfensters als das Signal lang ist
a=150;
han = hanning(N-a);
wn11 = zeros(N,1);
 for k =1:N-a
     wn11(k+a/2) = han(k);
 end;

 
 Spektrum(xt, wn1, fs, 0,2);
 Spektrum(xt, wn11,fs, 0,3);
 Spektrum(xt, wn2, fs, 0,4);
 Spektrum(xt, wn3, fs, 0,5);

 
 
% %plotten des Signals multipliziert mit dem jeweiligen Fenster
% figure(1)
% clf();
% hold on
% plot(t,wn2);
% %plot(t,wn1,'r');
% %plot(t,wn11,'b');
% plot(t,wn3,'g');
% plot(t,xt.*wn2);
% %plot(t,xt.*wn1,'r');
% %plot(t,xt.*wn11,'b');
% plot(t,xt.*wn3,'g');
% 
% legend('rechteck', 'Blackman',4);
% hold off
% 
% figure(2)
% clf();
% hold on
% %plot(t,wn2);
% plot(t,wn1,'r');
% plot(t,wn11,'b');
% %plot(t,wn3,'g');
% %plot(t,xt.*wn2);
% plot(t,xt.*wn1,'r');
% plot(t,xt.*wn11,'b');
% %plot(t,xt.*wn3,'g');
% 
% legend( 'Hanning', 'verkürzter Hanning',4);
% hold off




