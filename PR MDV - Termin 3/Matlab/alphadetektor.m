function [alpha,check,steigung]=alphadetektor(uc, f, samplerate, numofsample)
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
% numofsampe    - anzahl der Messwerte 176

% output : [ alpha ] anschnittwinkel
%---------------------------------------------------
global ut it mittel;
%Zeitvektor erstellen
t=0:1/samplerate:numofsample/samplerate;
%Zeit einer Periode [s]
T_periode = 1/f;

%Spannungvektor von Code zu Volt umrechnen
ut = Code2Volt(uc);

%Stomvektor aus dem vorhandenen Spannungsvektor bestimmen
it = 0.09*ut;

%Mittelwert von it
mittel = mean(it);

%Schleife über alle Abtastwerte
%zählvariable der Schleife
k=2;

warschonmalnichtnull = 0;
relativwertvonk = 1;
alpha = -1;
check = [-1,-1,-1,-1,-1];
steigung = zeros(175,1);


% while  k<(length(t)-1)
%     if (abs(it(k))>(mittel + 0.05)&&(relativwertvonk==1))
%         k=k+1;
%         warschonmalnichtnull = 1;
%         check(1) = k;
%     elseif ((abs(it(k)))<(mittel+0.3) && (warschonmalnichtnull == 0))
%             k=k+1;
%             check(2) = k;
%     elseif ((abs(it(k)))<(mittel+0.03) && (warschonmalnichtnull==1))
%         k=k+1;
%         relativwertvonk = relativwertvonk +1;
%         check(3)=k;
%     else
%         alpha = (relativwertvonk)/((T_periode/2)*samplerate);
%         check(4) = k;
%         check(5) = relativwertvonk;
%         k=length(t)+1;
%     end;
%        
% end;

while  k<(length(t)-2)
    if ((abs(it(k)-it(k-1))>(-1.00))&&(relativwertvonk<2))
        k=k+1;
        warschonmalnichtnull = 1;
        check(1) = k;
        steigung(k) = abs(it(k)-it(k-2));
    elseif ((abs(it(k)-it(k-1))<(0.00)) && (warschonmalnichtnull == 0))
            k=k+1;
            check(2) = k;
    elseif ((abs(it(k)-it(k-1))<(0.00)) && (warschonmalnichtnull==1))
        k=k+1;
        relativwertvonk = relativwertvonk +1;
        check(3)=k;
    else
        alpha = (relativwertvonk)/((T_periode/2)*samplerate);
        check(4) = k;
        check(5) = relativwertvonk;
        k=length(t)+1;
    end;
       
end;



