function [y] = da(x, b)
% Discretiza la amplitud de x, simulando el efecto de un conv. A/D
% Uso: y = da(x, b);
% x: vector a discretizar
% b: número de bits del conversor A/D
% y: vector discretizado
A = max(x) - min(x); % amplitud ptp de x
y = (x - min(x)) / A; % y = x escalado entre 0 y 1
np = 2^b - 1; % código máximo del conversor
y = round(y * np); % salida del conversor A/D
y = A * (y/np) + min(x); % normaliza a la amplitud original
El siguiente programa discretiza un segmento de música con 4 bit (16 niveles).
m = audioread('carpenters.wav'); % carga arch. 'carpenters.wav' en 'm'
y = da(m, 4); % genera el vector 'y' discretizando 'm' con 4 bit
r = m - y; % calcula el ruido de cuantización -> 'r'

n = 10000 : 10400; % rango de muestras a graficar
subplot 211; plot(n, m(n), 'b', n, y(n), 'r');
title('Original (azul) Discretizada (rojo)')
subplot 212; plot(n, r(n)); title('Ruido de cuantización')
wavwrite(y, 44100, 16, 'discretizada.wav') % graba 'y' en arch. wav
wavwrite(r, 44100, 16, 'ruido_cuant.wav') % graba 'r' en arch. wav