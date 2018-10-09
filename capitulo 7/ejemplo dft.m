function [X] = dft(x)
% Calcula la Transformada Discreta de Fourier
% Uso: [X] = dft(x)
% X : X(k), 0 <= k <= N-1
% x : x(n), 0 <= n <= N-1
N = length(x);
X = zeros(1, N);
for k = 0 : 1 : N-1,
Re = 0; Im = 0;
for n = 0 : 1 : N-1,
Re = Re + (x(n+1) * cos(2*pi * k * n/N));
Im = Im + (x(n+1) * sin(2*pi * k * n/N));
end
X(k+1) = Re - j*Im;
end