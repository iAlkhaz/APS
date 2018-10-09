x1 = [1 1 2];
x2 = [1 2 3]; Se obtienen las siguientes muestras de y:
X1 = dft(x1);
X2 = dft(x2); 8.0000
Y = X1 .* X2; 9.0000 - 0.0000i
y = idft(Y)' 7.0000 + 0.0000i