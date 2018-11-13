% Lee archivo stereo "ligo.wav"
og = audioread('ligo.wav'); Fs = 8000; T = 1/Fs;
% og: matriz de 2 columnas y 5592 filas
% El primer detector está en la columna 2
og1 = og(:, 2); % detector 1
og2 = og(:, 1); % detector 2
close; t = 1000 * T * [1 : length(og1)]; % eje de tpo [mseg]
% Grafica señales de ambos detectores
subplot 321; plot(t, og1, 'r', t, og2, 'b');
xlabel('t [mseg]'); title('Rojo: detector 1 Azul: detector 2')
grid; zoom
% Grafica señales ampliadas de ambos detectores
subplot 322; plot(t, og1, 'r', t, og2, 'b');
xlim([500 590]); xlabel('t [mseg]');
title('ZOOM Rojo: detector 1 Azul: detector 2')
grid; zoom
% Espectrograma de og1
LS = 256; % longitud del segmento usado
[B, f, t] = specgram(og1, 8*LS, Fs, hamming(LS), round(0.95*LS));
subplot 323; imagesc(1000*t, f, abs(B));
ylim([0 500]); % 0 a 500 Hz
axis xy, colormap(1-gray) % origen abajo, niveles de gris

brighten(0.7); xlabel('t [mseg]'); ylabel('f [Hz]');
title('Espectrograma de detector 1 Peak: 250 Hz');
grid; zoom
% Espectrograma de og2
LS = 256; % longitud del segmento usado
[B, f, t] = specgram(og2, 8*LS, Fs, hamming(LS), round(0.95*LS));
subplot 324; imagesc(1000*t, f, abs(B));
ylim([0 500]); % 0 a 500 Hz
axis xy, colormap(1-gray) % origen abajo, niveles de gris
brighten(0.7); xlabel('t [mseg]'); ylabel('f [Hz]');
title('Espectrograma de detector 2 Peak: 250 Hz');
grid; zoom
% Correlación: desplaza og1 respecto de og2
[c, d] = xcorr(og2, og1, 600);
subplot 325; plot(d, c);
xlabel('Desplazamiento de detector 1 [muestras]');
title('Correlación: peak en 58 muestras.')
grid; zoom
% Grafica señales con og1 desplazado para ver el calce de los canales
t = 1000 * T * [1 : length(og1)]; % eje de tpo [mseg]
og1 = circshift(og1, 58); % desplaza og1 58 muestras hacia la derecha
subplot 326; plot(t, og1, 'r', t, og2, 'b');
xlim([500 590]); xlabel('t [mseg]');
title('ZOOM Det. 1 (rojo) desplaz. 58 m. -> derecha')
grid; zoom