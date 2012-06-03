%MDV Praktikum 04 - Fensterung: Theorieaufgaben


function [BetragXf, PhaseXf] = Spektrum(xt, wn, fs, LogFlag, fig)

% function [BetragXf, PhaseXf] = Spektrum(xt, wn, fs, LogFlag);
% ??????????????????????????????????????????????????????
% filename:           Spektrum.m
% author:             Özgü Dogan, Timo Lausen, Boris Henckell
% organisation:       TU Berlin 
% project:            MDVPR
% date:               21.05.2012
% 
% ??????????????????????????????????????????????????????
% description:        Bestimmt und plottet das Betrags- und Phasenspektrum 
%                     eines Signals xt
% input:              xt : Signal im Zeitbereich
% output:             BetragXf = Betragsspektrum des Signals xt
%                     PhaseXf = Phasenspektrum des Signals xt

% xt = Signal im Zeitbereich
% wn = Fensterfolge
% fs = Abtastfrequenz
% LogFlag = für Flag=1 ist y-Achse log. in dB dargestellt, sonst 0

    
%Multiplikation des Zeitsignals und des Fensters
ergebnis1 = xt.*wn;             

%erstellen der DFT des Ergebnisses
ergebnis2 = fft(ergebnis1);     
ergebnis2 = fftshift(ergebnis2);
N = length(xt);

%Betragsspektrum
BetragXf = abs(ergebnis2)/N;
%Phasenspektrum
PhaseXf = unwrap(angle(ergebnis2)/N);


%Zeitachse
t = 0 :1/fs : (N-1)/fs;
length(t)
%Frequenzachse
%f_DFT = fs*2*(0:(N-1))/(N-1);
f_DFT = (-N/2+0.5:N/2-0.5)*fs/N;
%ceil bzw floor als Lösung
%neues Fenster zur Darstellung
figure(fig);
%Darstellung des Zeitsignals
subplot(3,1,1);
plot(t,xt);
%stem(t,xt);
%AXIS([-150 150 0 2])
 title('Zeitsignal');
 xlabel('t/s');
 ylabel('u/V');
%Darstellung des Amplitudenspektrums
subplot(3,1,2);
if LogFlag == 1
    semilogy(f_DFT, BetragXf);
else
    %plot(f_DFT, BetragXf,'-');
    stem(f_DFT,BetragXf);
end;
%AXIS([-300 300 0 0.5])%für die Vorbereitungsaufgabe 2
%Axis([-0.5 0.5 -0.01 0])%für die Vorbereitungsaufgabe 3
%ylim ([-30 5])
 title('Amplitudenspektrum');
 xlabel('f/Hz');
 ylabel('A(f)[dB]');    
%Darstellung des Phasenspektrums
subplot(3,1,3);
plot(f_DFT, PhaseXf);
%AXIS([-300 300 -0.015 0.015])%Für die Vorbereitungsaufgabe 2
%Axis([-0.5 0.5 -0.01 0])%für die Vorbereitungsaufgabe 3
title('Phasenspektrum');
 xlabel('f/Hz');
 ylabel('phi(f)');


