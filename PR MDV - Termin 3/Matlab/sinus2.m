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
t = (0:0.0001:T_ges);
%Phasenanschnittwinkel [rad]
alpha=4/8*pi;
%Resultierende Stomfunktion
% it = id*sin(2*pi*f*t + phi);
it = stromPhasSchnitt (id,f,alpha,t);
RMSit = EffektivwertZeitbereich(it)
RMSif = EffektivwertFourier(it)

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
f_DFT = f*2*(0:(N-1))/(N-1);
%neues Fenster zur Darstellung
figure(1);
%Darstellung des Zeitsignals
subplot(3,1,1);
plot(t,it);
AXIS([0 T_ges -id-0.3 id+0.3])
 title('Zeitsignal');
 xlabel('t/s');
 ylabel('u/V');
%Darstellung des Amplitudenspektrums
subplot(3,1,2);
plot(f_DFT, y_DFT_abs,'-');
%AXIS([0 4E3 0 1.5])
%ylim ([-30 5])
 title('Amplitudenspektrum');
 xlabel('f/Hz');
 ylabel('A(f)[dB]');    
%Darstellung des Phasenspektrums
subplot(3,1,3);
plot(f_DFT, y_DFT_phase);
%AXIS([0 4E3 0 0.4E-5])
 title('Phasenspektrum');
 xlabel('f/Hz');
 ylabel('phi(f)');
