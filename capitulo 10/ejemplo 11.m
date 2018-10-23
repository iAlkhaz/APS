% Lee señal del pulsar
x = audioread('psr-0950-08.wav');
Fs = 8000;
% Grafica la señal
T = 1 / Fs;
t = T * [1 : length(x)];
subplot 221; plot(t, x); xlim([0 30]); grid
xlabel('t [seg]'); title('Señal pulsar')
% Estima la PSD de la señal
x = x - mean(x); % elimina componente continua
M = 4096; % tamaño del segmento

T = M/2; % traslapo
[P, f] = pwelch(x, hamming(M), T, M, Fs);
% Grafica la PSD de la señal
subplot 222; plot(f, P); grid
xlabel('f [Hz]'); title('PSD señal')
% Calcula la envolvente de x --> e
m = abs(x); % rectifica en onda completa
load h20.txt % lee h(n) de filtro antialias con Fc = 20 Hz
% y atenuación de 40 dB @ 40 Hz
e = conv(m, h20); % aplica filtro antialias
e = e(1:100:length(e)); % decimación; tasa de muestreo baja a 80 m/s
e = e - mean(e); % elimina componente continua
Fs = 80; % redefine la frecuencia de muestreo
% Grafica la envolvente
T = 1 / Fs;
t = T * [1 : length(e)];
subplot 223; plot(t, e); xlim([0 30]); grid
xlabel('t [seg]'); title('Envolvente')
% Estima la PSD de la envolvente
M = 2048; % tamaño del segmento
T = M/2; % traslapo
[P, f] = pwelch(e, hamming(M), T, M, Fs);
% Grafica la PSD de la envolvente
subplot 224; plot(f, P); grid
xlabel('f [Hz]'); title('PSD envolvente')