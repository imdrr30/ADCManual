N = 1024; //N point FFT N>fc to avoid freq domain aliasing
fs = 4096; // Sample frequency
t = (0:N-1)/fs;
fc = 600; //Carrier Frequency
fm = 80; //Message Frequency
Ec = 20; //Carrier Amplitude
Em = 5; //Messagae Amplitude
xc=Ec*cos(2*%pi*fc*t);
xm=Em*cos(2*%pi*fm*t);
figure(1)
subplot(3,1,1),plot(t,xc);
title('carrier signal of 600Hz');
xlabel('time (s)');
ylabel('amplitude(V)');
subplot(3,1,2);
plot(t,xm);
title('message signal of 80Hz');
xlabel('time (s)');
ylabel('amplitude(V)');
// DSB‐SC MODULATION
z1= xm.*xc;
subplot(3,1,3),plot(t,z1);
title('DSB‐SC MODULATION IN TIME DOMAIN');
xlabel('time (s)');
ylabel('amplitude (V)');
