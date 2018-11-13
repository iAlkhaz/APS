function []= multi_pozo(MT)
% Diseño del filtro
% Requiere parámetro MT, valor de las muestras de transición
% Prepara la respuesta de frecuencia deseada
Fs = 11025;
N = 5001; % largo de h(n), impar
H = ones(1,N); % inicialización de mag. de H(w)(respuesta plana)
[H] = Pozo(50.7, H, MT, N, Fs);
[H] = Pozo(253.3, H, MT, N, Fs);
[H] = Pozo(354.6, H, MT, N, Fs);
[H] = Pozo(455.9, H, MT, N, Fs);
H(N : -1 : (N+3)/2) = H(2 : 1 : (N+1)/2); % genera frec. negativas
% Calcula h(n)
ho = ifft(H);
ho = real(ho); % elimina partes imaginarias residuales
% La IDFT entrega h(n) con índices 0 1 2 3 ... -3 -2 -1
% pero se necesita en el orden ... -3 -2 -1 0 1 2 3 ...
h = [ho((N+3)/2 : N) ho(1 : (N+1)/2)]; % intercambia mitades de ho

% Graba h(n) como vector de columna
h = h'; save 'h.txt' h -ascii
% Calcula y grafica la respuesta de frecuencia
f = [0 : 0.1 : 500];
H = freqz(h, 1, f, Fs);
plot(f, abs(H)); grid; ylabel('Mag'); xlabel('Hz')
% Fin -----------------------------------------------------------
% Función auxiliar: genera un pozo en la frecuencia f
function [H] = Pozo(f, H, MT, N, Fs)
% f = k · Fs / (N-1)
% Calcula el índice k más cercano a la frecuencia f
% 1+ porque el primer índice en Matlab es 1
k = 1 + round((N-1) * f / Fs);
H(k-2) = MT;
H(k-1) = 0.02;
H(k) = 0.01;
H(k+1) = 0.02;
H(k+2) = MT;

Con MT = 0.55 se obtiene la