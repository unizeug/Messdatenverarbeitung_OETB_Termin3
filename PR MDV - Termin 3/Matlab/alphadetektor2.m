function alpha = alphadetektor2(uc, f, samplerate, numofsample)
%function i = stromPhasSchnitt(id,f,alpha,t)
%---------------------------------------------------
% filename:         stromPhasSchnitt
% author:           Özgü Dogan, Timo Lausen, Boris Henckell
% organisation:     TU Berlin
% project:          MDVPR
% date:             09.05.2012
%---------------------------------------------------
% description : simuliert einen mit dem Winkel alpha angeschnittenen Strom
% input :
% uc            - Code der gemessenen Spannung
% f             - Frequenz des Stroms
% samplerate    - Die Rate mit der die Messwerte aufgenommen wurden 6000
% numofsampe    - anzahl der Messwerte 180

% output : [ alpha ] anschnittwinkel
%---------------------------------------------------

%Zeitvektor
t= 0:1/samplerate:numofsample/samplerate;

T_periode = 1/f;

it = 0.09*Code2Volt(uc);
%it=uc;
%ref=0.5; %Für die Messwerte von Tommy und Dirk
ref=0.03; % Für unsere Messwerte
relativwertvonk=0;
alpha = 1;
k=1;

warschonmalnichtnull=0;

while k<length(t)
    if (abs(it(k))>ref) && (warschonmalnichtnull == 0)
        warschonmalnichtnull=1;
    end;
    if (abs(it(k))<ref) && (warschonmalnichtnull == 0)
        %einfach nur hochzählen
    end;
    if (abs(it(k))<ref) && (warschonmalnichtnull == 1)
        relativwertvonk = relativwertvonk +1;
    end;
    if (abs(it(k))>ref) && (warschonmalnichtnull == 1) && (relativwertvonk > 0)
        alpha = relativwertvonk/((T_periode/2)*samplerate);%bei Dirks und Tommys werten muss der Faktor 2 davor
        k = length(t);
    end;
    k = k+1;
end;
        