% Datos
fc = 200; % frecuencia de corte en [Hz]
Fs = 1000; % frec. de muestreo en [Hz]
N = 6; % orden del filtro
Rp = 3; % ripple en dB en la banda de paso
f1 = 0; % frec. mínima para el cálculo de la rpta de frecuencia
f2 = 500; % frec. máxima para el cálculo de la rpta de frecuencia
m1 = 1e-6; % límite inferior del gráfico de magnitud
% Diseño del filtro
Wn = 2 * fc / Fs; [b, a] = cheby1(N, Rp, Wn, 'high');
% Despliega coeficientes
b
a

% Calcula respuesta de frecuencia obtenida
f = [f1 : (f2-f1)/511 : f2];
H = freqz(b, a, f, Fs);
% Grafica Mag[H(f)]
semilogy(f, abs(H)); axis([f1 f2 m1 2])
xlabel('f[Hz]'); title('Mag(H)'); grid;