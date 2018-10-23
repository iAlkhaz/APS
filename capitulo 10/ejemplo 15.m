x = audioread('carot.wav'); % lee la señal doppler de la carótida
Fs = 22050; % frec. de muestreo
soundsc(x, Fs) % reproduce sonido
% Grafica la señal
t = (1:length(x)) * 1/Fs;
subplot 211; plot(t, x);
xlabel('seg.'); ylabel('Señal'); grid;
% Calcula y grafica el espectrograma
LS = 1024; % longitud del segmento usado
[B, f, t] = specgram(x, 4*LS, Fs, hamming(LS), round(0.75*LS));
subplot 212; imagesc(t, f, abs(B)) % crea imagen
axis xy, colormap(1-gray) % origen abajo, niveles de gris
brighten(-0.8); % oscurece la imagen
xlabel('t [seg]'); ylabel('f [Hz]'); grid; zoom