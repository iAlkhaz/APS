% Banda 1 : 0 - 200 Hz ; rechazo ; mag = 0.01
% Banda 2 : 220 - 380 Hz ; paso ; mag = 1
% Banda 3 : 400 - 590 Hz ; rechazo ; mag = 0.003
% Banda 4 : 610 - 700 Hz ; paso ; mag = 0.5
% Banda 5 : 720 - 1000 Hz ; rechazo ; mag = 0.001
Fs = 2000; % frecuencia de muestreo
% Frecuencias y Magnitudes
f = [ 0 200 220 380 400 590 610 700 720 1000];
m = [0.01 0.01 1 1 0.003 0.003 0.5 0.5 0.001 0.001];
f = f / (Fs/2); % frec. normalizada
N = 30; % orden del filtro

% Diseña el filtro
[b, a] = yulewalk(N, f, m)
% Respuesta de frecuencia obtenida
[H, f] = freqz(b, a, 1024, Fs);
plot(f, 20*log10(abs(H)));
xlabel('Hz'); ylabel('dB'); grid;