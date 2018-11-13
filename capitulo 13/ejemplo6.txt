% Genera Tx, 100 bits +1 o -1
% que representan 1 bit de datos
Tx = 2 * round(rand(1, 100)) - 1;
% Genera Rx, 1000 bits de ruido
% sumados con Tx a partir de 501
Rx = [randn(1, 500) ...
randn(1, 100) + Tx ...
randn(1, 400)];
[Corr, lags] = xcorr(Rx, Tx);
% Grafica Tx (100 bits)
subplot 321; plot(Tx);
axis([1 100 -4 4]);
grid; title('Tx')
% Grafica Rx (1000 bits)
subplot 323; plot(Rx);
axis([1 1000 -4 4]);
grid; title('Rx')
% Grafica la correlación
subplot 325; plot(lags, Corr);
axis([1 1000 -50 150]);
grid; title('Corr')