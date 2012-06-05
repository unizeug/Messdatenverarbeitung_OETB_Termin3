%Aufgabe 3.3
clear;
load('Anschnitt_pi_2.mat');
xt = Anschnitt_pi_2;

%Amplitudengang

%Messwerte
   f=[10 1000 1250 1500 1750 2000 3000 3500 4000 4500 5000 5500 6000 6500 7000 8000 9000 10000];
   H=[2.1837 2.1948 2.1402 2.0376 1.8867 1.6775 0.6915 0.3736 0.2048 0.1360 0.1065 0.0976 0.0979 0.0980 0.0971 0.0968 0.0969 0.0930]./18;
   
%interpolation des Amplitudenganges
   yp2 = spline(f,Amp);
%   figure(3)
%   semilogx(f,ppval(yp2,f));

ampgang = ppval(yp2,f);
