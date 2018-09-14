n = 0 : 1 : 10; x = 10 * 0.7 .^ n; % decreciente
stem(n, x); xlabel('n'); title('B = 10 r = 0.7'); grid
n = 0 : 1 : 10; x = 10 * 1.4 .^ n; % creciente
stem(n, x); xlabel('n'); title('B = 10 r = 1.4'); grid