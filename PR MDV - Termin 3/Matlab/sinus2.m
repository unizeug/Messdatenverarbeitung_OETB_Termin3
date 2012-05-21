Ueff=230;
Upeek=325;
R=1320;

id=Upeek/R; %[A]
%Phasenverschiebung
 phi = pi/3;
%frequenz[Hz]
 f=50;
%Gesamtdauer des Signals [s]
 T_ges=3/f;
%Zeitvektor
%t = (0:0.0001:T_ges);
samplerate=6000;
numofsample=176;
t=1/samplerate:1/samplerate:numofsample/samplerate;
%Phasenanschnittwinkel [rad]
alpha=4/8*pi;
%Resultierende Stomfunktion
% it = id*sin(2*pi*f*t + phi);
%it = stromPhasSchnitt (id,f,alpha,t);
it = 0.09 * Code2Volt(Anschnitt_pi_2);
RMSit = EffektivwertZeitbereich(it);
RMSif = EffektivwertFourier(it);

%figure(2)
%Zeichnen der Funktion
%plot(y_DFT_abs);

%Berechnung des Spektrums
y_DFT = fft(it);
y_DFT = fftshift(y_DFT);
N = length(t);
%Betragsspektrum
y_DFT_abs = (abs(y_DFT)/N);
%Phasenspektrum
y_DFT_phase = unwrap(angle(y_DFT)/N);



%Zeitachse
%t = T_ges*(0:(N-1))/(N-1);
%Frequenzachse
%f_DFT = f*2*(0:(N-1))/(N-1);

f_DFT = 1/3*f*(-N/2+0.5:1:N/2-0.5);

%neues Fenster zur Darstellung
figure(1);
%Darstellung des Zeitsignals
subplot(3,1,1);
plot(t,it);
%AXIS([0 T_ges -id-0.3 id+0.3])
 title('Zeitsignal');
 xlabel('t [s]');
 ylabel('u [V]');
%Darstellung des Amplitudenspektrums
subplot(3,1,2);
plot(f_DFT, y_DFT_abs,'-');
AXIS([-1000 1000 0 0.13])
%ylim ([-30 5])
 title('Amplitudenspektrum');
 xlabel('f[Hz]');
 ylabel('A(f)[dB]');    
%Darstellung des Phasenspektrums
subplot(3,1,3);
plot(f_DFT, y_DFT_phase);
AXIS([-1000 1000 -0.020 0.020])
 title('Phasenspektrum');
 xlabel('f [Hz]');
 ylabel('phi(f)');
