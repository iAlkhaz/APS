function [k, E] = pr_esp(M, T, B)
% Genera sinusoide + ruido y estima la PSD
% aplicando promediación espectral
% M: número de muestras en el bloque
% T: número de muestras a traslapar
% B: número de bloques a promediar
% k: vector de frecuencias
% E: vector de magnitudes espectrales
N = B * M; % núm. total de muestras
n = [0 : N-1]; % genera el vector n
x = cos(2*pi * 20*B * n/N) + 4*randn(1,N); % genera sinusoide + ruido
E = pwelch(x, hamming(M), T); % estima la PSD
k = [0 : M/2]; % genera el vector k