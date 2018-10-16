function [] = tpofconv(P, N)
% Mide y despliega el tiempo de cálculo de la convolución normal y de
% la convolución via FFT. Despliega el cuociente de los tiempos.
% Uso: tpofconv(P, N)
% P : número de puntos de las secuencias originales
% N : número de ceros agregados a las secuencias; debe ser >= P-1
% tc : tiempo de cálculo de la convolución normal
% tf : tiempo de cálculo de la convolución via FFT
% CT : cuociente de los tiempos
% Inventa datos aleatorios
x1 = rand(1, P);
x2 = rand(1, P);
% Mide tiempo de cálculo de la convolución normal
k = int32(0); % contador de convoluciones calculadas
M = int32(1); % número de convoluciones a calcular
t = 0; % tiempo de cálculo
while t < 1, % tiempo mínimo de medición [seg]
tic;
for k = 1: M,
y = conv(x1, x2);
end
t = toc;
M = M * 2;
end

tc = 1E3 * t / (single(M)/2); % tiempo en ms
fprintf('tc = %5.3f ms \n',tc);
% Agrega ceros a los datos
x1 = [x1 zeros(1, N)];
x2 = [x2 zeros(1, N)];
% Mide tiempo de cálculo de la convolución via FFT
M = 1; % número de convoluciones a calcular
t = 0; % tiempo de cálculo
while t < 1, % tiempo mínimo de medición [seg]
tic;
for k = 1: M,
X1 = fft(x1);
X2 = fft(x2);
Y = X1 .* X2;
y = ifft(Y);
end
t = toc;
M = M * 2;
end
tf = 1E3 * t / (single(M)/2); % tiempo en ms
fprintf('tf = %5.3f ms \n',tf);
CT = tc / tf; % cuociente de los tiempos
fprintf('tc/tf = %6.2f [-] \n \n', CT);