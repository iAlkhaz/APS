x = audioread('cp0834.wav'); % lee señal --> x
t = (1 : length(x)) * (1/8000); % eje de tiempo
close; figure(1); subplot 311; plot(t, x); grid
title('Señal original del pulsar');
% Rectificación en onda completa
m = abs(x);
subplot 312; plot(t, m); grid
title('Señal del pulsar rectificada en onda completa');

% LPF IIR antialias @ 15 Hz, para poder reducir la tasa de muestreo
a = 0.998; e = filter((1-a), [1 -a], m);
subplot 313; plot(t, e); grid
title('Envolvente filtrada con LPF @ 15 Hz, 8000 m/s');
% Decimación 100:1. La tasa de muestreo baja a 80 m/s
% para aliviar la autocorrelación posterior
e = e(1 : 100 : length(e)); % decimación
t = (1 : length(e)) * (1/80); % nuevo eje de tiempo @ 80 m/s
% LPF IIR @ 0.2 Hz, para obtener la media fluctuante
a = 0.95; f = filter((1-a), [1 -a], e);
figure(2); subplot 311; plot(t, e, 'b', t, f, 'r'); grid
title('Decimación @ 80 m/s (azul) & LPF @ 0.2 Hz (rojo)');
e = e - f; % resta la media fluctuante para centrar la envolvente
% en cero, porque la AC requiere semiciclos pos. y neg.
subplot 312; plot(t, e); grid
title('Envolvente centrada en 0 mediante resta de la media');
% Autocorrelación de la envolvente centrada en cero
[AC, d] = xcorr(e, 10*80); % desplazamiento máximo: 10 seg
t = d * (1/80); % desplazamiento en [seg]
subplot 313; plot(t, AC); grid
title('Autocorrelación de la envolvente, desplazamiento máx. 10 seg');