clear;
fc=1000;
fs=10000;
f1=200;
t=0:1/fs:((2/f1)-(1/fs));
x1=0.4*cos(2*pi*f1*t)+0.5; %modulation 
y1=modulate(x1,fc,fs,'pwm');
subplot(411); plot(x1);
axis([0 100 0 1]);
title('modulating signal,f1=200,fs=10000');
subplot(412);
plot(y1);
axis([0 1000 -0.2 1.2]);
title('PWM')  %demodulation 
x1_recov=demod(y1,fc,fs,'pwm');
[den, num]=butter(1,2*pi*f1/fs);
s11=filter(den,num,x1_recov);
s12=filter(den,num,s11);
subplot(413);
plot(x1_recov);
title('time domain recovered, single tone,f1=200');
axis([0 100 0 1]);
subplot(414); plot(s12);
title('filtered output');
axis([0 100 0 1]);