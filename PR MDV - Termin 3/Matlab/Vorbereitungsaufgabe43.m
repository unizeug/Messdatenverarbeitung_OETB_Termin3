%vorbereitungsaufgabe 3
clear;

%Länge des Gewünschten Fensters
a=16;

%Länge des Zeropaddings
b=0;

%erstellen eines Rechteckfesters sowie eines Hanningfensters
 recht=zeros(a+b,1);
 han = zeros(a+b,1);
 recht(1:a)=1;
 han(1:a) = hanning(a);

 
%Berechnung und plotten des Spektrums des Rechteckfensters
Spektrum(recht,recht,1,1,1);

%Berechnung und plotten des Spektrums des Hanningfensters
Spektrum(han,recht,1,1,2); 
 
%vergrößerung des Zeropaddings
b=2^20-a;

%erneutes erstellen eines Rechteckfensters sowie eines Hanningfensters
 recht2=zeros(a+b,1);
 han2 = zeros(a+b,1);
 recht2(1:a)=1;
 han2(1:a) = hanning(a);

%Berechnung und plotten des Spektrums des Rechteckfensters
Spektrum(recht2,recht2,1,1,3);

%Berechnung und plotten des Spektrums des Hanningfensters
Spektrum(han2,recht2,1,1,4); 

 
