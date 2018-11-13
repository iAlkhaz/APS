Fs = 48000; % frecuencia de muestreo
Fi = 100; % frecuencia inicial del chirp
Ff = 10000; % frecuencia final del chirp
D = 2; % duración del chirp [seg]
R = 0; % valor RMS del ruido

T = 1 / Fs; % intervalo de muestreo
N = D / T; % número de muestras
t = [1 : N] * T; % vector de tiempos
Tx = chirp(t, Fi, D, Ff,'quadratic'); % genera chirp
Rx = Tx + R * randn(1, N); % agrega ruido
% Calcula y grafica el espectrograma
LS = 2048; % longitud del segmento usado
[B, f, t] = specgram(Rx, 4*LS, Fs, hamming(LS), round(0.75*LS));
subplot 211; imagesc(t, f, abs(B)) % crea imagen
axis xy, colormap(1-gray) % origen abajo, niveles de gris
ylim([0 10000]); % 0 a 10000 Hz
brighten(-0.4); % oscurece la imagen
xlabel('t [seg]'); ylabel('f [Hz]'); grid;
% Calcula y grafica la correlación
[c, d] = xcorr(Rx, Tx);
subplot 212; plot(d*T, c); grid
xlabel('Desplazamiento [seg]'); ylabel('Correlación');
Rx = 0.9 * Rx / max(abs(Rx)); % normaliza Rx para evitar recorte
sound(Rx, Fs); % reproduce Rx
wavwrite(Rx, Fs, 'chirp_r0.wav') % graba Rx en arch. wav