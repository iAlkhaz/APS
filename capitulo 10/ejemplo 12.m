s = audioread('señal.wav');
N = length(s)
Fs = 44100;
subplot 511; n = 1 : 0.2*N; n = round(n);
plot(n/Fs, s(n)); axis([0.0 0.2 -1 1]) % 0 a 0.2 seg.
subplot 512; n = 0.2*N : 0.4*N; n = round(n);
plot(n/Fs, s(n)); axis([0.2 0.4 -1 1]) % 0.2 a 0.4 seg.
subplot 513; n = 0.4*N : 0.6*N; n = round(n);
plot(n/Fs, s(n)); axis([0.4 0.6 -1 1]) % 0.4 a 0.6 seg.
subplot 514; n = 0.6*N : 0.8*N; n = round(n);
plot(n/Fs, s(n)); axis([0.6 0.8 -1 1]) % 0.6 a 0.8 seg.
subplot 515; n = 0.8*N : 1.0*N; n = round(n);
plot(n/Fs, s(n)); axis([0.8 1.0 -1 1]) % 0.8 a 1.0 seg.
xlabel('t [seg]');