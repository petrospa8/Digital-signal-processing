%ber vs EbN0 BPSK gray
%ber vs EbN0 QPSK gray 
%ber vs EbN0 16 QAM gray
%ber vs EbN0 64 QAM gray

figure
subplot(2,2,1)
calcularBer('PSK', 2, 0:20, 'gray', 100000)
legend('BPSK gray')

subplot(2,2,2)
calcularBer('PSK', 4, 0:20, 'gray', 100000)
legend('QPSK gray')

subplot(2,2,3)
calcularBer('QAM', 16, 0:20, 'gray', 100000)
legend('16 QAM gray')

subplot(2,2,4)
calcularBer('QAM', 64, 0:20, 'gray', 100000)
legend('64 QAM gray')



%ber vs EbN0 BPSK bin
%ber vs EbN0 QPSK bin
%ber vs EbN0 QPSK gray 
%curva teórica QPSK
figure
subplot(2,2,1)
calcularBer('PSK', 2, 0:20, 'bin', 100000)
legend('BPSK bin')

subplot(2,2,2)
calcularBer('PSK', 4, 0:20, 'bin', 100000)
legend('QPSK bin')

subplot(2,2,3)
calcularBer('PSK', 4, 0:20, 'gray', 100000)
legend('QPSK gray')

EbN0db = 0:0.1:20;
EbN0 = 10.^(EbN0db/10);
pe = (1/2) * erfc(sqrt(EbN0));
pb = pe / 2;
subplot(2,2,4)
semilogy(EbN0db, pb)
legend('teorico QPSK')

%ber vs EbN0 16QAM bin
%ber vs EbN0 16QAM gray
%curva teorica 16QAM
figure
subplot(3,1,1)
calcularBer('QAM', 16, 0:20, 'bin', 100000)
legend('16QAM bin')

subplot(3,1,2)
calcularBer('QAM', 16, 0:20, 'gray', 100000)
legend('16QAM gray')

EbNodB=0:0.1:20
EbNo=10.^(EbNodB/10);
k=4;
M=2^k;
x=sqrt(3*k*EbNo/(M-1));
Pb=(4/k)*(1-1/sqrt(M))*(1/2)*erfc(x/sqrt(2));
subplot(3,1,3)
semilogy(EbNodB,Pb)
legend('teorico 16 QAM')

%ber vs EbN0 64 QAM bin
%ber vs EbN0 64 QAM gray
%curva teórica 64 QAM

figure
subplot(3,1,1)
calcularBer('QAM', 64, 0:20, 'bin', 100000)
legend('64QAM bin')

subplot(3,1,2)
calcularBer('QAM', 64, 0:20, 'gray', 100000)
legend('64QAM gray')

EbNodB=0:0.1:20
EbNo=10.^(EbNodB/10);
k=6;
M=2^k;
x=sqrt(3*k*EbNo/(M-1));
Pb=(4/k)*(1-1/sqrt(M))*(1/2)*erfc(x/sqrt(2));
subplot(3,1,3)
semilogy(EbNodB,Pb)
legend('teorico 64 QAM')

