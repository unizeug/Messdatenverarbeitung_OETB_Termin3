%MDV Praktikum Aufgabe 1

clear;

load ('messung1');

xt = messung1;
xt = 0.09*Code2Volt(xt);
xt = xt';
N = length(xt);

fs = 15000;
wn1 = hanning(N);
wn2 = ones(N,1);
wn3 = blackman(N);

a = 200;
hann = hanning(N-a);
wn11 = zeros(N,1);
for k = 1:N-a
    wn11(k+a/2) = hann(k);
end

% figure(4);
% plot(wn11);
% hold on
% plot(xt);
% holdm off

Spektrum(xt, wn1, fs, 0, 1);
Spektrum(xt, wn2, fs, 0, 2);
Spektrum(xt, wn3, fs, 0, 3);
Spektrum(xt, wn11, fs, 0, 4);