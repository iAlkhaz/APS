T = 20; % duración [seg] de cada segmento generado
Fs = 100; % Hz
Dt = 1 / Fs;
N = T / Dt;
n = [0 : 1 : N-1];
x1 = cos(2*pi * 9 * n * Dt);
x2 = cos(2*pi * 5 * n * Dt);
x3 = cos(2*pi * 10 * n * Dt);
x4 = cos(2*pi * 15 * n * Dt);
x = [x1 x1 x1] + [x2 x3 x4];
M = 512; % tamaño del segmento usado en el análisis
specgram(x, 4*M, Fs, hanning(M), round(0.9*M))