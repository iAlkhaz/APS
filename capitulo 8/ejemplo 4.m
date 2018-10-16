x1 = [1 1 2];
x2 = [1 2 3];
% Convolución normal
conv(x1, x2) % calcula y despliega resultado
% Convolución via FFT
N = 2; % num. de ceros agregados
x1 = [x1 zeros(1, N)];
x2 = [x2 zeros(1, N)];
X1 = fft(x1);
X2 = fft(x2);
Y = X1 .* X2;
ifft(Y) % calcula y despliega resultado