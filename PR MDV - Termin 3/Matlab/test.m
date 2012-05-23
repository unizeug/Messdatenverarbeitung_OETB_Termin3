clear;
%load('Alpha5')
%Name = Anschnitt_pi_8;
load('Anschnitt_7pi_8')

%figure(4);
%plot(0.09*Code2Volt(Anschnitt_6pi_8));

%figure(5);
%plot(abs(alpha0));
% 
% it = alpha0;
% steigung = zeros(length(alpha0),1);
% k=10;
% 
% while k < length(alpha0)
%     steigung(k) =  ((it(k)-it(k-9)));
%     k = k+1;
% end;
%     
% figure(6);
% clf();
% hold on
% plot (steigung);
% plot(alpha0,'r');
% legend('steigung','signal');
% hold off
% 
% 
% figure(7);
% clf();
% hold on
% plot (abs(steigung));
% plot(abs(alpha0),'r');
% legend('steigung','signal');
% hold off

%Tommys und Dirks Messwerte: samperate:15000, Messwerte: 580
%unsere Messwerte samoplerate:50000, Messwerte: 176
alpha = alphadetektor2(Anschnitt_7pi_8,50,5000,176)