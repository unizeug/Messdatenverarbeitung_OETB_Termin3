%Amplitudengang des Tiefpassfilters
   f=[10 1000 1250 1500 1750 2000 3000 3500 4000 4500 5000 5500 6000 6500 7000 8000 9000 10000];
   H=[2.1837 2.1948 2.1402 2.0376 1.8867 1.6775 0.6915 0.3736 0.2048 0.1360 0.1065 0.0976 0.0979 0.0980 0.0971 0.0968 0.0969 0.0930]./18;
   Amp= 20*log(H);
   amp = Amp -max(Amp);
   semilogx(f,amp)
   grid on;
   
<<<<<<< HEAD
    figure(1); 
    clf();
    b = mkfilter(3100/(2*pi),8,'butterw');
    hold on
    semilogx(f,amp,'r');
    bode(b,{10^2,10^4});
    LEGEND('Aufgenommener Amplitudengang','Idealer Amplitudengang');
    grid on;
   
=======
   yp = polyfit(f,Amp,1);
   figure(2)
   semilogx(f,polyval(yp,f));
   
   yp2 = spline(f,Amp);
   figure(3)
   semilogx(f,ppval(yp2,f));
>>>>>>> refs/heads/master
