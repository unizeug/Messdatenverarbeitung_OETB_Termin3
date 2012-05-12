function i=stromPhasSchnitt(id,f,alpha,t)
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
% id        - Amplitude des Stroms
% f         - Frequenz des Stroms
% alpha     - Anschnittwinkel [rad]
% t         - Vektor mit den Zeitpunkten zu denen der Strom simuliert wird
% phi       - Phasenverschiebung

% output : [ i ] zeitlicher Verlauf des Stromes
%---------------------------------------------------

%Zeit einer Periode [s]
T_periode = 1/f;
%Initialisierung des Ergebnisvektors:
i = ones(1,length(t));
%Schleife über alle Abtastwerte
for k = 1:length(t),
    %Modulo-Test -> Zeit relativ zur Halben - Signalperiode
    t_rel = mod(t(k),T_periode/2);
    if(t_rel < (alpha/(pi)*T_periode/2))
        i(k) = 0;
    else
        i(k) = id*sin((2*pi*t(k)*f));
    end;
end;