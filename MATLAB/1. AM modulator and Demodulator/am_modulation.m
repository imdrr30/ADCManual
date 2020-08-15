t=0:0.001:1;
vm=5;
vc=10;
fm=2;
fc=25;
m=vm*sin(2*pi*fm*t);
c=vc*sin(2*pi*fc*t);
amp=vc+m;
am=amp.*sin(2*pi*fc*t);
subplot(4,1,1);
plot(t,m);
xlabel('time');
ylabel('amplitude');
title('message signal');
subplot(4,1,2);
plot(t,c);
xlabel('time');
ylabel('amplitude');
title('carrier signal');
subplot(4,1,3);
plot(t,am);
xlabel('time');
ylabel('amplitude');
title('amplitude modulated signal');
demod = am./sin(2*pi*fc*t);
subplot(4,1,4);
plot(t,demod);
xlabel('time');
ylabel('amplitude');
title('demodulated signal');