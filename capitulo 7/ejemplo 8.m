x1 = [1 1 2 0 0]; Se obtienen las siguientes muestras de y:
x2 = [1 2 3 0 0];
X1 = dft(x1); 1.0000 + 0.0000i
X2 = dft(x2); 3.0000 + 0.0000i
Y = X1 .* X2; 7.0000 + 0.0000i
y = idft(Y)' 7.0000 - 0.0000i
6.0000 - 0.0000i