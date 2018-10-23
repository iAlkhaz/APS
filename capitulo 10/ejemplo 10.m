Fs = 10000; % frec. de muestreo [Hz]
N = 20000; % longitud de x(n)
% Generación de x(n)
n = [0 : 1 : N-1]; % vector n (índice de tiempo)
x1 = 2.83 * cos(2*pi*2200*n/Fs); % primera sinusoide, 2 Vrms, 2200 Hz
x2 = 2.83 * cos(2*pi*2300*n/Fs); % segunda sinusoide, 2 Vrms, 2300 Hz
x3 = 10 * randn(1, N); % ruido gaussiano, 10 Vrms
x = x1 + x2 + x3; % vector x
% Estima la PSD
ls = 512; % longitud del segmento
[PSD, f] = pwelch(x, hamming(ls), ls/2, 8*ls, Fs);
% Grafica la PSD
plot(f, PSD); grid;
title('PSD'); xlabel('Hz'); zoom