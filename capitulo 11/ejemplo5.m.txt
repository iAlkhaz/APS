% Datos
fc = 200; % frecuencia de corte en [Hz]
Fs = 1000; % frec. de muestreo en [Hz]
N = 80; % longitud de la respuesta impulso
f1 = 0; % frec. mínima para el cálculo de la respuesta de frec.
f2 = 500; % frec. máxima para el cálculo de la respuesta de frec.
m1 = 1e-6; % límite inferior del gráfico de magnitud
% Diseña el filtro
wn = 2 * fc / Fs; b = fir1(N-1, wn, ' ',hanning(N));
% Graba h(n)
h = b'; save 'h.txt' h -ascii
% Calcula la respuesta de frecuencia obtenida
f = [f1 : (f2-f1)/1023 : f2];
H = freqz(b, 1, f, Fs);
% Grafica h(n)
n = [1 : N]; subplot 211; stem(n, b); grid; xlabel('n'); title('h(n)')
% Grafica Mag[H(f)]
subplot 212; semilogy(f, abs(H)); grid
axis([f1 f2 m1 1.1]); xlabel('f[Hz]'); title('Mag(H)')