x = audioread('avioneta.wav');
Fs = 22050; % frecuencia de muestreo
M = 16384; % tama�o del segmento
T = M/2; % traslapo
x = x - mean(x);
[P, f] = pwelch(x, hamming(M), T, M, Fs);
semilogy (f, P); axis([10 200 1e-6 1]); grid;