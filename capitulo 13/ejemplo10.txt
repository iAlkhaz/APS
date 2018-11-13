% Ensayo de correlograma
x = audioread('avioneta.wav');
Fs = 22050; % frecuencia de muestreo
x = x' - mean(x'); % elimina valor medio
f = [0 : 0.5 : 200]; % vector de frecuencias
L = 6000; % desplazamiento max. de la AC
AC = xcorr(x, L) .* blackman(2*L + 1)';
subplot 231; plot([-L:L]/Fs, AC);
title(['a) AC con L=', num2str(L)]); xlabel('seg'); grid

DTFT = freqz(AC, 1, f, Fs); PSD = abs(DTFT);
subplot 234; semilogy(f, PSD); ylim ([1E3 1E9])
title(['d) PSD via AC con L=', num2str(L)]); xlabel('Hz'); grid
L = 20000; % desplazamiento max. de la AC
AC = xcorr(x, L) .* blackman(2*L + 1)';
subplot 232; plot([-L:L]/Fs, AC);
title(['b) AC con L=', num2str(L)]); xlabel('seg'); grid
DTFT = freqz(AC, 1, f, Fs); PSD = abs(DTFT);
subplot 235; semilogy(f, PSD); ylim ([1E3 1E9])
title(['e) PSD via AC con L=', num2str(L)]); xlabel('Hz'); grid
L = 60000; % desplazamiento max. de la AC
AC = xcorr(x, L) .* blackman(2*L + 1)';
subplot 233; plot([-L:L]/Fs, AC);
title(['c) AC con L=', num2str(L)]); xlabel('seg'); grid
DTFT = freqz(AC, 1, f, Fs); PSD = abs(DTFT);
subplot 236; semilogy(f, PSD); ylim ([1E3 1E9])
title(['f) PSD via AC con L=', num2str(L)]); xlabel('Hz'); grid