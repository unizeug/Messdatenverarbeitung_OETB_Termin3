function alpha = alphadetektor2(uc, f, samplerate, numofsample)
%function i = stromPhasSchnitt(id,f,alpha,t)
%---------------------------------------------------
% filename:         stromPhasSchnitt
% author:           �zg� Dogan, Timo Lausen, Boris Henckell
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

%Periode des Signals
T_periode = 1/f;

%umrechnung aus dem gemessenen Spannungscode zu den Stromwerten
it = 0.09*Code2Volt(uc);
%it=uc;
%ref=0.5; %F�r die Messwerte von Tommy und Dirk

%Referenzwert unterhalb dieser Schwelle werden die Werte als 0 gewertet
ref=0.03; % F�r unsere Messwerte

%relative Z�hlvariable innerhalb einer Periode
relativwertvonk=0;

%defaltwert von dem Anschnittswinkel
alpha = 1;
k=1;

%Variable, die angibt, ob der Graph schon mal gr��er null war
warschonmalnichtnull=0;

%Schleife, die kontrolliert, ob der Graph gr��er oder kleiner als Null ist
%Wenn die Messwerte mindestens einmal Gr��er Null war und wieder Null ist
%ist der beginn einer neuen Periode.
%nun z�hlt die Schliefe bis der das n�chste mal gr��er null wird
%daraus wird der Anschnittswinkel errechnet.

while k<length(t)
    if (abs(it(k))>ref) && (warschonmalnichtnull == 0)
        warschonmalnichtnull=1;
    end;
    if (abs(it(k))<ref) && (warschonmalnichtnull == 0)
        %einfach nur hochz�hlen
    end;
    if (abs(it(k))<ref) && (warschonmalnichtnull == 1)
        relativwertvonk = relativwertvonk +1;
    end;
    if (abs(it(k))>ref) && (warschonmalnichtnull == 1) && (relativwertvonk > 0)
        alpha = relativwertvonk/((T_periode/2)*samplerate);
        k = length(t);
    end;
    k = k+1;
end;
        