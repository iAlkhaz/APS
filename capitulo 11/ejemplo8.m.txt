mr = audioread('mr.wav'); Fs = 11025;
M = 2048; % tamaño del segmento usado en el espectrograma
[B, f, t] = specgram(mr, 4*M, Fs, hamming(M), round(0.75*M));
imagesc(t, f, sqrt(abs(B))) % sqrt comprime, remarcando niveles bajos
axis xy, colormap(1-gray) % origen abajo, niveles de gris
brighten(-0.6) % oscurece gráfico
xlabel('t [seg]'); ylabel('f [Hz]'); grid;

mr = audioread('mr.wav'); Fs = 11025;
M = 8192; % tamaño del segmento
T = 0.75 * M; % traslapo
pwelch(mr, hamming(M), T, 4*M, Fs); zoom