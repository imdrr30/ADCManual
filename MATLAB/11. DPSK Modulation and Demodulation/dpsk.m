clc; clear all; close all;
N=10^4;
rand('state',100);rand('state',200);
ip=rand(1,N)>0.5,ipD=mod(filter(1,[1 -1],ip),2);
s=2*ipD-1;
n=1/sqrt(2)*[randn(1,N)+j*randn(1,N)];Eb_N0_db=[-3:10];
for ii=1:length(Eb_N0_db)
    y=s+10^(-Eb_N0_db(ii)/20)*n;
    ipDHat_coh=real(y)>0;
    ipHat_coh=mod(filter([1 -1],1,ipDHat_coh),2);
    nErr_dbpsk_coh(ii)=size(find([ip-ipHat_coh]),2);
end
simBer_dbpsk_coh=nErr_dbpsk_coh/N;
theoryBer_dbpsk_coh=erfc(sqrt(10.^(Eb_N0_db/10))).*(1-5*erfc(sqrt(10.^(Eb_N0_db/10))));
close all;
figure
semilogy(Eb_N0_db,theoryBer_dbpsk_coh,'b.-');
hold on;
semilogy(Eb_N0_db,simBer_dbpsk_coh,'mx-');
axis([-2 10 10^-6 0.5]);
grid on;
legend('theory','simulation');
xlabel('Eb/N0,db');
ylabel('bit error rate');
title('bit error probability curve for coherent demodulation of dbpsk');