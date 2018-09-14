x1 = 2 * rand(1, 10000) - 1; % secuencia 1
x2 = 2 * rand(1, 10000) - 1; % secuencia 2
x3 = 2 * rand(1, 10000) - 1; % secuencia 3
x4 = 2 * rand(1, 10000) - 1; % secuencia 4
x5 = 2 * rand(1, 10000) - 1; % secuencia 5
sx = x1 + x2 + x3 + x4 + x5; % suma de secuencias
subplot 223; hist(x1, 100); title('Histograma de x1'); grid
subplot 224; hist(sx, 100); title('Histograma de sx'); grid