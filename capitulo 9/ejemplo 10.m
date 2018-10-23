N = 128; n = [0 : N-1];
s = 1 + 0.01 * cos(2*pi * 1 * n/N);
% Magnitud del espectro sin eliminar la DC
x = s .* hanning(N)';
[X] = fft(x);
M = (2/N) * abs(X(1:N/2)); % mag. normalizada para frec. positivas
M(1) = M(1) / 2; % nivel DC no requiere factor de 2
M = M / 0.5; % compensación de atenuación de la ventana
k = [0 : 10];
subplot 221; stem(k, M(1:11)); grid
axis([-1 4 0 1.2])
xlabel('k'); title('Mag[X] con valor medio')

% Magnitud del espectro eliminando la DC
x = s - mean(s); % elimina nivel medio de la secuencia
x = x .* hanning(N)'; % ventana Hanning
x = x - mean(x); % elimina nivel medio residual
[X] = fft(x);
M = (2/N) * abs(X(1:N/2)); % mag. normalizada para frec. positivas
M = M / 0.5; % compensación de atenuación de la ventana
subplot 222; stem(k, M(1:11)); grid;
axis([-1 4 0 0.012])
xlabel('k'); title('Mag[X] sin valor medio')