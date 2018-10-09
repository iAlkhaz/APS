% Carga primeras 1000 muestras de carpenters.wav en el vector x
m = audioread('carpenters.wav');
x = m(1 : 1000);
% Calcula la magnitud del espectro de x entre 0 y 200 kHz
f = 0 : 100 : 200000; % [Hz]
M1 = abs(freqz(x, 1, f, 44100)); % Fs = 44100 m/s
% Grafica M1
subplot 221; semilogy(f/1000,M1); axis([0 200 0.01 10]); grid
title('1: Espectro de secuencia original');
xlabel('f [kHz]'); ylabel('Magnitud')
% Cuadruplica tasa de muestreo de la secuencia intercalando ceros
x4 = zeros(1, 4000); % prepara nueva secuencia, denominada x4
x4(1 : 4 : 4000) = x(1 : 1 : 1000); % copia muestras de x en x4
% Grafica 100 muestras de x4 a partir de la muestra 300
% para evitar la transiente inicial
subplot 222; stem(x4); axis([300 340 -0.1 +0.1]); grid
title('2: Secuencia con ceros (x4)'); xlabel('n');
% Filtra x4 con el filtro digital pasabajos, generando y
load h.txt
y = conv(x4, h);

% Como 3 de cada 4 muestras son cero, el filtro digital
% atenúa 4 veces. Se compensa multiplicando por 4
y = 4 * y;
% Grafica 'y'. Como el filtro digital introduce un retardo de
% 258/2 = 129 muestras, grafica 'y' desplazado 129 muestras
% para facilitar la comparación con x4
subplot 224; stem(y); axis([429 469 -0.1 +0.1]); grid
title('4: Secuencia x4 filtrada'); xlabel('n');
% Calcula la magnitud del espectro de 'y' entre 0 y 200 kHz
M2 = abs(freqz(y, 1, f, 176400));
% Grafica M2
subplot 223; semilogy(f/1000, M2); axis([0 200 0.01 10]); grid;
title('3: Espectro de secuencia x4 filtrada');
xlabel('f [kHz]'); ylabel('Magnitud')